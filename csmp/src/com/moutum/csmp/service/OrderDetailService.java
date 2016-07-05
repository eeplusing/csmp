package com.moutum.csmp.service;

import java.util.List;

import com.moutum.csmp.domain.OrderDetail;

/************************************************************************************
 * @Title        : OrderDetailService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:53:28
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface OrderDetailService extends ServiceSupport<OrderDetail>
{
	/**
     * 通过goodId查询订单信息
     */
    List<OrderDetail> getInfoByGoodId(int goodId);
}