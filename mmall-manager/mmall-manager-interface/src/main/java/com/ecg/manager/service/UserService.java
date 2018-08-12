package com.ecg.manager.service;

import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.TbUserResult;
import com.ecg.manager.pojo.dto.TbUserSearch;
import com.ecg.manager.pojo.po.TbUser;

import java.util.List;

public interface UserService {

     int saveUser(TbUser tbUser);

     TbUser getUser(TbUser tbUser);

     int deleteUser(String uid);

     TbUserResult<TbUser> listUsers(PageParam pageParam, TbUserSearch userSearch);

    TbUser getUserById(String uid);

    int updateUser(TbUser tbUser);


    int removeUserAll(List<String> ids);

    int updateUserStatu(String uid, String statu);
}
