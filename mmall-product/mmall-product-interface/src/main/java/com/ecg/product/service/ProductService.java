package com.ecg.product.service;

import com.ecg.product.pojo.po.TbProduct;

/**前台商品的服务接口层
 * @author wq
 * @date 2018.8.1
 */
public interface ProductService {
    /**
     * 根据pid在前台显示具体商品
     * @param pid
     * @return TbProduct
     */
    TbProduct showProductByPid(String pid);
}
