package com.ecg.search.dao;

import com.ecg.search.pojo.dto.SearchResult;
import com.ecg.search.pojo.vo.SearchProductVo;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈搜索solr的dao层〉
 *
 * @author wq
 * @date 2018/8/5 0005
 * @since 1.0.0
 */
@Repository
public class SearchProductDao {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SolrServer solrServer;

    public SearchResult<SearchProductVo> search(SolrQuery query, int pageSize){
        //recordCount 总记录数，pageSize 每页显示的条数
        //totalPages
        //list
        SearchResult<SearchProductVo> result = new SearchResult<>();
        try {
            //创建索引库 List --DocumentList
            //搜索索引库DocumentList--List
            //获取查询响应
            QueryResponse response = solrServer.query(query);
            //文档域列表
            SolrDocumentList documentList = response.getResults();
            //获取符合条件总记录数
            long recordCount = documentList.getNumFound();
            result.setRecordCount(recordCount);
            //获取总页数 (总记录数+每页显示条数-1)/每页显示条数
            long totalPages = (recordCount + pageSize - 1) / pageSize;
            result.setTotalPages(totalPages);
            //高亮集合
            Map<String, Map<String, List<String>>> highlighting = response.getHighlighting();
            //DocumentList--List
            List<SearchProductVo> list = new ArrayList<>();
            for (SolrDocument document: documentList) {
                //创建VO对象
                SearchProductVo productVo = new SearchProductVo();
                //把document里面的字段设值到VO对象中
                productVo.setPid((String) document.get("id"));
                productVo.setPidentity((String) document.get("item_pidentity"));
                productVo.setCatName((String) document.get("item_category_name"));
                productVo.setShopPrice((Double) document.get("item_price"));
                productVo.setImage((String) document.get("item_image"));
                //遍历高亮部分
                List<String> stringList = highlighting.get(document.get("id")).get("item_pname");
                String pname = "";
                if(stringList != null && ! stringList.isEmpty()){
                    pname = stringList.get(0);
                }else {
                    pname = (String) document.get("item_pname");
                }
                productVo.setPname(pname);
                list.add(productVo);
            }
            result.setList(list);
        } catch (SolrServerException e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        } catch (Exception e1){
            logger.error(e1.getMessage(),e1);
            e1.printStackTrace();
        }
        return result;
    }
}