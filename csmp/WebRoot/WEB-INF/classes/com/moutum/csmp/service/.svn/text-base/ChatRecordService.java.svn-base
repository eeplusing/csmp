package com.moutum.csmp.service;

import java.util.Date;
import java.util.List;

import com.moutum.csmp.domain.ChatRecord;

/************************************************************************************
 * @Title        : ChatRecordSercive.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月30日 下午6:51:49
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface ChatRecordService
{
    /**
     * 根据发送者，接收者起止时间获取聊天记录
     * @param senderUsername 说话人
     * @param sendeeUsername 接收人
     * @param startTime 起始时间
     * @param endTime 结束时间
     * @param state 记录状态
     * @return
     */
    public List<ChatRecord> queryRecords(String senderUsername, String sendeeUsername, Date startTime, Date endTime, String state);
    
    /**
     * 增加一条聊天记录
     * @param chatRecord
     * @return
     */
    public int addChatRecord(ChatRecord chatRecord);
    
    /**
     * 更新记录状态
     * @param chatRecords 聊天记录集合
     */
    public void updateChatRecord(List<ChatRecord> chatRecords);
}

