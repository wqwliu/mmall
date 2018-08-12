package com.ecg.manager.pojo.dto;

/**
 * 〈一句话功能简述〉<br>
 * 〈订单的查询bean〉
 *
 * @author wq
 * @date 2018/8/12 0012
 * @since 1.0.0
 */
public class OrderQuery {

    private String pname;
    private String orderitemid;

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getOrderitemid() {
        return orderitemid;
    }

    public void setOrderitemid(String orderitemid) {
        this.orderitemid = orderitemid;
    }
}