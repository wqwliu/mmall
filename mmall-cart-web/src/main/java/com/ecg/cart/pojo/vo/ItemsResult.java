package com.ecg.cart.pojo.vo;

import java.util.ArrayList;
import java.util.List;

public class ItemsResult<T> {

    private int code;
    private String msg;
    private int count;
    private List<T> data=new ArrayList<>();

    public void setCode(int code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public int getCount() {
        return count;
    }

    public List<T> getData() {
        return data;
    }
}
