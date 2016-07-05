package com.moutum.csmp.domain;
/************************************************************************************
 * @Title        : Stock.java
 * @Description  : 库存信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 上午11:44:27
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Stock
{

    /**
     * 库存编号
     */
    private int stockId;
    
    /**
     * 商品编号
     */
    private int goodId;
    
    /**
     * 仓库编号
     */
    private int storageId;
    
    /**
     * 库存量
     */
    private Double stockAmount;

    public int getStockId()
    {
        return stockId;
    }

    public void setStockId(int stockId)
    {
        this.stockId = stockId;
    }

    public int getGoodId()
    {
        return goodId;
    }

    public void setGoodId(int goodId)
    {
        this.goodId = goodId;
    }

    public int getStorageId()
    {
        return storageId;
    }

    public void setStorageId(int storageId)
    {
        this.storageId = storageId;
    }

    public Double getStockAmount()
    {
        return stockAmount;
    }

    public void setStockAmount(Double stockAmount)
    {
        this.stockAmount = stockAmount;
    }
    
    public Stock()
    {
    	
    }
    
    public Stock(int stockId, int goodId, int storageId, Double stockAmount)
    {
    	this.stockId = stockId;
    	this.goodId = goodId;
    	this.storageId = storageId;
    	this.stockAmount = stockAmount;
    }
}

