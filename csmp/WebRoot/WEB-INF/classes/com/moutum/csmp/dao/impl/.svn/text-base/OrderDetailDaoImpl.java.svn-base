package com.moutum.csmp.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.OrderDetailDao;
import com.moutum.csmp.domain.OrderDetail;

/************************************************************************************
 * @Title        : OrderDetailDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:51:43
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class OrderDetailDaoImpl extends DaoSupportImpl<OrderDetail> implements OrderDetailDao
{
	/**
	 * 通过goodId查询订单信息
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderDetail> getInfoByGoodId(int goodId)
	{
		String hql = "FROM OrderDetail od WHERE od.goodId="+goodId;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<OrderDetail> orderList = query.list();
		return orderList;
	}

}

