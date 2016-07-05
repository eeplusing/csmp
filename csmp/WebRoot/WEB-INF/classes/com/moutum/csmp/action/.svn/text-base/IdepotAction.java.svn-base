package com.moutum.csmp.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Bill;
import com.moutum.csmp.domain.BillDetail;
import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.Idepot;
import com.moutum.csmp.domain.Stock;
import com.moutum.csmp.domain.Storage;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.util.BillNoUtil;
import com.moutum.csmp.util.EncodeConvertor;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : IdepotAction.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月20日 上午10:22:57
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/

@Controller @Scope("prototype")
public class IdepotAction extends BaseAction<Idepot>
{
    private static final long serialVersionUID = 1267255124142935188L;
    HttpServletRequest request = ServletActionContext.getRequest();
    private String results="error";
    private String result1="error";
    
    public String list()
    {
   
        return null;
        
    }
    
    public String addIdepot() throws Exception 
    {
        
        int storageId = Integer.parseInt(request.getParameter("storageId"));
        int type= Integer.parseInt(request.getParameter("type"));
        int goodId = Integer.parseInt(request.getParameter("goodId"));
        Double amount = Double.valueOf(request.getParameter("amount")).doubleValue();
        String perator = request.getParameter("perator");
        Date date=new Date(); 
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        String t = sdf.format(date);
        Date time=sdf.parse(t);
    
        Idepot idepot = new Idepot();
        idepot.setStorageId(storageId);
        idepot.setType(type);
        idepot.setGoodId(goodId);
        idepot.setAmount(amount);
        idepot.setTime(time);
        idepot.setPerator(perator);
    
        idepotService.save(idepot);
    
        return "addIdepot";
    }

    /**
     * 入库单查询
     */
	public String getInStorageList()
    {
    	Map<String, Object> map = new HashMap<String, Object>();
    	String billNo = request.getParameter("billNo");
    	map.put("billNo", billNo);
    	
    	pageSize = 12;
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

    	PageBean pageBean = billService.getInStorageList(pageNum, pageSize, map);
    	//获取仓库信息
    	List<Storage> sList=storageService.getStorageList();
    	//获取入库单信息
    	List<Bill> bList = billService.getBillList();
    	//根据入库单id查询总的入库数量
    	List<Idepot> iList = idepotService.getSumAmountByBillId();
    	
        ActionContext.getContext().put("pageBean", pageBean);
        ActionContext.getContext().put("sList", sList);
    	ActionContext.getContext().put("bList", bList);
    	ActionContext.getContext().put("iList", iList);
    	ActionContext.getContext().put("billNo", billNo);
        
    	return "inStorageList";
    }
  
    /**
     * 新增入库单
     */
    public String goInStorage()
    {
    	//获取仓库信息
    	List<Storage> sList=storageService.getStorageList();
    	//获取商品信息
    	List<Good> gList = goodService.getGoodList();
    	
    	ActionContext.getContext().put("sList", sList);
    	ActionContext.getContext().put("gList", gList);
    	
    	return "GoInStorage";
    }
    
