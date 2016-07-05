package com.moutum.csmp.util;
/************************************************************************************
 * @Title        : OrderNoUtil.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月21日 上午11:16:10
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class OrderNoUtil
{
    
    public static String getOrderNo()
    {
        return "00" + getFirstNo() + getFirstNo();
    }

    private static String getFirstNo()
    {
        String result = "0000";
        result += (int)(Math.random()*10000);
        result = result.substring(result.length() - 4);
        return result;
    }
    
    
    public static void main(String[] args)
    {
        for(int i = 0; i < 20; i++)
        {
            System.out.println(getOrderNo());
        }
    }

}

