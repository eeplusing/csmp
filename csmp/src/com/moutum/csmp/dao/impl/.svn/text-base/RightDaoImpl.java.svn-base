package com.moutum.csmp.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.RightDao;
import com.moutum.csmp.domain.Right;
import com.moutum.csmp.domain.Role;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : RightDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:38:07
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class RightDaoImpl extends DaoSupportImpl<Right> implements RightDao
{

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer,Right> selectRight(int modleId) 
	{
		QueryHelper queryHelper = new QueryHelper(Right.class, "r");
		queryHelper.addCondition("modleId like ?", modleId);
		queryHelper.addOrderProperty("rightId", true);
		List<Object> parameters = queryHelper.getParameters();
		Query listQuery = getSession().createQuery(queryHelper.getListQueryHql());
		
		for(int i =0; i<parameters.size();i++)
		{
			listQuery.setParameter(i, parameters.get(i));
		}
		
		List<Right> rightList = listQuery.list();
		Map<Integer,Right> rightMap = new HashMap<Integer,Right>();
		
		for(int i = 0;i<rightList.size();i++)
		{
			rightMap.put(i, rightList.get(i));
		}
		
		return rightMap;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Right> getRightsByRole(int roleId) 
	{
		QueryHelper queryHelper = new QueryHelper(Role.class, "r");
		queryHelper.addCondition("roleId = ?", roleId);
		queryHelper.addOrderProperty("roleId", true);
		List<Object> parameters = queryHelper.getParameters();
		Query listQuery = getSession().createQuery(queryHelper.getListQueryHql());
		
		for(int i =0; i<parameters.size();i++)
		{
			listQuery.setParameter(i, parameters.get(i));
		}
		
		List<Role> roleList = listQuery.list();
		List<Right> rightList = new ArrayList<Right>();
		
		if(0 != roleList.get(0).getRights().size())
		{
			for(Right right : roleList.get(0).getRights())
			{
				rightList.add(right);
			}
			
			return rightList;
		}
		
		return null;
	}
}