    /**
     * 保存入库单
     * @throws IOException 
     */
    public String saveInStorage() throws IOException
    {
    	User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
    	
    	//仓库id
    	int storageId = Integer.parseInt(request.getParameter("storageId"));
    	//json字符串，其中包括商品id和数量
    	String json = request.getParameter("json_str");
    	JSONArray jsonArray = JSONArray.fromObject(json);
    	
    	String billNos = "";
    	
    	try
    	{
    		//给出入库单据信息表(csmp_bill_info)和出入库单据详情表(csmp_bill_detail_info)添加数据
    		Set<BillDetail> billDetails = new HashSet<BillDetail>();
            
    		for (int i = 0; i < jsonArray.size(); i++)
    		{
    			BillDetail billDetail = new BillDetail();
		
		    	JSONObject jsonObject = jsonArray.getJSONObject(i);

		    	billDetail.setGoodId(Integer.parseInt(jsonObject.getString("goodId")));
		    	billDetail.setAmount(Double.parseDouble(jsonObject.getString("amount")));
		
		    	billDetails.add(billDetail);		
		    }
            
            Bill bill = new Bill();
            String billNo = BillNoUtil.getBillNo(billService, 0);//生成单据编号
            billNos = billNo;
            bill.setBillNo(billNo);//单据编号
            bill.setStorageId(storageId);//仓库id
            bill.setBillType(0);//单据类型  0:入库  1:出库
            bill.setCreateTime(new Date());//生成时间
            bill.setProposer(loginUser.getLoginAccount());//申请者
            bill.setBillStat(0);//单据状态  0:未操作  1:已完成
            bill.setBillDetails(billDetails);//单据详情
            
            billService.save(bill);
            
            //给出入库记录信息表添加数据(csmp_idepot_info)
            Bill bill1 = billService.getBillByNo(billNos);
            for (int i = 0; i < jsonArray.size(); i++)
            {		
		    	JSONObject jsonObject = jsonArray.getJSONObject(i);
		    	
		    	Idepot idepot = new Idepot();
	            idepot.setStorageId(storageId);//仓库id
	            idepot.setBillId(bill1.getBillId());//入库单id
	            idepot.setType(0);//单据类型  0:入库  1:出库
	            
	            idepot.setGoodId(Integer.parseInt(jsonObject.getString("goodId")));//商品id
	            idepot.setAmount(Double.parseDouble(jsonObject.getString("amount")));//入库数量           
	            idepot.setTime(new Date());//时间
	            idepot.setPerator(loginUser.getLoginAccount());//操作人员
	            
	            idepotService.save(idepot);
            }
            
            results="success";
    	}
    	catch(Exception e)
    	{
    		results="error";
    		e.printStackTrace();
    	}
    	
    	return SUCCESS;
    }
    
    /**
     * 确认入库单
     */
    public String updateInStorage()
    {
    	User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
    	
    	int billId = Integer.parseInt(request.getParameter("billId"));//入库单id 
    	double amount = Double.parseDouble(request.getParameter("amount"));//入库数量
    	int storageId = Integer.parseInt(request.getParameter("storageId"));//仓库id
    	
    	try
    	{
    		List<Idepot> blist = idepotService.getByBillId(billId);
    		if(null!=blist)
    		{
    			for(int i=0;i<blist.size();i++)
    			{
    				//先通过storageId和goodId去查询库存中有没有该商品
    	        	Map<String, Object> map = new HashMap<String, Object>();
    	        	map.put("storageId", storageId);
    	        	map.put("goodId", blist.get(i).getGoodId());
    	        	Stock stock = stockService.getStock(map);
    	        	if(stock!=null)
    	        	{
    	        		//更新库存
    	        		map.put("amount", blist.get(i).getAmount());
    	            	stockService.updateStock(map);
    	        	}
    	        	else
    	        	{
    	        		//添加库存
    	        		Stock stock2 = new Stock();
    	        		stock2.setGoodId(blist.get(i).getGoodId());
    	        		stock2.setStorageId(storageId);
    	        		stock2.setStockAmount(blist.get(i).getAmount());
    	        		
    	        		stockService.save(stock2);
    	        	}
    			}
    		}
        	
        	//更新仓库
        	Map<String, Object> map1 = new HashMap<String, Object>();
        	map1.put("storageId", storageId);
        	map1.put("amount", amount);
        	storageService.updateStorage(map1);
        	
        	//更新入库单
        	Map<String, Object> map2 = new HashMap<String, Object>();
        	map2.put("billId", billId);
        	map2.put("perator", loginUser.getLoginAccount());
        	billService.updateBill(map2);
        	
        	result1 = "success";
    	}
    	catch(Exception ex)
    	{
    		result1 = "error";
    		ex.printStackTrace();
    	}
    	
    	return SUCCESS;
    }
    
    /**
     * 显示所有仓库*/
	public String storeList()
    {
        List<Storage> stores=null;
        stores = storageService.findUnDel();
        ActionContext.getContext().put("stores", stores); 
        return "allStore";
    }
    
