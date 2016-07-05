package com.moutum.csmp.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.Order;
import com.moutum.csmp.domain.OrderDetail;
import com.moutum.csmp.domain.Stock;
import com.moutum.csmp.domain.Storage;
import com.moutum.csmp.domain.Type;
import com.moutum.csmp.domain.User;
import com.opensymphony.xwork2.ActionContext;

/**
 * class    : ExportAction.java
 * describe : 
 * author   : wanghuan
 * dateTime : 2015-06-08 上午12:16:20
 * righter  :
 */

@SuppressWarnings("deprecation")
@Controller @Scope(("prototype"))
public class ExportAction extends BaseAction<Stock> {

	private static final long serialVersionUID = 1L;	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	private InputStream inputStream; //定义一个输入流

	/**
	 * 数据导出页面跳转
	 */
	public String goExportData()
	{
		//仓库ID
		String storage_id = request.getParameter("storage_id");
		
		List<Type> oList = typeService.getTypeOne();//一级分类
		//一级分类id
		String typeId1 = request.getParameter("typeId1");
		List<Type> tList = null;
		if(typeId1!=null && !typeId1.equals(""))
		{
			tList = typeService.getTypeTwo(Integer.parseInt(typeId1));//二级分类
		}
		//二级分类id
		String typeId2 = request.getParameter("typeId2");
		List<Good> gList = null;
		if(typeId2!=null && !typeId2.equals(""))
		{
			gList = goodService.getGoodForTypeId(Integer.parseInt(typeId1),Integer.parseInt(typeId2));//商品
		}
		
		List<Storage> sList = storageService.getStorageList();//仓库
		
		ActionContext.getContext().put("oList", oList);  
		ActionContext.getContext().put("tList", tList);  
		ActionContext.getContext().put("gList", gList);     
		ActionContext.getContext().put("sList", sList);
		ActionContext.getContext().put("storage_id", storage_id);
		ActionContext.getContext().put("type_id1", typeId1);
		ActionContext.getContext().put("type_id2", typeId2);
		
		return SUCCESS;
	}
	
	
	/**
	 * 库存导出
	 */
	public String exportStockData()
	{
		Map<String, Object> map = new HashMap<String, Object>();
		//仓库id
		String storageId = request.getParameter("storage_id");
		map.put("storageId", storageId);
		//一级分类
		String typeId1 = request.getParameter("typeId1");
		map.put("typeId1", typeId1);
		//二级分类
		String typeId2 = request.getParameter("typeId2");
		map.put("typeId2", typeId2);
		//商品id
		String goodId = request.getParameter("good_id");
		map.put("goodId", goodId);
			
		// 第一步，创建一个webbook，对应一个Excel文件  
	    HSSFWorkbook wb = new HSSFWorkbook();  
	    // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
	    HSSFSheet sheet = wb.createSheet("库存信息");  
	    // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
	    HSSFRow row = sheet.createRow((int) 0);  
	    // 第四步，创建单元格，并设置值表头 设置表头居中  
	    HSSFCellStyle style = wb.createCellStyle();  
	    style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
	  
	    HSSFCell cell = row.createCell((short) 0);  
	    cell.setCellValue("商品");  
	    cell.setCellStyle(style);  
	    cell = row.createCell((short) 1);  
	    cell.setCellValue("仓库");  
	    cell.setCellStyle(style);  
	    cell = row.createCell((short) 2);  
	    cell.setCellValue("数量");  
	    cell.setCellStyle(style);   
	  
	    // 第五步，写入实体数据 实际应用中这些数据从数据库得到，  
	    List<Stock> list = stockService.getExportStock(map);
	  
	    for (int i = 0; i < list.size(); i++)  
	    {  
	    	if(list.get(i)!=null)
	    	{
	    		row = sheet.createRow((int) i + 1);  
		        Stock stock = (Stock) list.get(i);  
		        Good good = goodService.getById(stock.getGoodId());
		        Storage storage = storageService.getById(stock.getStorageId());
		        // 第四步，创建单元格，并设置值  
		        row.createCell((short) 0).setCellValue(good.getGoodName()); 
		        if(storage==null)
		        {
		        	row.createCell((short) 1).setCellValue("");  
		        }else
		        {
		        	row.createCell((short) 1).setCellValue(storage.getStorageName());  
		        }
		        row.createCell((short) 2).setCellValue(stock.getStockAmount());  
	    	}
	    }  
	    // 第六步，将文件存到指定位置  
	    try  
	    {  
	    	//设置文件名，用格局化日期来生成一个ID
	        String filePath="";
	        Date dt = new Date();
	        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	        String date = df.format(dt).toString();
	        filePath = "stock" + date + ".xls";
	        File file=new File(filePath);
	        try{
	            OutputStream out=new FileOutputStream(file);
	            wb.write(out);
	            out.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }

	        try{
	        	inputStream=new FileInputStream(file);
	        }catch(Exception e)
	        {
	            e.printStackTrace();
	        }
	    }  
	    catch (Exception e)  
	    {  
	        e.printStackTrace();  
	    }  
		return "exportStock";
	}
	
