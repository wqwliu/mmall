package com.ecg.product.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 〈一句话功能简述〉<br>
 * 〈查看jsp页专用〉
 *
 * @author wq
 * @date 2018/7/31 0923
 * @since 1.0.0
 */
@Controller
public class ViewController {

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/{path}",method = RequestMethod.GET)
    public String view(@PathVariable String path){
        return path;
    }

    @RequestMapping(value = "/pages/{path1}",method = RequestMethod.GET)
    public String view2(@PathVariable String path1){
        return "pages/"+path1;
    }

    @RequestMapping(value = "/pages/{path1}/{path2}",method = RequestMethod.GET)
    public String view2(@PathVariable String path1,@PathVariable String path2){
        return "pages/"+path1+"/"+path2;
    }

    @RequestMapping(value = "/pages/{path1}/{path2}/{path3}",method = RequestMethod.GET)
    public String view2(@PathVariable String path1,@PathVariable String path2,@PathVariable String path3){
        return "pages/"+path1+"/"+path2+"/"+path3;
    }

    @RequestMapping(value = "/user/{path1}",method = RequestMethod.GET)
    public String view3(@PathVariable String path1){
        return "user/"+path1;
    }
}