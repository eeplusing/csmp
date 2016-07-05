package com.moutum.csmp.action;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Right;
import com.moutum.csmp.domain.Role;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.util.QueryHelper;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : RightAction.java
 * @Description : 
 * @Author       : BISON
 * @DateTime     : 2015年6月12日 上午14:38:20
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class RightAction extends BaseAction<Right>
{

	private static final long serialVersionUID = -377022243317017462L;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	Logger logger = Logger.getLogger(RightAction.class);
	
	/*
	 * 权限管理
	 */
	public String showAll()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		pageSize = 10;
		pageNum = 1;
		QueryHelper queryHelper = new QueryHelper(Right.class,"r");
		queryHelper.addOrderProperty("modleId", true);
		
		try 
		{
			pageNum = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("pageNum"))[0]);
		} 
		catch (Exception e)
		{
		}
		try 
		{
			pageSize = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("pageSize"))[0]);
		} 
		catch (Exception e)
		{
		}
		
		PageBean pageBean = rightService.getPageBean(pageNum, pageSize, queryHelper);
		ActionContext.getContext().put("pageBean", pageBean);
		logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]打开权限管理");
		
		return SUCCESS;
	}
	
	/*
	 * 打开授权页面
	 */
	public String getRightTree()
    {
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        request.setAttribute("rightMap", rightService.rightMap());
        request.setAttribute("roleId", roleId);
        request.setAttribute("hasRight", rightService.getRightIdByRole(roleId));
        logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]打开授权页面");
        
        return "tree";
    }
	
	/*
	 * 保存权限
	 */
	public void saveRight()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		String ids = ((String[])ActionContext.getContext().getParameters().get("rightIds"))[0];
		int roleId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("roleId"))[0]);
		Role role = roleService.getById(roleId);
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("rightIds", ids);
		map.put("role", role);
		Role roleBack =  rightService.BackRoleWithRights(map);
		roleService.update(roleBack);
		
		try 
		{
			logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存权限");
			getResponse().getWriter().write("ok");
		} 
		catch (IOException e) 
		{
			logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存权限失败");
			e.printStackTrace();
		}
	}
}
