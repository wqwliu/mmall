package com.ecg.manager.pojo.dto;

public class TbUserSearch {

    private String start;

    private String end ;

    private String uname;

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    @Override
    public String toString() {
        return "TbSearch{" +
                "start=" + start +
                ", end=" + end +
                ", uname='" + uname + '\'' +
                '}';
    }

    public TbUserSearch() {
        super();
    }
}
