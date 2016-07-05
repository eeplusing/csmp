package com.moutum.csmp.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Recruit;
import com.moutum.csmp.service.RecruitService;

/************************************************************************************
 * @Title        : RecruitServiceImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月15日 下午5:49:02
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class RecruitServiceImpl extends ServiceSupportImpl<Recruit> implements RecruitService
{

	@Override
	public PageBean getBy(int pageNum, int pageSize) {
	
		return recruitDao.getBy(pageNum,pageSize);
	}

}

