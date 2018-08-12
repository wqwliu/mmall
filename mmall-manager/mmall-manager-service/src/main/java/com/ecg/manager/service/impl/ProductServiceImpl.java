package com.ecg.manager.service.impl;

import com.ecg.manager.dao.TbProductCustomMapper;
import com.ecg.manager.dao.TbProductMapper;
import com.ecg.manager.dao.TbSearchMapperCustom;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductQuery;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.po.TbProduct;
import com.ecg.manager.pojo.po.TbProductExample;
import com.ecg.manager.pojo.vo.SearchProductVo;
import com.ecg.manager.pojo.vo.TbProductCustom;
import com.ecg.manager.service.ProductService;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrInputDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
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
    @Autowired
    private TbSearchMapperCustom searchMapperDao;
    @Autowired
    private SolrServer solrServer;

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
            //获得hid的list集合
            List<String> hidList = productCustomDao.getHidList(productQuery.getHid());
            //count
            long count = productCustomDao.countProducts(productQuery,hidList);
            result.setCount(count);
            List<TbProductCustom> data = productCustomDao.listProductsByPage(pageParam,productQuery,hidList);
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
        product.setPstatus((int) (Math.random() + 1));
        String image = product.getImage();
        String[] split = image.split("\"");
        StringBuilder imag = new StringBuilder();
        for (String s:split) {
            if(s.contains("http")){
                imag.append(s).append(",");

            }
        }
        imag.deleteCharAt(imag.length() - 1);
        String ima = imag.toString();
        product.setImage(ima);
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

    @Override
    public void importSearchItem() throws IOException, SolrServerException {
        try {
            //1 采集数据
            List<SearchProductVo> searchProductList = searchMapperDao.getSearchProductList();
            //2 导入索引库（遍历集合 documentList）
            for (SearchProductVo p:searchProductList) {
                SolrInputDocument document = new SolrInputDocument();
                document.addField("id",p.getPid());
                document.addField("item_pname",p.getPname());
                document.addField("item_pidentity",p.getPidentity());
                document.addField("item_price",p.getShopPrice());
                document.addField("item_image",p.getImage());
                document.addField("item_category_name",p.getCatName());
                //c addDocument
                solrServer.add(document);
            }
            solrServer.commit();
        } catch (SolrServerException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
        } catch (IOException e1) {
            logger.error(e1.getMessage(),e1);
            e1.printStackTrace();
        } catch (Exception e2){
            logger.error(e2.getMessage(),e2);
            e2.printStackTrace();
        }
    }
}