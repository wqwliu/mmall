package com.ecg.manager.service.impl;

import com.ecg.manager.dao.TbUserMapper;

import com.ecg.manager.pojo.dto.PageParam;
import com.ecg.manager.pojo.dto.TbUserResult;
import com.ecg.manager.pojo.dto.TbUserSearch;
import com.ecg.manager.pojo.po.TbUser;
import com.ecg.manager.service.UserService;
import com.ecg.utils.MD5Utils;
import com.ecg.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private TbUserMapper tbUserMapper;

    @Override
    public int saveUser(TbUser tbUser) {
        tbUser.setUid(UUIDUtils.getuuid());
        tbUser.setPassword(MD5Utils.md5(tbUser.getPassword()));
        tbUser.setCreatedate(new Date());
        tbUser.setStatu("1");
        int i = tbUserMapper.insertSelective(tbUser);
        return  i;

    }

    @Override
    public TbUser getUser(TbUser tbUser) {

        String name = tbUser.getUname();
        String password =MD5Utils.md5(tbUser.getPassword());

        TbUser u = tbUserMapper.selectUser(name,password);

        return u;
    }

    @Override
    public int deleteUser(String uid) {

        int i = tbUserMapper.deleteUser(uid);
        return i;
    }

    @Override
    public TbUserResult<TbUser> listUsers(PageParam pageParam, TbUserSearch userSearch) {

        TbUserResult<TbUser> result = new TbUserResult<TbUser>();

        result.setCode(0);
        result.setMsg("select success");
        try {
            long count =  tbUserMapper.getUsers(userSearch);
            result.setCount(count);
            List<TbUser> list = tbUserMapper.getUsersList(pageParam,userSearch);

            result.setData(list);
        }
        catch (Exception e){
            result.setCode(1);
            result.setMsg("select failed");
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public TbUser getUserById(String uid) {

        TbUser u = tbUserMapper.getUserById(uid);
        return u;
    }

    @Override
    public int updateUser(TbUser tbUser) {
        tbUser.setPassword(MD5Utils.md5(tbUser.getPassword()));
        System.out.println(tbUser.getPassword());
         int i = tbUserMapper.updateUser(tbUser);
        return i;
    }

    @Override
    public int removeUserAll(List<String> ids) {
        int i = tbUserMapper.removeUserAll(ids);
        return 0;
    }

    @Override
    public int updateUserStatu(String uid, String statu) {
        int i = tbUserMapper.updateUserStatu(uid,statu);
        return i;
    }


}

