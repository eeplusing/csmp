package com.moutum.csmp.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.domain.Address;
import com.moutum.csmp.domain.BuyGood;
import com.moutum.csmp.domain.Car;
import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.Price;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.dto.GoodMoney;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : AddressAction.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月22日 下午5:36:25
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class AddressAction extends BaseAction<Address>
{    

	private static final long serialVersionUID = -5917231052723058622L;
	HttpServletRequest request = ServletActionContext.getRequest();
	Logger logger = Logger.getLogger(AddressAction.class);
	/**
	 * 查询订单地址
	 * @return
	 */
	public String list()
	{
		User user = (User)ActionContext.getContext().getSession().get("login_user");
		//不能直接取session中的用户，必须要重新查询，才能将用户登陆后添加的地址信息加载进来
		user = userService.getByPhone(user.getUserPhone());
		String isBuy = request.getParameter("infoId");

		String[] ids = isBuy.split(";");
		Integer[] infoIds = new Integer[ids.length];
		for(int i = 0; i < ids.length; i++)
		{
			infoIds[i] = Integer.parseInt(ids[i]);
		}

		List<BuyGood> buyGoodsList = buyGoodService.getByIds(infoIds);

		List<GoodMoney> goods = new ArrayList<GoodMoney>();
		String payInfo = "";
		double tmoney = 0.0;
		for(BuyGood buyGood : buyGoodsList)
		{
			double price = 0.0;
			for(Price p :  buyGood.getGood().getPrices())
			{
				if(p.getGrade().getGradeId() == user.getGrade().getGradeId())
				{
					price = p.getPrice();
				}
			}
			GoodMoney bm = new GoodMoney();
			bm.setAmount(buyGood.getAmount());
			bm.setGoodId(buyGood.getGood().getGoodId());
			bm.setGoodName(buyGood.getGood().getGoodName());
			bm.setMoney(price * buyGood.getAmount());
			bm.setPrice(price);
			bm.setImages(buyGood.getGood().getImages());
			payInfo += buyGood.getGood().getGoodId() + "," + buyGood.getAmount() + "," + price + "," + (price * buyGood.getAmount()) + ";";
			goods.add(bm);

			tmoney += bm.getMoney();
		}

		ActionContext.getContext().put("goods", goods);
		ActionContext.getContext().put("addresss",user.getAddresss());
		ActionContext.getContext().put("payInfo",payInfo);
		ActionContext.getContext().put("tmoney",tmoney);
		ActionContext.getContext().put("isBuy",isBuy);
		return "select_address";
	}

	/**
	 * 查询用户的地址信息
	 * @return
	 */
	public String select()
	{
		User user = (User)ActionContext.getContext().getSession().get("login_user");
		//不能直接取session中的用户，必须要重新查询，才能将用户登陆后添加的地址信息加载进来
		user = userService.getByPhone(user.getUserPhone());
		ActionContext.getContext().put("address",user.getAddresss());
		return "sele_add";
	}

	/**
	 * 添加地址
	 * @return
	 */ 
	public void add()
	{
		try
		{
			User user = (User)ActionContext.getContext().getSession().get("login_user");
			String address = request.getParameter("address");
			String postCode = request.getParameter("postCode");
			String consigneName = request.getParameter("consigneName");
			String consignePhone = request.getParameter("consignePhone");

			Set<Address> set = user.getAddresss();
            if (null == set)
            {
                set = new HashSet<Address>();
            }
            
            Address addre = new Address();
            addre.setAddress(address);
            addre.setPostCode(postCode);
			addre.setConsigneName(consigneName);
			addre.setConsignePhone(consignePhone);
	
			set.add(addre);
			user.setAddresss(set);
			userService.update(user);
			
			getResponse().getWriter().write("添加成功");
		}
		catch (Exception e)
		{
			try
			{
				getResponse().getWriter().write("添加失败");
			}
			catch (IOException e1)
			{
			    logger.info("[ZSS]---错误信息：地址添加失败");
			}
		}
	}

	/**
	 * 删除地址
	 */
	public void delect()
	{
		int addressId = Integer.parseInt(request.getParameter("addressId"));
		try
		{
		    addressService.delete(addressId);
			getResponse().getWriter().write("-1");
		}
		catch (Exception ce)
		{
		    try
            {
                getResponse().getWriter().write("1");
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
			ce.printStackTrace();
		}

	}

	/**
	 * 修改地址
	 */
	public void updateAddress()
	{
			int addressId = Integer.parseInt(request.getParameter("addressId"));
			String address = request.getParameter("address");
			String postCode = request.getParameter("postCode");
			String consigneName = request.getParameter("consigneName");
			String consignePhone = request.getParameter("consignephone");

			Address addres = addressService.getById(addressId);

			addres.setAddress(address);
			addres.setPostCode(postCode);
			addres.setConsigneName(consigneName);
			addres.setConsignePhone(consignePhone);
      
           addressService.update(addres);  
			
		 try
	     {
			getResponse().getWriter().write("-1");
		 }
		 catch (IOException e)
		 {
		     logger.info("[ZSS]---错误信息：修改地址失败");
		 }

	 }

	/**
	 * 查询要修改的地址信息
	 */
	public String  upAddre()
	{      
		User user = (User)ActionContext.getContext().getSession().get("login_user");
		int addressId = Integer.parseInt(request.getParameter("addressId"));

		Address addres = addressService.getById(addressId);

		ActionContext.getContext().put("addres", addres);
		ActionContext.getContext().put("address",user.getAddresss());
		return "up_address";
	}

	/**
	 * 立即购买
	 */
	public String buyNow()
	{
		int goodId = Integer.parseInt(request.getParameter("goodId"));//商品id

		User loginUser = (User)ActionContext.getContext().getSession().get("login_user");

		//购物车的判断
		int infoId = 0;
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
			boolean buy=false;//是否已在购物车中存在 false:不存在  true:存在
			for(BuyGood bg : buyGoods)
			{
				if(bg.getGood().getGoodId()==goodId)
				{
					buyGood = bg;
                    buyGood.setAmount((double) 1);
					buy=true;
				}
			}
			if(buy==true)//存在
			{
				infoId = buyGood.getInfoId();//获得购物车中的信息id
				//因为购物车中已存在此商品，所以将数量改为1
                buyGoodService.update(buyGood);
			}else
			{
				//购物车中还没有此商品，直接添加,并且获得插入数据的id  
				infoId = saveBuyGood(car,goodId);
			}
		}
		catch(Exception ex)
		{
		    logger.info("[ZSS]---错误信息：立即购买失败");
		}

		//购买结算
		//不能直接取session中的用户，必须要重新查询，才能将用户登陆后添加的地址信息加载进来
		loginUser = userService.getByPhone(loginUser.getUserPhone());

		Integer[] infoIds = {infoId};
		List<BuyGood> buyGoodsList = buyGoodService.getByIds(infoIds);

		List<GoodMoney> goods = new ArrayList<GoodMoney>();
		String payInfo = "";
		double tmoney = 0.0;
		for(BuyGood buyGood : buyGoodsList)
		{
			double price = 0.0; 
			for(Price p :  buyGood.getGood().getPrices())
			{
				if(p.getGrade().getGradeId() == loginUser.getGrade().getGradeId())
				{
					price = p.getPrice();
				}
			}
			GoodMoney bm = new GoodMoney();
			bm.setAmount(buyGood.getAmount());
			bm.setGoodId(buyGood.getGood().getGoodId());
			bm.setGoodName(buyGood.getGood().getGoodName());
			bm.setMoney(price * buyGood.getAmount());
			bm.setPrice(price);
			bm.setImages(buyGood.getGood().getImages());
			payInfo += buyGood.getGood().getGoodId() + "," + buyGood.getAmount() + "," + price + "," + (price * buyGood.getAmount()) + ";";
			goods.add(bm);

			tmoney += bm.getMoney();
		}

		ActionContext.getContext().put("goods", goods);
		ActionContext.getContext().put("addresss",loginUser.getAddresss());
		ActionContext.getContext().put("payInfo",payInfo);
		ActionContext.getContext().put("tmoney",tmoney);
		ActionContext.getContext().put("isBuy",infoId);
		
		return "select_address";
	}
	
	public int saveBuyGood(Car car,int goodId)
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
		
		Car cars = carService.getById(car.getCarId());
		Set<BuyGood> buyGoods = cars.getBuyGoods();
		BuyGood buy = new BuyGood();
		for(BuyGood bg : buyGoods)
        {
            if(bg.getGood().getGoodId()==goodId)
            {
            	buy = bg;
            }
        }
		
		return buy.getInfoId();
	}
}

