package com.moutum.csmp.action;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
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
import com.moutum.csmp.util.DateUtil;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : OutStorageAction.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年6月3日 下午3:35:22
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class OutStorageAction extends BaseAction<Storage>
{

    private static final long serialVersionUID = 1963005136090892745L;
    HttpServletRequest request = ServletActionContext.getRequest();
    Logger logger = Logger.getLogger(OutStorageAction.class);
    private String result1="error";
    private String results="error";
    
    public String getResult1()
    {
        return result1;
    }


    public void setResult1(String result1)
    {
        this.result1 = result1;
    }


    public String getResults()
    {
        return results;
    }


    public void setResults(String results)
    {
        this.results = results;
    }


    /**
     * 查询仓库信息记录
     * @return
     */
	public String list()
     {
         Map<String, Object> map = new HashMap<String, Object>();
         String billNo = request.getParameter("billNo");
         map.put("billNo", billNo);
         
         pageSize = 10;
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

         PageBean pageBean = billService.getOutStorageList(pageNum, pageSize, map);        
         List<Storage> storageList=storageService.findAll();//获取仓库信息        
         List<Idepot> idepotList = idepotService.AmountOutByBillId();//根据出库单id查询总的出库数量  
         ActionContext.getContext().put("pageBean", pageBean);
         ActionContext.getContext().put("storageList", storageList);
         ActionContext.getContext().put("idepotList", idepotList);
         ActionContext.getContext().put("billNo", billNo);
 
       return "get_bill";
     }

     
     /**
      * 新增出库单
      */
     public String outStorage()
     { 
           List<Storage> storage=storageService.getStorageList();//.findAll();//获取仓库信息    
           List<Good> goodList = goodService.getGoodList();//.findAll();//获取商品信息
             
           ActionContext.getContext().put("storage", storage);
           ActionContext.getContext().put("goodList", goodList);
             
             return "out_storage";
     }
    
    /**
     * 保存出库单
     * 
     */
    public String outState()
    {
       
        String date = DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD).substring(2);
        String append = "0000";//单据后四位数字
        String billNo = "1" + date + append;//最终生成的单据编号
        String billNos = "";       
        Bill bills = billService.getOutMaxBillNo();//查询当天的最大单据号 
       if(bills!=null)//有最大编号，则最大编号+1
       {
           String maxBillNo = bills.getBillNo();
           String sub = "0000" + (Integer.parseInt(maxBillNo.substring(7))+1);

          billNos = "1" + date + (sub.substring(sub.length() -4, sub.length()));
          
       }else 
       {           
           billNos = billNo; //最大编号，从0001开始
       }
        
       
       User user = (User)ActionContext.getContext().getSession().get("login_user");//当前用户
  
       int storageId = Integer.parseInt(request.getParameter("storageId")); //仓库id    

       String json = request.getParameter("json_str"); //json字符串，其中包括商品id和数量
       JSONArray jsonArray = JSONArray.fromObject(json);
      try
      {
    
           Bill bill = new Bill();  
           bill.setBillNo(billNos);//单据编号      
           bill.setStorageId(storageId);//仓库ID 
           bill.setBillType(1);//单据类型  0:入库  1:出库
           bill.setPerator(user.getLoginAccount());
           bill.setCreateTime(new Date());
           bill.setProposer(user.getLoginAccount());
           bill.setBillStat(0);//单据状态  0:未操作  1:已完成
        
           Set<BillDetail> billDetails = new HashSet<BillDetail>();
           
           for (int i = 0; i < jsonArray.size(); i++) {
              BillDetail billDetail = new BillDetail();
     
              JSONObject jsonObject = jsonArray.getJSONObject(i);
    
              billDetail.setGoodId(Integer.parseInt(jsonObject.getString("goodId")));
              billDetail.setAmount(Double.parseDouble(jsonObject.getString("amount")));
     
              billDetails.add(billDetail);        
          }
    
           bill.setBillDetails(billDetails);//单据详情
           
           billService.save(bill);
           
           //给出库记录信息表里添加数据
            Bill bil = billService.outBillByNo(billNos);
            for (int i = 0; i < jsonArray.size(); i++) {       
               JSONObject jsonObject = jsonArray.getJSONObject(i);   
               Idepot idepot = new Idepot();
               idepot.setStorageId(storageId);//仓库id
               idepot.setBillId(bil.getBillId());//出库单id
               idepot.setType(1);//单据类型  0:入库  1:出库   
               idepot.setGoodId(Integer.parseInt(jsonObject.getString("goodId")));//商品id
               idepot.setAmount(Double.parseDouble(jsonObject.getString("amount")));//出库数量           
               idepot.setTime(new Date());//时间
               idepot.setPerator(user.getLoginAccount());//操作人员
               idepotService.save(idepot);
           }
            results="success";
        }
        catch(Exception e)
        {
            results="error";
        }
        return SUCCESS;
     }
    

    /**
     * 出库单详情
     */
    public String outDetail()
    {
        Map<String, Object> map = new HashMap<String, Object>();
        
        String billId = request.getParameter("billId");//出库单id
        map.put("billId", billId);
        
        String goodId = request.getParameter("goodId");//商品id
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

        PageBean pageBean = idepotService.getOutStorageList(pageNum, pageSize, map);        
        List<Storage> storageList=storageService.findAll();//获取仓库信息 
        List<Good> goodList = goodService.findAll();//获取商品信息
        
        ActionContext.getContext().put("pageBean", pageBean);
        ActionContext.getContext().put("storageList", storageList);
        ActionContext.getContext().put("goodList", goodList);
        ActionContext.getContext().put("goodId", goodId);
        ActionContext.getContext().put("billId", billId);
        
        return "out_detail";
    }
    
   
    /**
     * 出库
     * @return
     */
    public String update0utStorage()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        
        int billId = Integer.parseInt(request.getParameter("billId"));//出库单id 
        double amount = Double.parseDouble(request.getParameter("amount"));//出库数量
        int storageId = Integer.parseInt(request.getParameter("storageId"));//仓库id
        
        try
        {
            List<Idepot> blist = idepotService.getOutByBillId(billId);//根据单据id查询出库单信息 
            if(null!=blist)
            {
                for(int i=0;i<blist.size();i++)
                {
                    //先通过storageId和goodId去查询库存中有没有该商品
                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put("storageId", storageId);
                    map.put("goodId", blist.get(i).getGoodId());
                    Stock stock = stockService.getStock(map);
                    if(null != stock)
                    {
                        //更新库存
                        map.put("amount", blist.get(i).getAmount());
                        stockService.updateStock(map);
                    }else
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
            
            
            Map<String, Object> map1 = new HashMap<String, Object>();
            map1.put("storageId", storageId);
            map1.put("amount", amount);
            storageService.updateStorage(map1);//更新仓库
            
            //更新出库单
            Map<String, Object> map2 = new HashMap<String, Object>();
            map2.put("billId", billId);
            map2.put("perator", loginUser.getLoginAccount());
            billService.updateBill(map2);//更新出库单
            
            result1 = "success";
        }catch(Exception ex)
        {
            result1 = "error";
        }       
        return SUCCESS;
    }

}

