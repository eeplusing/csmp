package com.moutum.csmp.dao;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Order;

/************************************************************************************
 * @Title        : OrderDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:47:07
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface OrderDao extends DaoSupport<Order>
{
    
    /********************************************************************************
     * 根据订单状态查询订单数量
     * @param states
     * @return
     ********************************************************************************/
    int getCountByState(Integer userId, Integer[] states);
    
    /********************************************************************************
     * 管理端订单查询
     * @param pageSize
     * @param pageNum
     * @param selValue
     * @param hql
     * @return
     ********************************************************************************/
    PageBean joinQuery(int pageSize, int pageNum, Map<Integer, Object> selValue, String hql);

    /********************************************************************************
     * 通过订单编号查询订单
     * @param orderNo
     * @return
     ********************************************************************************/
    Order getByNo(String orderNo);

    /**
	 * 导出查询订单信息
	 */
    List<Order> getExportOrder(Map<String,Object> map);

    /**
     * 通过订单状态查询订单信息
     * @param orderState
     * @return
     */
    Order getOrderState(int orderState);

    /**
     * 通过userId查询订单信息
     */
    List<Order> getInfoByUserId(int userId);
}