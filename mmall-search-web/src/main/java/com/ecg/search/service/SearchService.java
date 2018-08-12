package com.ecg.search.service;

import com.ecg.search.pojo.dto.SearchResult;
import com.ecg.search.pojo.vo.SearchProductVo;

/**
 * @author wq
 * 搜索产品服务层接口类
 */
public interface SearchService {

    /**
     * 根据关键词solr搜索返回结果分页
     * @param keyWord
     * @param pageIndex
     * @param pageSize
     * @return searchProduct
     */
    SearchResult<SearchProductVo> searchProduct(String keyWord, int pageIndex, int pageSize);
}
