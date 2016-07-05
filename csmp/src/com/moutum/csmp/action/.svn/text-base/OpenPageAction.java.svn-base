package com.moutum.csmp.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.User;
import com.moutum.csmp.util.VisitorNoUtil;
import com.opensymphony.xwork2.ActionContext;

/**
 * class    : OpenPageAction.java
 * describe : 
 * author   : BianWeiqing
 * dateTime : 2015-2-2 上午09:00:27
 * righter  :
 */

@Controller @Scope(("prototype"))
public class OpenPageAction
{
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    
    public String customer()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        if(null == loginUser)
        {
            request.getSession().setAttribute("sender", VisitorNoUtil.getNo());
        }
        else
        {
            request.getSession().setAttribute("sender", loginUser.getLoginAccount());
        }
        request.getSession().setAttribute("sendee", "no-sendee");
        return "customer";
    }
    
    public String manager()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        request.getSession().setAttribute("sender", loginUser.getLoginAccount());
        request.getSession().setAttribute("sendee", "no-sendee");
        return "manager";
    }
}

