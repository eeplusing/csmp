package com.moutum.csmp.domain;
/************************************************************************************
 * @Title        : BillDetail.java
 * @Description  : 出入库单据详情
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 下午2:50:19
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class BillDetail
{

    /**
     * 信息编号
     */
    private int infoId;
    
    /**
     * 商品编号
     */
    private int goodId;
    
    /**
     * 数量
     */
    private Double amount;

    public int getInfoId()
    {
        return infoId;
    }

    public void setInfoId(int infoId)
    {
        this.infoId = infoId;
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
    
}