	/**
	 * 订单数据导出
	 */
	public String exportOrderData()
	{
		Map<String, Object> map = new HashMap<String, Object>();
		//时间段
		String beginDate = request.getParameter("beginDate");
		map.put("beginDate", beginDate);
		String endDate = request.getParameter("endDate");
		map.put("endDate", endDate);
		//订单编号
		String orderNo = request.getParameter("orderNo");
		map.put("orderNo", orderNo);
		
		// 第一步，创建一个webbook，对应一个Excel文件  
	    HSSFWorkbook wb = new HSSFWorkbook();  
	    // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
	    HSSFSheet sheet = wb.createSheet("订单信息");  
	    // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
	    HSSFRow row = sheet.createRow((int) 0);  
	    // 第四步，创建单元格，并设置值表头 设置表头居中  
	    HSSFCellStyle style = wb.createCellStyle();  
	    style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
	    
	    HSSFFont font  = wb.createFont();      
	    font.setFontHeightInPoints((short) 11);//字号      
	    font.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);//加粗
	    style.setFont(font);
	  	    
		HSSFCell cell = row.createCell((short) 0);  
	    cell.setCellValue("订单编号");  
	    cell.setCellStyle(style);  
	    cell = row.createCell((short) 1);  
	    cell.setCellValue("日期");  
	    cell.setCellStyle(style);   
	    cell = row.createCell((short) 2);  
	    cell.setCellValue("总额");  
	    cell.setCellStyle(style);   
	    cell = row.createCell((short) 3);  
	    cell.setCellValue("运费");  
	    cell.setCellStyle(style);  
	    cell = row.createCell((short) 4);  
	    cell.setCellValue("审核时间");  
	    cell.setCellStyle(style);  
	    cell = row.createCell((short) 5);  
	    cell.setCellValue("支付时间");  
	    cell.setCellStyle(style);  
	    cell = row.createCell((short) 6);  
	    cell.setCellValue("收货时间");  
	    cell.setCellStyle(style);  
	    cell = row.createCell((short) 7);  
	    cell.setCellValue("商品");  
	    cell.setCellStyle(style);
	    cell = row.createCell((short) 8);  
	    cell.setCellValue("数量");  
	    cell.setCellStyle(style);
	    cell = row.createCell((short) 9);
	    cell.setCellValue("客户手机号");  
	    cell.setCellStyle(style);
	  
	    // 第五步，从数据库得到数据 
	    List<Order> list = orderService.getExportOrder(map);//查询订单信息
	  
