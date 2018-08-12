package com.ecg.common.dto;

/**
 * 〈一句话功能简述〉<br>
 * 〈搜索导入信息结果返回〉
 *
 * @author wq
 * @create 2018/8/5 0005
 * @since 1.0.0
 */
public class MessageResult {
    private Boolean success;
    private String msg;
    private Object data;

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}