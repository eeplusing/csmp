package com.moutum.csmp.action;

import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.util.EncodeConvertor;

/**
 * class    : FileAction.java
 * describe : 
 * author   : BianWeiqing
 * dateTime : 2015-2-3 上午10:09:33
 * righter  :
 */

@Controller @Scope(("prototype"))
public class FileAction
{
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    
    public void download()
    {
        FileInputStream in = null;
        OutputStream os = null;
        String filePath = request.getParameter("path");
        String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
        
        try
        {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            Cookie cookie = new Cookie("fileDownload", "true");
            response.addCookie(cookie);
            response.addHeader("Content-Disposition","attachment;filename=" + EncodeConvertor.encodeConvert(fileName, "gb2312", "iso8859-1"));
            in = new FileInputStream(filePath);
            os = response.getOutputStream();
            byte[] b = new byte[1024 * 1024 * 4];
            int count = in.read(b);
            while(count > 0)
            {
                os.write(b, 0, count);
                count = in.read(b);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                in.close();
                os.close();
            }
            catch (Exception e2)
            {
                e2.printStackTrace();
            }
        }
    }
    
}

