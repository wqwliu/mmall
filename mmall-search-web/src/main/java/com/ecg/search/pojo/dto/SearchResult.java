package com.ecg.search.pojo.dto;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈搜索结果bean〉
 *
 * @author wq
 * @create 2018/8/5 0005
 * @since 1.0.0
 */
public class SearchResult<T> {

    /**
     *  符合条件的总记录数
     */
    private long recordCount;
    /**
     * 总页数
     */
    private long totalPages;
    /**
     * 指定分页的集合
     */
    private List<T> list;

    public long getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(long recordCount) {
        this.recordCount = recordCount;
    }

    public long getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(long totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}