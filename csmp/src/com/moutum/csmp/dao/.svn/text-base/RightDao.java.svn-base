package com.moutum.csmp.dao;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.domain.Right;

/************************************************************************************
 * @Title        : RightDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:36:44
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface RightDao extends DaoSupport<Right>
{
	/**
	 * 搜索权限
	 * @param modleId
	 * @return Map<Integer,Right>
	 */
	Map<Integer,Right> selectRight(int modleId);

	/**
	 * 通过角色获得权限
	 * @param roleId
	 * @return List<Right>
	 */
	List<Right> getRightsByRole(int roleId);

}

