package com.ecg.manager.pojo.vo;

import java.util.ArrayList;
import java.util.List;

public class ResultStatus<T> {
    private int code;
    private String msg;
    private List<T> data =new ArrayList<>();

    public void setCode(int code) {
        this.code = code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
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

    public List<T> getData() {
        return data;
    }

    @Override
    public String toString() {
        return "ResultStatus{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
