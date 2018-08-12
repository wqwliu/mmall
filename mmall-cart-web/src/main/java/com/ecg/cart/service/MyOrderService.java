package com.ecg.cart.service;

import com.ecg.cart.pojo.po.TbOrder;

import java.util.List;

public interface MyOrderService {
    List<TbOrder> listOrders(String uid);

    TbOrder getOrderByOid(String oid);
}
