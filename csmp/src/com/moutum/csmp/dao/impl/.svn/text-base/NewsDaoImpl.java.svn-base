package com.moutum.csmp.dao.impl;

import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.dao.NewsDao;
import com.moutum.csmp.domain.News;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : NewsDaoImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月15日 下午5:52:25
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class NewsDaoImpl extends DaoSupportImpl<News> implements NewsDao
{
	@Override
	public PageBean getBy(int pageNum, int pageSize) 
	{
		QueryHelper queryHelper = new QueryHelper(News.class,"n");
		queryHelper.addOrderProperty("newsTime", false);
		
		return getPageBean(pageNum, pageSize, queryHelper);
	}
}

