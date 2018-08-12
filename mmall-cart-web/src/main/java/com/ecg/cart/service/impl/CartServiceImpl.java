package com.ecg.cart.service.impl;

import com.ecg.cart.dao.TbOrderMapper;
import com.ecg.cart.dao.TbOrderitemsMapper;
import com.ecg.cart.dao.TbProductMapper;
import com.ecg.cart.dao.TbUserMapper;
import com.ecg.cart.pojo.po.*;
import com.ecg.cart.pojo.vo.ReceivePeople;
import com.ecg.cart.pojo.vo.StatusResult;
import com.ecg.cart.pojo.vo.TbCartItem;
import com.ecg.cart.service.CartService;
import com.ecg.common.jedis.JedisClient;
import com.ecg.utils.JsonUtils;
import com.ecg.utils.StrKit;
import com.ecg.utils.UUIDUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.*;

@Service
public class CartServiceImpl implements CartService {
    private Logger lg = LoggerFactory.getLogger(Logger.class);
    @Autowired
    private JedisClient jedisClient;
    @Autowired
    private TbProductMapper tbProductMapper;
    @Autowired
    private TbOrderMapper tbOrderMapper;
    @Autowired
    private TbOrderitemsMapper tbOrderitemsMapper;
    @Autowired
    private TbUserMapper tbUserMapper;

