package com.moutum.csmp.dao;

import java.util.List;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.domain.Modle;


/************************************************************************************
 * @Title        : ModelDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:41:43
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface ModleDao extends DaoSupport<Modle>
{

	/**
	 * 搜索模块
	 * @param i
	 * @return List<Modle>
	 */
	List<Modle> selectModle(int i);

}

