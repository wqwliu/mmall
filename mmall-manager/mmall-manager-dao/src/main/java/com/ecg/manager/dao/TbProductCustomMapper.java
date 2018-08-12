package com.ecg.manager.dao;

import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.ProductQuery;
import com.ecg.manager.pojo.vo.TbProductCustom;
import org.apache.ibatis.annotations.Param;

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
     * @param productQuery
     * @param hidList
     * @return
     */
    long countProducts(@Param("productQuery")ProductQuery productQuery, @Param("list")List<String> hidList);

    /**
     * 返回所有商品的分页和查询数据
     * @param pageParam
     * @param productQuery
     * @param hidList
     * @return
     */
    List<TbProductCustom> listProductsByPage(@Param("pageParam")PageParam pageParam,@Param("productQuery")ProductQuery productQuery, @Param("list") List<String> hidList);

    /**
     * 查询hl表格获得hid的list
     * @param hid
     * @return
     */
    List<String> getHidList(String hid);
}