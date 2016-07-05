package com.moutum.csmp.util;

import org.apache.commons.codec.digest.DigestUtils;

/************************************************************************************
 * @Title        : VisitorNoUtil.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月30日 下午10:20:26
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class VisitorNoUtil
{

    public static String getNo()
    {
        String no = "Visitor";
        for(int i = 0; i < 10; i++)
        {
            no += (int)(Math.random()*10);
        }
        return no;
    }
    
    public static void main(String[] args)
    {
        System.out.println((DigestUtils.md5Hex(DigestUtils.md5Hex("a") + "{admin}")));
        System.out.println((DigestUtils.md5Hex(DigestUtils.md5Hex("b") + "{b}")));
    }
}