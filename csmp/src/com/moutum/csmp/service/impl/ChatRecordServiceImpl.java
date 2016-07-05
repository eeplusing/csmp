package com.moutum.csmp.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.dao.ChatRecordDao;
import com.moutum.csmp.domain.ChatRecord;
import com.moutum.csmp.service.ChatRecordService;

/************************************************************************************
 * @Title        : ChatRecordSerciveImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月30日 下午6:52:48
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class ChatRecordServiceImpl implements ChatRecordService
{
    @Resource ChatRecordDao chatRecordDao;

    @Override
    public List<ChatRecord> queryRecords(String senderUsername, String sendeeUsername, Date startTime, Date endTime, String state)
    {
        
        return chatRecordDao.queryRecords(senderUsername, sendeeUsername, startTime, endTime, state);
    }

    @Override
    public int addChatRecord(ChatRecord chatRecord)
    {
        return chatRecordDao.addChatRecord(chatRecord);
    }

    @Override
    public void updateChatRecord(List<ChatRecord> chatRecords)
    {
        chatRecordDao.updateChatRecord(chatRecords);
    }

}

