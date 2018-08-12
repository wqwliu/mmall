package com.ecg.cart.service;

import com.ecg.cart.pojo.po.TbOrder;
import com.ecg.cart.pojo.vo.ReceivePeople;
import com.ecg.cart.pojo.vo.StatusResult;
import com.ecg.cart.pojo.vo.TbCartItem;

import java.util.List;

public interface CartService {
    void saveToCart(TbCartItem tbCartItem, String uname);

    List<TbCartItem> getCart(String uid);

    void deleteCartItem(String pid, String uid);

    StatusResult deleteOneCart(String pid, String uid);

    StatusResult addOneCart(String pid, String uid);

    TbOrder submitCart(ReceivePeople receivePeople, String uid);
}
