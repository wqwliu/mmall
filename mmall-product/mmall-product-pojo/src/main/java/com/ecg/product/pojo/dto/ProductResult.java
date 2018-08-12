package com.ecg.product.pojo.dto;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈产品的结果集类〉
 *
 * @author wq
 * @date 2018/7/31 0031
 * @since 1.0.0
 */
public class ProductResult<T> {

    private String url;
    private List<T> data;

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}