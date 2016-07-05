package com.moutum.csmp.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Evaluate;
import com.moutum.csmp.domain.User;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : EvaluateAction.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月14日 下午6:08:55
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class EvaluateAction extends BaseAction<Evaluate>
{
    
    /********************************************************************************
     * 
     ********************************************************************************/
    private static final long serialVersionUID = 1267255124142935188L;
    HttpServletRequest request = ServletActionContext.getRequest();
    
    private String status="error";//是否添加成功   success:表示成功    noLogin:表示还没登录   error:表示登录的情况下，添加失败
    
    /**
     * 商品评论查询
     */
    public String getEvaluateById()
    {
    	int goodId=0;
    	goodId=Integer.parseInt(request.getParameter("goodId"));//商品id
    	pageSize = 12;//一页显示多少条数据
    	
    	//页数
    	try
        {
    		if(ActionContext.getContext().getParameters().get("pageNum")!=null)
    		{
    			pageNum = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageNum"))[0]);
    		}
        }
        catch (Exception e)
        {
            
        }
        
        try
        {
        	if(ActionContext.getContext().getParameters().get("pageSize")!=null)
        	{
        		pageSize = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageSize"))[0]);
        	}  
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    	
    	User user = new User();
    	List<User> list = new ArrayList<User>();
    	PageBean pageBean = evaluateService.getEvaluateById(pageNum, pageSize, goodId);
    	//通过id查询用户信息，把用户信息放到list中
    	if(pageBean!=null)
    	{
    		for(int i=0;i<pageBean.getRecordList().size();i++)
        	{
    			Evaluate eva = (Evaluate) pageBean.getRecordList().get(i);
    			int userid = eva.getUserId();
    			user = userService.getById(userid);
    			list.add(user);
        	}
    	}
    	//去掉list中的重复值
    	list = getNewList(list);
    	
    	ActionContext.getContext().put("pageBean", pageBean);
    	ActionContext.getContext().put("list", list);
    	return "evaluateSearch";
    }
    
    /**
     * 去掉list中的重复姓名值
     */
    public List<User> getNewList(List<User> list){
    	for  ( int  i  =   0 ; i  <  list.size()  -   1 ; i ++ )   { 
    	    for  ( int  j  =  list.size()  -   1 ; j  >  i; j -- )   { 
    	      if  (list.get(j).getUserName().equals(list.get(i).getUserName()))   { 
    	        list.remove(j); 
    	      } 
    	    } 
    	} 

        return list;  //返回集合
    }

    
    /**
     * 评论跳转
     */
    public String goEvaluate()
    {
    	int goodId=0;
    	goodId=Integer.parseInt(request.getParameter("goodId"));//商品id
    	
    	ActionContext.getContext().put("goodId", goodId);
    	return "goEva";
    }
    /**
     * 添加评论信息
     */
    public String saveEvaluate()
    {
    	int goodId=0;
    	goodId=Integer.parseInt(request.getParameter("goodId"));//商品id
    	String content = request.getParameter("content");//评论内容
		int score = Integer.parseInt(request.getParameter("score"));//评分
		User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
		if(null==loginUser)
		{
			status="noLogin";
		}else
		{
			try
			{
	    		Evaluate eva = new Evaluate();
	    		eva.setEvaluateContent(content);
	    		eva.setEvaluateGrade(score);
	    		eva.setUserId(loginUser.getUserId());
	    		eva.setGoodId(goodId);
	            eva.setEvaluateTime(new Date());
	    		evaluateService.save(eva);
	    		
	    		status="success";
			}
	    	catch(Exception e)
			{
				status="error";
				e.printStackTrace();
			}   		
		}   	
    	
    	return SUCCESS;
    }

	public String getStatus() 
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}
	
}

