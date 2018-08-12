package com.ecg.search.dao;

import com.ecg.search.pojo.vo.SearchProductVo;

import java.util.List;

/**
 * 搜索用dao层接口类
 */
public interface SearchMapperCustom {
    /**
     *搜索产品的接口类
     *
     */
    List<SearchProductVo> getSearchProductList();
}
