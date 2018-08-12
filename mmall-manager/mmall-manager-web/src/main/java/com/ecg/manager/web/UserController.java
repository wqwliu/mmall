package com.ecg.manager.web;


import com.ecg.common.jedis.JedisClient;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.TbUserResult;
import com.ecg.manager.pojo.dto.TbUserSearch;
import com.ecg.manager.pojo.po.TbUser;
import com.ecg.manager.pojo.vo.ResultStatus;
import com.ecg.manager.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private JedisClient jedisClient;

    @RequestMapping(value = "/register")
    public @ResponseBody int register(TbUser tbUser){
        System.out.println(tbUser.getUname());
        String msg ="";

        int i = userService.saveUser(tbUser);
        if(i!=0){
            msg="注册成功";

        }
        else{
            msg="注册失败";
        }
        return i;
    }

    @RequestMapping(value = "/login")
    public @ResponseBody
    ResultStatus login(TbUser tbUser){
        System.out.println(tbUser);
        String msg ="";
        ResultStatus result = new ResultStatus();
        TbUser u = userService.getUser(tbUser);

        System.out.println(u);

        if(u!=null){
            String statu = u.getStatu();
            System.out.println(statu);
            if(statu.equals("1")){
                result.setCode(0);
                msg="登录成功";
                result.setMsg(msg);
                return result;
            }else{
                result.setCode(1);
                msg="该用户已被封禁";
                result.setMsg(msg);
                return result;
            }
        }else {
            result.setCode(1);
            msg ="用户名或密码错误";
            result.setMsg(msg);
            return result;
        }

    }

    @RequestMapping(value = "/adminLogin")
    public @ResponseBody ResultStatus adminLogin(String name,String pwd,HttpSession session){
        String msg ="";
        ResultStatus result = new ResultStatus();
        if(name.equals("admin")&pwd.equals("admin")){
            result.setCode(0);
            session.setAttribute("user",name);
            msg="登录成功";
            result.setMsg(msg);
            return result;
        }else {

            result.setCode(1);
            msg ="用户名或密码错误";
            result.setMsg(msg);
            return result;

        }

    }

    @RequestMapping(value = "/getUserList")
    public @ResponseBody
    TbUserResult<TbUser> getUserList(PageParam pageParam, TbUserSearch userSearch, HttpSession session){


        System.out.println(userSearch);
        TbUserResult<TbUser> result =null;

        try {
            result = userService.listUsers(pageParam,userSearch);

        }catch (Exception e){
            e.printStackTrace();
        }




        return result;
    }

    @RequestMapping(value = "/deleteUser",method = RequestMethod.POST)
    public @ResponseBody int deleteUser(String uid){
        System.out.println(uid);
        String msg = "";
        int i = userService.deleteUser(uid);
        if(i!=0){
            msg = "删除成功";
        }
        msg = "删除失败";
        return  i;
    }

    @RequestMapping(value = "/getUserById")
    public @ResponseBody TbUser getUserById(String uid,HttpSession session){

        System.out.println(uid);

        TbUser u  =  userService.getUserById(uid);
        session.setAttribute("user",u);
        return  u;

    }

    @RequestMapping(value = "/updateUser")
    public @ResponseBody int updateUser(TbUser tbUser){

        int i = userService.updateUser(tbUser);

        return 1;
    }


    @RequestMapping(value = "/removeUserAll")
    public @ResponseBody int removeUserAll(@RequestParam("ids[]") List<String> ids){
        int i  = userService.removeUserAll(ids);

        return i;
    }

    @RequestMapping(value = "/updateUserStatu")
    public @ResponseBody int updateUserStatu(String uid,String statu,String val){
        System.out.println("uid="+uid);
        System.out.println("statu="+statu);
        int i = userService.updateUserStatu(uid,statu);
        return  i;
    }


    @RequestMapping(value = "/checkCode")
    public @ResponseBody int checkCode(String code,HttpSession session){
        String code1 = (String) session.getAttribute("checkcode_session");
        if(code.equals(code1)){
            return 0;
        }
        return 1;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }
}
