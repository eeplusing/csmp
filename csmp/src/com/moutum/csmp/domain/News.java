package com.moutum.csmp.domain;

import java.util.Date;

/************************************************************************************
 * @Title        : News.java
 * @Description  : 新闻信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 下午3:13:38
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class News
{

    /**
     * 新闻编号
     */
    private int newsId;
    
    /**
     * 发布人
     */
    private int userId;
    
    /**
     * 新闻标题
     */
    private String newsTitle;
    
    /**
     * 发布时间
     */
    private Date newsTime;
    
    /**
     * 新闻内容
     */
    private String newsContent;
    
    /**
     * 新闻类型
     */
    private int newsType;

    public int getNewsId()
    {
        return newsId;
    }

    public void setNewsId(int newsId)
    {
        this.newsId = newsId;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public String getNewsTitle()
    {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle)
    {
        this.newsTitle = newsTitle;
    }

    public Date getNewsTime()
    {
        return newsTime;
    }

    public void setNewsTime(Date newsTime)
    {
        this.newsTime = newsTime;
    }

    public String getNewsContent()
    {
        return newsContent;
    }

    public void setNewsContent(String newsContent)
    {
        this.newsContent = newsContent;
    }

    public int getNewsType()
    {
        return newsType;
    }

    public void setNewsType(int newsType)
    {
        this.newsType = newsType;
    }
    
}

