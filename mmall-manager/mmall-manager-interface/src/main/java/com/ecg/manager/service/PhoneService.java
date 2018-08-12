package com.ecg.manager.service;


import com.ecg.manager.pojo.vo.ResultStatus;

public interface PhoneService {

    void saveCodeToRedis(int code, String phone);

    ResultStatus<String> checkCodeToRedis(String code, String phone);
}
