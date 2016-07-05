package com.moutum.csmp.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Car;
import com.moutum.csmp.service.CarService;

/************************************************************************************
 * @Title        : CarServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:31:43
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class CarServiceImpl extends ServiceSupportImpl<Car> implements CarService
{
    /**
     * 根据用户查询购物车商品信息
     */
    @Override
    public Car getCar(int userId)
    {
        
        return carDao.getCar(userId);
    }
   
}

