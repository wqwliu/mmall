package com.ecg.manager.dao;

import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.TbUserSearch;
import com.ecg.manager.pojo.po.TbUser;
import com.ecg.manager.pojo.po.TbUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbUserMapper {
    long countByExample(TbUserExample example);

    int deleteByExample(TbUserExample example);

    int deleteByPrimaryKey(String uid);

    int insert(TbUser record);

    int insertSelective(TbUser record);

    List<TbUser> selectByExample(TbUserExample example);

    TbUser selectByPrimaryKey(String uid);

    int updateByExampleSelective(@Param("record") TbUser record, @Param("example") TbUserExample example);

    int updateByExample(@Param("record") TbUser record, @Param("example") TbUserExample example);

    int updateByPrimaryKeySelective(TbUser record);

    int updateByPrimaryKey(TbUser record);

    TbUser selectUser(@Param("uname") String name, @Param("password") String password);

    int deleteUser(String uid);

    long getUsers(@Param("userSearch") TbUserSearch userSearch);

    List<TbUser> getUsersList(@Param("pageParam") PageParam pageParam, @Param("userSearch") TbUserSearch userSearch);

    TbUser getUserById(String uid);

    int updateUser(TbUser tbUser);

    int removeUserAll(List<String> ids);

    int updateUserStatu(String uid, String statu);
}