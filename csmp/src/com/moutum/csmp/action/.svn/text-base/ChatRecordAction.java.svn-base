package com.moutum.csmp.action;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.ChatRecord;
import com.moutum.csmp.service.ChatRecordService;
import com.moutum.csmp.util.DateUtil;
import com.moutum.csmp.util.EncodeConvertor;
import com.moutum.csmp.util.UserListManager;

/**
 * class    : ChatRecordAction.java
 * describe : 
 * author   : BianWeiqing
 * dateTime : 2015-1-31 下午04:09:48
 * righter  :
 */

@Controller
@Scope(("prototype"))
public class ChatRecordAction
{
    //private Messagee messagee;
    private File uploadFile;//和JSP页面file的name一致
    private String uploadFileFileName;//固定写法uploadFile + FileName = uploadFileFileName
    private String imageUrl;
    
    @Resource ChatRecordService chatRecordService;
    
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    
    public void getNewMessage()
    {
        String senderUsername = request.getParameter("sendee");
        String sendeeUsername = request.getParameter("sender");
        if("no-sendee".equals(senderUsername))
        {
            senderUsername = null;
        }
        ChatRecord chatRecord = new ChatRecord();
        List<ChatRecord> chatRecords = chatRecordService.queryRecords(senderUsername, sendeeUsername, null, null, "0");
        Collections.sort(chatRecords, chatRecord);
        chatRecordService.updateChatRecord(chatRecords);
        if(null != chatRecords && chatRecords.size() > 0)
        {
        	StringBuffer stringBuffer = new StringBuffer();
        	stringBuffer.append(sendeeUsername + "|");
        	if(null != senderUsername)
        	{
        		stringBuffer.append(senderUsername + "|");
        	}
        	else
        	{
        		stringBuffer.append(chatRecords.get(0).getSenderUsername() + "|");
        	}
        	for(ChatRecord cr : chatRecords)
        	{
        		
        		stringBuffer.append(cr.getSenderUsername() + "#" + DateUtil.format(cr.getSenderTime()) + "#" + cr.getContent() + "#" + cr.getFilePath() + "#");
                if(null != cr.getFilePath())
                {
                     String fileName = cr.getContent();
                     String extName = "";//文件拓展名
                    
                     if(fileName.lastIndexOf(".") > -1)
                     {
                         extName = fileName.substring(fileName.lastIndexOf("."));//获取文件扩展名
                     }
                     if(isImage(extName))
                     {
                         stringBuffer.append("1;");
                     }
                     else
                     {
                         stringBuffer.append("2;");
                     }
                 }
                 else
                 {
                     stringBuffer.append("0;");
                 }
                
        	}
        	try
            {
				response.getWriter().print(stringBuffer.toString());
			}
            catch (IOException e)
            {
				e.printStackTrace();
			}
        }
        else
        {
        	try
            {
				response.getWriter().print("no_message");
			}
            catch (IOException e)
            {
				e.printStackTrace();
			}
        }
    }
    
