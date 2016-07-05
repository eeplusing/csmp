package com.moutum.csmp.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.News;
import com.moutum.csmp.service.NewsService;

/************************************************************************************
 * @Title        : NewsServiceImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月15日 下午5:53:46
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class NewsServiceImpl extends ServiceSupportImpl<News> implements NewsService
{

	@Override
	public PageBean getBy(int pageNum, int pageSize)
	{
		return newsDao.getBy(pageNum,pageSize);
	}

}

