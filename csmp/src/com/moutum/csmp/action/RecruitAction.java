package com.moutum.csmp.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Recruit;
import com.moutum.csmp.domain.User;
import com.opensymphony.xwork2.ActionContext;

@Controller @Scope("prototype")
public class RecruitAction extends BaseAction<Recruit>
{

	private static final long serialVersionUID = 9089446116214433969L;
	Logger logger = Logger.getLogger(RecruitAction.class);
	
	/*
	 * 岗位列表
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	public String showAll()
	{
		User loginUser = null;
		pageSize = 10;
		pageNum = 1;
		Map<String,String> map = null;
		loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		String userPhone = "";
		
		try 
		{
			
			if(null != ActionContext.getContext().getSession().get("rightMap"))
			{
				map = (Map<String, String>)ActionContext.getContext().getSession().get("rightMap");
			}
			if(loginUser.getRole().getRoleName().indexOf("管理员") >= 0)
			{
			    ActionContext.getContext().put("userFlag", 1);
			    userPhone = loginUser.getUserPhone();
			}
			else
			{
			    ActionContext.getContext().put("userFlag", -1);
			}
		} 
		catch (Exception e) 
		{
			ActionContext.getContext().put("userFlag", -1);
		}
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
		if(!userPhone.equals(""))
		{
			logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]打开岗位列表");
		}
		else
		{
			logger.info("[BWQ]---打开岗位列表");
		}
		
		PageBean pageBean = recruitService.getBy(pageNum,pageSize);
		List<User> users = new ArrayList<User> ();
		users =userService.findAll();
		ActionContext.getContext().put("pageBean", pageBean);
		ActionContext.getContext().put("users", users);
		
		return SUCCESS;
	}
	
	/*
	 * 岗位添加与修改
	 */
	public String addAndChangeRecruit()
	{
		
		int recruitId = -1;
		String postDuty = "";
		String factor = "";
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		
		try 
		{
			recruitId = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("recruitId"))[0]);
			Recruit recruit = recruitService.getById(recruitId);
			ActionContext.getContext().put("recruitIdFlag", 1);
			ActionContext.getContext().put("recruit", recruit);
			
			factor = recruit.getFactor().replaceAll("<br/>","\n");
			postDuty = recruit.getPostDuty().replace("<br/>","\n");
			ActionContext.getContext().put("postDuty", postDuty);
			ActionContext.getContext().put("factor", factor);
			logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]岗位修改");
		} 
		catch (Exception e)
		{
			logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]岗位添加");
			ActionContext.getContext().put("recruitIdFlag", -1);
		}
		
		return SUCCESS;
	}
	
	/*
	 * 岗位显示
	 */
	public String showRecruit()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		int	recruitId = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("recruitId"))[0]);
		Recruit recruit = recruitService.getById(recruitId);
		recruit.setJobName(recruit.getJobName().replaceAll("88888888888", "%"));
		recruit.setWage(recruit.getWage().replaceAll("88888888888", "%"));
		recruit.setWorkAddress(recruit.getWorkAddress().replaceAll("88888888888", "%"));
		recruit.setPostDuty(recruit.getPostDuty().replaceAll("88888888888", "%"));
		recruit.setFactor(recruit.getFactor().replaceAll("88888888888", "%"));
		ActionContext.getContext().put("recruit", recruit);
		logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]岗位显示");
		
		return SUCCESS;
	}
	
	/*
	 * 保存岗位
	 */
	public void addChangeRecruit()
	{
		int recruitId = -2;
		String recruitJobName = null;
		String recruitWage = null;
		String recruitAddress = null;
		int recruitWorkNature = -2;
		int recruitSexRequire = -2;
		int recruitMember = -2;
		String postduty = null;
		String factor = null; 
		User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
		int userId = loginUser.getUserId();
		Date date = new Date();
		
		try
        {
			recruitId = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("recruitId"))[0]);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
		try
	    {
			recruitJobName = ((String[]) ActionContext.getContext().getParameters().get("recruitJobName"))[0].trim();
		}
	    catch (Exception e)
	    {
	    }
		try
        {
			recruitWage = ((String[]) ActionContext.getContext().getParameters().get("recruitWage"))[0].trim();
		}
		catch (Exception e)
		{
		}
		try
		{
			recruitAddress = ((String[]) ActionContext.getContext().getParameters().get("recruitAddress"))[0].trim();
		}
		catch (Exception e)
		{
		}
		try
		{
			recruitWorkNature = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("recruitWorkNature"))[0]);
		}
		catch (Exception e)
		{
		}
		try
		{
			recruitSexRequire = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("recruitSexRequire"))[0]);
		}
		catch (Exception e)
		{
		}
		try
		{
			recruitMember = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("recruitMember"))[0]);
		}
		catch (Exception e)
		{
		}
		try
		{
			postduty = ((String[]) ActionContext.getContext().getParameters().get("postduty"))[0];
			postduty = postduty.replaceAll("\n", "<br/>");
			postduty = postduty.replaceAll(" ",  "&nbsp;");
		}
		catch (Exception e)
		{
		}
		try
		{
			factor = ((String[]) ActionContext.getContext().getParameters().get("factor"))[0];
			factor = factor.replaceAll("\n", "<br/>");
			factor = factor.replaceAll(" ", "&nbsp;");
		}
		catch (Exception e)
		{
		}
		if(recruitId==-1)
		{
			Recruit recruit = new Recruit() ;
			recruit.setWorkNature(recruitWorkNature);
			recruit.setFactor(factor);
			recruit.setJobName(recruitJobName);
			recruit.setPostDuty(postduty);
			recruit.setRecruitMember(recruitMember);
			recruit.setSexRequire(recruitSexRequire);
			recruit.setTime(date);
			recruit.setUserId(userId);
			recruit.setWage(recruitWage);
			recruit.setWorkAddress(recruitAddress);
			recruitService.save(recruit);

			try
	        {
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]岗位添加成功");
	            getResponse().getWriter().write("ok");
	        }
	        catch (IOException e)
	        {
	            e.printStackTrace();
	        }
		}
		else
		{
			Recruit recruit = recruitService.getById(recruitId);
			recruit.setFactor(factor);
			recruit.setJobName(recruitJobName);
			recruit.setPostDuty(postduty);
			recruit.setRecruitMember(recruitMember);
			recruit.setSexRequire(recruitSexRequire);
			recruit.setTime(date);
			recruit.setUserId(userId);
			recruit.setWage(recruitWage);
			recruit.setWorkAddress(recruitAddress);
			recruit.setWorkNature(recruitWorkNature);
			recruitService.update(recruit);
			
			try
	        {
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]岗位修改成功");
	            getResponse().getWriter().write("ok");
	        }
	        catch (IOException e)
	        {
	            e.printStackTrace();
	        }
		}
	}
	
	/*
	 * 岗位删除
	 */
	public void deleteRecruit()
	{
		User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
	    try
        {
    		List<Integer> list = new ArrayList<Integer>();
            List<Integer> recruitIds = new ArrayList<Integer>();
            String a = ((String[]) ActionContext.getContext().getParameters().get("recruitIds"))[0];
            recruitIds = seperate(a, list, 0);
            
            for(int i =0; i<recruitIds.size(); i++)
            {
            	recruitService.delete(recruitIds.get(i));
        	}
            logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]岗位删除");
            
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
        	logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]岗位删除失败");
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
}