    /**
     * 数据发送
     */
    public void sendMessage()
    {
        Date sendTime = new Date();
        String senderUsername = request.getParameter("sendee").trim();
        String sendeeUsername = request.getParameter("sender").trim();
        StringBuffer stringBuffer = new StringBuffer("");
        try
        {
            String msgee = "";
            //Firefox和360浏览器
            if(request.getHeader("user-agent").indexOf("Safari") > 0 || request.getHeader("user-agent").indexOf("Firefox") > 0)
            {
                msgee = EncodeConvertor.encodeConvert(request.getParameter("msgee").trim(), "iso8859-1", "utf-8");
            }
            else//IE浏览器
            {
                msgee = EncodeConvertor.encodeConvert(request.getParameter("msgee").trim(), "iso8859-1", "GBK");
            }
            
            if (null != msgee && !"".equals(msgee))
            {
                ChatRecord chatRecord = new ChatRecord();
                chatRecord.setContent(msgee);
                chatRecord.setSenderUsername(sendeeUsername);
                chatRecord.setSendeeUsername(senderUsername);
                chatRecord.setSenderTime(sendTime);
                chatRecord.setState("0");
                chatRecordService.addChatRecord(chatRecord);
                stringBuffer.append("0#" + sendeeUsername + "#" + DateUtil.format(sendTime) + "#" + msgee + "|");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        if (null != uploadFile)
        {
            String extName = "";//文件拓展名
            String newFileName = DateUtil.dateToString(new Date(), DateUtil.DATE_PATTERN_SS) + "-" + uploadFileFileName;//新文件名
            
            if(uploadFileFileName.lastIndexOf(".") > -1)
            {
                extName = uploadFileFileName.substring(uploadFileFileName.lastIndexOf("."));//获取文件扩展名
            }
            
            try
            {
                //文件保存目录
                File savePath = new File("d:/annexs/" + DateUtil.dateToString(new Date(),DateUtil.YYYY_MM_DD));
                
                if (!savePath.exists())
                {
                    savePath.mkdirs();
                }
                
                String saveFile = (savePath + "/" +  newFileName).replace("\\", "/");
                FileUtils.copyFile(uploadFile, new File(saveFile));//保存上传的文件
                ChatRecord chatRecord = new ChatRecord();
                chatRecord.setFilePath(saveFile);
                chatRecord.setSenderUsername(sendeeUsername);
                chatRecord.setSendeeUsername(senderUsername);
                chatRecord.setSenderTime(sendTime);
                chatRecord.setState("0");
                chatRecord.setContent(uploadFileFileName);
                chatRecordService.addChatRecord(chatRecord);//保存到数据库
                
                if(isImage(extName))
                {
                    stringBuffer.append("1#" + sendeeUsername + "#" + DateUtil.format(sendTime) + "#" + uploadFileFileName + "#" + saveFile + "|");
                }
                else
                {
                    stringBuffer.append("2#" + sendeeUsername + "#" + DateUtil.format(sendTime) + "#" + uploadFileFileName + "#" + saveFile + "|");
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        try
        {
            response.getWriter().print(stringBuffer.toString());
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void getCustomer()
    {
        try
        {
            response.setContentType("text/xml");
            response.setCharacterEncoding("UTF-8");
            if(UserListManager.NEED_HELP_USER_LIST.size() > 0)
            {
                response.getWriter().write("1");//1：表示有客户等待帮助
            }
            else
            {
                response.getWriter().write("0");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
    }

    /**
     * 客户提交一个对话请求，并打开一个对话窗口，等待管理员
     */
    public void getManager()
    {
        String username = request.getParameter("username");
    	UserListManager.put(username);
    	try
        {
            response.getWriter().print(DateUtil.format(new Date()) + "|申请已提交，稍后会有管理员联系您，请勿关闭该窗口");
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * 获取一个提交申请的客户，并打开与该客户交谈的对话窗口
     */
    public void getUser()
    {
    	String manager = request.getParameter("manager");
    	String customer = UserListManager.getUserName();
    	if(null != customer)
    	{
    	    String dateTime = DateUtil.format(new Date());
    	    String content = "您好！我是客服人员，请问有什么可以帮您的？";
    		ChatRecord chatRecord = new ChatRecord();
            chatRecord.setContent(content);
            chatRecord.setSenderUsername(manager);
            chatRecord.setSendeeUsername(customer);
            chatRecord.setSenderTime(DateUtil.parse(dateTime));
            chatRecord.setState("0");
            chatRecordService.addChatRecord(chatRecord);
            try
            {
				response.getWriter().print(manager + "|" + customer + "|" + dateTime + "|" + content);
			}
            catch (IOException e)
            {
				e.printStackTrace();
			}
    	}
    	else
    	{
    	    try
            {
                response.getWriter().print("no-customer");
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
    	}
    }
    
    /**
     * 图片回显action
     */
    public void showImage()
    {
        
        try
        {
            File file = new File(EncodeConvertor.encodeConvert(imageUrl, "iso8859-1", "utf-8"));
            InputStream is = new FileInputStream(file);
            Image image = ImageIO.read(is);
            String imageType = imageUrl.substring(imageUrl.lastIndexOf(".") + 1);
            OutputStream out = response.getOutputStream();
            ImageIO.write((RenderedImage)image, imageType, out);
            out.flush();
            out.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    /**
     * 判断是否是图片
     * @param extName 文件扩展名
     * @return
     */
    private boolean isImage(String extName)
    {
        boolean flag = false;
        if(extName.equalsIgnoreCase(".gif") || extName.equalsIgnoreCase(".jpg") || extName.equalsIgnoreCase(".jpeg") || extName.equalsIgnoreCase(".png"))
        {
            flag = true;
        }
        return flag;
    }
    
    public File getUploadFile()
    {
        return uploadFile;
    }

    public void setUploadFile(File uploadFile)
    {
        this.uploadFile = uploadFile;
    }

    public String getImageUrl()
    {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl)
    {
        this.imageUrl = imageUrl;
    }

    public String getUploadFileFileName()
    {
        return uploadFileFileName;
    }

    public void setUploadFileFileName(String uploadFileFileName)
    {
        this.uploadFileFileName = uploadFileFileName;
    }
}

