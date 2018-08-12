package com.ecg.portal.dao;


import com.ecg.portal.pojo.TbIndeximage;
import com.ecg.portal.pojo.TbIndeximageExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbIndeximageMapper {
    int countByExample(TbIndeximageExample example);

    int deleteByExample(TbIndeximageExample example);

    int deleteByPrimaryKey(String iid);

    int insert(TbIndeximage record);

    int insertSelective(TbIndeximage record);

    List<TbIndeximage> selectByExample(TbIndeximageExample example);

    TbIndeximage selectByPrimaryKey(String iid);

    int updateByExampleSelective(@Param("record") TbIndeximage record, @Param("example") TbIndeximageExample example);

    int updateByExample(@Param("record") TbIndeximage record, @Param("example") TbIndeximageExample example);

    int updateByPrimaryKeySelective(TbIndeximage record);

    int updateByPrimaryKey(TbIndeximage record);
}