package com.moutum.csmp.action;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.DataStat;
import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.News;
import com.moutum.csmp.domain.Right;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.dto.HotGood;
import com.moutum.csmp.util.EncodeConvertor;
import com.moutum.csmp.util.NewOrderListManager;
import com.moutum.csmp.util.SMSCodeUtil;
import com.moutum.csmp.util.SendRecieveSms;
import com.moutum.csmp.util.SystemConstants;
import com.moutum.csmp.util.XMLUtil;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : HomeAction.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月16日 上午10:59:22
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class HomeAction extends BaseAction<User>
{

    /********************************************************************************
     * 
     ********************************************************************************/
    private static final long serialVersionUID = 1012074219643654431L;
    HttpServletRequest request = ServletActionContext.getRequest();
    Logger logger = Logger.getLogger(HomeAction.class);
      
    public String index()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        ActionContext.getContext().put("luser", loginUser);
        //统计标识，该标识存在时则不增加系统访问量，否则系统访问量加1
        if(null == ActionContext.getContext().getSession().get("data_stat_info"))
        {
            ActionContext.getContext().getSession().put("data_stat_info", "data_stat_info");
            try
            {
                dataStatService.modifyStat();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        logger.info("[BWQ]---访问信息：系统首页被访问");
        return "success";
    }
    
    public String managerIndex()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        ActionContext.getContext().put("luser", loginUser);
        if(loginUser.getRole().getRoleRank() == 0)
        {
            List<DataStat> list = dataStatService.findAll();
            if(null != list && list.size() > 0)
            {
                ActionContext.getContext().put("ds", list.get(0));
            }
            return "success";
        }
        else
        {
            return "no_page";
        }
    }
    
    public String mainNews()
    {
    	List<News> newsList = newsService.findAll();
    	ActionContext.getContext().put("newsList", newsList);
    	
    	//查询热销煤炭
    	List<Good> cole = goodService.findHot(Integer.parseInt(XMLUtil.CONFIG_MAP.get("mtRootId")), 10);
    	List<HotGood> hotCole = new ArrayList<HotGood>();
        for (int i = 0; i < cole.size(); i++)
        {
            HotGood hg = new HotGood();
            hg.setGoodId(cole.get(i).getGoodId());
            hg.setName(cole.get(i).getGoodName());// 商品名称
            hg.setPrices(cole.get(i).getPrices()); // 商品价格集合
            double amount = stockService.getAmount(cole.get(i).getGoodId()); // 查出商品当前库存量
            hg.setAmount("" + amount); // 查设置商品当前库存量
            hg.setGoodOrigin(cole.get(i).getGoodOrigin()); // 原产地
            hg.setGoodVendor(cole.get(i).getGoodVendor()); // 供货商
            hg.setType(cole.get(i).getType());
            hotCole.add(hg);
        }
        
      //查询热销炉具
        List<Good> cook = goodService.findHot(Integer.parseInt(XMLUtil.CONFIG_MAP.get("lzRootId")), 10);
        List<HotGood> hotCook = new ArrayList<HotGood>();
        for (int i = 0; i < cook.size(); i++)
        {
            HotGood hg = new HotGood();
            hg.setGoodId(cook.get(i).getGoodId());
            hg.setName(cook.get(i).getGoodName());// 商品名称
            hg.setPrices(cook.get(i).getPrices()); // 商品价格集合
            double amount = stockService.getAmount(cook.get(i).getGoodId()); // 查出商品当前库存量
            hg.setAmount("" + amount); // 查设置商品当前库存量
            hg.setGoodOrigin(cook.get(i).getGoodOrigin()); // 原产地
            hg.setGoodVendor(cook.get(i).getGoodVendor()); // 供货商
            hg.setType(cook.get(i).getType());
            hotCook.add(hg);
        }
        
      //查询热销化肥
        List<Good> chem = goodService.findHot(Integer.parseInt(XMLUtil.CONFIG_MAP.get("hfRootId")), 10);
        List<HotGood> hotChem = new ArrayList<HotGood>();
        for (int i = 0; i < chem.size(); i++)
        {
            HotGood hg = new HotGood();
            hg.setGoodId(chem.get(i).getGoodId());
            hg.setName(chem.get(i).getGoodName());// 商品名称
            hg.setPrices(chem.get(i).getPrices()); // 商品价格集合
            double amount = stockService.getAmount(chem.get(i).getGoodId()); // 查出商品当前库存量
            hg.setAmount("" + amount); // 查设置商品当前库存量
            hg.setGoodOrigin(chem.get(i).getGoodOrigin()); // 原产地
            hg.setGoodVendor(chem.get(i).getGoodVendor()); // 供货商
            hg.setType(chem.get(i).getType());
            hotChem.add(hg);
        }
        
      //查询热销农药
        List<Good> pest = goodService.findHot(Integer.parseInt(XMLUtil.CONFIG_MAP.get("nyRootId")), 10);
        List<HotGood> hotPest = new ArrayList<HotGood>();
        for (int i = 0; i < pest.size(); i++)
        {
            HotGood hg = new HotGood();
            hg.setGoodId(pest.get(i).getGoodId());
            hg.setName(pest.get(i).getGoodName());// 商品名称
            hg.setPrices(pest.get(i).getPrices()); // 商品价格集合
            double amount = stockService.getAmount(pest.get(i).getGoodId()); // 查出商品当前库存量
            hg.setAmount("" + amount); // 查设置商品当前库存量
            hg.setGoodOrigin(pest.get(i).getGoodOrigin()); // 原产地
            hg.setGoodVendor(pest.get(i).getGoodVendor()); // 供货商
            hg.setType(pest.get(i).getType());
            hotPest.add(hg);
        }
    	
    	ActionContext.getContext().put("coles", hotCole);
    	ActionContext.getContext().put("cooks", hotCook);
    	ActionContext.getContext().put("chems", hotChem);
    	ActionContext.getContext().put("pests", hotPest);
    	
    	return SUCCESS;
    }
    
    
   /**
    * 用户登录
    */
    public void login()
    {
        String loginPhone = ((String[])ActionContext.getContext().getParameters().get("loginAccount"))[0];
   
      // User user = userService.getByPhone(loginPhone);

        String loginPassword = ((String[])ActionContext.getContext().getParameters().get("loginPassword"))[0];
        
        try
        {
            User user = userService.getByPhone(loginPhone);
            if (null != user)
            {
//                if (user.getState() == 0)
//                {
//                    getResponse().getWriter().write("6");// 提示帐户已经在线
//                }
               // else 
                //{
                    if (!user.getLoginPassword().equals(DigestUtils.md5Hex(loginPassword)))
                    {
                        getResponse().getWriter().write("4");// 账户名密码不匹配
                    }
                    else
                    {
                        List<Right> rights = new ArrayList<Right>();
                        if(user.getState() == 2){
                            try 
                            {
                                getResponse().getWriter().write("8"); // 你的账号被冻结
                            } 
                            catch (IOException e) 
                            {
                                e.printStackTrace();
                            }
                        }else if(user.getState() == 3){
                            try 
                            {
                                getResponse().getWriter().write("9"); //你的账号被注销
                            } 
                            catch (IOException e) 
                            {
                                e.printStackTrace();
                            }
                        }
                        else
                        {
                            user.setState(0);
                            userService.update(user);
                            ActionContext.getContext().getSession().put("login_user",user);
                            logger.info("[BWQ]---登录信息：用户[" + user.getUserPhone() + "]登录系统" );
//                            Role role = user.getRole();
//                        
//                            if((user.getRole().getRoleName().indexOf("管理员") >= 0 )&&(!user.getRole().getRoleName().equals("超级管理员")))
//                            {
//                                rights = rightService.getRightFunctionByRole(role.getRoleId());
//                                Map<String,String> rightMap = new HashMap<String,String>();
//                                try 
//                                {
//                                    for (Right right : rights) {
//                                        rightMap.put(right.getFunction(), right.getFunction());
//                                    }
//                                } 
//                                catch (Exception e) 
//                                {
//                                }
//                                ActionContext.getContext().getSession().put("rightMap", rightMap);
//                            }
//                            else if(user.getRole().getRoleName().equals("超级管理员"))
//                            {
//                                ActionContext.getContext().getSession().put("rightMap", null);
//                            }
//                            else if(user.getRole().getRoleName().equals("客户"))
//                            {
//                                ActionContext.getContext().getSession().put("rightMap", null);
//                            }
                        
                            try
                            {
                                if(null == ActionContext.getContext().getSession().get("data_stat_info"))
                                {
                                    ActionContext.getContext().getSession().put("data_stat_info", "data_stat_info");
                                    try
                                    {
                                        dataStatService.modifyStat();
                                    }
                                    catch (Exception e)
                                    {
                                        e.printStackTrace();
                                    }
                                }
                                
                                if(user.getRole().getRoleRank() == 0)
                                {
                                    rights = rightService.getRightFunctionByRole(user.getRole().getRoleId());
                                    if(null != rights)
                                    {
                                        Map<String,String> rightMap = new HashMap<String,String>();
                                        for (Right right : rights)
                                        {
                                            rightMap.put(right.getFunction(), right.getFunction());
                                        }
                                    }
                                    getResponse().getWriter().write("0");
                                }
                                else
                                {
                                    getResponse().getWriter().write("7");
                                }
                            }
                            catch (Exception e)
                            {
                                e.printStackTrace();
                            }
                        }

                    }
              //  }
            }
            else
            {
                getResponse().getWriter().write("2");// 提示帐户不存在
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    public void loginOut()
    {
        try
        {
        	User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        	if(null != loginUser)
        	{
        	    loginUser.setState(1);
                userService.update(loginUser);
                ActionContext.getContext().getSession().clear();
        	}
        	getResponse().getWriter().write("0");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * 获取验证码
     */
    public void sendCode()
    {
        try
        {
            
            String phoneNo = ((String[])ActionContext.getContext().getParameters().get("phoneNo"))[0].trim(); 
            String SMSCode = SMSCodeUtil.createSMSCode();
            ActionContext.getContext().getSession().put("SMSCode",SMSCode);
            ActionContext.getContext().getSession().put("SMSTime",System.currentTimeMillis());
            String smsContext = "[卖炭网]注册验证码：" + SMSCode + "，该验证码有效期为5分钟。如非本人操作，请忽略此短信。";

            InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
            SendRecieveSms.getSendSms(phoneNo, smsContext, inputStream);
            getResponse().getWriter().print("1");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * 卖炭网注册
     * @return
     */
    public String getList()
    {
        
        return "get_list";
    }
    
    /**
     * 卖炭网注册协议详情
     * @return
     */
    public String sellCarbon()
    {
        return "sell_carbon";
    }

    /**
     * 验证手机
     * @return
     */
    public void usePhone()
    {
        String result = "0";
        String SMSCode = ((String)ActionContext.getContext().getSession().get("SMSCode")).trim();
        Long SMSTime = (Long)ActionContext.getContext().getSession().get("SMSTime");
        String usePhone = request.getParameter("phone").trim();//手机号码
        String smsCode = request.getParameter("smsCode").trim();//验证码
        
        if(!SMSCode.equals(smsCode))
        {
           result = "1";//验证码不对
        }
        else
        {
            long nowTime = System.currentTimeMillis();
            if((nowTime - SMSTime) < 300000)
            {
                ActionContext.getContext().put("usePhone", usePhone);
                result="0";                        
            }
            else
              {
                 result = "2";//验证码过时
              }   
        }
         try
         {
             getResponse().getWriter().write(result);
         }
         catch (IOException e)
         {
             e.printStackTrace();
         } 
    }
    
   /**
    * 注册手机 
    * @return
    */
    public String addPhone()
    {
        String usePhone = request.getParameter("phone").trim();//手机号码
        ActionContext.getContext().put("usePhone", usePhone);
        return "get_phone";
    }
    
    /**
     * 注册信息 
     */
     public void addUser()
     {
         String result = "0";
         String companyName = null;
         String email = null;
         String userName = request.getParameter("userName").trim();// 昵称
         String loginPassword = request.getParameter("loginPswd").trim();// 登录密码
         String userPhone = request.getParameter("phone").trim();// 登录账号 手机号码

         companyName = request.getParameter("company").trim();// 注册单位
         email = request.getParameter("email").trim();// 电子邮箱
         int state = SystemConstants.USER_STAT_ONLINE;// 状态
         try
         {
             User user = userService.getByPhone(userPhone);
             if (null == user)// 账号不存在
             {
                 user = new User();
                 user.setUserName(userName);
                 user.setLoginPassword(DigestUtils.md5Hex(loginPassword));
                 user.setUserPhone(userPhone);
                 user.setCompanyName(companyName);
                 user.setState(state);
                 user.setEmail(email);
                 user.setRole(roleService.getById(Integer.parseInt(XMLUtil.CONFIG_MAP.get("roleid"))));
                 user.setGrade(gradeService.getById(Integer.parseInt(XMLUtil.CONFIG_MAP.get("gradeid"))));

                 userService.save(user);
                 result = "1";// 注册成功
                 User loginUser = userService.getByPhone(userPhone);
                 ActionContext.getContext().getSession().put("login_user", loginUser);
                 ActionContext.getContext().put("userPhone", userPhone);
             }
             else
             {
                 result = "2";// 账号已经存在
             }
         }
         catch (Exception e)
         {
             e.printStackTrace();
             result = "3";// 注册失败
         }

         try
         {
             getResponse().getWriter().write(result);
         }
         catch (Exception e)
         {
             e.printStackTrace();
         }
     }
     
     /*
      * 注册成功
      */
     public String complete()
     {
         String userPhone = request.getParameter("phone").trim();//登录账号 手机号码
         ActionContext.getContext().put("userPhone", userPhone);
         return "get_complete";
     }
   
    /**
     * 修改密码
     */
    public void updatePassWord()
    {
        try
        {
            User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
            String newPassWord = request.getParameter("newps");
            String oldPassWord = request.getParameter("oldps");
            if(loginUser.getLoginPassword().equals(DigestUtils.md5Hex(oldPassWord)))
            {
                loginUser.setLoginPassword(DigestUtils.md5Hex(newPassWord));  
                userService.update(loginUser);
                getResponse().getWriter().write("0");//成功
            }
            else
            {
                getResponse().getWriter().write("1");//旧密码错误
            }
        }
        catch (IOException e)
        {
            try
            {
                getResponse().getWriter().write("2");//失败
            }
            catch (IOException e1)
            {
                e1.printStackTrace();
            }
        }
    }
    
    /**
     * 用户信息
     * @return
     */
    public void updateInfo()
    { 
        
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        
        StringBuffer json = new StringBuffer("");
        json.append("{userPhone: \"" + loginUser.getUserPhone() + "\",");
        json.append("userName: \"" + loginUser.getUserName() + "\",");
        json.append("companyName: \"" + loginUser.getCompanyName() + "\",");
        json.append("email: \"" + loginUser.getEmail() + "\"}");
        
        try
        {
            getResponse().getWriter().write(json.toString());
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
     }
    
    /**
     * 修改信息
     */
    public void upInfo()
    {  
        
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        String userName = request.getParameter("userName");
        String companyName = request.getParameter("companyName");
        String email = request.getParameter("email");
       
        loginUser.setUserName(userName);
        loginUser.setCompanyName(companyName);
        loginUser.setEmail(email);
        userService.update(loginUser);
    
        try
        {
            getResponse().getWriter().write("修改成功");
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }   
     }
    
    /**
     * 忘记密码
     * @return
     */
    public String getForgrt()
    {   
        return "get_forgrt";
    }
    
    /**
     * 忘记密码/手机验证
     * @return
     */
    public void forgetPassword()
    {
        String result = "0";
        String usePhone = request.getParameter("phone").trim();//手机号码
        String smsCode = request.getParameter("smsCode").trim();//验证码
        String SMSCode = ((String)ActionContext.getContext().getSession().get("SMSCode")).trim();
        Long SMSTime = (Long)ActionContext.getContext().getSession().get("SMSTime");
        
       // System.out.println(usePhone);
       User userList = userService.getByPhone(usePhone);
    
        if(null == userList.getUserPhone()){
            result = "3";//登录的账户不存在   
        }
        if(!SMSCode.equals(smsCode))
        {
           result = "1";//验证码不对
        }
        else
        {
            long nowTime = System.currentTimeMillis();
            if((nowTime - SMSTime) < 60000)
            {
                ActionContext.getContext().put("usePhone", usePhone);
                result="0";  
           
            }
            else
              {
                 result = "2";//验证码过时
              }   
        }
         try
         {
             getResponse().getWriter().write(result);
         }
         catch (IOException e)
         {
             e.printStackTrace();
         }
       
      
    } 
    /**
     * 手机号码 
     * @return
     */
     public String Phone()
     {
         String usePhone = request.getParameter("phone").trim();//手机号码
         ActionContext.getContext().put("usePhone", usePhone);
         return "get_password";
     }
    
    /**
     * 重置密码
     */
    public void resetPassword()
    {
        try
        {
            String passWord = request.getParameter("password").trim();// 密码
            String usePhone = request.getParameter("phone").trim();// 手机号码

            User loginUser = userService.getByPhone(usePhone);

            loginUser.setLoginPassword(DigestUtils.md5Hex(passWord));
            userService.update(loginUser);
            getResponse().getWriter().write("0");// 成功
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        
    }
    
    public void hasNewOrder()
    {
        try
        {
            if(NewOrderListManager.hasNewOrder())
            {
                getResponse().getWriter().write("1");// 有新订单生成
            }
            else
            {
                getResponse().getWriter().write("0");// 没有新订单
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * 修改密码成功
     * @return
     */
    public String Password()
    {
        return "get_reset";  
    } 
    
    /********************************************************************************
     *判断是否登录
     ********************************************************************************/
    public void check()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        try
        {
            if(null != loginUser)
            {
                getResponse().getWriter().write("1");//1代表登录
            }
            else
            {
                getResponse().getWriter().write("0");//0代表未登录
            }
        }
        catch (Exception e)
        {
        }
    }
    
    /********************************************************************************
     * 图片回显
     ********************************************************************************/
    @SuppressWarnings("deprecation")
    public void showImage()
    {
        String goodId = "";
        String showPath = "";
        String imagePath = "";
        Image img = null;
        OutputStream out = null;
        try
        {
            goodId = ((String[])ActionContext.getContext().getParameters().get("goodId"))[0].trim();
        }
        catch(Exception e){}
        
        try
        {
            showPath = EncodeConvertor.encodeConvert(((String[])ActionContext.getContext().getParameters().get("showPath"))[0].trim(), "iso8859-1", "utf-8");
        }
        catch(Exception e){}
        
        if(!goodId.isEmpty())
        {
            Good good = goodService.getById(Integer.parseInt(goodId.trim()));
            for(com.moutum.csmp.domain.Image image : good.getImages())
            {
                if(image.getIsDefault() == 1)//获取默认图片
                {
                    imagePath = image.getImagePath();
                }
            }
            if(null == imagePath || imagePath == "")
            {
                imagePath = XMLUtil.CONFIG_MAP.get("defaultImagePath");
            }
        }
        else if(!showPath.isEmpty())
        {
            imagePath = showPath;
        }
        try
        {
            
            File file = new File(request.getRealPath("/") + imagePath);
            InputStream is = new FileInputStream(file);
            img = ImageIO.read(is);
            String imageType = imagePath.substring(imagePath.lastIndexOf(".") + 1);
            out = getResponse().getOutputStream();
            ImageIO.write((RenderedImage)img, imageType, out);
            out.flush();
            out.close();
        }
        catch (Exception e)
        {
            logger.info("---[BWQ:IMG-SHOW]--连接已断开或页面已跳转导致图片显示异常");
        }
        finally
        {
            try
            {
                if(img != null)
                {
                    img = null;
                }
                if(out != null)
                {
                    out.close();
                }
            }
            catch (Exception e)
            {
                logger.info("---[BWQ:IMG-SHOW]--输出流关闭异常");
            }
        }
    }
    
    public String foot()
    {
        ActionContext.getContext().put("coperightZH", XMLUtil.CONFIG_MAP.get("coperightZH"));
        ActionContext.getContext().put("coperightEN", XMLUtil.CONFIG_MAP.get("coperightEN"));
        ActionContext.getContext().put("supporter", XMLUtil.CONFIG_MAP.get("supporter"));
        return "success";
    }
    
    public static void main(String[] args)
    {
        System.out.println(DigestUtils.md5Hex("asd"));
    }
}