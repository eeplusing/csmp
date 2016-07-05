package com.moutum.csmp.service;


import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.News;

/************************************************************************************
 * @Title        : NewsService.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月15日 下午5:53:32
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface NewsService extends ServiceSupport<News>
{

	/**
	 * 获得页面
	 * @param pageNum
	 * @param pageSize
	 * @return PageBean
	 */
	PageBean getBy(int pageNum, int pageSize);
}

