package com.ecg.utils;

import org.apache.http.HttpResponse;

import java.util.HashMap;
import java.util.Map;

public class SendPhoneCode {
    //【ecg商城】本次验证只用于登入操作,验证码为1212121,请勿将此验证码告予他人!
    public static void sendPhoneCode(int code,String phone){
        String host = "http://cdcxdxjk.market.alicloudapi.com";
        String path = "/chuangxin/dxjk";
        String method = "POST";
        String appcode = "7e70a42240e54992ba0becabd725475e";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<String, String>();
        Map<String, String> bodys = new HashMap<String, String>();
        querys.put("content", "【ecg商城】本次验证只用于登入操作,验证码为"+code+",请勿将此验证码告予他人!");
        querys.put("mobile", phone);
        try {
            HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
            System.out.println(response.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
