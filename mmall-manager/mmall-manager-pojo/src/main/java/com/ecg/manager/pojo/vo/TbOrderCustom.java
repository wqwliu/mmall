package com.ecg.manager.pojo.vo;

import com.ecg.manager.pojo.po.TbOrderitems;

/**
 * 〈一句话功能简述〉<br>
 * 〈订单的业务bean〉
 *
 * @author wq
 * @create 2018/8/12 0012
 * @since 1.0.0
 */
public class TbOrderCustom extends TbOrderitems{

    private String receiveName;
    private String ostatus;
    private String receivePhone;

    public String getReceiveName() {
        return receiveName;
    }

    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName;
    }

    public String getOstatus() {
        return ostatus;
    }

    public void setOstatus(String ostatus) {
        this.ostatus = ostatus;
    }

    public String getReceivePhone() {
        return receivePhone;
    }

    public void setReceivePhone(String receivePhone) {
        this.receivePhone = receivePhone;
    }
}