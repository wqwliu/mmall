package com.ecg.manager.web;

import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.vo.TbProductCustom;
import com.ecg.manager.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public ProductResult<TbProductCustom> listProduct(PageParam pageParam){
        ProductResult<TbProductCustom> result = null;
        try {
            //todo
            result  =  productService.listProduct(pageParam);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

}