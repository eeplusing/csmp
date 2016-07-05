package com.moutum.csmp.action;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.BuyGood;
import com.moutum.csmp.domain.Car;
import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.Price;
import com.moutum.csmp.domain.User;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : CarAction.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月18日 上午10:00:44
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class CarAction extends BaseAction<Car>
{
    
    private static final long serialVersionUID = 1267255124142935188L;
    
    HttpServletRequest request = ServletActionContext.getRequest();
    Logger logger = Logger.getLogger(CarAction.class);
    private String data="error";//是否添加成功   success:表示成功    noLogin:表示还没登录   error:表示登录的情况下，添加失败
    
    /**
     * 根据用户查询购物车商品信息
     * @return
     */
    public String list()
    {
       
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
       
         Car car= carService.getCar(loginUser.getUserId());
         Map<String, Object> map = new HashMap<String, Object>();
         if(null == car)
         {             
             car = new Car();
             car.setUserId(loginUser.getUserId());
             carService.save(car);     
         }
         else
         {
            map = getTotalMoney(car.getBuyGoods(), loginUser);
         }
         
         ActionContext.getContext().put("buygoods", map.get("bs"));
         ActionContext.getContext().put("user", loginUser);
         ActionContext.getContext().put("tmoney",map.get("tm"));
         logger.info("[ZSS]---访问信息：查询购物车信息");
         return "get_car";
     }
    
    /**
     * 计算价格
     * @param buyGoods
     * @param loginUser
     * @return
     */
    private Map<String, Object> getTotalMoney(Set<BuyGood> buyGoods, User loginUser)
    {
        Set<BuyGood> bs = new HashSet<BuyGood>();
        Map<String, Object> map = new HashMap<String, Object>();
        double totalMoney = 0;
        for(BuyGood bg : buyGoods)
        {
            Set<Price> prices = bg.getGood().getPrices();
            for(Price p : prices)
            {
                if(p.getGrade().getGradeId() == loginUser.getGrade().getGradeId())
                {
                    totalMoney += bg.getAmount() * p.getPrice();
                    bg.setMoney(bg.getAmount() * p.getPrice());
                    bs.add(bg);
                }
            }
        }
        map.put("tm", totalMoney);
        map.put("bs", bs);
        return map;
    }

    /**
     * 修改 / 删除购物车里商品数量
     * @return
     */
    public void addNum()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        
        int infoId = Integer.parseInt(request.getParameter("fid"));//编号
        Double amount = Double.parseDouble(request.getParameter("num"));//数量
        if(amount <= 0)
        {
            try
            {
                buyGoodService.delete(infoId);
                logger.info("[ZSS]---访问信息：删除购物车商品");
                getResponse().getWriter().write("-1");//-1代表商品数量减少为0时删除对应的购物车信息
                
            }
            catch (Exception e)
            {
                logger.info("[ZSS]---错误信息：删除购物车商品失败");
            }
        }
        else
        {
            try
            {
                BuyGood buyGood = buyGoodService.getById(infoId);
                double tmoney = 0.0;
                double price = 0.0;
                for(Price p :  buyGood.getGood().getPrices())
                {
                    if(p.getGrade().getGradeId() == loginUser.getGrade().getGradeId())
                    {
                        price = p.getPrice();
                    }
                }
                double money = price * amount;
                buyGood.setAmount(amount);
                buyGood.setMoney(money);
                buyGoodService.update(buyGood);
                
                Car car= carService.getCar(loginUser.getUserId());
                tmoney = (Double)getTotalMoney(car.getBuyGoods(),loginUser).get("tm");
                logger.info("[ZSS]---访问信息：修改购物车商品数量和价格");
                getResponse().getWriter().write(infoId + ";" + money + ";" + tmoney);
            }
            catch (Exception e)
            {
                logger.info("[ZSS]---错误信息：修改购物车商品数量和价格失败");
            }
        }
    }
    
   /**
    * 根据编号删除购物车商品
    */
    public void delInfoId()
    {
       int infoId = Integer.parseInt(request.getParameter("fid"));//编号
     
       try
       {
           buyGoodService.delete(infoId);
           logger.info("[ZSS]---访问信息：删除购物车商品信息");
           getResponse().getWriter().write("-1");
       }
         catch (Exception e)
       {
         logger.info("[ZSS]---错误信息：删除购物车商品失败");
       }
    }
   
    /**
     * 给购物车里添加商品信息
     */ 
     public String saveCarGood()
     {
         
       int goodId = Integer.parseInt(request.getParameter("goodId"));//商品id

       User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
       if(null==loginUser)
       {
    	   data="noLogin";
       }
       else
       {
    	   Car car = carService.getCar(loginUser.getUserId());
           try
           {
               if(car==null)       //判断当前操作人是否有购物车，如果没有则添加一个
               {
                   Car cars = new Car();
                   cars.setUserId(loginUser.getUserId());
                   carService.save(cars);
                   
                   car = carService.getCar(loginUser.getUserId());
               }
               Set<BuyGood> buyGoods = car.getBuyGoods();
               BuyGood buyGood = new BuyGood();
               boolean buy=false;//是否已在购物车中存在
               for(BuyGood bg : buyGoods)
               {
                   if(bg.getGood().getGoodId()==goodId)
                   {
                       buyGood = bg;
                       buyGood.setAmount(bg.getAmount()+1);
                       
                       buy=true;
                   }
               }
               if(buy==true)
               {
                   //因为购物车中已存在此商品，所以只改变数量
                   buyGoodService.update(buyGood);
                   logger.info("[ZSS]---访问信息：给购物车添加商品");
                   data="success";
               }
               else
               {
                   //购物车中还没有此商品，直接添加   
                   Set<BuyGood> buygood = car.getBuyGoods();
                   if(null == buygood)
                   {
                       buygood = new HashSet<BuyGood>();
                   }
                   
                   BuyGood buys = new BuyGood();              
                   buys.setAmount((double) 1);
                   Good good = new Good();
                   good.setGoodId(goodId);
                   buys.setGood(good);
                   
                   buygood.add(buys);
                   
                   car.setBuyGoods(buygood);
                   carService.update(car);
                   logger.info("[ZSS]---访问信息：给购物车添加商品");
                   data="success";
               }
           }
           catch(Exception ex)
           {
               logger.info("[ZSS]---访问信息：给购物车商品添加失败");
               data="error";               
           }
       }
       
       return SUCCESS;
   }

   public String getData() 
   {
		return data;
   }

   public void setData(String data) 
   {
		this.data = data;
   }
     
}