package com.ecg.search.service.impl;

import com.ecg.search.dao.SearchProductDao;
import com.ecg.search.pojo.dto.SearchResult;
import com.ecg.search.pojo.vo.SearchProductVo;
import com.ecg.search.service.SearchService;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 〈一句话功能简述〉<br>
 * 〈搜索的实现类〉
 *
 * @author wq
 * @date 2018/8/5 0005
 * @since 1.0.0
 */
@Service
public class SearchServiceImpl implements SearchService{

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SearchProductDao searchProductDao;
    @Autowired
    private SolrServer solrServer;


    @Override
    public SearchResult<SearchProductVo> searchProduct(String keyWord, int pageIndex, int pageSize) {
        SearchResult<SearchProductVo> result = null;
        try {
            //创建solr查询对象
            SolrQuery query = new SolrQuery();
            //设置查询的关键字
            query.setQuery(keyWord);
            //设置pageIndex当前页的页码
            if(pageIndex<=0){
                pageIndex=1;
            }
            //设置查询的分页条件 起使的页码=(当前页-1)*当前页条数
            query.setStart((pageIndex - 1) * pageSize);
            //设置每页的条数
            query.setRows(pageSize);
            //设置默认查询字段 df default search field
            query.set("df", "item_keywords");
            //设置高亮部分
            query.setHighlight(true);
            query.addHighlightField("item_pname");
            query.setHighlightSimplePre("<font style='color:red;'>");
            query.setHighlightSimplePost("</font>");
            //调用DAO层方法进行查询，查询条件：query
            result = searchProductDao.search(query, pageSize);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }
}