package com.moutum.csmp.domain;
/************************************************************************************
 * @Title        : OrderDetail.java
 * @Description  : 订单详情
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 上午11:10:33
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class OrderDetail
{
   
    /**
     * 详情编号
     */
    private int infoId;
     
    /**
     * 商品编号
     */
    private int goodId;
     
     /**
      * 商品名称
      */
    private String goodName;
     
    /**
     * 购买数量 
     */
    private Double num;
     
    /**
     * 购买单价 
     */
    private Double salePrice;
    
    /**
     * 商品规格及介绍
     */
    private String specification;
    
    /**
     * 参数
     */
    private String headValue;

    public int getInfoId()
    {
        return infoId;
    }

    public void setInfoId(int infoId)
    {
        this.infoId = infoId;
    }

    public String getGoodName()
    {
        return goodName;
    }

    public void setGoodName(String goodName)
    {
        this.goodName = goodName;
    }

    public Double getNum()
    {
        return num;
    }

    public void setNum(Double num)
    {
        this.num = num;
    }

    public Double getSalePrice()
    {
        return salePrice;
    }

    public void setSalePrice(Double salePrice)
    {
        this.salePrice = salePrice;
    }

    public int getGoodId()
    {
        return goodId;
    }

    public void setGoodId(int goodId)
    {
        this.goodId = goodId;
    }

    public String getSpecification()
    {
        return specification;
    }

    public void setSpecification(String specification)
    {
        this.specification = specification;
    }

    public String getHeadValue()
    {
        return headValue;
    }

    public void setHeadValue(String headValue)
    {
        this.headValue = headValue;
    }

}