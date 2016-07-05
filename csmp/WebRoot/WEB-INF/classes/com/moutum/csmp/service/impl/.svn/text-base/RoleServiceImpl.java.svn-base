package com.moutum.csmp.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Role;
import com.moutum.csmp.service.RoleService;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : RoleServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:33:58
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class RoleServiceImpl extends ServiceSupportImpl<Role> implements RoleService
{

	@Override
	public PageBean getby(int pageNum, int pageSize)
	 {
		return roleDao.getBy(pageNum, pageSize);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> getByString(String roleName)
	{
		QueryHelper queryHelper = new QueryHelper(Role.class, "r");
		queryHelper.addCondition("roleName like ?", roleName);
		List<Object> parameters = queryHelper.getParameters();
		Query listQuery = getSession().createQuery(queryHelper.getListQueryHql());
		if (parameters != null)
        { 
            for (int i = 0; i < parameters.size(); i++)
            {
                listQuery.setParameter(i, parameters.get(i));
                System.out.println(parameters.get(i));
            }
        }
		List<Role> list = listQuery.list();
		return list;
	}

}

