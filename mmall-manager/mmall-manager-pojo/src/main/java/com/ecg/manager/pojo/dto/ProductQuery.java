package com.ecg.manager.pojo.dto;

/**
 * 〈一句话功能简述〉<br>
 * 〈专用于产品查询的封装类〉
 *
 * @author wq
 * @date 2018/7/25 0025
 * @since 1.0.0
 */
public class ProductQuery {

    private String pname;
    private String pid;
    private String hid;
    private Double priceMin;
    private Double priceMax;

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getHid() {
        return hid;
    }

    public void setHid(String hid) {
        this.hid = hid;
    }

    public Double getPriceMin() {
        return priceMin;
    }

    public void setPriceMin(Double priceMin) {
        this.priceMin = priceMin;
    }

    public Double getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Double priceMax) {
        this.priceMax = priceMax;
    }
}