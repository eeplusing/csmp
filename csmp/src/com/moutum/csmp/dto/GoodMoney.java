package com.moutum.csmp.dto;

import java.util.Set;

import com.moutum.csmp.domain.Image;

/************************************************************************************
 * @Title        : GoodMoney.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月28日 下午2:25:47
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class GoodMoney
{

    /**
     * 商品id
     */
    private  int goodId;
    
    /**
     * 商品名称
     */
    private String goodName;
    
    /**
     * 购买数量
     */
    private Double amount;
    
    /**
     * 购买金额
     */
    private Double money;
    
    /**
     * 购买时单价
     */
    private Double price;
    
    /**
     * 商品图片
     */
    private Set<Image> images;
    
    public int getGoodId()
    {
        return goodId;
    }

    public void setGoodId(int goodId)
    {
        this.goodId = goodId;
    }

    public String getGoodName()
    {
        return goodName;
    }

    public void setGoodName(String goodName)
    {
        this.goodName = goodName;
    }

    public Double getAmount()
    {
        return amount;
    }

    public void setAmount(Double amount)
    {
        this.amount = amount;
    }

    public Double getMoney()
    {
        return money;
    }

    public void setMoney(Double money)
    {
        this.money = money;
    }

    public Double getPrice()
    {
        return price;
    }

    public void setPrice(Double price)
    {
        this.price = price;
    }

    public Set<Image> getImages()
    {
        return images;
    }

    public void setImages(Set<Image> images)
    {
        this.images = images;
    }
}