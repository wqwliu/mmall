package com.ecg.cart.pojo.vo;

public class TbCartItem {
    private String pid;
    private String pname;
    private String image;
    private Double shopPrice;
    private Double price;//总额
    private Integer pcount;

    public void setPid(String pid) {
        this.pid = pid;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setShopPrice(Double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setPcount(Integer pcount) {
        this.pcount = pcount;
    }

    public String getPid() {
        return pid;
    }

    public String getPname() {
        return pname;
    }

    public String getImage() {
        return image;
    }

    public Double getShopPrice() {
        return shopPrice;
    }

    public Double getPrice() {
        return price;
    }

    public Integer getPcount() {
        return pcount;
    }
}
