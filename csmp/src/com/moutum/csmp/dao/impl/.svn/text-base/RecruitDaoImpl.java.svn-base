package com.moutum.csmp.dao.impl;

import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.dao.RecruitDao;
import com.moutum.csmp.domain.Recruit;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : RecruitDaoImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月15日 下午5:46:04
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class RecruitDaoImpl extends DaoSupportImpl<Recruit> implements RecruitDao
{
	@Override
	public PageBean getBy(int pageNum, int pageSize)
	{
		QueryHelper queryHelper = new QueryHelper(Recruit.class,"r");
		queryHelper.addOrderProperty("time", false);
		
		return getPageBean(pageNum, pageSize, queryHelper);
	}

}