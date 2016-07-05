package com.moutum.csmp.domain;

import java.util.Date;

/************************************************************************************
 * @Title        : Feedback.java
 * @Description  : 反馈信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 下午3:10:49
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Feedback
{

    /**
     * 信息编号
     */
    private int feedbackId;
    
    /**
     * 反馈人
     */
    private int userId;
    
    /**
     * 反馈时间
     */
    private Date feedbackTime;
    
    /**
     * 标题
     */
    private String title;
    
    /**
     * 内容
     */
    private String content;

    public int getFeedbackId()
    {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId)
    {
        this.feedbackId = feedbackId;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public Date getFeedbackTime()
    {
        return feedbackTime;
    }

    public void setFeedbackTime(Date feedbackTime)
    {
        this.feedbackTime = feedbackTime;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }
    
}