	    int snum = 0;
	    int frows = 0;
	    int lrows = 0;
	    int j=1;
	    for (int i = 0; i < list.size(); i++)  
	    {  
	        Order order = (Order) list.get(i);  
	        
	        Set<OrderDetail> orderDetail = order.getOrderDetails();//订单详情
	        
	        if(i==0)
	        {
	        	frows = 1;
	        }else
	        {
	        	frows = 1+snum;
	        } 	        
	        snum += orderDetail.size();
	        lrows = snum;
	        
	        sheet.addMergedRegion(new CellRangeAddress((short)frows, (short)lrows, (short)0, (short)0));
		    sheet.addMergedRegion(new CellRangeAddress((short)frows, (short)lrows, (short)1, (short)1));
		    sheet.addMergedRegion(new CellRangeAddress((short)frows, (short)lrows, (short)2, (short)2));
		    sheet.addMergedRegion(new CellRangeAddress((short)frows, (short)lrows, (short)3, (short)3));
		    sheet.addMergedRegion(new CellRangeAddress((short)frows, (short)lrows, (short)4, (short)4));
		    sheet.addMergedRegion(new CellRangeAddress((short)frows, (short)lrows, (short)5, (short)5));
		    sheet.addMergedRegion(new CellRangeAddress((short)frows, (short)lrows, (short)6, (short)6));
		    sheet.addMergedRegion(new CellRangeAddress((short)frows, (short)lrows, (short)9, (short)9));
	        
	        // 第六步，创建单元格，并设置值                 
            for (OrderDetail orders: orderDetail) 
            {
            	row = sheet.createRow((int) (j++));  
            	
            	row.createCell((short) 0).setCellValue(order.getOrderNo()); //订单编号列
    	        
    	        Date oerderDate = order.getOrderDate();
    	        cell = row.createCell((short) 1);  //日期列
    	        if(null != oerderDate)
    	        {
    	        	cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(oerderDate));  
    	        }else
    	        {
    	        	cell.setCellValue("");
    	        }     
    	        
    	        row.createCell((short) 2).setCellValue(order.getOrderAmount());//总额列
    	        
    	        row.createCell((short) 3).setCellValue(order.getOrderCarriage()==null?0:order.getOrderCarriage());//运费列
    	        
    	        Date checkTime = order.getCheckTime();
    	        cell = row.createCell((short) 4);  //审核时间列
    	        if(null != checkTime)
    	        {
    	        	cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(checkTime)); 
    	        }else
    	        {
    	        	cell.setCellValue("");
    	        }   
    	        
    	        Date payTime = order.getPayTime();
                cell = row.createCell((short) 5);  //支付时间列
                if(null != payTime)
    	        {
                	cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(payTime)); 
    	        }else
    	        {
    	        	cell.setCellValue("");
    	        } 
                
                Date takeGoodTime = order.getTakeGoodTime();            
                cell = row.createCell((short) 6);  //收货时间列
                if(null != takeGoodTime)
    	        {
                	cell.setCellValue(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(takeGoodTime)); 
    	        }else
    	        {
    	        	cell.setCellValue("");
    	        }  
                
                Good good = goodService.getById(orders.getGoodId());//查询商品信息
                if(null != good)
                {
                	row.createCell((short) 7).setCellValue(good.getGoodName());//商品列
                }else
                {
                	row.createCell((short) 7).setCellValue("");
                }  
                
                row.createCell((short) 8).setCellValue(orders.getNum());//数量列
                
                User user = userService.getById(order.getUserId());
                if(null != user)
                {
                	row.createCell((short) 9).setCellValue(user.getUserPhone());//客户手机号
                }else
                {
                	row.createCell((short) 9).setCellValue("");//客户手机号
                }               
            }   
	    }  
	    // 第七步，将文件存到指定位置  
	    try  
	    {  
	    	//设置文件名，用格局化日期来生成一个ID
	        String filePath="";
	        Date dt = new Date();
	        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	        String date = df.format(dt).toString();
	        filePath = "order" + date + ".xls";
	        File file=new File(filePath);
	        try{
	            OutputStream out=new FileOutputStream(file);
	            wb.write(out);
	            out.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }

	        try{
	        	inputStream=new FileInputStream(file);
	        }catch(Exception e)
	        {
	            e.printStackTrace();
	        }
	    }  
	    catch (Exception e)  
	    {  
	        e.printStackTrace();  
	    }  
		return "exportOrder";
	}


	public InputStream getInputStream() {
		return inputStream;
	}


	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

}
