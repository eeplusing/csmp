package com.moutum.csmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.dao.AddressDao;
import com.moutum.csmp.dao.BillDao;
import com.moutum.csmp.dao.BillDetailDao;
import com.moutum.csmp.dao.BuyGoodDao;
import com.moutum.csmp.dao.CarDao;
import com.moutum.csmp.dao.DataStatDao;
import com.moutum.csmp.dao.EvaluateDao;
import com.moutum.csmp.dao.FeedbackDao;
import com.moutum.csmp.dao.GoodDao;
import com.moutum.csmp.dao.GradeDao;
import com.moutum.csmp.dao.GroupDao;
import com.moutum.csmp.dao.IdepotDao;
import com.moutum.csmp.dao.ImageDao;
import com.moutum.csmp.dao.MailDao;
import com.moutum.csmp.dao.ModleDao;
import com.moutum.csmp.dao.NewsDao;
import com.moutum.csmp.dao.OperLogDao;
import com.moutum.csmp.dao.OrderDao;
import com.moutum.csmp.dao.OrderDetailDao;
import com.moutum.csmp.dao.PriceDao;
import com.moutum.csmp.dao.RecruitDao;
import com.moutum.csmp.dao.RightDao;
import com.moutum.csmp.dao.RoleDao;
import com.moutum.csmp.dao.StatDao;
import com.moutum.csmp.dao.StockDao;
import com.moutum.csmp.dao.StorageDao;
import com.moutum.csmp.dao.TypeDao;
import com.moutum.csmp.dao.UserDao;
import com.moutum.csmp.service.ServiceSupport;
import com.moutum.csmp.util.QueryHelper;
/************************************************************************************
 * @Title        : ServiceSupportImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月16日 上午11:13:55
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Transactional
public class ServiceSupportImpl<T> extends DaoSupportImpl<T> implements ServiceSupport<T>
{
    @Resource protected AddressDao addressDao;
    
    @Resource protected BillDetailDao billDetailDao;
    
    @Resource protected BillDao billDao;
    
    @Resource protected BuyGoodDao buyGoodDao;
    
    @Resource protected CarDao carDao;
    
    @Resource protected EvaluateDao evaluateDao;
    
    @Resource protected FeedbackDao feedbackDao;
    
    @Resource protected GoodDao goodDao; 
    
    @Resource protected GroupDao groupDao;
    
    @Resource protected IdepotDao idepotDao;
    
    @Resource protected ImageDao imageDao;
    
    @Resource protected MailDao mailDao;
    
    @Resource protected ModleDao modleDao;
    
    @Resource protected NewsDao newsDao;
    
    @Resource protected OperLogDao operLogDao;
    
    @Resource protected OrderDetailDao orderDetailDao;
    
    @Resource protected OrderDao orderDao;
    
    @Resource protected PriceDao priceDao;
    
    @Resource protected RecruitDao recruitDao;
    
    @Resource protected RightDao rightDao;
    
    @Resource protected RoleDao roleDao;
    
    @Resource protected StatDao statDao;
    
    @Resource protected StockDao stockDao;
    
    @Resource protected StorageDao storageDao;
    
    @Resource protected TypeDao typeDao;
    
    @Resource protected UserDao userDao;
    
    @Resource protected GradeDao gradeDao;
    
    @Resource protected DataStatDao dataStatDao;

    @Override
    public void save(T entity)
    {
        super.save(entity);
    }

    @Override
    public void delete(Integer id) throws Exception
    {
        super.delete(id);
    }

    @Override
    public void update(T entity)
    {
        super.update(entity);
    }

    @Override @Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
    public T getById(Integer id)
    {
        return super.getById(id);
    }

    @Override @Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
    public List<T> getByIds(Integer[] ids)
    {
        return super.getByIds(ids);
    }

    @Override @Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
    public List<T> findAll()
    {
        return super.findAll();
    }

    @Override @Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
    public PageBean getPageBean(int pageNum, int pageSize, QueryHelper queryHelper)
    {
        return super.getPageBean(pageNum, pageSize, queryHelper);
    }
    
    @Override @Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
    public List<T> getByQueryHelper(QueryHelper queryHelper)
    {
        return super.getByQueryHelper(queryHelper);
    }

    @Override
    public void delete(Integer[] ids) throws Exception
    {
        super.delete(ids);
    }
    
}