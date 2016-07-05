package com.moutum.csmp.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Order;
import com.moutum.csmp.service.OrderService;
import com.moutum.csmp.util.DateUtil;
import com.moutum.csmp.util.QueryHelper;
import com.moutum.csmp.util.SystemConstants;

/************************************************************************************
 * @Title        : OrderServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:49:20
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class OrderServiceImpl extends ServiceSupportImpl<Order> implements OrderService
{

    @Override
    public PageBean getPageBean(int pageNum, int pageSize, Map<String, Object> selMap)
    {
        QueryHelper queryHelper = new QueryHelper(Order.class, "o");
        /*
         * 通过Map生成对应的QueryHelper实例
         */
        queryHelper.addCondition("o.userId = ?", selMap.get("userId"));
        if(null != selMap.get("orderNo"))
        {
            queryHelper.addCondition("o.orderNo like ?", "%" + selMap.get("orderNo") + "%");
        }
        if(null != selMap.get("orderState"))
        {
            queryHelper.addCondition("o.orderState = ?", selMap.get("orderState"));
        }
        //添加排序
        queryHelper.addOrderProperty("o.orderDate", false);
        return getPageBean(pageNum, pageSize, queryHelper);
    }

    @Override
    public Map<String, Integer> getMapForNumState(Integer userId)
    {
        Map<String, Integer> resultMap = new HashMap<String, Integer>();
        resultMap.put("uncheck", orderDao.getCountByState(userId, new Integer[]{SystemConstants.ORDER_STAT_UNCHECK}));
        resultMap.put("checked", orderDao.getCountByState(userId, new Integer[]{SystemConstants.ORDER_STAT_CHECKED}));
        resultMap.put("outStock", orderDao.getCountByState(userId, new Integer[]{SystemConstants.ORDER_STAT_OUT_STOCK, SystemConstants.ORDER_STAT_PAID}));
        resultMap.put("waitTake", orderDao.getCountByState(userId, new Integer[]{SystemConstants.ORDER_STAT_DELIVER_GOODS, SystemConstants.ORDER_STAT_WAIT_TAKE_GOOD}));
        resultMap.put("taken", orderDao.getCountByState(userId, new Integer[]{SystemConstants.ORDER_STAT_TAKEN}));
        resultMap.put("end", orderDao.getCountByState(userId, new Integer[]{SystemConstants.ORDER_STAT_END}));
        resultMap.put("appCancel", orderDao.getCountByState(userId, new Integer[]{SystemConstants.ORDER_STAT_APPLY_CANCEL}));
        resultMap.put("canceled", orderDao.getCountByState(userId, new Integer[]{SystemConstants.ORDER_STAT_CANCELED}));
        return resultMap;
    }

    @Override
    public boolean saveEvaluate(int orderId, String evaluateInfo, String userName)
    {
        Order order = orderDao.getById(orderId);
        order.setEvaluateInfo(evaluateInfo);
        order.setOrderState(SystemConstants.ORDER_STAT_END);
        order.setInfoFlow(order.getInfoFlow() + DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t" + userName + "对订单进行了评价,订单已完成;\r\t");
        order.setEvaluateTime(new Date());
        try
        {
            orderDao.update(order);
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean saveTaken(int orderId, String userName)
    {
        Order order = orderDao.getById(orderId);
        order.setOrderState(SystemConstants.ORDER_STAT_TAKEN);
        order.setInfoFlow(order.getInfoFlow() + DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t" + userName + "签字确认收货;\r\t");
        order.setTakeGoodTime(new Date());
        try
        {
            orderDao.update(order);
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateCancel(int orderId, String reason, String userName)
    {
        Order order = orderDao.getById(orderId);
        order.setOrderState(SystemConstants.ORDER_STAT_APPLY_CANCEL);
        order.setInfoFlow(order.getInfoFlow() + DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t" + userName + "申请取消订单;\r\t");
        order.setCancelReason(reason);
        try
        {
            orderDao.update(order);
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public PageBean joinQuery(int pageSize, int pageNum, Map<String, Object> selMap)
    {
        Map<Integer, Object> selValue = new HashMap<Integer, Object>();
        int index = 0;
        String hql = "SELECT o FROM Order o";
        String whereCondition = "";
        if(null != selMap.get("userName"))
        {
            hql += ", User u";
            if(whereCondition == "")
            {
                whereCondition += " WHERE o.userId = u.userId AND u.userName like ?";
            }
            else
            {
                whereCondition += " AND o.userId = u.userId AND u.userName like ?";
            }
            selValue.put(index++, "%" + selMap.get("userName") + "%");
        }
        if(null != selMap.get("orderNo"))
        {
            if(whereCondition == "")
            {
                whereCondition += " WHERE o.orderNo like ?";
            }
            else
            {
                whereCondition += " AND o.orderNo like ?";
            }
            selValue.put(index++, "%" + selMap.get("orderNo") + "%");
        }
        if(null != selMap.get("oraState"))
        {
            if(whereCondition == "")
            {
                whereCondition += " WHERE o.orderState = ?";
            }
            else
            {
                whereCondition += " AND o.orderState = ?";
            }
            selValue.put(index++, selMap.get("oraState"));
        }
        if(null != selMap.get("evaState"))
        {
            if((Integer)selMap.get("evaState") == 0)
            {
                if(whereCondition == "")
                {
                    whereCondition += " WHERE o.evaluateInfo IS NULL";
                }
                else
                {
                    whereCondition += " AND o.evaluateInfo IS NULL";
                }
            }
            else
            {
                if(whereCondition == "")
                {
                    whereCondition += " WHERE o.evaluateInfo IS NOT NULL";
                }
                else
                {
                    whereCondition += " AND o.evaluateInfo IS NOT NULL";
                }
            }
        }
        if(null != selMap.get("sTime"))
        {
            if(whereCondition == "")
            {
                whereCondition += " WHERE o.orderDate >= ?";
            }
            else
            {
                whereCondition += " AND o.orderDate >= ?";
            }
            selValue.put(index++, selMap.get("sTime"));
        }
        if(null != selMap.get("eTime"))
        {
            if(whereCondition == "")
            {
                whereCondition += " WHERE o.orderDate <= ?";
            }
            else
            {
                whereCondition += " AND o.orderDate <= ?";
            }
            selValue.put(index++, selMap.get("eTime"));
        }
        hql += whereCondition + " ORDER BY o.orderDate DESC";
        return orderDao.joinQuery(pageSize, pageNum, selValue, hql);
    }

    @Override
    public boolean modifyCheck(int orderId, String userName, double carriage)
    {
        Order order = orderDao.getById(orderId);
        if(order.getOrderState() == SystemConstants.ORDER_STAT_UNCHECK)
        {
            order.setOrderState(SystemConstants.ORDER_STAT_CHECKED);
            order.setCheckTime(new Date());
            order.setOrderCarriage(carriage);
            order.setInfoFlow(order.getInfoFlow() + DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t" + userName + "审核订单;\r\t");
            try
            {
                orderDao.update(order);
                return true;
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
            return false;
        }
        else
        {
            return false;
        }
    }

    @Override
    public boolean savePassApply(int orderId, String userName)
    {
        
        try
        {
            Order order = orderDao.getById(orderId);
            order.setOrderState(SystemConstants.ORDER_STAT_CANCELED);
            order.setInfoFlow(order.getInfoFlow() + DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t" + userName + "通过了取消订单申请;\r\t");
            orderDao.update(order);
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean saveRefApply(int orderId, String userName)
    {
        try
        {
            Order order = orderDao.getById(orderId);
            if(null != order.getCheckTime())
            {
                order.setOrderState(SystemConstants.ORDER_STAT_CHECKED);
            }
            else
            {
                order.setOrderState(SystemConstants.ORDER_STAT_UNCHECK);
            }
            order.setInfoFlow(order.getInfoFlow() + DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t" + userName + "拒绝了取消订单申请;\r\t");
            orderDao.update(order);
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Order getByNo(String orderNo)
    {
        return orderDao.getByNo(orderNo);
    }
    
    /**
	 * 导出查询订单信息
	 */
	@Override
	public List<Order> getExportOrder(Map<String,Object> map) {
		return orderDao.getExportOrder(map);
	}

    /**
     * 通过订单状态查询订单信息
     */
    @Override
    public Order getOrderState(int orderState)
    {
       
        return orderDao.getOrderState(orderState);
    }

    /**
     * 通过userId查询订单信息
     */
	@Override
	public List<Order> getInfoByUserId(int userId) {
		return orderDao.getInfoByUserId(userId);
	}

   
}