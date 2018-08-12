package com.ecg.manager.dao;


import com.ecg.manager.pojo.vo.SearchProductVo;

import java.util.List;

/**
 * 搜索用dao层接口类
 */
public interface TbSearchMapperCustom {
    /**
     *搜索产品的接口类
     *
     */
    List<SearchProductVo> getSearchProductList();
}
