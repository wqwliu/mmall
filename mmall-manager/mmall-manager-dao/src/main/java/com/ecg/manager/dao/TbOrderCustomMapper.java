package com.ecg.manager.dao;


import com.ecg.manager.pojo.vo.TbOrderCustom;

import java.util.List;
import java.util.Map;

/**
 * 订单查询的dao层接口
 * @author wq
 */
public interface TbOrderCustomMapper {

    /**
     * 返回所有订单数量
     * @param map
     * @return long
     */
    long countOrders(Map<String,Object> map);

    /**
     * 返回所有订单的分页和查询数据
     * @param map
     * @return List<TbOrderCustom>
     */
    List<TbOrderCustom> listOrdersByPage(Map<String,Object> map);
}