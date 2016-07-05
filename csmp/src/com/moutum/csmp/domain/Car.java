package com.moutum.csmp.domain;

import java.util.Set;

/************************************************************************************
 * @Title : Car.java
 * @Description : 购物车信息
 * @Author : ZhaoShasha
 * @DateTime : 2015年5月12日 上午11:37:55
 * @Copyright : 2015 Moutum All Rights Reserved
 * @version : V1.0
 ************************************************************************************/

public class Car
{

    /**
     * 购物车编号
     */
    private int carId;

    /**
     * 用户编号
     */
    private int userId;

    /**
     * 购物车商品信息
     */
    private Set<BuyGood> buyGoods;

    public int getCarId()
    {
        return carId;
    }

    public void setCarId(int carId)
    {
        this.carId = carId;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public Set<BuyGood> getBuyGoods()
    {
        return buyGoods;
    }

    public void setBuyGoods(Set<BuyGood> buyGoods)
    {
        this.buyGoods = buyGoods;
    }
}