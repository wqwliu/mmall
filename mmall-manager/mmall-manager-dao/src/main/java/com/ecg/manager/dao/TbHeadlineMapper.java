package com.ecg.manager.dao;

import com.ecg.manager.pojo.po.TbHeadline;
import com.ecg.manager.pojo.po.TbHeadlineExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbHeadlineMapper {
    int countByExample(TbHeadlineExample example);

    int deleteByExample(TbHeadlineExample example);

    int deleteByPrimaryKey(String hid);

    int insert(TbHeadline record);

    int insertSelective(TbHeadline record);

    List<TbHeadline> selectByExample(TbHeadlineExample example);

    TbHeadline selectByPrimaryKey(String hid);

    int updateByExampleSelective(@Param("record") TbHeadline record, @Param("example") TbHeadlineExample example);

    int updateByExample(@Param("record") TbHeadline record, @Param("example") TbHeadlineExample example);

    int updateByPrimaryKeySelective(TbHeadline record);

    int updateByPrimaryKey(TbHeadline record);
}