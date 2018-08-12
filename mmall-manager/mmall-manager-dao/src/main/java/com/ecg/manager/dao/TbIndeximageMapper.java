package com.ecg.manager.dao;

import com.ecg.manager.pojo.po.TbIndeximage;
import com.ecg.manager.pojo.po.TbIndeximageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

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