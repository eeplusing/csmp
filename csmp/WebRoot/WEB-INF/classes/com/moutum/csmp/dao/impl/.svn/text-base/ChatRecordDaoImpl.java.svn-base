package com.moutum.csmp.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.dao.ChatRecordDao;
import com.moutum.csmp.domain.ChatRecord;

/**
 * class    : ChatRecordDaoImpl.java
 * describe : 
 * author   : BianWeiqing
 * dateTime : 2015-1-31 上午11:44:21
 * righter  :
 */

@Repository
public class ChatRecordDaoImpl implements ChatRecordDao
{
    @Resource SessionFactory sessionFactory;
    
    @Override 
    public int addChatRecord(ChatRecord chatRecord)
    {
        sessionFactory.getCurrentSession().persist(chatRecord);
        return 0;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<ChatRecord> queryRecords(String senderUsername, String sendeeUsername, Date startTime, Date endTime, String state)
    {
        Map<Integer, Object> map = new HashMap<Integer, Object>();
        int index = 0;
        StringBuffer hql = new StringBuffer("FROM ChatRecord cr WHERE 1=1");
        
        if(null != senderUsername)
        {
            hql.append(" and cr.senderUsername=?");
            map.put(index++, senderUsername);
        }
        
        if(null != sendeeUsername)
        {
            hql.append(" and cr.sendeeUsername=?");
            map.put(index++, sendeeUsername);
        }
        
        if(null != startTime)
        {
            hql.append(" and sendertime>?");
            map.put(index++, startTime);
        }
        
        if(null != endTime)
        {
            hql.append(" and sendertime<?");
            map.put(index++, endTime);
        }
        
        if(null != state)
        {
            hql.append(" and state=?");
            map.put(index++, state);
        }
        
        Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
        
        for(int i = 0; i < map.size(); i++)
        {
            query.setParameter(i, map.get(i));
        }
        return query.list();
    }

    @Override
    public void updateChatRecord(List<ChatRecord> chatRecords)
    {
        for(ChatRecord cr : chatRecords)
        {
            cr.setState("1");
            sessionFactory.getCurrentSession().merge(cr);
        }
    }

}