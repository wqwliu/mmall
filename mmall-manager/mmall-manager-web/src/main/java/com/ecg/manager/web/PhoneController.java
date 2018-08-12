package com.ecg.manager.web;

import com.ecg.manager.pojo.vo.ResultStatus;
import com.ecg.manager.service.PhoneService;
import com.ecg.utils.SendPhoneCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/phone")
public class PhoneController {
    @Autowired
    private PhoneService phoneService;
    @RequestMapping("/sendPhoneCode")
    public@ResponseBody
    ResultStatus<String> sendPhoneCode(String phone){
        ResultStatus<String> rs=new ResultStatus<String>();
        rs.setCode(1);
        rs.setMsg("验证码发送失败");
        try{
            int code = (int)Math.ceil(Math.random() * 9000 + 1000);
            phoneService.saveCodeToRedis(code,phone);
            SendPhoneCode.sendPhoneCode(code,phone);
            rs.setCode(0);
            rs.setMsg("验证码发送成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    @RequestMapping("/checkPhoneCode")
    public@ResponseBody ResultStatus<String> checkPhoneCode(String code,String phone){
        ResultStatus<String> rs=phoneService.checkCodeToRedis(code,phone);
        return rs;
    }
}
