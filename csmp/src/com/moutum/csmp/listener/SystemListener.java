package com.moutum.csmp.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.moutum.csmp.util.XMLUtil;

/************************************************************************************
 * @Title        : SMSServiceListener.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年6月11日 下午4:17:49
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class SystemListener implements ServletContextListener
{

    @Override
    public void contextDestroyed(ServletContextEvent event)
    {
        //
    }

    /**
     * 
     * 系统启动时,调用此方法进行相关初始化工作
     */
    @Override
    public void contextInitialized(ServletContextEvent event)
    {
        //系统变量初始化
        XMLUtil.parserXml(event.getServletContext().getRealPath("/") + "/WEB-INF/classes/config.xml");
    }
}