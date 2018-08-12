package com.ecg.manager.pojo.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class TbUser {
    private String uid;

    private String uname;

    private String username;

    private String password;

    private String usex;

    private String uphone;

    private String uemail;

    private Double umoney;

    private Date ubirthday;

    private Date createdate;

    private String image;

    private String statu;

    private String card;

    @Override
    public String toString() {
        return "TbUser{" +
                "uid='" + uid + '\'' +
                ", uname='" + uname + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", usex='" + usex + '\'' +
                ", uphone='" + uphone + '\'' +
                ", uemail='" + uemail + '\'' +
                ", umoney=" + umoney +
                ", ubirthday=" + ubirthday +
                ", createdate=" + createdate +
                ", image='" + image + '\'' +
                ", statu='" + statu + '\'' +
                ", card='" + card + '\'' +
                '}';
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex == null ? null : usex.trim();
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone == null ? null : uphone.trim();
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail == null ? null : uemail.trim();
    }

    public Double getUmoney() {
        return umoney;
    }

    public void setUmoney(Double umoney) {
        this.umoney = umoney;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getUbirthday() {
        return ubirthday;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public void setUbirthday(Date ubirthday) {
        this.ubirthday = ubirthday;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public Date getCreatedate() {
        return createdate;
    }

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }
}