package com.moutum.csmp.service;

import com.moutum.csmp.domain.Price;

/************************************************************************************
 * @Title        : PriceService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:28:32
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface PriceService extends ServiceSupport<Price>
{

    /********************************************************************************
     * 更新或增加商品价格(0代表修改;1代表新增)
     * 价格跟新要求
     * 1.同个商品不能出现多个同名价格参数
     * 2.同个商品同个级别只能有一个价格参数(不包括默认级别)
     * @param operType
     * @param price
     * @return
     ********************************************************************************/
    int modify(int operType, Price price);

}
