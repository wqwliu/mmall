package com.ecg.manager.web;

import com.ecg.manager.pojo.dto.OrderQuery;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.vo.TbOrderCustom;
import com.ecg.manager.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 〈一句话功能简述〉<br>
 * 〈订单控制层〉
 *
 * @author wq
 * @create 2018/8/12 0012
 * @since 1.0.0
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderServcie;

    @ResponseBody
    @RequestMapping("/show")
    public ProductResult<TbOrderCustom> showOrder(PageParam pageParam, OrderQuery orderQuery){
        ProductResult<TbOrderCustom>  result = null;
        try {
            result = orderServcie.showOrder(pageParam,orderQuery);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}