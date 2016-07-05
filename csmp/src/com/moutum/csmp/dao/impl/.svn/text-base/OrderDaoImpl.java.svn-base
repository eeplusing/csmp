package com.moutum.csmp.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.dao.OrderDao;
import com.moutum.csmp.domain.Order;

/************************************************************************************
 * @Title        : OrderDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:48:00
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class OrderDaoImpl extends DaoSupportImpl<Order> implements OrderDao
{

    @Override
    public int getCountByState(Integer userId, Integer[] states)
    {
        String hql = "SELECT COUNT(o) FROM Order o";
        if(null != userId)
        {
            hql += " WHERE o.userId = ? AND o.orderState IN (:states)";
        }
        else
        {
            hql += " WHERE o.orderState IN (:states)";
        }
        Query query = sessionFactory.getCurrentSession().createQuery(hql).setParameterList("states", states);
        if(null != userId)
        {
            query.setParameter(0, userId);
        }
        return Integer.parseInt(query.list().get(0).toString());
    }

    @SuppressWarnings("unchecked")
    @Override
    public PageBean joinQuery(int pageSize, int pageNum, Map<Integer, Object> selValue, String hql)
    {
        Query listQuery = sessionFactory.getCurrentSession().createQuery(hql);
        for(Integer index : selValue.keySet())
        {
            listQuery.setParameter(index, selValue.get(index));
        }
        listQuery.setFirstResult((pageNum - 1) * pageSize);
        listQuery.setMaxResults(pageSize);
        List<Order> list = listQuery.list();// 执行查询
        
        String countHQL = "SELECT COUNT(o) " + hql.substring(8);
        Query countQuery = sessionFactory.getCurrentSession().createQuery(countHQL);
        for(Integer index : selValue.keySet())
        {
            countQuery.setParameter(index, selValue.get(index));
        }
        Long count = (Long)countQuery.uniqueResult(); // 执行查询
        
        return new PageBean(pageNum, pageSize, count.intValue(), list);
    }

    @SuppressWarnings("unchecked")
    @Override
    public Order getByNo(String orderNo)
    {
        List<Order> list = sessionFactory.getCurrentSession()
                           .createQuery("FROM Order o WHERE o.orderNo = ?")
                           .setParameter(0, orderNo).list();
        if(list.size() > 0)
        {
            return list.get(0);
        }
        return null;
    }
    
    /**
	 * 导出查询订单信息
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getExportOrder(Map<String,Object> map) {
		String hql = "FROM Order o WHERE 1=1";

        if(null != map.get("beginDate") &&  !map.get("beginDate").equals(""))
        {
            hql += " AND o.orderDate>=to_date('"+map.get("beginDate")+" 00:00:00','yyyy-mm-dd hh24:mi:ss')";
        }
        
        if(null != map.get("endDate") && !map.get("endDate").equals(""))
        {
        	hql += " AND o.orderDate<=to_date('"+map.get("endDate")+" 23:59:59','yyyy-mm-dd hh24:mi:ss')";
        }        

        if(null != map.get("orderNo") && !map.get("orderNo").equals(""))
        {
            hql += " AND o.orderNo = '"+map.get("orderNo").toString()+"'";
        }
        
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<Order> orderList = query.list();
		return orderList;
	}

    /**
     * 通过订单状态查询订单信息
     */
    @Override
    public Order getOrderState(int orderState)
    {

        try
        {
            return (Order) sessionFactory.getCurrentSession()
                    .createQuery("FROM Order WHERE orderState=?")
                    .setParameter(0, orderState).list();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 通过userId查询订单信息
     */
	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getInfoByUserId(int userId) {
		String hql = "FROM Order o WHERE o.userId="+userId;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		List<Order> orderList = query.list();
		return orderList;
	}

}