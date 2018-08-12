package com.ecg.manager.web;

import com.ecg.common.dto.MessageResult;
import com.ecg.common.jedis.JedisClient;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductQuery;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.po.TbProduct;
import com.ecg.manager.pojo.vo.TbProductCustom;
import com.ecg.manager.service.ProductService;
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

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈产品控制层〉
 *
 * @author wq
 * @date 2018/7/24 0024
 * @since 1.0.0
 */
@Controller
public class ProductController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ProductService productService;
    @Autowired
    private JedisClient jedisClient;

    @ResponseBody
    @RequestMapping(value = "/products",method = RequestMethod.GET)
    public ProductResult<TbProductCustom> listProduct(PageParam pageParam, ProductQuery productQuery){
        ProductResult<TbProductCustom> result = null;
        try {
            result  =  productService.listProduct(pageParam,productQuery);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/item/addproduct",method = RequestMethod.POST)
    public int addProduct(TbProduct product){
        int i = 0;
        try {
            i = productService.insertProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public int deleteProduct(String pid){
        int i = 0;
        try {
            i = productService.updateProductByPid(pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @ResponseBody
    @RequestMapping(value = "/item/delete",method = RequestMethod.POST)
    public int removeItems(@RequestParam("ids[]") List<String> pids){
        int i = 0;
        try {
            i = productService.updateProductsByPids(pids);
        }catch (Exception e){
            e.printStackTrace();
        }
        return i;
    }

    @ResponseBody
    @RequestMapping(value = "/acfun",method = RequestMethod.POST)
    public int editProduct(TbProduct product){
        int i = 0;
        try {
            i = productService.editProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping(value = "/product/getone/one",method = RequestMethod.GET)
    public String getProduct(String pid,Model model){
        TbProduct tbProduct=null;
        try {
            tbProduct=productService.getProduct(pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("aabbcc",tbProduct);
        return "pages/item/edit";
    }

    @ResponseBody
    @RequestMapping(value = "/product/update",method = RequestMethod.POST)
    public String updateProduct(@RequestParam String a){
        String[] split = a.split(",\"file\":\"\"");
        a=split[0]+split[1];
        TbProduct tbProduct = JsonUtils.jsonToPojo(a, TbProduct.class);
        int i=0;
        try {
            i=productService.updateProduct(tbProduct);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Integer.toString(i);
    }

    @ResponseBody
    @RequestMapping(value = "/uploadImage",method = RequestMethod.POST)
    public String uploadImage(@RequestParam MultipartFile file) {
        Map<String,Object> map = new HashMap<>();
        String jsonString = null;
        try {
            FastDFSFile fastDFSFile = new FastDFSFile(file.getBytes(),file.getOriginalFilename(),file.getSize());
            //上传
            // path /group1/M00/00/00/XXX.jpg
            // 模拟上传  /usr/bin/fdfs_upload_file  /etc/fdfs/client.conf  /opt/soft/2.jpg
            //  /group1/M00/00/00/xxx.jpg
            //  http://106.12.6.239/group1/M00/00/00/xxx.jpg
            String fielPath = FastDFSUtils.uploadFile(fastDFSFile);
            //回显到富文本编辑器中
            String basePath = PropKit.use("fdfs_client.conf").get("fdfs_server");
            //判断filePath是否为空，不为空上传成功
            if (StrKit.notBlank(fielPath)){
                //不为空
                map.put("code",0);
                map.put("msg","success");
                Map<String,Object> dataMap = new HashMap<>();
                dataMap.put("src", basePath + "/" + fielPath);
                map.put("data", dataMap);
            }else{
                //为空
                map.put("code", 1);
                map.put("msg", "fail");
                Map<String,Object> dataMap = new HashMap<String,Object>();
                dataMap.put("src", "");
                map.put("data", dataMap);
            }
            jsonString = JsonUtils.objectToJson(map);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        } catch (Exception e1){
            logger.error(e1.getMessage(), e1);
            e1.printStackTrace();
        }
        return jsonString;
    }

    @RequestMapping(value = "/view",method = RequestMethod.GET)
    public String viewImage(String pid,Model model){
        //去缓存查,报错不能影响主要功能
        //调用JedisClientCluster
        try {
            String json = jedisClient.hget("image", pid );
            //判断json是否为空
            if(StrKit.notBlank(json)){
                //json不为空
                List<String> list = new ArrayList<>();
                String[] split = json.split("\"");
                for (String s:split) {
                    if(s.contains("http")){
                        list.add(s);
                    }
                }
                model.addAttribute("list",list);
                return "/pages/item/view";
            }
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        //sql查询
        List<String> list = null;
        try {
            TbProduct product = productService.getProduct(pid);
            list = new ArrayList<>();
            String image = product.getImage();
            String[] strings = image.split(",");
            for (String s: strings) {
                list.add(s);
            }
            model.addAttribute("list",list);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }

        //3.存到缓存中
        try {
            //调用JedisClientCluster的hset
            jedisClient.hset("image",pid,JsonUtils.objectToJson(list));
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }

        return "/pages/item/view";
    }

    @ResponseBody
    @RequestMapping(value = "/search/item/import",method = RequestMethod.POST)
    public MessageResult importSearchItem(){
        MessageResult result = new MessageResult();
        result.setMsg("import failed");
        result.setSuccess(false);
        try {
            productService.importSearchItem();
            result.setMsg("import success");
            result.setSuccess(true);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }


}