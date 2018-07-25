package com.ecg.manager.service.impl;

import com.ecg.manager.dao.TbProductCustomMapper;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.vo.TbProductCustom;
import com.ecg.manager.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈产品的service实现类〉
 *
 * @author wq
 * @date 2018/7/25 0025
 * @since 1.0.0
 */
@Service
public class ProductServiceImpl implements ProductService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private TbProductCustomMapper productCustomDao;

    @Override
    public ProductResult<TbProductCustom> listProduct(PageParam pageParam) {
        //新建结果对象
        ProductResult<TbProductCustom> result = new ProductResult<>();
        result.setCode(0);
        result.setMsg("select successful");
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("pageParam", pageParam);
            //count
            long count = productCustomDao.countProducts();
            result.setCount(count);
            List<TbProductCustom> data = productCustomDao.listProductsByPage(map);
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