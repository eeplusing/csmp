package com.moutum.csmp.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Role;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.util.EncodeConvertor;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : RoleAction.java
 * @Description : 
 * @Author       : BISON
 * @DateTime     : 2015年6月12日 下午12:16:32
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class RoleAction extends BaseAction<Role>
{
	private static final long serialVersionUID = -8653133317929076221L;
	Logger logger = Logger.getLogger(RoleAction.class);

	/*
	 * 修改角色
	 */
    public String changeName()
    {
        int roleId = -1;
        Role role = null;
        String roleName = null;
        User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
        
        try
        {
            roleId = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("roleId"))[0]);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        try
        {
            roleName = ((String[]) ActionContext.getContext().getParameters().get("roleId"))[0].trim();
            roleName = EncodeConvertor.encodeConvert(roleName, "iso8859-1", "utf-8");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        role = roleService.getById(roleId);
        ActionContext.getContext().put("role", role);
        logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]修改角色");
        
        return SUCCESS;
    }
    
    /*
     * 查看角色
     */
	@SuppressWarnings({ "unused", "unchecked" })
    public String showAll()
	{
		User loginUser = null;
		pageSize = 10;
		pageNum = 1;
		Map<String,String> map = null;
		
        try
        {
        	loginUser = (User) ActionContext.getContext().getSession().get("login_user");
        	
			if(null != ActionContext.getContext().getSession().get("rightMap"))
			{
				map = (Map<String, String>)ActionContext.getContext().getSession().get("rightMap");
			}
			
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
        
        PageBean pageBean = roleService.getby(pageNum, pageSize);
        ActionContext.getContext().put("pageBean",pageBean);

        logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]查看角色");
        return SUCCESS;        
    }
	
	/*
	 * 保存修改角色
	 */
    public void change()
    {
    	User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
        int roleId = -1;
        String roleName = null;
        int roleRank = 1;
        
        try
        {
            roleId = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("roleId"))[0]);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        try
        {
            roleName = ((String[]) ActionContext.getContext().getParameters().get("roleName"))[0];
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        try
        {
            roleRank = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("roleRank"))[0]);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        try
        {
            Role role = roleService.getById(roleId);
            role.setRoleName(roleName);
            role.setRoleRank(roleRank);
            roleService.update(role);
            
            logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存修改角色");
            getResponse().getWriter().write("ok");
        }
        catch (IOException e)
        {
        	logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存修改角色失败");
            e.printStackTrace();
        }
    }
	
    /*
     * 保存新添加角色
     */
	public void addRole()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		String roleName = null;
		int roleRank = 1;
		
		try
		{
			roleName = ((String[]) ActionContext.getContext().getParameters().get("roleName"))[0];
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		try
        {
            roleRank = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("roleRank"))[0]);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        try
        {
            Role role = new Role() ;
            role.setRoleName(roleName);
            role.setRoleRank(roleRank);
            roleService.save(role);
            logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存新添加角色");
            getResponse().getWriter().write("ok");
        }
        catch (IOException e)
        {
        	logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存新添加角色失败");
            e.printStackTrace();
        }
	}
	
	/*
	 * 按照分隔符分割字符串，返回LIST
	 */
    public static List<Integer> seperate(String a, List<Integer> list, int i)
    {
        if (a.indexOf(",") != -1)
        {
            i = a.indexOf(",");
            String b = a.substring(0, i);
            i = i + 1;
            a = a.substring(i);
            list.add(Integer.parseInt(b));
            return seperate(a, list, i);
        }
        else
        {
            list.add(Integer.parseInt(a));
            return list;
        }
    }
	
    /*
     * 添加角色
     */
	public String add()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]添加角色");
		return SUCCESS;
	}

	/*
	 * 删除角色
	 */
    public void deleteRole()
    {
    	User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
        try
        {
            List<Integer> list = new ArrayList<Integer>();
            List<Integer> roleIds = new ArrayList<Integer>();
            String a = ((String[]) ActionContext.getContext().getParameters().get("roleIds"))[0];
            roleIds = seperate(a, list, 0);
            
            for(int i = 0; i<roleIds.size();i++)
            {
            	roleService.delete(roleIds.get(i));
            }
            
            logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]删除角色");
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
        	logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]删除角色失败");
            e.printStackTrace();
        }
    }
}
