package com.ecg.cart.service.impl;

import com.ecg.cart.dao.TbOrderMapper;
import com.ecg.cart.dao.TbOrderitemsMapper;
import com.ecg.cart.pojo.po.*;
import com.ecg.cart.service.MyOrderService;
import com.ecg.common.jedis.JedisClient;
import com.ecg.utils.JsonUtils;
import com.ecg.utils.StrKit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.ArrayList;
import java.util.List;

@Service
public class MyOrderServiceImpl implements MyOrderService {
    private Logger lg = LoggerFactory.getLogger(Logger.class);
    @Autowired
    private TbOrderMapper tbOrderMapper;
    @Autowired
    private TbOrderitemsMapper tbOrderitemsMapper;
    @Autowired
    private JedisClient jedisClient;

    @Override
    public List<TbOrder> listOrders(String uid) {
        String order = null;
        try {
            order = jedisClient.hget("order", uid);
        } catch (JedisConnectionException jce) {
            System.out.println("111");
            order = jedisClient.hget("order", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        List<TbOrder> list = new ArrayList<>();

        if (StrKit.notBlank(order)) {
            list = JsonUtils.jsonToList(order, TbOrder.class);
        } else {
            TbOrderExample example = new TbOrderExample();
            example.createCriteria().andUidEqualTo(uid);
            List<TbOrder> tos = tbOrderMapper.selectByExample(example);
            for (TbOrder t : tos) {
                TbOrderitemsExample example2 = new TbOrderitemsExample();
                example2.createCriteria().andOidEqualTo(t.getOid());
                List<TbOrderitems> tbOrderitems = tbOrderitemsMapper.selectByExample(example2);
                t.setTbOrderitems(tbOrderitems);
                list.add(t);
            }
            String s = JsonUtils.objectToJson(list);
            try {
                jedisClient.hset("order", uid, s);
            } catch (Exception e) {
                lg.error(e.getMessage(), e);
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public TbOrder getOrderByOid(String oid) {
        TbOrder t = tbOrderMapper.selectByPrimaryKey(oid);
        TbOrderitemsExample example2 = new TbOrderitemsExample();
        example2.createCriteria().andOidEqualTo(t.getOid());
        List<TbOrderitems> tbOrderitems = tbOrderitemsMapper.selectByExample(example2);
        t.setTbOrderitems(tbOrderitems);
        return t;
    }
}
