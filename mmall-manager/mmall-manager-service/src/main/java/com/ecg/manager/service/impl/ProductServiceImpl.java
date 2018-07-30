package com.ecg.manager.service.impl;

import com.ecg.manager.dao.TbProductCustomMapper;
import com.ecg.manager.dao.TbProductMapper;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductQuery;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.po.TbProduct;
import com.ecg.manager.pojo.po.TbProductExample;
import com.ecg.manager.pojo.vo.TbProductCustom;
import com.ecg.manager.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
    @Autowired
    private TbProductMapper productDao;

    @Override
    public ProductResult<TbProductCustom> listProduct(PageParam pageParam, ProductQuery productQuery) {
        //新建结果对象
        ProductResult<TbProductCustom> result = new ProductResult<>();
        result.setCode(0);
        result.setMsg("select successful");
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("pageParam", pageParam);
            map.put("productQuery",productQuery);
            //count
            long count = productCustomDao.countProducts(map);
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

    @Override
    public int insertProduct(TbProduct product) {
        int i = 0;
        String pid = UUID.randomUUID().toString().replaceAll("-","");
        product.setPid(pid);
        product.setPstatus(2);
        try {
            i = productDao.insert(product);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int updateProductByPid(String pid) {
        int i = 0;
        try {
            TbProduct product = new TbProduct();
            product.setPid(pid);
            //将Pstatus修改为3删除状态
            product.setPstatus(3);
            i = productDao.updateByPrimaryKeySelective(product);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int updateProductsByPids(List<String> pids) {
        int i = 0;
        try {
            TbProduct product = new TbProduct();
            product.setPstatus(3);
            TbProductExample example = new TbProductExample();
            TbProductExample.Criteria criteria = example.createCriteria();
            criteria.andPidIn(pids);
            i = productDao.updateByExampleSelective(product, example);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int editProduct(TbProduct product) {
        int i = 0;
        try {
            i = productDao.updateByPrimaryKeySelective(product);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public TbProduct getProduct(String pid) {
        TbProduct tbProduct = null;
        try {
            tbProduct = productDao.selectByPrimaryKey(pid);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return tbProduct;
    }

    @Override
    public int updateProduct(TbProduct product) {
        int i=0;
        try {
            TbProductExample example=new TbProductExample();
            example.createCriteria().andPidEqualTo(product.getPid());
            i=productDao.updateByExampleSelective(product,example);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }
}