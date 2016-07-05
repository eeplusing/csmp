package com.moutum.csmp.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.OrderDetail;
import com.moutum.csmp.service.OrderDetailService;

/************************************************************************************
 * @Title        : OrderDetailServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:53:57
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class OrderDetailServiceImpl extends ServiceSupportImpl<OrderDetail> implements OrderDetailService
{
    /**
     * 通过goodId查询订单信息
     */
	@Override
	public List<OrderDetail> getInfoByGoodId(int goodId) {
		return orderDetailDao.getInfoByGoodId(goodId);
	}

}

