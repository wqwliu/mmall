package com.ecg.manager.service;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductQuery;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.po.TbProduct;
import com.ecg.manager.pojo.vo.TbProductCustom;
import org.apache.solr.client.solrj.SolrServerException;

import java.io.IOException;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈产品服务层接口类〉
 *
 * @author wq
 * @date 2018/7/24 0024
 * @since 1.0.0
 */
public interface ProductService {

    /**
     *根据条件返回产品
     * @param pageParam
     * @param productQuery
     * @return TbProductCustom
     */
    ProductResult<TbProductCustom> listProduct(PageParam pageParam, ProductQuery productQuery);

    /**
     * 添加产品
     * @return int
     * @param product
     */
    int insertProduct(TbProduct product);

    /**
     * 根据pid删除产品
     * @param pid
     * @return int
     */
    int updateProductByPid(String pid);

    /**
     * 根据pids批量删除
     * @param pids
     * @return int
     */
    int updateProductsByPids(List<String> pids);

    /**
     * 修改任意属性
     * @param product
     * @return
     */
    int editProduct(TbProduct product);

    /**
     * 根据pid获得产品回显
     * @param pid
     * @return TbProduct
     */
    TbProduct getProduct(String pid);

    /**
     * 根据主键更新产品信息
     * @param product
     * @return int
     */
    int updateProduct(TbProduct product);

    /**
     * solr传入搜索数据
     */
    void importSearchItem() throws IOException, SolrServerException;
}
