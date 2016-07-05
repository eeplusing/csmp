package com.moutum.csmp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/************************************************************************************
 * @Title        : DateUtil.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年3月27日 下午1:54:15
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class DateUtil
{
    public static String YYYY_MM_DD = "yyyy-MM-dd";
    public static String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";
    public static String YYYYMMDD = "yyyyMMdd";
    public static final String DATE_PATTERN_SS = "yyyyMMddHHmmssSS";
    
    public static String format(Date date)
    {
        SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD_HH_MM_SS);
        return sdf.format(date);
    }
    
    public static Date parse(String str) 
    {
        SimpleDateFormat sdf = new SimpleDateFormat(YYYY_MM_DD_HH_MM_SS);
        try 
        {
            return sdf.parse(str);
        }
        catch (ParseException e) 
        {
            return null;
        }
    }
    
    public static Date stringToDate(String source, String format)
    {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        
        try
        {
            return sdf.parse(source);
        }
        catch (ParseException e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public static Date formatNewDate(String format)
    {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try
        {
            return sdf.parse(dateToString(new Date(), format));
        }
        catch (ParseException e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public static String dateToString(Date date, String format)
    {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try
        {
            return sdf.format(date);
        }
        catch (Exception e)
        {
            return null;
        }
    }
    
    public static void main(String[] args)
    {
        System.out.println(formatNewDate(YYYY_MM_DD_HH_MM_SS));
    }
}

