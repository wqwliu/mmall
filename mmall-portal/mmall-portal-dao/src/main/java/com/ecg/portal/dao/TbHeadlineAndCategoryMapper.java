package com.ecg.portal.dao;

import com.ecg.portal.pojo.TbHeadLineAndCategory;

import java.util.List;

public interface TbHeadlineAndCategoryMapper {
    List<TbHeadLineAndCategory> selectByHid(Integer parendId);
}