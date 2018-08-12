package com.ecg.portal.pojo;

/**
 * @author skyfxu
 * @Title: TbHeadLineAndCategory
 * @ProjectName mmall
 * @Description: TODO
 * @date 2018/8/3 17:56
 */
public class TbHeadLineAndCategory extends TbHeadline{
    String tcname;

    String pid;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public void setTcname(String tcname) {
        this.tcname = tcname;
    }

    public String getTcname() {
        return tcname;
    }
}
