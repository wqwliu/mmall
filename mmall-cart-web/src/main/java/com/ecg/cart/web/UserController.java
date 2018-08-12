package com.ecg.cart.web;

import com.ecg.cart.pojo.vo.StatusResult;
import com.ecg.cart.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/getUid")
    public @ResponseBody Object getUid(String callBackId){
        StatusResult sr=userService.getUid();
        MappingJacksonValue mjv=new MappingJacksonValue(sr);
        mjv.setJsonpFunction(callBackId);
        return mjv;
    }
    @RequestMapping("/setUid")
    public @ResponseBody StatusResult setUid(String uid){
        StatusResult sr=new StatusResult();
        sr.setCode(1);
        sr.setMsg("用户储存失败");
        try{
            userService.setUid(uid);
            sr.setCode(0);
            sr.setMsg("用户储存成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return sr;
    }
}
