package com.ecg.portal.service.impl;

import com.ecg.portal.dao.TbHeadlineAndCategoryMapper;
import com.ecg.portal.dao.TbIndeximageMapper;
import com.ecg.portal.pojo.TbHeadLineAndCategory;
import com.ecg.portal.pojo.TbIndeximage;
import com.ecg.portal.service.IndexService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author skyfxu
 * @Title: IndexServiceImpl
 * @ProjectName mmall
 * @Description: TODO
 * @date 2018/8/10 17:42
 */
@Service
public class IndexServiceImpl implements IndexService {

    private Logger logger=LoggerFactory.getLogger(this.getClass());
    @Autowired
    private TbIndeximageMapper tbIndeximageMapper;
    @Autowired
    private TbHeadlineAndCategoryMapper tbHeadlineAndCategoryMapper;

    @Override
    public List<TbIndeximage> getImageList() {
        List<TbIndeximage> list=null;
        try {
            list = tbIndeximageMapper.selectByExample(null);
        }catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<TbHeadLineAndCategory> getLeftImageList(Integer parendId) {
        List<TbHeadLineAndCategory> list=null;
        try {
            list=tbHeadlineAndCategoryMapper.selectByHid(parendId);
        }catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return list;
    }
}
