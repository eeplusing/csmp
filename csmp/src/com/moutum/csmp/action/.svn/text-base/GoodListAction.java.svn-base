package com.moutum.csmp.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.Evaluate;
import com.moutum.csmp.domain.Good;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : GoodListAction.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月26日 上午11:31:48
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class GoodListAction extends BaseAction<Good>
{

    /**
     * 
     */
    private static final long serialVersionUID = 1947426793463653015L;
    HttpServletRequest request = ServletActionContext.getRequest();
    
    public String goodList()
    {
       List<Good> good = goodService.findAll();      
       ActionContext.getContext().put("good", good);     
       
       return "get_list";
      
    }
    
    public String goodInfo()
    {
        
        int goodId = Integer.parseInt(request.getParameter("goodId"));
       
        Good gd= goodService.getById(goodId);
        
        Evaluate evaluate= evaluateService.getById(goodId);
        
        ActionContext.getContext().put("evaluate", evaluate);
        
        ActionContext.getContext().put("gd", gd);
       
        return "get_info";
    }

}

