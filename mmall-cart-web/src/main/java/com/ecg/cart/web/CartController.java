package com.ecg.cart.web;


import com.ecg.cart.pojo.po.TbOrder;
import com.ecg.cart.pojo.vo.ItemsResult;
import com.ecg.cart.pojo.vo.ReceivePeople;
import com.ecg.cart.pojo.vo.StatusResult;
import com.ecg.cart.pojo.vo.TbCartItem;
import com.ecg.cart.service.CartService;
import com.ecg.utils.StrKit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @RequestMapping("/saveToCart")
    public @ResponseBody
    Object saveToCart(TbCartItem tbCartItem, String successCallback, @RequestParam(defaultValue = "") String uname, HttpServletResponse response, HttpSession session) throws IOException {
        StatusResult rs = new StatusResult();
        rs.setCode(1);
        rs.setMsg("添加失败");
        rs.setRetCode(0);

            try {
                cartService.saveToCart(tbCartItem, uname);
                rs.setMsg("添加成功");
                rs.setRetCode(200);
                rs.setCode(0);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if(StrKit.notBlank(uname)){
                session.setAttribute("uname",uname);
            }
        MappingJacksonValue mj = new MappingJacksonValue(rs);
        mj.setJsonpFunction(successCallback);
        return mj;
    }

    @RequestMapping("/getCart")
    public @ResponseBody
    ItemsResult<TbCartItem> getCart(@RequestParam(defaultValue = "") String uid, HttpServletResponse response) throws IOException {

        ItemsResult<TbCartItem> ir = new ItemsResult<TbCartItem>();
        ir.setCode(1);
        ir.setMsg("查询失败");
        try {
            List<TbCartItem> list = cartService.getCart(uid);
            ir.setCount(list.size());
            ir.setData(list);
            ir.setMsg("查询成功");
            ir.setCode(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ir;
    }

    @RequestMapping("/deleteCartItem")
    public @ResponseBody
    ItemsResult<TbCartItem> deleteCartItem(String pid,@RequestParam(defaultValue = "") String uid, HttpServletResponse response) throws IOException {
        ItemsResult<TbCartItem> ir = new ItemsResult<TbCartItem>();
        ir.setCode(1);
        ir.setMsg("删除失败");
        try {
            cartService.deleteCartItem(pid,uid);
            ir.setMsg("删除成功");
            ir.setCode(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ir;
    }
    @RequestMapping("/deleteOneCart")
    public @ResponseBody
    StatusResult deleteOneCart(String pid,@RequestParam(defaultValue = "") String uid, HttpServletResponse response) throws IOException {
        StatusResult sr=null;
        sr=cartService.deleteOneCart(pid,uid);
        return sr;
    }
    @RequestMapping("/addOneCart")
    public @ResponseBody
    StatusResult addOneCart(String pid,@RequestParam(defaultValue = "") String uid, HttpServletResponse response) throws IOException {
        StatusResult sr=null;
        sr=cartService.addOneCart(pid,uid);
        return sr;
    }
    @RequestMapping("/submitCart")
    public String submitCart(ReceivePeople receivePeople, String uid, Map<String,Object> map){
        TbOrder tbOrder=cartService.submitCart(receivePeople,uid);
        map.put("tbOrder",tbOrder);
        return "pages/cart/successOrder";
    }
}
