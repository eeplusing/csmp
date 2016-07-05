package com.moutum.csmp.service;


import java.util.List;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Role;

/************************************************************************************
 * @Title        : RoleService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:32:57
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface RoleService extends ServiceSupport<Role>
{

	/**
	 * 获得页面
	 * @param pageNum
	 * @param pageSize
	 * @return PageBean  
	 */
	PageBean getby(int pageNum, int pageSize);
	
	/**
	 * 根据命名称查询角色
	 * @param roleName
	 * @return List<Role>  
	 */
	List<Role> getByString(String roleName);

}

