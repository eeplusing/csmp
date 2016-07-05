package com.moutum.csmp.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.ModleDao;
import com.moutum.csmp.domain.Modle;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : ModelDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:42:39
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class ModleDaoImpl extends DaoSupportImpl<Modle> implements ModleDao
{

	@SuppressWarnings("unchecked")
	@Override
	public List<Modle> selectModle(int parentId) 
	{
		QueryHelper queryHelper = new QueryHelper(Modle.class, "m");
		queryHelper.addCondition("parentId = ?", parentId);
		queryHelper.addOrderProperty("modleId", true);
		List<Object> parameters = queryHelper.getParameters();
		Query listQuery = getSession().createQuery(queryHelper.getListQueryHql());
		for(int i = 0 ; i<parameters.size();i++)
		{
			listQuery.setParameter(i, parameters.get(i));
		}
		List<Modle> modlelist = listQuery.list();
		return modlelist;
	}

}

