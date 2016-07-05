package com.moutum.csmp.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Price;
import com.moutum.csmp.service.PriceService;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : PriceServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:28:42
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class PriceServiceImpl extends ServiceSupportImpl<Price> implements PriceService
{

    @Override
    public int modify(int operType, Price price)
    {
        QueryHelper queryHelper = new QueryHelper(Price.class, "p");
        if(operType == 0)//更新操作
        {
            queryHelper.addCondition("p.infoId <> ?", price.getInfoId())
                       .addCondition("p.good.goodId = ?", price.getGood().getGoodId())
                       .addCondition("p.priceName = ?", price.getPriceName());
        }
        else if(operType == 1)//新增操作
        {
            queryHelper.addCondition("p.good.goodId = ?", price.getGood().getGoodId())
                       .addCondition("p.priceName = ?", price.getPriceName());
        }
        List<Price> prices = getByQueryHelper(queryHelper);
        if(prices.size() > 0)//更新后将违反规则1：同一商品出现多个同名价格
        {
            return 0;
        }
        
        if(price.getGrade().getGradeNum() > 0)
        {
            queryHelper = new QueryHelper(Price.class, "p");
            if(operType == 0)//更新操作
            {
                queryHelper.addCondition("p.infoId <> ?", price.getInfoId())
                           .addCondition("p.good.goodId = ?", price.getGood().getGoodId())
                           .addCondition("p.grade.gradeId = ?", price.getGrade().getGradeId());
            }
            else if(operType == 1)//新增操作
            {
                queryHelper.addCondition("p.good.goodId = ?", price.getGood().getGoodId())
                           .addCondition("p.grade.gradeId = ?", price.getGrade().getGradeId());
            }
            prices = getByQueryHelper(queryHelper);
            if(prices.size() > 0)//更新后将违反规则2：同一商品出现多个(除默认级别外)同级别价格
            {
                return 1;
            }
        }
        
        try
        {
            if(operType == 0)//更新操作
            {
                priceDao.update(price);
            }
            else if(operType == 1)//新增操作
            {
                priceDao.save(price);
            }
            return 2;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return 3;
        }
    }
}