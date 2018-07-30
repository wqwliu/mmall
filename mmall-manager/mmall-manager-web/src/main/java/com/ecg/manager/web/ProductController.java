package com.ecg.manager.web;

import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductQuery;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.po.TbProduct;
import com.ecg.manager.pojo.vo.TbProductCustom;
import com.ecg.manager.service.ProductService;
import com.ecg.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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

    @Autowired
    private ProductService productService;

    @ResponseBody
    @RequestMapping(value = "/products",method = RequestMethod.GET)
    public ProductResult<TbProductCustom> listProduct(PageParam pageParam, ProductQuery productQuery){
        ProductResult<TbProductCustom> result = null;
        try {
            //todo
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
        System.out.println("====");
        TbProduct tbProduct=null;
        try {
            tbProduct=productService.getProduct(pid);
            System.out.println("====");
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("aabbcc",tbProduct);
        return "pages/item/edit";
    }

    @ResponseBody
    @RequestMapping(value = "/product/update",method = RequestMethod.POST)
    public String updateProduct(@RequestParam String a){
        System.out.println(a);
        String[] split = a.split(",\"file\":\"\"");
        a=split[0]+split[1];
        TbProduct tbProduct = JsonUtils.jsonToPojo(a, TbProduct.class);
        System.out.println(tbProduct);
        int i=0;
        try {
            i=productService.updateProduct(tbProduct);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Integer.toString(i);
    }


}