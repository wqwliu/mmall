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
    private String pstatus;
    private String hid;
    private String ishot;
    private String title;

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

    public String getPstatus() {
        return pstatus;
    }

    public void setPstatus(String pstatus) {
        this.pstatus = pstatus;
    }

    public String getHid() {
        return hid;
    }

    public void setHid(String hid) {
        this.hid = hid;
    }

    public String getIshot() {
        return ishot;
    }

    public void setIshot(String ishot) {
        this.ishot = ishot;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}