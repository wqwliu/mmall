package com.ecg.manager.service;
import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.vo.TbProductCustom;

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
     *
     * @param pageParam
     * @return TbProductCustom
     */
    ProductResult<TbProductCustom> listProduct(PageParam pageParam);
}
