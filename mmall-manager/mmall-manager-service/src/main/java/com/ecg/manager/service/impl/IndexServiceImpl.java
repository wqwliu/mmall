package com.ecg.manager.service.impl;

import com.ecg.manager.dao.TbHeadlineAndCategoryMapper;
import com.ecg.manager.dao.TbHeadlineMapper;
import com.ecg.manager.dao.TbIndeximageMapper;
import com.ecg.manager.pojo.dto.ProductResult;
import com.ecg.manager.pojo.po.*;
import com.ecg.manager.service.IndexService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * @author skyfxu
 * @Title: IndexServiceImpl
 * @ProjectName mmall
 * @Description:
 * @date 2018/7/30 17:08
 */
@Service
public class IndexServiceImpl implements IndexService {

    private Logger logger=LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TbIndeximageMapper tbIndeximageMapper;
    @Autowired
    private TbHeadlineMapper tbHeadlineMapper;

    @Autowired
    private TbHeadlineAndCategoryMapper tbHeadlineAndCategoryMapper;

    @Override
    public ProductResult<TbIndeximage> listLimage() {
        TbIndeximageExample example=new TbIndeximageExample();
        example.setOrderByClause("`sort` ASC");
        ProductResult<TbIndeximage> result = new ProductResult<>();
        result.setCode(0);
        result.setMsg("select successful");
        try{
            List<TbIndeximage> list= tbIndeximageMapper.selectByExample(null);
            System.out.println(list);
            System.out.println("32131211111");
            result.setData(list);
        } catch (Exception e) {
            result.setCode(1);
            result.setMsg("select failed");
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public int addIndexImage(TbIndeximage tbIndeximage) {
        int i=0;
        try{
            tbIndeximage.setIid(UUID.randomUUID().toString().replace("-", ""));
            i=tbIndeximageMapper.insertSelective(tbIndeximage);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public TbIndeximage getlimage(String iid) {
        TbIndeximage tbIndeximage = null;
        try{
            tbIndeximage=tbIndeximageMapper.selectByPrimaryKey(iid);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return tbIndeximage;
    }

    @Override
    public int updateimage(TbIndeximage tbIndeximage) {
        int i=0;
        try{
            i=tbIndeximageMapper.updateByPrimaryKeySelective(tbIndeximage);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int deleteImage(String iid) {
        int i=0;
        try{
            i=tbIndeximageMapper.deleteByPrimaryKey(iid);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public ProductResult<TbHeadline> getlist() {
        ProductResult<TbHeadline> p=new ProductResult<>();
        p.setCode(0);
        p.setMsg("select successful");
        try{
            List<TbHeadline> tbHeadlines = tbHeadlineMapper.selectByExample(null);
            p.setData(tbHeadlines);
        } catch (Exception e) {
            p.setCode(1);
            p.setMsg("select faild");
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public int addIndexOther(TbHeadline tb) {
        int i=0;
        try{
            tb.setHid(UUID.randomUUID().toString().replace("-", ""));
            i=tbHeadlineMapper.insertSelective(tb);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public TbHeadline getIndexother(String hid) {
        TbHeadline tbHeadline=null;
        try{
            tbHeadline=tbHeadlineMapper.selectByPrimaryKey(hid);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return tbHeadline;
    }

    @Override
    public int updateIndexother(TbHeadline tbHeadline) {
        int i=0;
        try{
            i=tbHeadlineMapper.updateByPrimaryKey(tbHeadline);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int deleteIndexOther(String hid) {
        int i=0;
        try{
            i=tbHeadlineMapper.deleteByPrimaryKey(hid);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            e.printStackTrace();
        }
        return i;
    }

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
