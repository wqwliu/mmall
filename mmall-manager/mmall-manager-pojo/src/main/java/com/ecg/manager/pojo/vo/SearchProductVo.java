package com.ecg.manager.pojo.vo;

/**
 * 〈一句话功能简述〉<br>
 * 〈搜索用的参数业务bean〉
 *
 * @author wq
 * @date 2018/8/5 0005
 * @since 1.0.0
 */
public class SearchProductVo {

    private String pid;
    private String pname;
    private String pidentity;
    private String image;
    private double shopPrice;
    private String catName;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPidentity() {
        return pidentity;
    }

    public void setPidentity(String pidentity) {
        this.pidentity = pidentity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(double shopPrice) {
        this.shopPrice = shopPrice;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }
}