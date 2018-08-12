package com.ecg.portal.service;


import com.ecg.portal.pojo.TbHeadLineAndCategory;
import com.ecg.portal.pojo.TbIndeximage;

import java.util.List;

/**
 * @author skyfxu
 * @Title: IndexService
 * @ProjectName mmall
 * @Description: TODO
 * @date 2018/8/10 17:40
 */
public interface IndexService {
    List<TbIndeximage> getImageList();

    List<TbHeadLineAndCategory> getLeftImageList(Integer parendId);
}
