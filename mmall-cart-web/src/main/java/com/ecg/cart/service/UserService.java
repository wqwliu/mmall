package com.ecg.cart.service;

import com.ecg.cart.pojo.vo.StatusResult;

public interface UserService {

    StatusResult getUid();

    void setUid(String uid);
}
