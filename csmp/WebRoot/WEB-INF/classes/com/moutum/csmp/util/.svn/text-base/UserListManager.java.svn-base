package com.moutum.csmp.util;

import java.util.LinkedList;

/**
 * class : UserMapManager.java describe : author : BianWeiqing dateTime :
 * 2015-1-31 下午05:21:06 righter :
 */
public class UserListManager
{
    public static LinkedList<String> NEED_HELP_USER_LIST = new LinkedList<String>();

    /**
     * 获取一个联系客服的客户，并将其从等待队列中删除
     * 
     * @return
     */
    public static synchronized String getUserName()
    {
        if (NEED_HELP_USER_LIST.size() > 0)
        {
            String userName = NEED_HELP_USER_LIST.getLast();
            NEED_HELP_USER_LIST.removeLast();
            return userName;
        }
        return null;
    }

    /**
     * 客户点击联系客服后，进入等待队列
     * 
     * @param userName
     */
    public static synchronized void put(String userName)
    {
        for (int i = 0; i < NEED_HELP_USER_LIST.size(); i++)
        {
            if (userName.equals(NEED_HELP_USER_LIST.get(i)))
            {
                return;
            }
        }
        NEED_HELP_USER_LIST.add(userName);
    }
    
    /**
     * 将指定用户名从等待队列中移除。
     * 
     * @param userName
     */
    public static synchronized void remove(String userName)
    {
        int index = -1;
        for (int i = 0; i < NEED_HELP_USER_LIST.size(); i++)
        {
            if (userName.equals(NEED_HELP_USER_LIST.get(i)))
            {
                index = i;
                break;
            }
        }
        
        if(index >= 0)
        {
            NEED_HELP_USER_LIST.remove(index);
        }
    }
}
