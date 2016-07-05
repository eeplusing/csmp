package com.moutum.csmp.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.service.UserService;

public class SessionListener implements HttpSessionListener 
{
    private static Logger logger = Logger.getLogger(SessionListener.class);
    
	@Override
	public void sessionCreated(HttpSessionEvent arg0) 
	{
	    //
	}
	
	public void sessionDestroyed(HttpSessionEvent event) 
	{
		User user = (User) event.getSession().getAttribute("login_user");
		if(null != user)
		{
		    logger.info("[BWQ]---Session销毁时：更新账户[" + user.getUserPhone() + "]状态为离线");
		    WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(event.getSession().getServletContext());
		    UserService userService = (UserService) ctx.getBean("userServiceImpl");
		    user.setState(1);
            userService.update(user);
		}
		else
		{
		    logger.info("[BWQ]---Session销毁时用户为空");
		}
	}
}