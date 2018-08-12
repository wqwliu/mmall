package com.ecg.manager.service.impl;

import com.ecg.manager.dao.TbOrderCustomMapper;
import com.ecg.manager.pojo.dto.OrderQuery;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.vo.TbOrderCustom;
import com.ecg.manager.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈订单服务实现类〉
 *
 * @author wq
 * @create 2018/8/12 0012
 * @since 1.0.0
 */
@Service
public class OrderServiceImpl implements OrderService{

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private TbOrderCustomMapper orderCustomDao;

    @Override
    public ProductResult<TbOrderCustom> showOrder(PageParam pageParam, OrderQuery orderQuery) {
        ProductResult<TbOrderCustom> result = new ProductResult<>();
        result.setCode(0);
        result.setMsg("select successful");

        try {
            Map<String, Object> map = new HashMap<>();
            map.put("pageParam", pageParam);
            map.put("orderQuery",orderQuery);
            //count
            long count = orderCustomDao.countOrders(map);
            result.setCount(count);
            //orderList
            List<TbOrderCustom> data = orderCustomDao.listOrdersByPage(map);
            result.setData(data);
        } catch (Exception e) {
            result.setCode(1);
            result.setMsg("select failed");
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }
}