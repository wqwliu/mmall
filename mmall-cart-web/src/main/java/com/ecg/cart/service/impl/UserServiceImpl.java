package com.ecg.cart.service.impl;

import com.ecg.cart.pojo.vo.StatusResult;
import com.ecg.cart.service.UserService;
import com.ecg.common.jedis.JedisClient;
import com.ecg.utils.StrKit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.exceptions.JedisConnectionException;

@Service
public class UserServiceImpl implements UserService {

    private Logger lg= LoggerFactory.getLogger(Logger.class);
    @Autowired
    private JedisClient jedisClient;
    @Override
    public StatusResult getUid() {
        StatusResult sr=new StatusResult();
        String uid=null;
        try {
            uid = jedisClient.get("account");
        } catch (JedisConnectionException jce) {
            uid = jedisClient.get("account");
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        if(StrKit.notBlank(uid)){
            jedisClient.expire("account",1800);
            sr.setCode(0);
            sr.setMsg(uid);
        }else{
            sr.setCode(1);
            sr.setMsg("用户不存在");
        }
        return sr;
    }
    @Override
    public void setUid(String uid) {
        try {
            uid = jedisClient.set("account",uid);
        } catch (JedisConnectionException jce) {
            uid = jedisClient.set("account",uid);
        } catch (Exception e) {
            lg.error(e.getMessage(), e);
            e.printStackTrace();
        }
        jedisClient.expire("account",1800);
    }
}
