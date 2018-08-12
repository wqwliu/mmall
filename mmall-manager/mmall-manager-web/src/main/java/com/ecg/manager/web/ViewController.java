package com.ecg.manager.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 〈一句话功能简述〉<br>
 * 〈查看jsp页专用〉
 *
 * @author wq
 * @date 2018/7/24 0024
 * @since 1.0.0
 */
@Controller
public class ViewController {

    @RequestMapping(value = "/")
    public String login(){
        return "index";
    }

    @RequestMapping(value = "/{path}")
    public String view(@PathVariable String path){
        return path;
    }

    @RequestMapping(value = "/pages/{path1}")
    public String view2(@PathVariable String path1){
        return "pages/"+path1;
    }

    @RequestMapping(value = "/pages/{path1}/{path2}")
    public String view2(@PathVariable String path1,@PathVariable String path2){
        return "pages/"+path1+"/"+path2;
    }

    @RequestMapping(value = "/pages/{path1}/{path2}/{path3}")
    public String view2(@PathVariable String path1,@PathVariable String path2,@PathVariable String path3){
        return "pages/"+path1+"/"+path2+"/"+path3;
    }
}