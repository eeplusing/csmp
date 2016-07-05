package com.moutum.csmp.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Grade;
import com.moutum.csmp.domain.Group;
import com.moutum.csmp.domain.Role;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.util.EncodeConvertor;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : UserAction.java
 * @Description : 
 * @Author       : HUANGWEI
 * @DateTime     : 2015年5月26日 上午12:51:24
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class UserAction  extends BaseAction<User>
{
	private static final long serialVersionUID = 9038813896371381502L;
	Logger logger = Logger.getLogger(UserAction.class);
	
	/*
	 * 查看账户
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	public String showAll()
	{
		pageSize = 10;
		pageNum = 1;
        int userStat = 9;
        String userAccount = null;
        String userName = null;
        int userGrade = -1;
        int userGroup = -1;
        int userRole = -1;
        List<Group> groups = null; 
        List<Grade> grades = null; 
        List<Role> roles = null;
        Map<String,Object> map = new HashMap<String,Object>();
        Map<String,String> userMap = null;
        User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
        
        if(null != ActionContext.getContext().getSession().get("rightMap"))
		{
        	userMap = (Map<String, String>)ActionContext.getContext().getSession().get("rightMap");
		}
        try
        {
            pageNum = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageNum"))[0]);
        }
        catch (Exception e)
        {
        }
        try
        {
            pageSize = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageSize"))[0]);
        }
        catch (Exception e)
        {
        }
        try
        {
			userStat = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("userstat"))[0]);
			
			if(userStat != 9)
			{
				map.put("userStat", userStat);
			}
		}
        catch (Exception e)
        {
		}
        try
        {
			userAccount = ((String[]) ActionContext.getContext().getParameters().get("useraccount"))[0].trim();
			
			if(null != userAccount)
			{
				map.put("userAccount", userAccount);
			}
		}
        catch (Exception e)
        {
		}
        try
        {
			userName = ((String[]) ActionContext.getContext().getParameters().get("username"))[0].trim();
			userName = EncodeConvertor.encodeConvert(userName, "iso8859-1", "utf-8");
			
			if(null != userName)
			{
				map.put("userName", userName);
			}
		}
        catch (Exception e)
        {
		}
        try
        {
        	userRole = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("userrole"))[0]);
        	
        	if(userRole != -1)
			{
				map.put("userRole", userRole);
			}
        }
        catch (Exception e)
        {
        }
        try
        {
    		userGroup = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("usergroup"))[0]);
    		
        	if(userGroup != -1)
			{
				map.put("userGroup", userGroup);
			}
        }
        catch (Exception e)
        {
        }
        try
        {
        	userGrade = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("usergrade"))[0]);
        	
        	if(userGrade != -1)
			{
				map.put("userGrade", userGrade);
			}
        }
        catch (Exception e)
        {
        }
		
        PageBean pageBean = userService.getbyMap(pageNum, pageSize, map);
		groups=groupService.findAll();
		Group group = new Group();
		group.setGroupId(-1);
		group.setGroupName("全部");
		groups.add(group);
		
		grades=gradeService.findAll();
		Grade grade = new Grade();
		grade.setGradeId(-1);
		grade.setGradeName("全部");
		grades.add(grade);
		
		roles=roleService.findAll();
		Role role = new Role();
		role.setRoleId(-1);
		role.setRoleName("全部");
		roles.add(role);
		
        ActionContext.getContext().put("pageBean",pageBean);
        ActionContext.getContext().put("grades",grades);
        ActionContext.getContext().put("groups",groups);
        ActionContext.getContext().put("roles",roles);
        
        ActionContext.getContext().put("user_stat",userStat);
        ActionContext.getContext().put("userAccount",userAccount);
        ActionContext.getContext().put("userName",userName);
        ActionContext.getContext().put("userGroup",userGroup);
        ActionContext.getContext().put("userRole",userRole);
        ActionContext.getContext().put("userGrade",userGrade);
        logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]打开角色管理页面");
        
        return SUCCESS;        
    }
	
	/*
	 * 冻结账户
	 */
	public void  groupFreeze()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		try
		{
			List<Integer> list=new ArrayList<Integer>();
			List<Integer> userIds=new ArrayList<Integer>();
			String a = ((String[]) ActionContext.getContext().getParameters().get("userIds"))[0];
			userIds = seperate(a,list,0);
			userService.modifybyListFreeze(userIds);
			
			for(int userId : userIds)
			{
				User user = userService.getById(userId);
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]冻结账户["+user.getUserPhone()+"]");
			}
			getResponse().getWriter().write("ok");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			try 
			{
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]冻结账户出错");
				getResponse().getWriter().write("error");
			} 
			catch (IOException e1) 
			{
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]冻结账户出错");
				e1.printStackTrace();
			}
		}
	}
	
	/*
	 * 解冻账户
	 */
	public void groupwarm()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		try
		{
			List<Integer> list=new ArrayList<Integer>();
			List<Integer> userIds=new ArrayList<Integer>();
			String a = ((String[]) ActionContext.getContext().getParameters().get("userIds"))[0];
			userIds =seperate(a,list,0);
			userService.modifybyListWarm(userIds);
			
			for(int userId : userIds)
			{
				User user = userService.getById(userId);
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]解冻账户["+user.getUserPhone()+"]");
			}
			getResponse().getWriter().write("ok");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			try 
			{
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]解冻账户失败");
				getResponse().getWriter().write("error");
			} 
			catch (IOException e1) 
			{
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]解冻账户失败");
				e1.printStackTrace();
			}
		}
	}
	
	/*
	 * 注销账户
	 */
	public void groupwithdraw()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		try
		{
			List<Integer> list=new ArrayList<Integer>();
			List<Integer> userIds=new ArrayList<Integer>();
			String a = ((String[]) ActionContext.getContext().getParameters().get("userIds"))[0];
			userIds =seperate(a,list,0);
			userService.modifybyListWithdraw(userIds);
			
			for(int userId : userIds)
			{
				User user = userService.getById(userId);
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]注销账户["+user.getUserPhone()+"]");
			}
			getResponse().getWriter().write("ok");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			try
			{
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]注销账户失败");
				getResponse().getWriter().write("error");
			}
			catch (IOException e1) 
			{
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]注销账户失败");
				e1.printStackTrace();
			}
		}
	}
	
	/*
	 * 按照分隔符分割字符串，返回LIST
	 */
	public  static List<Integer> seperate (String a,List<Integer> list,int i)
	{
		if(a.indexOf(",")!=-1)
		{
            i = a.indexOf(",");
            String b = a.substring(0, i);
            i = i + 1;
            a = a.substring(i);
            list.add(Integer.parseInt(b));
            
            return seperate(a, list,i);
	    }
		else
		{
			list.add(Integer.parseInt(a));
			
			return list;
		}
	}
	
	/*
	 * 打开账户角色页面
	 */
	public String changeRole()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		Integer userId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("userId"))[0]);
		User user = userService.getById(userId);
		List<Role> roles = roleService.findAll();
		ActionContext.getContext().put("user", user);
		ActionContext.getContext().put("roles", roles);
		logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]打开角色页面");
		
		return SUCCESS;
	}
	
	/*
	 * 保存账户角色
	 */
	public void saveRole()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		Integer userId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("userId"))[0]);
		String roleName = ((String[]) ActionContext.getContext().getParameters().get("rolename"))[0];
		User user = userService.getById(userId);
		List<Role> role = roleService.getByString(roleName);
		user.setRole(role.get(0));
		logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存账户角色");
		userService.update(user);
	}
}