    /** 增加仓库 */
    public void storeAdd()
    {
        try
        {
            String name = request.getParameter("name").trim();
            String size = request.getParameter("size").trim();
            String address = request.getParameter("address").trim();
            String owner = request.getParameter("owner").trim();
            String maxsize = request.getParameter("maxsize").trim();
            String currentsize = request.getParameter("currentsize").trim();
            String distribution = request.getParameter("distribution").trim();
            String unwaterLevel = request.getParameter("unwaterLevel").trim(); 
            String surface = request.getParameter("surface").trim(); 
            Integer storageStat = 1;
            Storage store = new Storage(); //实例化仓库
            /************设值仓库的参数***************/
            store.setStorageName(name);
            store.setStorageSpecification(size);
            store.setStorageAddress(address);
            store.setOwer(owner);
            store.setStockMaxAmount(Double.parseDouble(maxsize));
            store.setStockIniAmount(0.0);
            store.setStockAmount(Double.parseDouble(currentsize));
            store.setDistributionWay(distribution);
            store.setWaterproofGrade(unwaterLevel);
            store.setSurface(surface);
            store.setStorageStat(storageStat);
            storageService.save(store);
            getResponse().getWriter().write("ok");
        }
       
      
   
        catch (Exception e)
        {
            e.printStackTrace();
        }
   }
    
   
    /**显示要被修改仓库的信息*/
    public void storeModifyShow()
    {
        try
        {
            String sid = ((String[])ActionContext.getContext().getParameters().get("sid"))[0]; //从前台获取id数组
            int id = Integer.parseInt(sid.split(",")[0]); //获得第一个id
            Storage store = storageService.getById(id);  //通过id查询出仓库
            
            StringBuffer json = new StringBuffer("{");
            json.append("storageId:\"" + store.getStorageId() + "\",");
            json.append("storageName:\"" + store.getStorageName() + "\",");
            json.append("storageSpecification:\"" + store.getStorageSpecification() + "\",");
            json.append("storageAddress:\"" + store.getStorageAddress() + "\",");
            json.append("ower:\"" + store.getOwer() + "\",");
            json.append("stockMaxAmount:\"" + store.getStockMaxAmount() + "\",");
            json.append("distributionWay:\"" + store.getDistributionWay() + "\",");
            json.append("waterproofGrade:\"" + store.getWaterproofGrade() + "\",");
            json.append("surface:\"" + store.getSurface() + "\"}");
            getResponse().getWriter().write(json.toString());
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /**编辑仓库信息*/
    public void storeModify()
    {
        try
        {
            String id = ((String[])ActionContext.getContext().getParameters().get("id"))[0]; //从前台获取id数组
            String name = request.getParameter("name").trim();
            String size = request.getParameter("size").trim();
            String address = request.getParameter("address").trim();
            String owner = request.getParameter("owner").trim();
            String maxsize = request.getParameter("maxsize").trim();
            String distribution = request.getParameter("distribution").trim();
            String unwaterLevel = request.getParameter("unwaterLevel").trim(); 
            String surface = request.getParameter("surface").trim(); 
            Storage store = storageService.getById(Integer.parseInt(id));  //通过id查询出仓库
            store.setStorageName(name);
            store.setStorageSpecification(size);
            store.setStorageAddress(address);
            store.setOwer(owner);
            store.setStockMaxAmount(Double.parseDouble(maxsize));
            store.setDistributionWay(distribution);
            store.setWaterproofGrade(unwaterLevel);
            store.setSurface(surface);
            storageService.update(store);
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
       
    }
    
    /**删除仓库*/
    public void storeDelete()
    {
        String ids = ((String[])ActionContext.getContext().getParameters().get("sids"))[0]; //从前台获取id数组  //从前台获取id数组
        String[] sids=ids.split(",");
        
        try
        {
            for( int i=0; i<sids.length;i++)
            {
                Storage storage = storageService.getById((Integer.parseInt(sids[i])));
                storage.setStorageStat(0);
                storageService.update(storage);
                System.out.println(storage.getStorageStat());
            }
            getResponse().getWriter().write("ok");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /**
     * 入库单详情查询
     */
    public String getInStorageDetail()
    {
    	Map<String, Object> map = new HashMap<String, Object>();
    	//入库单id
    	String billId = request.getParameter("billId");
    	map.put("billId", billId);
    	//商品id
    	String goodId = request.getParameter("goodId");
    	map.put("goodId", goodId);
    	
    	pageSize = 12;
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

    	PageBean pageBean = idepotService.getInStorageList(pageNum, pageSize, map);
    	//获取仓库信息
    	List<Storage> sList=storageService.getStorageList();
    	//获取商品信息
    	List<Good> gList = goodService.getGoodList();
    	
        ActionContext.getContext().put("pageBean", pageBean);
        ActionContext.getContext().put("sList", sList);
    	ActionContext.getContext().put("gList", gList);
    	ActionContext.getContext().put("goodId", goodId);
    	ActionContext.getContext().put("billId", billId);
        
    	return "inStorageDetail";
    }

	public String getResults()
	{
		return results;
	}

	public void setResults(String results)
	{
		this.results = results;
	}

	public String getResult1()
	{
		return result1;
	}

	public void setResult1(String result1) 
	{
		this.result1 = result1;
	}
	
	/**
     * 仓库查询
     */
	public String searchKucun()
	{
		int storageId = -1;
		String storageName = null;
		String storageAddress = null;
		String ower = null;
		String distributionWay = null;
		String waterproofGrade = null;
		Map<String, Object> map = new HashMap<String,Object>(); 
		
		try 
		{
			if(((String[]) ActionContext.getContext().getParameters().get("storageId"))[0].trim().length()!=0)
			{
				storageId = Integer.parseInt(((String[]) ActionContext.getContext().getParameters().get("storageId"))[0].trim());
			}
			map.put("storageId", storageId);
			
			storageName = EncodeConvertor.encodeConvert(((String[]) ActionContext.getContext().getParameters().get("storageName"))[0].trim(), "iso8859-1", "utf-8");
            if(storageName.length()!=0)
            {
                map.put("storageName", storageName);
            }
            else
            {
                map.put("storageName", null);
            }
            
            storageAddress = EncodeConvertor.encodeConvert(((String[]) ActionContext.getContext().getParameters().get("storageAddress"))[0].trim(), "iso8859-1", "utf-8");
            if(storageAddress.length()!=0)
            {
                map.put("storageAddress", storageAddress);
            }
            else
            {
                map.put("storageAddress", null);
            }
            
            ower = EncodeConvertor.encodeConvert(((String[]) ActionContext.getContext().getParameters().get("ower"))[0].trim(), "iso8859-1", "utf-8");
            if(ower.length()!=0)
            {
                map.put("ower", ower);
            }
            else
            {
                map.put("ower", null);
            }
            
            distributionWay = EncodeConvertor.encodeConvert(((String[]) ActionContext.getContext().getParameters().get("distributionWay"))[0].trim(), "iso8859-1", "utf-8");
            if(distributionWay.length()!=0)
            {
                map.put("distributionWay", distributionWay);
            }
            else
            {
                map.put("distributionWay", null);
            }
            
            waterproofGrade = EncodeConvertor.encodeConvert(((String[]) ActionContext.getContext().getParameters().get("waterproofGrade"))[0].trim(), "iso8859-1", "utf-8");
            if(waterproofGrade.length()!=0)
            {
                map.put("waterproofGrade", waterproofGrade);
            }
            else
            {
                map.put("waterproofGrade", null);
            }
            
            List<Storage> stores = idepotService.getByMap(map);
            ActionContext.getContext().put("stores", stores);
            for(int i =0;i<stores.size();i++)
            {
                System.out.println(stores.get(i).getStorageName());
            }
		}catch (Exception e){}
		
		return SUCCESS;
	}
}

