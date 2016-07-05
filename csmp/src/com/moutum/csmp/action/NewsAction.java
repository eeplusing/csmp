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
import com.moutum.csmp.domain.News;
import com.moutum.csmp.domain.User;
import com.opensymphony.xwork2.ActionContext;
/************************************************************************************
 * @Title        : NewsAction.java
 * @Description : 
 * @Author       : BISON
 * @DateTime     : 2015年6月12日 下午12:16:32
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class NewsAction extends BaseAction<News> 
{

	private static final long serialVersionUID = 3700627294923958371L;
	Logger logger = Logger.getLogger(NewsAction.class);
	
	/*
	 * 新闻列表
	 */
	@SuppressWarnings("unused")
    public String showAll()
	{
		User loginUser = null;
		pageSize = 10;
		pageNum = 1;
		Map<String,String> map = null;
		
		try 
		{
			loginUser = (User) ActionContext.getContext().getSession().get("login_user");
			
			if(loginUser.getRole().getRoleName().indexOf("管理员") >= 0)
			{
			    ActionContext.getContext().put("userFlag", 1);
			    logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]打开新闻列表");
			}
			else
			{
			    ActionContext.getContext().put("userFlag", -1);
			    logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]打开新闻列表");
			}
		} 
		catch (Exception e) 
		{
			ActionContext.getContext().put("userFlag", -1);
			logger.info("[BWQ]---打开新闻列表");
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
		
		PageBean pageBean = newsService.getBy(pageNum,pageSize);
		List<User> users = new ArrayList<User> ();
		users =userService.findAll();
		ActionContext.getContext().put("pageBean", pageBean);
		ActionContext.getContext().put("users", users);
		
		return SUCCESS;
	}
	
	/*
	 * 新闻显示
	 */
	public String showNews()
	{
		User loginUser= null;
		int	newsId = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("newsId"))[0]);
		String userPhone = "";
		
		try 
		{
			loginUser = (User) ActionContext.getContext().getSession().get("login_user");
			ActionContext.getContext().put("login_user", loginUser);
			userPhone = loginUser.getUserPhone();
		} 
		catch (Exception e)
		{
		}
		if(newsId !=-1)
		{
			News news = newsService.getById(newsId);
			news.setNewsTitle(news.getNewsTitle().replaceAll("88888888888", "%"));
			news.setNewsContent(news.getNewsContent().replaceAll("88888888888", "%"));
			ActionContext.getContext().put("news", news);
			ActionContext.getContext().put("newsFlag", newsId);
			
			if(!userPhone.equals(""))
			{
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]打开新闻显示");
			}
			else
			{
				logger.info("[BWQ]---打开新闻显示");
			}
		}
		else
		{
			ActionContext.getContext().put("newsFlag", newsId );
			
			if(!userPhone.equals(""))
			{
				logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]新建新闻");
			}
		}
		
		List<User> users = userService.findAll();
		ActionContext.getContext().put("users", users);
		
		return SUCCESS;
	}
	
	/*
	 * 保存新闻
	 */
	public void saveNewsNews()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
		String newsTitle = null;
		int newsType = -1;
		int userId = -1;
		String newsContent = null;
		
		try 
		{
			newsTitle = ((String[]) ActionContext.getContext().getParameters().get("newsTitle"))[0];
			System.out.println(newsTitle);
			newsType = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("newsType"))[0]);
			userId = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("userId"))[0]);
			newsContent = ((String[]) ActionContext.getContext().getParameters().get("newsContent"))[0];
			newsContent = newsContent.replaceAll("\n", "<br>");
			newsContent = newsContent.replaceAll(" ", "&nbsp;");
		} 
		catch (Exception e)
		{
		}
		
		Date newsTime = new Date();
		News news = new News();
		news.setNewsContent(newsContent);
		news.setNewsTime(newsTime);
		news.setNewsTitle(newsTitle);
		news.setNewsType(newsType);
		news.setUserId(userId);
		newsService.save(news);
		
		try 
		{
			logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存新闻");
			getResponse().getWriter().write("ok");
		} 
		catch (IOException e) 
		{
			logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]保存新闻失败");
			e.printStackTrace();
		}
	}
	
	/*
	 * 新闻删除
	 */
	public void deleteNews()
	{
		User loginUser = (User) ActionContext.getContext().getSession().get("login_user");
	    try
        {
    		List<Integer> list = new ArrayList<Integer>();
            List<Integer> newsIds = new ArrayList<Integer>();
            String a = ((String[]) ActionContext.getContext().getParameters().get("newsIds"))[0];
            newsIds = seperate(a, list, 0);
            
            for(int i = 0 ; i<newsIds.size();i++)
            {
            	newsService.delete(newsIds.get(i));
            }
            
            logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]删除新闻");
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
        	logger.info("[BWQ]---账户[" + loginUser.getUserPhone() + "]删除新闻失败");
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
