package com.ecg.manager.dao;

import com.ecg.manager.pojo.vo.TbProductCustom;

import java.util.List;
import java.util.Map;
/**
 * 〈一句话功能简述〉<br>
 * 〈产品关联和分页的mapper接口类〉
 *
 * @author wq
 * @date  2018/7/25 0025
 * @since 1.0.0
 */
public interface TbProductCustomMapper {
    /**
     * 返回所有产品数量
     * @return long
     * @param map
     */
    long countProducts(Map<String, Object> map);

    /**
     * 返回所有商品的分页和查询数据
     * @param map
     * @return TbProductCustom
     */
    List<TbProductCustom> listProductsByPage(Map<String, Object> map);
}