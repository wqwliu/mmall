package com.ecg.cart.web;

import com.ecg.cart.pojo.po.TbOrder;
import com.ecg.cart.pojo.vo.ItemsResult;
import com.ecg.cart.service.MyOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/order")
public class MyOrderController {
    @Autowired
    private MyOrderService myOrderService;
    @RequestMapping("/listOrders")
    public @ResponseBody ItemsResult<TbOrder> listOrders(String uid){
        ItemsResult<TbOrder> ir=new ItemsResult<TbOrder>();
        ir.setCode(1);
        ir.setMsg("获取订单信息失败");
        try{
            List<TbOrder> list=myOrderService.listOrders(uid);
            ir.setCode(0);
            ir.setMsg("获取订单信息成功");
            ir.setData(list);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ir;
    }
    @RequestMapping("/getOrderByOid")
    public String getOrderByOid(String oid,Model model){

        TbOrder tbOrder=myOrderService.getOrderByOid(oid);
        model.addAttribute("tbOrder",tbOrder);
        return "pages/order/showOneOrder";
    }
}
