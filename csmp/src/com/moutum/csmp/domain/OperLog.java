package com.moutum.csmp.domain;

import java.util.Date;

/************************************************************************************
 * @Title        : Operlog.java
 * @Description  : 操作日志信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 下午1:12:46
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class OperLog
{

    /**
     * 日志编号
     */
    private int logId;
    
    /**
     * 操作类型
     */
    private int operType;
    
    /**
     * 操作时间
     */
    private Date operTime;
    
    /**
     * 内容描述
     */
    private String operContent;
    
    /**
     * 操作人
     */
    private int userId;

    public int getLogId()
    {
        return logId;
    }

    public void setLogId(int logId)
    {
        this.logId = logId;
    }

    public int getOperType()
    {
        return operType;
    }

    public void setOperType(int operType)
    {
        this.operType = operType;
    }

    public Date getOperTime()
    {
        return operTime;
    }

    public void setOperTime(Date operTime)
    {
        this.operTime = operTime;
    }

    public String getOperContent()
    {
        return operContent;
    }

    public void setOperContent(String operContent)
    {
        this.operContent = operContent;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

}