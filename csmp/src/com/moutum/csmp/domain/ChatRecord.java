package com.moutum.csmp.domain;

import java.util.Comparator;
import java.util.Date;

/**
 * class    : ChatRecord.java
 * describe : 
 * author   : BianWeiqing
 * dateTime : 2015-1-31 上午10:02:52
 * righter  :
 */
public class ChatRecord implements Comparator<ChatRecord>
{
    private long id;//ID
    
    private String senderUsername;//说话人
    
    private String sendeeUsername;//接收人
    
    private Date   senderTime;//时间
    
    private String content;//内容
    
    private String filePath;//文件路径
    
    private String state;//记录状态，0:未读    1:已读
    
    
    public long getId()
    {
        return id;
    }
    public void setId(long id)
    {
        this.id = id;
    }
    public String getSenderUsername()
    {
        return senderUsername;
    }
    public void setSenderUsername(String senderUsername)
    {
        this.senderUsername = senderUsername;
    }
    public String getSendeeUsername()
    {
        return sendeeUsername;
    }
    public void setSendeeUsername(String sendeeUsername)
    {
        this.sendeeUsername = sendeeUsername;
    }
    public Date getSenderTime()
    {
        return senderTime;
    }
    public void setSenderTime(Date senderTime)
    {
        this.senderTime = senderTime;
    }
    public String getContent()
    {
        return content;
    }
    public void setContent(String content)
    {
        this.content = content;
    }
    public String getFilePath()
    {
        return filePath;
    }
    public void setFilePath(String filePath)
    {
        this.filePath = filePath;
    }
    public String getState()
    {
        return state;
    }
    public void setState(String state)
    {
        this.state = state;
    }
    @Override
    public int compare(ChatRecord cr1, ChatRecord cr2)
    {
        if(cr1.getSenderTime().after(cr2.getSenderTime()))
        {
            return 1;
        }
        return -1;
    }
}

