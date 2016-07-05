package com.moutum.csmp.dao;

import java.util.List;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.domain.OrderDetail;

/************************************************************************************
 * @Title        : OrderDetailDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:50:54
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface OrderDetailDao extends DaoSupport<OrderDetail>
{
	/**
     * 通过goodId查询订单信息
     */
    List<OrderDetail> getInfoByGoodId(int goodId);
}

