package com.ecg.manager.service;

import com.ecg.manager.pojo.dto.OrderQuery;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.vo.TbOrderCustom;

/**
 * 订单的接口
 * @author wq
 */
public interface OrderService {


    ProductResult<TbOrderCustom> showOrder(PageParam pageParam, OrderQuery orderQuery);
}
