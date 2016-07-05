package com.moutum.csmp.dto;

import java.util.Set;

import com.moutum.csmp.domain.Price;
import com.moutum.csmp.domain.Type;
/************************************************************************************
 * @Title        : HotGood.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年7月9日 下午5:55:11
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class HotGood
{
    //商品ID
    private int goodId;
    
    //商品名称
    private String name;
    
    //商品价格
    private Set<Price> prices;
    
    //原产地
    private String goodOrigin;
   
    //供应商
    private String goodVendor;
    
    //库存
    private String amount;
    
    // 种类
    private Type type;
    
    public int getGoodId()
    {
        return goodId;
    }

    public void setGoodId(int goodId)
    {
        this.goodId = goodId;
    }

    public Type getType()
    {
        return type;
    }
    
    public void setType(Type type)
    {
        this.type = type;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public Set<Price> getPrices()
    {
        return prices;
    }

    public void setPrices(Set<Price> prices)
    {
        this.prices = prices;
    }

    public String getGoodOrigin()
    {
        return goodOrigin;
    }

    public void setGoodOrigin(String goodOrigin)
    {
        this.goodOrigin = goodOrigin;
    }

    public String getGoodVendor()
    {
        return goodVendor;
    }

    public void setGoodVendor(String goodVendor)
    {
        this.goodVendor = goodVendor;
    }

    public String getAmount()
    {
        return amount;
    }

    public void setAmount(String amount)
    {
        this.amount = amount;
    }
}