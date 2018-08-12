package com.ecg.manager.dao;

import com.ecg.manager.pojo.po.TbOrderitems;
import com.ecg.manager.pojo.po.TbOrderitemsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbOrderitemsMapper {
    int countByExample(TbOrderitemsExample example);

    int deleteByExample(TbOrderitemsExample example);

    int deleteByPrimaryKey(String orderitemid);

    int insert(TbOrderitems record);

    int insertSelective(TbOrderitems record);

    List<TbOrderitems> selectByExample(TbOrderitemsExample example);

    TbOrderitems selectByPrimaryKey(String orderitemid);

    int updateByExampleSelective(@Param("record") TbOrderitems record, @Param("example") TbOrderitemsExample example);

    int updateByExample(@Param("record") TbOrderitems record, @Param("example") TbOrderitemsExample example);

    int updateByPrimaryKeySelective(TbOrderitems record);

    int updateByPrimaryKey(TbOrderitems record);
}