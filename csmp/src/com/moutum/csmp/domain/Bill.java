package com.moutum.csmp.domain;

import java.util.Date;
import java.util.Set;

/************************************************************************************
 * @Title        : Bill.java
 * @Description  : 出入库单据信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 下午2:46:39
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Bill
{

    /**
     * 单据ID
     */
    private int billId;
    
    /**
     * 单据编号
     */
    private String billNo;
    
    /**
     * 仓库编号
     */
    private int storageId;
    
    /**
     * 单据类型
     * 0:入库
     * 1:出库
     */
    private int billType;
    
    /**
     * 操作时间
     */
    private Date operTime;
    
    /**
     * 操作人员
     */
    private String perator;
    
    /**
     * 生成时间
     */
    private Date createTime;
    
    /**
     * 申请者
     */
    private String proposer;
    
    /**
     * 单据状态
     * 0:未操作
     * 1:已完成
     */
    private int billStat;
    
    /**
     * 单据详情
     */
    private Set<BillDetail> billDetails;

    public int getBillId()
    {
        return billId;
    }

    public void setBillId(int billId)
    {
        this.billId = billId;
    }

    public int getStorageId()
    {
        return storageId;
    }

    public void setStorageId(int storageId)
    {
        this.storageId = storageId;
    }

    public int getBillType()
    {
        return billType;
    }

    public void setBillType(int billType)
    {
        this.billType = billType;
    }

    public Date getOperTime()
    {
        return operTime;
    }

    public void setOperTime(Date operTime)
    {
        this.operTime = operTime;
    }

    public String getPerator()
    {
        return perator;
    }

    public void setPerator(String perator)
    {
        this.perator = perator;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public String getProposer()
    {
        return proposer;
    }

    public void setProposer(String proposer)
    {
        this.proposer = proposer;
    }

    public int getBillStat()
    {
        return billStat;
    }

    public void setBillStat(int billStat)
    {
        this.billStat = billStat;
    }

    public Set<BillDetail> getBillDetails()
    {
        return billDetails;
    }

    public void setBillDetails(Set<BillDetail> billDetails)
    {
        this.billDetails = billDetails;
    }

    public String getBillNo()
    {
        return billNo;
    }

    public void setBillNo(String billNo)
    {
        this.billNo = billNo;
    }
}