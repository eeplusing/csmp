 


package com.moutum.csmp.action;

import java.io.ByteArrayInputStream;

import org.springframework.stereotype.Controller;

import com.moutum.csmp.util.SecurityCodeUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/************************************************************************************
 * @Title : SecurityCodeAction.java
 * @Description : 生成验证码
 * @Author : BianWeiqing
 * @DateTime : 2015年5月18日 上午10:57:01
 * @Copyright : 2015 Moutum All Rights Reserved
 * @version : V1.0
 ************************************************************************************/
@Controller
public class SecurityCodeAction extends ActionSupport
{

    /********************************************************************************
     * 
     ********************************************************************************/
    private static final long serialVersionUID = 8835729871288856211L;

    private ByteArrayInputStream inputStream;

    public String execute() throws Exception
    {
        SecurityCodeUtil rdnu = SecurityCodeUtil.Instance();
        this.setInputStream(rdnu.getImage());// 取得带有随机字符串的图片
        ActionContext.getContext().getSession().put("random", rdnu.getString());// 取得随机字符串放入HttpSession
        return SUCCESS;
    }

    public void setInputStream(ByteArrayInputStream inputStream)
    {
        this.inputStream = inputStream;
    }

    public ByteArrayInputStream getInputStream()
    {
        return inputStream;
    }

}