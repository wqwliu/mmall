package com.ecg.manager.service.impl;

import com.ecg.common.jedis.JedisClient;
import com.ecg.manager.pojo.vo.ResultStatus;
import com.ecg.manager.service.PhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PhoneServiceImpl implements PhoneService {
    @Autowired
    private JedisClient jedisClient;

    @Override
    public void saveCodeToRedis(int code, String phone) {
        jedisClient.hset(phone, "code", String.valueOf(code));
        jedisClient.expire(phone,180);
    }
    @Override
    public ResultStatus<String> checkCodeToRedis(String code, String phone) {
        ResultStatus<String> rs=new ResultStatus<String>();
        rs.setCode(1);
        rs.setMsg("验证码不正确");
        String code1 = jedisClient.hget(phone, "code");
        if(code.equals(code1)){
            rs.setCode(0);
            rs.setMsg("验证通过");
        }
        return rs;
    }
}
