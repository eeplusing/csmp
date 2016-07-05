package com.moutum.csmp.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.CarDao;
import com.moutum.csmp.domain.Car;

/************************************************************************************
 * @Title : CarDaoImpl.java
 * @Description :
 * @Author : ZhaoShasha
 * @DateTime : 2015年5月15日 下午5:30:45
 * @Copyright : 2015 Moutum All Rights Reserved
 * @version : V1.0
 ************************************************************************************/
@Repository
public class CarDaoImpl extends DaoSupportImpl<Car> implements CarDao
{
   /**
    * 根据用户查询购物车商品信息
    */
    @SuppressWarnings("unchecked")
	@Override
    public Car getCar(int userId)
    {
        try
        {
        	List<Car> list = sessionFactory.getCurrentSession()
                    .createQuery("FROM Car WHERE userId=?")
                    .setParameter(0, userId).list();
        	if(null != list && list.size()>0)
        	{
        		return list.get(0);
        	}
        	else
        	{
        		return null;
        	}
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
       
    }

}
