package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.domain.Right;
import com.moutum.csmp.domain.Role;

/************************************************************************************
 * @Title        : RightService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:39:23
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface RightService extends ServiceSupport<Right>
{
	 /********************************************************************************
     * 授权并分配模块
     * @param roleId
     * @return 1:授权成功 0:操作失败
     ********************************************************************************/
	Map<String,Map<String,Map<Integer,Right>>> rightMap();

	/********************************************************************************
     * 根据角色ID查询该角色的所有权限并拼接成String
     * @param roleId
     * @return String
     ********************************************************************************/
	String getRightIdByRole(int roleId);

	/********************************************************************************
     * 给角色存储权限
     * @param map
     ********************************************************************************/
	Role BackRoleWithRights(Map<String, Object> map);
	
	/********************************************************************************
     * 根据角色ID查询该角色的所有权限
     * @param map
     ********************************************************************************/
	List<Right> getRightFunctionByRole(int roleId); 

}

