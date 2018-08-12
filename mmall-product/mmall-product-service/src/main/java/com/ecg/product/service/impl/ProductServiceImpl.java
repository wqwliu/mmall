package com.ecg.product.service.impl;

import com.ecg.product.dao.TbProductMapper;
import com.ecg.product.pojo.po.TbProduct;
import com.ecg.product.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 〈一句话功能简述〉<br>
 * 〈前台产品服务的实现层〉
 *
 * @author wq
 * @create 2018/8/1 0001
 * @since 1.0.0
 */
@Service
public class ProductServiceImpl implements ProductService{

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TbProductMapper productDao;

    @Override
    public TbProduct showProductByPid(String pid) {
        TbProduct product = null;
        try {
            product = productDao.selectByPrimaryKey(pid);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return product;
    }
}