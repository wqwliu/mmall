package com.ecg.portal.web;

import com.ecg.portal.pojo.TbHeadLineAndCategory;
import com.ecg.portal.pojo.TbIndeximage;
import com.ecg.portal.service.IndexService;
import com.ecg.utils.StrKit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author skyfxu
 * @Title: IndexService
 * @ProjectName mmall
 * @Description: TODO
 * @date 2018/8/10 21:55
 */
@Controller
public class IndexController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private IndexService indexService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String getlunboImage(Model model,@RequestParam(defaultValue = "")String uname){
        System.out.println("hid:");
        List<TbIndeximage> list = null;
        int i=0;
        try {
            list=indexService.getImageList();
            model.addAttribute("abcimages",list);
            if(StrKit.notBlank(uname)){
                model.addAttribute("user",uname);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return "index/index";
    }

    @RequestMapping(value = "/admin/index/forindexleft",method = RequestMethod.GET)
    public @ResponseBody List<TbHeadLineAndCategory> getleftImage(@RequestParam Integer parendId, Model model){
        System.out.println("hid!!!:"+parendId);
        System.out.println("=======>");
        List<TbHeadLineAndCategory> list = null;
        try {
            list=indexService.getLeftImageList(parendId);
            model.addAttribute("abcimages",list);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return list;
    }
}
