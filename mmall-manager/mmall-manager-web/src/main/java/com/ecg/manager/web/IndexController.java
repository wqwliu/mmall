package com.ecg.manager.web;

import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.po.TbHeadLineAndCategory;
import com.ecg.manager.pojo.po.TbHeadline;
import com.ecg.manager.pojo.po.TbIndeximage;
import com.ecg.manager.service.IndexService;
import com.ecg.utils.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author skyfxu
 * @Title: indexController
 * @ProjectName mmall
 * @Description: TODO
 * @date 2018/7/30 16:56
 */

@Controller
public class IndexController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private IndexService indexService;


    @RequestMapping(value = "/admin/index/getlimagelist",method = RequestMethod.GET)
    public @ResponseBody ProductResult<TbIndeximage> listLimage(){
        ProductResult<TbIndeximage> result=null;
        try {
            result  =  indexService.listLimage();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return result;
    }

    @RequestMapping(value = "/admin/index/add/addlimage",method = RequestMethod.POST)
    public String addindeximage(@RequestParam String a){
        System.out.println(a);
        String[] split = a.split(",\"file\":\"\"");
        a=split[0]+split[1];
        split=a.split("<img src=");
        System.out.println(split[0]);
        if(split.length>1){
            String aa=split[1].substring(2,split[1].length()-21);
            aa=aa.replace("\\","");
            System.out.println(aa);
            a=split[0]+aa+"}";
            System.out.println(a);
        }
        TbIndeximage tb = JsonUtils.jsonToPojo(a, TbIndeximage.class);
        System.out.println(tb.getImage());
        int i=0;
        try {
            i  =  indexService.addIndexImage(tb);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        System.out.println("=============>"+i);
        return Integer.toString(i);
    }


    @ResponseBody
    @RequestMapping(value = "/admin/uploadImage", method = RequestMethod.POST)
    public String uploadImage(@RequestParam MultipartFile file) {
        System.out.println("xbz"+file.getName());
        Map<String, Object> map = new HashMap<String, Object>();
        String jsonString = "";
        try {
            //1 将文件上传到fdfs
            //a 初始化实体类
            FastDFSFile fastDFSFile = new FastDFSFile(file.getBytes(), file.getOriginalFilename(), file.getSize());
            //b 上传
            //path  /group1/M00/00/00/xxxx.jpg
            //模拟上传   /usr/bin/fdfs_upload_file /etc/fdfs/client.conf  /opt/soft/2.jpg
            ///group1/M00/00/00/xxxx.jpg
            // http://101.132.38.253/group1/M00/00/00/xxxx.jpg
            String filePath = FastDFSUtils.uploadFile(fastDFSFile);
            //2 回显到富文本编辑器中
            String basePath = PropKit.use("fdfs_client.conf").get("fdfs_server");
            //判断filePath是否为空，不为空上传成功
            if(StrKit.notBlank(filePath)){
                //不为空
                map.put("code",0);
                map.put("msg", "success");
                Map<String, Object> dataMap = new HashMap<String, Object>();
                System.out.println("basePath:"+basePath);
                System.out.println("http://118.25.228.20:83/"+ filePath);
                dataMap.put("src","http://118.25.228.20:83/"+ filePath);
                map.put("data", dataMap);
            }else{
                map.put("code", 1);
                map.put("msg", "fail");
                Map<String,Object> dataMap = new HashMap<String,Object>();
                dataMap.put("src", "");
                map.put("data", dataMap);
            }
            jsonString = JsonUtils.objectToJson(map);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return jsonString;
    }

    @RequestMapping(value = "/admin/index/getlimage",method = RequestMethod.GET)
    public String getlimage(@RequestParam String iid,Model model){
        System.out.println("正在执行");
        TbIndeximage tbIndeximage=null ;
        try {
            tbIndeximage=indexService.getlimage(iid);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        model.addAttribute("aabbcc",tbIndeximage);
        return "pages/indexlib/ledit";
    }

    @ResponseBody
    @RequestMapping(value = "/admin/index/limage/update",method = RequestMethod.POST)
    public String updatelimage(@RequestParam String a){
        System.out.println(a);
        String[] split = a.split(",\"file\":\"\"");
        a=split[0]+split[1];
        split=a.split("<img src=");
        System.out.println(split[0]);
        if(split.length>1){
            String aaa=split[1].substring(2,split[1].length()-21);
            aaa=aaa.replace("\\","");
            System.out.println(aaa);
            a=split[0]+aaa+"}";
            System.out.println(a);
        }
        TbIndeximage tb = JsonUtils.jsonToPojo(a, TbIndeximage.class);
        int i=0;
        try {
            i=indexService.updateimage(tb);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        System.out.println("=============>"+i);
        return Integer.toString(i);
    }

    @ResponseBody
    @RequestMapping(value = "/admin/index/limage/delete",method = RequestMethod.GET)
    public String deletelimage(@RequestParam String iid){
        System.out.println("delete:"+iid);
        int i=0;
        try {
            i=indexService.deleteImage(iid);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return Integer.toString(i);
    }

    //左侧列表的控制
    @RequestMapping(value = "/admin/index/getlists",method = RequestMethod.GET)
    public @ResponseBody ProductResult<TbHeadline> getlist(){
        ProductResult<TbHeadline> result=null;
        try {
            result  =  indexService.getlist();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return result;
    }


    @RequestMapping(value = "/admin/index/addIndexOther",method = RequestMethod.POST)
    public String addIndexOther(@RequestParam String a){
        System.out.println(a);
        String[] split = a.split(",\"file\":\"\"");
        a=split[0]+split[1];
        split=a.split("<img src=");
        System.out.println(split[0]);
        if(split.length>1){
            String aaa=split[1].substring(2,split[1].length()-21);
            aaa=aaa.replace("\\","");
            System.out.println(aaa);
            a=split[0]+aaa+"}";
            System.out.println(a);
        }
        TbHeadline tb = JsonUtils.jsonToPojo(a, TbHeadline.class);
        System.out.println(tb.getImage());
        int i=0;
        try {
            i  =  indexService.addIndexOther(tb);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return Integer.toString(i);
    }

    @RequestMapping(value = "/admin/index/getIndexother",method = RequestMethod.GET)
    public String getIndexother(@RequestParam String hid,Model model){
        System.out.println("正在执行!");
        TbHeadline tbHeadline=null ;
        int i=0;
        try {
            tbHeadline=indexService.getIndexother(hid);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        model.addAttribute("aabbcc",tbHeadline);
        return "pages/indexlib/otheredit";
    }

    @ResponseBody
    @RequestMapping(value = "/admin/index/Indexother/update",method = RequestMethod.POST)
    public String updateIndexother(@RequestParam String a){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!======>>>");
        System.out.println(a);
        String[] split = a.split(",\"file\":\"\"");
        a=split[0]+split[1];
        split=a.split("<img src=");
        System.out.println(split[0]);
        if(split.length>1){
            String aaa=split[1].substring(2,split[1].length()-21);
            aaa=aaa.replace("\\","");
            System.out.println(aaa);
            a=split[0]+aaa+"}";
            System.out.println(a);
        }
        TbHeadline tb = JsonUtils.jsonToPojo(a, TbHeadline.class);
        int i=0;
        try {
            i=indexService.updateIndexother(tb);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return Integer.toString(i);
    }

    @ResponseBody
    @RequestMapping(value = "/admin/index/indexOther/delete",method = RequestMethod.GET)
    public String deleteIndexOther(@RequestParam String hid){
        System.out.println("hid:"+hid);
        int i=0;
        try {
            i=indexService.deleteIndexOther(hid);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return Integer.toString(i);
    }


    
}
