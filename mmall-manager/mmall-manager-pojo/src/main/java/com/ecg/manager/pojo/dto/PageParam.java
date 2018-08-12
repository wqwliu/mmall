package com.ecg.manager.pojo.dto;

/**
 * 〈一句话功能简述〉<br>
 * 〈分页用dto类〉
 *
 * @author wq
 * @date 2018/7/25 0025
 * @since 1.0.0
 */
public class PageParam {
    private int page;
    private int limit;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    /**
     * 设置一个offset(分页用的当页第一个页码),只要使用给page和limit赋值，那么offset自动计算出来
     * @return int
     */
    public int getOffset() {
        return (page - 1) * limit;
    }
}