    @Override
    public void saveToCart(TbCartItem tbCartItem, String uname) {
        String uid = "";
        if(StrKit.notBlank(uname)){
            TbUserExample example=new TbUserExample();
            example.createCriteria().andUnameEqualTo(uname);
            TbUser tbUser = tbUserMapper.selectByExample(example).get(0);
             uid=tbUser.getUid();

            saveUidToRedis(uid);
        }else {
            uid = jedisClient.get("account");
        }


        String cart = null;
        try {
            cart = jedisClient.hget("cart", uid);
        } catch (JedisConnectionException jce) {
            System.out.println("111");
            cart = jedisClient.hget("cart", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        List<TbCartItem> list = new ArrayList();
        if (StrKit.notBlank(cart)) {
            list = JsonUtils.jsonToList(cart, TbCartItem.class);
        }
        boolean flg = false;
        for (TbCartItem t : list) {
            if (tbCartItem.getPid().equals(t.getPid())) {
                flg = true;
                t.setPcount(t.getPcount() + tbCartItem.getPcount());
                t.setPrice(t.getPcount() * t.getShopPrice());
            }
        }
        if (!flg) {
            TbProduct tbProduct = tbProductMapper.selectByPrimaryKey(tbCartItem.getPid());
            tbCartItem.setPname(tbProduct.getPname());
            tbCartItem.setShopPrice(tbProduct.getShopprice());
            tbCartItem.setImage(tbProduct.getImage());
            tbCartItem.setPrice(tbCartItem.getPcount() * tbProduct.getShopprice());
            list.add(tbCartItem);
        }
        String s = JsonUtils.objectToJson(list);
        try {
            jedisClient.hset("cart", uid, s);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
    }

    private void saveUidToRedis(String uid) {
        try{
            jedisClient.set("account",uid);
        }catch (JedisConnectionException jce){
            jedisClient.set("account",uid);
        }catch (Exception e){
            e.printStackTrace();
        }
        jedisClient.expire("account",1800);
    }

    @Override
    public List<TbCartItem> getCart(String uid) {
        String cart = null;
        try {
            cart = jedisClient.hget("cart", uid);
        } catch (JedisConnectionException jce) {
            cart = jedisClient.hget("cart", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        List<TbCartItem> list = new ArrayList<>();
        if (StrKit.notBlank(cart)) {
            list = JsonUtils.jsonToList(cart, TbCartItem.class);
        }
        return list;
    }

    @Override
    public void deleteCartItem(String pid, String uid) {
        String cart = null;
        try {
            cart = jedisClient.hget("cart", uid);
        } catch (JedisConnectionException jce) {
            cart = jedisClient.hget("cart", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        List<TbCartItem> list = new ArrayList<>();
        if (StrKit.notBlank(cart)) {
            list = JsonUtils.jsonToList(cart, TbCartItem.class);
            TbCartItem tbCartItem = null;
            for (TbCartItem t : list) {
                if (pid.equals(t.getPid())) {
                    tbCartItem = t;
                }
            }
            list.remove(tbCartItem);
        }
        String s = JsonUtils.objectToJson(list);
        try {
            jedisClient.hset("cart", uid, s);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
    }

    @Override
    public StatusResult deleteOneCart(String pid, String uid) {
        String cart = null;
        StatusResult sr = new StatusResult();
        sr.setCode(0);
        try {
            cart = jedisClient.hget("cart", uid);
        } catch (JedisConnectionException jce) {
            cart = jedisClient.hget("cart", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        List<TbCartItem> list = new ArrayList();
        list = JsonUtils.jsonToList(cart, TbCartItem.class);

        for (TbCartItem t : list) {
            if (pid.equals(t.getPid())) {
                if (t.getPcount() > 1) {
                    t.setPcount(t.getPcount() - 1);
                    t.setPrice(t.getShopPrice() * t.getPcount());
                    //修改redis缓存
                    String s = JsonUtils.objectToJson(list);
                    try {
                        jedisClient.hset("cart", uid, s);
                    } catch (Exception e) {
                        lg.error(e.getMessage(), e);
                        e.printStackTrace();
                    }
                } else {
                    sr.setCode(1);
                    sr.setMsg("商品购买数量不能少于1件");
                }
            }
        }
        return sr;
    }

    @Override
    public StatusResult addOneCart(String pid, String uid) {
        String cart = null;
        StatusResult sr = new StatusResult();
        sr.setCode(0);
        try {
            cart = jedisClient.hget("cart", uid);
        } catch (JedisConnectionException jce) {
            cart = jedisClient.hget("cart", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        List<TbCartItem> list = new ArrayList();
        list = JsonUtils.jsonToList(cart, TbCartItem.class);

        for (TbCartItem t : list) {
            if (pid.equals(t.getPid())) {
                t.setPcount(t.getPcount() + 1);
                t.setPrice(t.getShopPrice() * t.getPcount());
            }
        }
        String s = JsonUtils.objectToJson(list);
        try {
            jedisClient.hset("cart", uid, s);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return sr;
    }
    @Override
    public TbOrder submitCart(ReceivePeople receivePeople, String uid) {
        String order=null;
        try {
            order = jedisClient.hget("order", uid);
        } catch (JedisConnectionException jce) {
            System.out.println("111");
            order = jedisClient.hget("order", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }

        if(StrKit.notBlank(order)){
            jedisClient.hdel("order",uid);
        }


        String oid = UUIDUtils.getuuid();
        Double totalMoney=0.0;
        String cart = null;
        try {
            cart = jedisClient.hget("cart", uid);
        } catch (JedisConnectionException jce) {
            cart = jedisClient.hget("cart", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        List<TbCartItem> list = new ArrayList<>();
        list = JsonUtils.jsonToList(cart, TbCartItem.class);

        for (TbCartItem t:list){
            TbOrderitems toi=new TbOrderitems();
            toi.setImage(t.getImage());
            toi.setOid(oid);
            toi.setOrderitemid(UUIDUtils.getuuid());
            toi.setPcount(t.getPcount());
            toi.setPid(t.getPid());
            toi.setPname(t.getPname());
            toi.setPrice(t.getPrice());
            totalMoney+=t.getPrice();
            tbOrderitemsMapper.insert(toi);
        }
        TbOrder tbOrder=new TbOrder();
        tbOrder.setOid(oid);
        tbOrder.setOdate(new Date());
        tbOrder.setUid(uid);
        tbOrder.setReceivename(receivePeople.getReceiveName());
        tbOrder.setReceivephone(receivePeople.getReceivePhone());
        tbOrder.setReceiveaddress(receivePeople.getReceiveAddress());
        tbOrder.setTotalMoney(totalMoney);
        tbOrder.setOstatus(1);
        tbOrderMapper.insert(tbOrder);

        try {
            jedisClient.hdel("cart", uid);
        } catch (JedisConnectionException jce) {
            jedisClient.hdel("cart", uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return tbOrder;
    }
}
