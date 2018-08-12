package com.ecg.manager.service;

import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.po.TbHeadLineAndCategory;
import com.ecg.manager.pojo.po.TbHeadline;
import com.ecg.manager.pojo.po.TbIndeximage;

import java.util.List;

/**
 * @author skyfxu
 * @Title: IndexService
 * @ProjectName mmall
 * @Description: TODO
 * @date 2018/7/30 17:07
 */
public interface IndexService {
    ProductResult<TbIndeximage> listLimage();

    int addIndexImage(TbIndeximage tbIndeximage);

    TbIndeximage getlimage(String iid);

    int updateimage(TbIndeximage tbIndeximage);

    int deleteImage(String iid);

    ProductResult<TbHeadline> getlist();

    int addIndexOther(TbHeadline tb);

    TbHeadline getIndexother(String hid);

    int updateIndexother(TbHeadline tbHeadline);

    int deleteIndexOther(String hid);

    List<TbIndeximage> getImageList();

    List<TbHeadLineAndCategory> getLeftImageList(Integer parendId);
}
