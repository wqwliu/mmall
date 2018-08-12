package com.ecg.cart.dao;

import com.ecg.cart.pojo.po.TbProduct;
import com.ecg.cart.pojo.po.TbProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbProductMapper {
    long countByExample(TbProductExample example);

    int deleteByExample(TbProductExample example);

    int deleteByPrimaryKey(String pid);

    int insert(TbProduct record);

    int insertSelective(TbProduct record);

    List<TbProduct> selectByExampleWithBLOBs(TbProductExample example);

    List<TbProduct> selectByExample(TbProductExample example);

    TbProduct selectByPrimaryKey(String pid);

    int updateByExampleSelective(@Param("record") TbProduct record, @Param("example") TbProductExample example);

    int updateByExampleWithBLOBs(@Param("record") TbProduct record, @Param("example") TbProductExample example);

    int updateByExample(@Param("record") TbProduct record, @Param("example") TbProductExample example);

    int updateByPrimaryKeySelective(TbProduct record);

    int updateByPrimaryKeyWithBLOBs(TbProduct record);

    int updateByPrimaryKey(TbProduct record);
}