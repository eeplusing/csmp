package com.moutum.csmp.util;

/************************************************************************************
 * @Title        : NewOrderListManager.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年8月7日 下午5:31:11
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class NewOrderListManager
{
    public static boolean HAS_NEW_ORDER = false;
    
    /**
     * 提醒管理员后将标志位设为false
     * @return
     */
    public static synchronized boolean hasNewOrder()
    {
        if (HAS_NEW_ORDER)
        {
            HAS_NEW_ORDER = false;
            return true;
        }
        return false;
    }

    /**
     * 生成新订单时将标识设为true
     * @param userName
     */
    public static synchronized void createNewOrder()
    {
        HAS_NEW_ORDER = true;
    }
}