package com.ecg.manager.dao;

import com.ecg.manager.pojo.po.TbHeadLineAndCategory;
import com.ecg.manager.pojo.po.TbHeadline;
import com.ecg.manager.pojo.po.TbHeadlineExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbHeadlineAndCategoryMapper {
    List<TbHeadLineAndCategory> selectByHid(Integer parendId);
}