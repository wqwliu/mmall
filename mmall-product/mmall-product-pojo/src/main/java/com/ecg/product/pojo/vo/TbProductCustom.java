package com.ecg.product.pojo.vo;

import com.ecg.product.pojo.po.TbProduct;

/**
 * 〈一句话功能简述〉<br>
 * 〈用于关联查询产品与其他的类〉
 *
 * @author wq
 * @date 2018/7/25 0025
 * @since 1.0.0
 */
public class TbProductCustom extends TbProduct{
    private String hlTitle;

    public String getHlTitle() {
        return hlTitle;
    }

    public void setHlTitle(String hlTitle) {
        this.hlTitle = hlTitle;
    }
}