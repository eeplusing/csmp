package com.moutum.csmp.dao.impl;

import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.dao.RoleDao;
import com.moutum.csmp.domain.Role;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : RoleDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午2:37:41
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class RoleDaoImpl extends DaoSupportImpl<Role> implements RoleDao
{

	@Override
	public PageBean getBy(int pageNum, int pageSize)
	{
		QueryHelper queryHelper = new QueryHelper(Role.class, "r");
		queryHelper.addOrderProperty("roleId", true);
		
		return getPageBean(pageNum, pageSize, queryHelper);
	}
    
}

