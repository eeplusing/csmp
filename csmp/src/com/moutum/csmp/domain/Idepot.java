package com.moutum.csmp.domain;

import java.util.Date;

/************************************************************************************
 * @Title        : Idepot.java
 * @Description  : 出入库记录信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 上午11:49:57
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Idepot
{

    /**
     * 信息编号
     */
    private int infoId;
    
    /**
     * 仓库编号
     */
    private int storageId;
    
    /**
     * 单据ID
     */
    private int billId;
    
    /**
     * 类型
     */
    private int type;
    
    /**
     * 商品编号 
     */
    private int goodId;
    
    /**
     * 数量
     */
    private Double amount;
    
    /**
     * 时间
     */
    private Date time;
    
    /**
     * 操作人
     */
    private String perator;

    public int getInfoId()
    {
        return infoId;
    }

    public void setInfoId(int infoId)
    {
        this.infoId = infoId;
    }

    public int getStorageId()
    {
        return storageId;
    }

    public void setStorageId(int storageId)
    {
        this.storageId = storageId;
    }

    public int getType()
    {
        return type;
    }

    public void setType(int type)
    {
        this.type = type;
    }

    public int getGoodId()
    {
        return goodId;
    }

    public void setGoodId(int goodId)
    {
        this.goodId = goodId;
    }

    public Double getAmount()
    {
        return amount;
    }

    public void setAmount(Double amount)
    {
        this.amount = amount;
    }

    public Date getTime()
    {
        return time;
    }

    public void setTime(Date time)
    {
        this.time = time;
    }

    public String getPerator()
    {
        return perator;
    }

    public void setPerator(String perator)
    {
        this.perator = perator;
    }

    public int getBillId()
    {
        return billId;
    }

    public void setBillId(int billId)
    {
        this.billId = billId;
    }
    
    public Idepot() {  
    };  
    //要查哪几个字段，就写哪几个字段的构造方法，注意这里的顺序要和后面dao里面的查询顺序要一样  
    public Idepot(int billId, Double amount) {  
    	super();  
    	this.billId = billId;  
    	this.amount = amount;  
    }  

}

