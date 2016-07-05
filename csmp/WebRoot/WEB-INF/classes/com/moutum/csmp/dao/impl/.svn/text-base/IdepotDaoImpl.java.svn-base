package com.moutum.csmp.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.IdepotDao;
import com.moutum.csmp.domain.Idepot;

/************************************************************************************
 * @Title        : IdepotDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:38:27
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class IdepotDaoImpl extends DaoSupportImpl<Idepot> implements IdepotDao
{
	/**
     * 通过billId分组查询相同billId的入库总数量
     */
	@SuppressWarnings("unchecked")
    @Override
	public List<Idepot> getSumAmountByBillId() {
		String hql = "SELECT new Idepot(billId,sum(amount) as amount) FROM Idepot WHERE type=0 GROUP BY billId";              
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        List<Idepot> idepot = query.list();
        
        return idepot;
	}

	/**
     * 通过billId查询所有记录
     */
	@SuppressWarnings("unchecked")
    @Override
	public List<Idepot> getByBillId(int billId) {
		String hql = "FROM Idepot WHERE type=0 AND billId="+billId;              
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        List<Idepot> idepot = query.list();
        
        return idepot;
	}

	/**
	 * 出库总数量
	 */
    @SuppressWarnings("unchecked")
    @Override
    public List<Idepot> AmountOutByBillId()
    {
        
       String hql = "SELECT new Idepot(billId,sum(amount) as amount) FROM Idepot WHERE type=1 GROUP BY billId";              
       Query query = sessionFactory.getCurrentSession().createQuery(hql);

       List<Idepot> idepot = query.list();
    
       return idepot;
    }

    /**
     * 根据单据id查询出库单信息 
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<Idepot> getOutByBillId(int billId)
    {
       
        String hql = "FROM Idepot WHERE type=1 AND billId="+billId;              
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        List<Idepot> idepot = query.list();
        
        return idepot;
    } 

}

