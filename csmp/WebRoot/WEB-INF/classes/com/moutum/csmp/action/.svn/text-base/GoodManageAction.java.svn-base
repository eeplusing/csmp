package com.moutum.csmp.action;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.Order;
import com.moutum.csmp.domain.OrderDetail;
import com.moutum.csmp.domain.Price;
import com.moutum.csmp.domain.Type;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.util.DateUtil;
import com.moutum.csmp.util.EncodeConvertor;
import com.moutum.csmp.util.OrderNoUtil;
import com.moutum.csmp.util.XMLUtil;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : GoodManageAction.java
 * @Description : 
 * @Author       : CaoPeng
 * @DateTime     : 2015年5月20日 下午3:16:28
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class GoodManageAction extends BaseAction<Good>
{

    private static final long serialVersionUID = 1382391221593670335L;
    
    Logger logger = Logger.getLogger(GoodManageAction.class);

    HttpServletRequest request = ServletActionContext.getRequest();
    
    private File[] uploadImage;//和JSP页面file的name一致
    
    private String[] uploadImageFileName;//固定写法uploadFile + FileName = uploadFileFileName
    
    private List<Type> typeList;
    
    /*分页查询商品*/
	public String list()
    {
	    Map<String, Object> selMap = new HashMap<String, Object>();//保存查询条件
        int goodStat = -1;
        String goodName = "";
        
        try
        {
            //从页面接收每页显示的条目数
            pageSize = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageSize"))[0]);
        }
        catch (Exception e)
        {
            //初始每页显示的条目数
            pageSize = 8;
        }
        
        try
        {
            //从页面接收要查询商品的状态
            goodStat = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("goodStat"))[0]);
        }
        catch (Exception e)
        {
            
        }
        selMap.put("goodStat", goodStat);//将商品的状态作为查询条件

        try
        {
            //从页面接收当前页面数
            pageNum = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageNum"))[0]);
        }
        catch (Exception e)
        {
        }
        
        try
        {
            //从页面接收商品名称
            goodName = ((String[])ActionContext.getContext().getParameters().get("goodName"))[0];
            goodName = EncodeConvertor.encodeConvert(goodName, "iso8859-1", "utf-8").trim();
        }
        catch (Exception e)
        {
        }
        selMap.put("goodName", goodName);//将商品的名称作为查询条件
        PageBean pageBean = goodService.joinQuery(pageSize, pageNum, selMap);
        ActionContext.getContext().put("pageBean", pageBean);
        ActionContext.getContext().put("good_stat", goodStat); 
        ActionContext.getContext().put("gn", goodName);
        ActionContext.getContext().put("pageNum", pageNum);
        return "allGoods";
    }
    
    public void delete()
    {
        try
        {
            int goodId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("goodId"))[0]);
            Good good = goodService.getById(goodId);
            good.setGoodStat(2);
            goodService.update(good);
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
            e.printStackTrace();  
            try
            {
                getResponse().getWriter().write("error");
            }
            catch (IOException e1)
            {
                e1.printStackTrace();
            }
        }
    }
    
    /**
     * 上下架操作
     */
    public void rack()
    {
        try
        {
            String ids = ((String[])ActionContext.getContext().getParameters().get("goodIds"))[0];
            int stat = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("stat"))[0]);
            String[] gids = ids.split(",");
            Integer[] goodIds = new Integer[gids.length];
            for(int i = 0; i < gids.length; i++)
            {
                goodIds[i] = Integer.parseInt(gids[i]);
            }
            
            if(goodService.modifyRack(goodIds, stat))//0:下架；1：上架；2：删除
            {
                getResponse().getWriter().write("ok");
            }
            else
            {
                getResponse().getWriter().write("error");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    /**
     * 设为热卖商品
     */
    public void setHot()
    {
        try
        {
            String ids = ((String[])ActionContext.getContext().getParameters().get("goodIds"))[0];
            int hotGood = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("hotGood"))[0]);
            String[] gids = ids.split(",");
            Integer[] goodIds = new Integer[gids.length];
            for(int i = 0; i < gids.length; i++)
            {
                goodIds[i] = Integer.parseInt(gids[i]);
            }
            
            if(goodService.setHot(goodIds, hotGood))//0:非热销；1：热销；
            {
                getResponse().getWriter().write("ok");
            }
            else
            {
                getResponse().getWriter().write("error");
            }
        }
        catch (Exception e)
        {
            logger.info("---[CPP:SET-HOT]--设置热卖商品出现异常");
        }
    }
    
    public String showVariety()
    {
        return "allVariety";
    }
    
    public String page()
    {
        setTypeList(typeService.findAll()); //获取商品种类列表
        int goodId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("goodId"))[0]);
        Good good = goodService.getById(goodId);
        ActionContext.getContext().put("good", good);
        ActionContext.getContext().put("types", typeList);
        return "open";
    }
    
    /**
     * 编辑 图片    页面*/
    public String pageImage()
    {
        int goodId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("goodId"))[0]);
        Set<com.moutum.csmp.domain.Image> images = goodService.getById(goodId).getImages();
        ActionContext.getContext().put("images", images);
        ActionContext.getContext().put("goodId", goodId);
        return "openImgModify"; 
    }
    
    @SuppressWarnings("deprecation")
    public String imageUpload()
    {
        int goodId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("goodId"))[0]);
        if (null != uploadImage)
        {
            String sysPath = (request.getRealPath("/image/") + "/" + DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD)).replace("\\", "/");
            File savePath = new File(sysPath);
            File savePath2 = new File(XMLUtil.CONFIG_MAP.get("uploadImagePath") + DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD));
            String imagePath = sysPath.substring(sysPath.indexOf("/image"));
            Good good = goodService.getById(goodId);
            Set<com.moutum.csmp.domain.Image> images = good.getImages();
            if (!savePath.exists())
            {
                savePath.mkdirs();
            }
            if (!savePath2.exists())
            {
                savePath2.mkdirs();
            }
            for(int i = 0; i<uploadImage.length; i++)
            {
                String extName = "";//文件拓展名
                String newFileName = DateUtil.dateToString(new Date(), DateUtil.DATE_PATTERN_SS) + OrderNoUtil.getOrderNo() + System.currentTimeMillis();
                if(uploadImageFileName[i].lastIndexOf(".") > -1)
                {
                    extName = uploadImageFileName[i].substring(uploadImageFileName[i].lastIndexOf("."));//获取文件扩展名
                }
                if(isImage(extName))
                {
                    File saveFile = new File((savePath + "/" +  newFileName + extName).replace("\\", "/"));
                    File saveFile2 = new File((savePath2 + "/" +  newFileName + extName).replace("\\", "/"));
                    try
                    {
                        FileUtils.copyFile(uploadImage[i],saveFile);
                        FileUtils.copyFile(uploadImage[i],saveFile2);
                        com.moutum.csmp.domain.Image image = new com.moutum.csmp.domain.Image();
                        image.setIsDefault(0);
                        image.setImagePath((imagePath + "/" +  newFileName + extName).replace("\\", "/"));
                        images.add(image);
                    } 
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
            }
            
            good.setImages(images);
            goodService.update(good);
        }
        ActionContext.getContext().put("images", goodService.getById(goodId).getImages());
        return "success";
    }
    
    
    public void setImage()
    {
        try
        {
            int defaultId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("defaultId"))[0]);
            String mids = ((String[])ActionContext.getContext().getParameters().get("mids"))[0];
            String[] imageIds = mids.split(",");
            Integer[] ids = new Integer[imageIds.length];
            for(int i = 0; i < imageIds.length; i++)
            {
                ids[i] = Integer.parseInt(imageIds[i]);
            }
            imageService.modifyDefault(ids);
            com.moutum.csmp.domain.Image image  = imageService.getById(defaultId);
            image.setIsDefault(1);
            imageService.update(image);
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    
    public void delImage()
    {
        try
        {
            String mids = ((String[])ActionContext.getContext().getParameters().get("mids"))[0];
            String[] imageIds = mids.split(",");
            Integer[] ids = new Integer[imageIds.length];
            for(int i = 0; i < imageIds.length; i++)
            {
                ids[i] = Integer.parseInt(imageIds[i]);
            }
            imageService.delete(ids);
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
           
            e.printStackTrace();
        }
    }
    
    public String pageOpen()
    {
        ActionContext.getContext().put("types", typeService.findAll());
        return "open";
    }
    
    public String pageAddVariety()
    {
        return "open";
    }
    
    public void modify()
    {
        //返回一个数组对象(Object)
        //从前台jsp页面接收一个名为"goodId"的参数
        int goodId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("goodId"))[0]);
        String goodName = ((String[])ActionContext.getContext().getParameters().get("goodName"))[0];
        Good good = goodService.getById(goodId);
        good.setGoodName(goodName);
        goodService.update(good);
    }
    
    public void showImage()
    {
        Image img = null;
        OutputStream out = null;
        try
        {
            String goodId = ((String[])ActionContext.getContext().getParameters().get("goodId"))[0];
            Good good = goodService.getById(Integer.parseInt(goodId));
            String imagePath = "";
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
            File file = new File(imagePath);
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
   
    /**
     * 添加商品
     */
    public String goodAdd()
    {
        try
        {
            Good good = new Good();
            Set<Price> prices = new HashSet<Price>();
            
            int typeId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("c_type"))[0].trim());
            String goodName = ((String[])ActionContext.getContext().getParameters().get("c_goodName"))[0].trim();
            String specification = ((String[])ActionContext.getContext().getParameters().get("c_specification"))[0].trim().replace("...0...", "%");
            String headValue = ((String[])ActionContext.getContext().getParameters().get("c_headValue"))[0].trim().replace("...0...", "%");
            String goodOrigin = ((String[])ActionContext.getContext().getParameters().get("c_goodOrigin"))[0].trim().replace("...0...", "%");
            String goodVendor = ((String[])ActionContext.getContext().getParameters().get("c_goodVendor"))[0].trim().replace("...0...", "%");
            Integer calorificValue = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("c_calorificValue"))[0].trim());
            Integer busyType = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("c_busyType"))[0].trim());
            
            String priceName0 = ((String[])ActionContext.getContext().getParameters().get("price_name0"))[0].trim();
            double priceVal0 = Double.parseDouble(((String[])ActionContext.getContext().getParameters().get("price_val0"))[0].trim());
            String priceName1 = ((String[])ActionContext.getContext().getParameters().get("price_name1"))[0].trim();
            double priceVal1 = Double.parseDouble(((String[])ActionContext.getContext().getParameters().get("price_val1"))[0].trim());
            String priceName2 = ((String[])ActionContext.getContext().getParameters().get("price_name2"))[0].trim();
            double priceVal2 = Double.parseDouble(((String[])ActionContext.getContext().getParameters().get("price_val2"))[0].trim());
            String priceName3 = ((String[])ActionContext.getContext().getParameters().get("price_name3"))[0].trim();
            double priceVal3 = Double.parseDouble(((String[])ActionContext.getContext().getParameters().get("price_val3"))[0].trim());
            
            Price price0 = new Price();
            price0.setGood(good);
            price0.setPriceName(priceName0);
            price0.setPrice(priceVal0);
            price0.setGrade(gradeService.getById(Integer.parseInt(XMLUtil.CONFIG_MAP.get("grade0"))));
            
            Price price1 = new Price();
            price1.setGood(good);
            price1.setPriceName(priceName1);
            price1.setPrice(priceVal1);
            price1.setGrade(gradeService.getById(Integer.parseInt(XMLUtil.CONFIG_MAP.get("grade1"))));
            
            Price price2 = new Price();
            price2.setGood(good);
            price2.setPriceName(priceName2);
            price2.setPrice(priceVal2);
            price2.setGrade(gradeService.getById(Integer.parseInt(XMLUtil.CONFIG_MAP.get("grade2"))));
            
            Price price3 = new Price();
            price3.setGood(good);
            price3.setPriceName(priceName3);
            price3.setPrice(priceVal3);
            price3.setGrade(gradeService.getById(Integer.parseInt(XMLUtil.CONFIG_MAP.get("grade3"))));
            
            prices.add(price0);
            prices.add(price1);
            prices.add(price2);
            prices.add(price3);
            
            good.setGoodName(goodName);//名字
            good.setSpecification(specification);//详情
            good.setHeadValue(headValue);//参数
            good.setBusyType(busyType);//行业属性
            good.setCalorificValue(calorificValue);//商品热值
            good.setGoodOrigin(goodOrigin);//产地
            good.setGoodVendor(goodVendor);//供应商
            Type type = typeService.getById(typeId);//商品类别
            good.setType(type);
            good.setPrices(prices);
            good.setImages(imgUpload());
            goodService.save(good);
            ActionContext.getContext().put("add_msg", "商品添加成功");
        }
        catch (Exception e)
        {
            ActionContext.getContext().put("add_msg", "商品添加出错");
            e.printStackTrace();
        }
        ActionContext.getContext().put("types", typeService.findAll());
        return "success";
    }
    
    @SuppressWarnings("deprecation")
    private Set<com.moutum.csmp.domain.Image> imgUpload()
    {
        if (null != uploadImage)
        {
            String sysPath = (request.getRealPath("/image/") + "/" + DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD)).replace("\\", "/");
            File savePath = new File(sysPath);
            File savePath2 = new File(XMLUtil.CONFIG_MAP.get("uploadImagePath") + DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD));
            String imagePath = sysPath.substring(sysPath.indexOf("/image"));
            if (!savePath.exists())
            {
                savePath.mkdirs();
            }
            if (!savePath2.exists())
            {
                savePath2.mkdirs();
            }
            Set<com.moutum.csmp.domain.Image> images = new HashSet<com.moutum.csmp.domain.Image>();
            for(int i = 0; i<uploadImage.length; i++)
            {
                String extName = "";//文件拓展名
                String newFileName = DateUtil.dateToString(new Date(), DateUtil.DATE_PATTERN_SS) + OrderNoUtil.getOrderNo() + System.currentTimeMillis();
                if(uploadImageFileName[i].lastIndexOf(".") > -1)
                {
                    extName = uploadImageFileName[i].substring(uploadImageFileName[i].lastIndexOf("."));//获取文件扩展名
                }
                if(isImage(extName))
                {
                    File saveFile = new File((savePath + "/" +  newFileName + extName).replace("\\", "/"));
                    File saveFile2 = new File((savePath2 + "/" +  newFileName + extName).replace("\\", "/"));
                    try
                    {
                        FileUtils.copyFile(uploadImage[i],saveFile);
                        FileUtils.copyFile(uploadImage[i],saveFile2);
                        com.moutum.csmp.domain.Image image = new com.moutum.csmp.domain.Image();
                        if(i == 0)
                        {
                            image.setIsDefault(1);
                        }
                        else
                        {
                            image.setIsDefault(0);
                        }
                        image.setImagePath((imagePath + "/" +  newFileName + extName).replace("\\", "/"));
                        images.add(image);
                    } 
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
            }
            return images;
        }
        return null;
    }
    
    
    /**
     * 修改商品基本信息
     * */
    public void goodBaseModify()
    {
        try
        {
            Integer goodId = Integer.parseInt(request.getParameter("goodId").trim());
            String goodVariety = request.getParameter("goodVariety").trim();
            String goodVendor = request.getParameter("goodVendor").trim();
            String goodOrigin = request.getParameter("goodOrigin").trim();
            String goodName = ((String[])ActionContext.getContext().getParameters().get("goodName"))[0];
            String specification = request.getParameter("specification").trim();
            String headValue = request.getParameter("headValue").trim();
            Integer calorificValue = Integer.parseInt(request.getParameter("calorificValue").trim());
            Integer busyType = Integer.parseInt(request.getParameter("busyType").trim());
            Good good = goodService.getById(goodId);
            good.setBusyType(busyType);
            good.setGoodVendor(goodVendor);
            good.setGoodOrigin(goodOrigin);
            good.setCalorificValue(calorificValue);
            good.setGoodName(goodName);
            good.setSpecification(specification.replace("...0...", "%"));
            good.setHeadValue(headValue.replace("...0...", "%"));
            Type type = typeService.getById(Integer.parseInt(goodVariety));
            good.setType(type);
            goodService.update(good);
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
       
     }
        
    /**
     * 修改价格
     */
    public String price()
    {
        int goodId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("goodId"))[0]);
        ActionContext.getContext().put("good", goodService.getById(goodId));
        return "price_list";
    }
    
    /**
     * 商品浏览查询
     */
    public String getGoodScan()
    {    	
    	List<Type> tList = typeService.getTypeOne();//.findAll();

        ActionContext.getContext().put("tList", tList);
    	return "goodScan";
    }
    
    public String getGoodShow()
    {
    	Map<String, Object> map = new HashMap<String, Object>();
    	String goodName="";

    	pageSize = 12;

    	//行业属性
    	String busyName = "";
    	if(request.getParameter("busyName")!=null)
    	{
    		busyName = request.getParameter("busyName");
    	}
    	map.put("busyName", busyName);   	
    	
    	//一级类别
        String ptypeId = "";
        if(request.getParameter("ptypeId")!=null)
        {
            ptypeId = request.getParameter("ptypeId");
        }
        map.put("ptypeId", ptypeId);
    	
    	//商品种类
    	String typeId = "";
    	if(request.getParameter("typeId")!=null)
    	{
    		typeId = request.getParameter("typeId");
    	}
    	map.put("typeId", typeId);
    	
    	//热值
    	String calorificValues = "";
    	try 
    	{
    		calorificValues = ((String[])ActionContext.getContext().getParameters().get("calorificValues"))[0];
    		String[] cfv = calorificValues.split("~");
    		map.put("minCalorificValue", Integer.parseInt(cfv[0]));
    		map.put("maxCalorificValue", Integer.parseInt(cfv[1]));
		} 
    	catch (Exception e){}

    	//价格
    	String prices = "";
    	try 
    	{
    		prices = ((String[])ActionContext.getContext().getParameters().get("price"))[0];
    		String[] ps = prices.split("~");
    		map.put("minPrice", Double.parseDouble(ps[0]));
    		map.put("maxPrice", Double.parseDouble(ps[1]));
		} 
    	catch (Exception e){}
    	
    	try
    	{
    		if(ActionContext.getContext().getParameters().get("goodName")!=null)
    		{
    			goodName = ((String[])ActionContext.getContext().getParameters().get("goodName"))[0];
    			goodName = EncodeConvertor.encodeConvert(goodName, "iso8859-1", "utf-8");
    		}
    	}catch(Exception e)
    	{
    		
    	}
    	
    	try
        {
            pageNum = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageNum"))[0]);
        }
        catch (Exception e)
        {
            
        }
        
        try
        {
            pageSize = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageSize"))[0]);
        }
        catch (Exception e)
        {
            
        }
    	map.put("goodName", goodName);

    	User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
    	//重新查询user,为了防止更改了用户等级或其他信息，而loginUser中还是登录时的信息
    	User user=null;
    	if(loginUser!=null)
    	{
    		user = userService.getById(loginUser.getUserId());
        	map.put("loginUser", user);
    	}
    	
    	PageBean pageBean = goodService.getGoodByName(pageNum, pageSize, map);
    	   	
        ActionContext.getContext().put("pageBean", pageBean);
        ActionContext.getContext().put("user", user);
        ActionContext.getContext().put("goodName", goodName);
        ActionContext.getContext().put("busyName", busyName);
        ActionContext.getContext().put("typeId", typeId);
        ActionContext.getContext().put("ptypeId", ptypeId);
        ActionContext.getContext().put("calorificValues", calorificValues);
        ActionContext.getContext().put("prices", prices);
    	return "goodShow";
    }
    /**
     * 商品浏览详情
     */
    public String getGoodScanDetail()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
    	int goodId=0;
    	goodId=Integer.parseInt(request.getParameter("goodId"));//商品id
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("goodId", goodId);
    	if(null != loginUser)
    	{
    	    map.put("userId", loginUser.getUserId());
    	}
    	Good good = goodService.getGoodById(map);
    	
    	List<Order> oList = null;
    	List<OrderDetail> odList=null;
    	if(loginUser!=null)
    	{
    		oList = orderService.getInfoByUserId(loginUser.getUserId());
    		if(oList!=null && oList.size()>0)
        	{
        		odList = orderDetailService.getInfoByGoodId(good.getGoodId());
        	}
    	}    	
    	
    	ActionContext.getContext().put("good", good);
    	ActionContext.getContext().put("user", loginUser);
    	ActionContext.getContext().put("odList", odList);

    	return "goodScanDetail";
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

    public List<Type> getTypeList()
    {
        return typeList;
    }

    public void setTypeList(List<Type> typeList)
    {
        this.typeList = typeList;
    }
    
    public File[] getUploadImage()
    {
        return uploadImage;
    }

    public void setUploadImage(File[] uploadImage)
    {
        this.uploadImage = uploadImage;
    }

    public String[] getUploadImageFileName()
    {
        return uploadImageFileName;
    }

    public void setUploadImageFileName(String[] uploadImageFileName)
    {
        this.uploadImageFileName = uploadImageFileName;
    }
}