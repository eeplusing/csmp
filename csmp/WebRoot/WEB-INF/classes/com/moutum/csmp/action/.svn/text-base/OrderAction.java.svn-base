package com.moutum.csmp.action;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Address;
import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.OperLog;
import com.moutum.csmp.domain.Order;
import com.moutum.csmp.domain.OrderDetail;
import com.moutum.csmp.domain.User;
import com.moutum.csmp.util.DateUtil;
import com.moutum.csmp.util.NewOrderListManager;
import com.moutum.csmp.util.OrderNoUtil;
import com.moutum.csmp.util.SystemConstants;
import com.opensymphony.xwork2.ActionContext;

/************************************************************************************
 * @Title        : OrderAction.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月18日 下午12:16:32
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Controller @Scope("prototype")
public class OrderAction extends BaseAction<Order>
{

    /********************************************************************************
     * 
     ********************************************************************************/
    private static final long serialVersionUID = -2354227928648772744L;
    
    Logger logger = Logger.getLogger(OrderAction.class);
    HttpServletRequest request = ServletActionContext.getRequest(); 
    /********************************************************************************
     * 订单查询(客户)
     * @return
     ********************************************************************************/
    public String list()
    {
        User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
        Map<String, Object> selMap = new HashMap<String, Object>();
        if(loginUser!=null)
        {
        	selMap.put("userId", loginUser.getUserId());
        }
        
        /*
         * 参数初始化
         */
        pageSize = 5;
        String orderNo = "";
        int orderStat = -1;
        int pageNum = 1;
        
        try
        {
        	if(ActionContext.getContext().getParameters().get("pageNum")!=null)
        	{
        		pageNum = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageNum"))[0]);
        	}
        }
        catch (Exception e)
        {
            
        }
        
        try
        {
        	if(ActionContext.getContext().getParameters().get("pageSize")!=null)
        	{
        		pageSize = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageSize"))[0]);
        	}
        }
        catch (Exception e)
        {
            
        }
        
        try
        {
            orderNo = ((String[])ActionContext.getContext().getParameters().get("orderNo"))[0];
            selMap.put("orderNo", orderNo);
        }
        catch (Exception e)
        {
//            e.printStackTrace();
            logger.info("[BWQ]---获取订单编号出错，可能原因：1.前台未传值；2.。。。；3.。。。；");
        }
        
        try
        {
            orderStat = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderStat"))[0]);
            if(orderStat >= 0)
            {
                selMap.put("orderState", orderStat);
            }
        }
        catch (Exception e)
        {
//            e.printStackTrace();
        }
        
        Map<String, Integer> numByState = orderService.getMapForNumState(loginUser.getUserId());
        
        PageBean pageBean = orderService.getPageBean(pageNum, pageSize, selMap);
        //List<Good> gList = goodService.getGoodList();
        
        ActionContext.getContext().put("pageBean", pageBean);
        ActionContext.getContext().put("orderNo",  orderNo);
        ActionContext.getContext().put("orderStat", orderStat);
        for(String key : numByState.keySet())
        {
            ActionContext.getContext().put(key, numByState.get(key));
        }
        //ActionContext.getContext().put("gList", gList);
        logger.info("test-log info");
        return "c-order";
    }
    
    /********************************************************************************
     * 订单详情
     * @return
     ********************************************************************************/
    public String info()
    {
        int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
        Order order = orderService.getById(orderId);
        ActionContext.getContext().put("order", order);
        ActionContext.getContext().put("orderDate", DateUtil.dateToString(order.getOrderDate(), DateUtil.YYYY_MM_DD_HH_MM_SS));
        if(null != order.getCheckTime())
        {
            ActionContext.getContext().put("checkTime", DateUtil.dateToString(order.getCheckTime(), DateUtil.YYYY_MM_DD_HH_MM_SS));
        }
        if(null != order.getPayTime())
        {
            ActionContext.getContext().put("payTime", DateUtil.dateToString(order.getPayTime(), DateUtil.YYYY_MM_DD_HH_MM_SS));
        }
        if(null != order.getTakeGoodTime())
        {
            ActionContext.getContext().put("takeGoodTime", DateUtil.dateToString(order.getTakeGoodTime(), DateUtil.YYYY_MM_DD_HH_MM_SS));
        }
        if(null != order.getEvaluateTime())
        {
            ActionContext.getContext().put("evaluateTime", DateUtil.dateToString(order.getEvaluateTime(), DateUtil.YYYY_MM_DD_HH_MM_SS));
        }
        return "info";
    }
    
    /********************************************************************************
     * 订单流转信息(客户)
     ********************************************************************************/
    public void flowInfo()
    {
        int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
        Order order = orderService.getById(orderId);
        try
        {
            getResponse().getWriter().write(order.getInfoFlow().replace("\r\t", "<br />"));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    /********************************************************************************
     * 订单评价
     ********************************************************************************/
    public void addEva()
    {
        try
        {
          User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
//            User loginUser = userService.getById(69);
            
            int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
            Order order = orderService.getById(orderId);
            String evaluateInfo = ((String[])ActionContext.getContext().getParameters().get("eva_acount"))[0];
            if(orderService.saveEvaluate(orderId, evaluateInfo, loginUser.getUserName()))
            {
                getResponse().getWriter().write("订单评价成功");
                
                OperLog operLog = new OperLog();
                operLog.setOperTime(new Date());
                operLog.setOperType(SystemConstants.OPERLOG_TYPE_HANDLE_DELETE_ORDER_REQUEST);
                operLog.setUserId(loginUser.getUserId());
                operLog.setOperContent("客户：" + loginUser.getLoginAccount() + "评价了订单：" + order.getOrderNo() + ",评价内容：" + evaluateInfo);
                operLogService.save(operLog);
            }
            else
            {
                getResponse().getWriter().write("订单评价失败");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /********************************************************************************
     * 确认收货
     ********************************************************************************/
    public void taken()
    {
        try
        {
            User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
            
            int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
            Order order = orderService.getById(orderId);
            if(orderService.saveTaken(orderId, loginUser.getUserName()))
            {
                getResponse().getWriter().write("收货成功");
                
                OperLog operLog = new OperLog();
                operLog.setOperTime(new Date());
                operLog.setOperType(SystemConstants.OPERLOG_TYPE_HANDLE_DELETE_ORDER_REQUEST);
                operLog.setUserId(loginUser.getUserId());
                operLog.setOperContent("客户：" + loginUser.getLoginAccount() + "确认收货，订单编号" + order.getOrderNo());
                operLogService.save(operLog);
            }
            else
            {
                getResponse().getWriter().write("收货失败");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /********************************************************************************
     * 申请取消
     ********************************************************************************/
    public void cancel()
    {
        try
        {
            User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
            int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
            String reason = ((String[])ActionContext.getContext().getParameters().get("reason"))[0];
            Order order = orderService.getById(orderId);
            if(reason.equals("1"))
            {
                reason = "不想买了";
            }
            else if(reason.equals("2"))
            {
                reason = "信息填写错误";
            }
            else if(reason.equals("3"))
            {
                reason = "支付遇到问题";
            }
            if(orderService.updateCancel(orderId, reason, loginUser.getUserName()))
            {
                getResponse().getWriter().write("申请已经提交，等待管理员处理！");
                
                OperLog operLog = new OperLog();
                operLog.setOperTime(new Date());
                operLog.setOperType(SystemConstants.OPERLOG_TYPE_HANDLE_DELETE_ORDER_REQUEST);
                operLog.setUserId(loginUser.getUserId());
                operLog.setOperContent("客户：" + loginUser.getLoginAccount() + "申请取消订单，订单编号" + order.getOrderNo() + ",原因：" + reason);
                operLogService.save(operLog);
            }
            else
            {
                getResponse().getWriter().write("提交时发生错误！");
            }
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /********************************************************************************
     * 订单查询(管理员)
     * @return
     ********************************************************************************/
	public String morder()
    {
    	
        Map<String, Object> selMap = new HashMap<String, Object>();
        String orderNo = "";
        String userName = "";
        int oraState = -1;
        int evaState = -1;
        String sTime = "";
        String eTime = "";
        pageSize = 10;
        int pageNum = 1;
        try
        {
            orderNo = ((String[])ActionContext.getContext().getParameters().get("orderNo"))[0];
            if(!orderNo.isEmpty())
            {
                selMap.put("orderNo", orderNo);
            }
        }
        catch (Exception e)
        {
        }
        
        try
        {
            userName = ((String[])ActionContext.getContext().getParameters().get("userName"))[0];
            if(!userName.isEmpty())
            {
                selMap.put("userName", userName);
            }
        }
        catch (Exception e)
        {
        }
        
        try
        {
            oraState = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("oraState"))[0]);
            if(oraState != -1)
            {
                selMap.put("oraState", oraState);
            }
        }
        catch (Exception e)
        {
        }
        
        try
        {
            evaState = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("evaState"))[0]);
            if(evaState != -1)
            {
                selMap.put("evaState", evaState);
            }
        }
        catch (Exception e)
        {
        }
        
        try
        {
            sTime = ((String[])ActionContext.getContext().getParameters().get("sTime"))[0];
            if(!sTime.isEmpty())
            {
                selMap.put("sTime", DateUtil.stringToDate(sTime + " 00:00:00", DateUtil.YYYY_MM_DD_HH_MM_SS));
            }
        }
        catch (Exception e)
        {
        }
        
        try
        {
            eTime = ((String[])ActionContext.getContext().getParameters().get("eTime"))[0];
            if(!sTime.isEmpty())
            {
                selMap.put("eTime", DateUtil.stringToDate(eTime + " 23:59:59", DateUtil.YYYY_MM_DD_HH_MM_SS));
            }
        }
        catch (Exception e)
        {
        }
        
        try
        {
            pageNum = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("pageNum"))[0]);
        }
        catch (Exception e)
        {
        }
        
        PageBean pageBean = orderService.joinQuery(pageSize, pageNum, selMap);
        ActionContext.getContext().put("pageBean", pageBean);
        ActionContext.getContext().put("orderNo",  orderNo);
        ActionContext.getContext().put("orderStat", oraState);
        ActionContext.getContext().put("evaState", evaState);
        ActionContext.getContext().put("sTime", sTime);
        ActionContext.getContext().put("eTime", eTime);
        ActionContext.getContext().put("stateMap", stateMap());
        ActionContext.getContext().put("userName", userName);
        return "m-order";
    }
    
    /********************************************************************************
     * 审核订单
     ********************************************************************************/
    public void check()
    {
        try
        {
            User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
            
            int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
            int isAuto = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("isAuto"))[0]);
            double carriage = 0;//默认运费为0
            if(isAuto == 0)//未选择默认运费时，则从前台页面获取运费
            {
                carriage = Double.parseDouble(((String[])ActionContext.getContext().getParameters().get("carriage"))[0]);
            }
            Order order = orderService.getById(orderId);
            if(orderService.modifyCheck(orderId, loginUser.getUserName(), carriage))
            {
                getResponse().getWriter().write("审核成功");
                
                OperLog operLog = new OperLog();
                operLog.setOperTime(new Date());
                operLog.setOperType(SystemConstants.OPERLOG_TYPE_CHECK_ORDER);
                operLog.setUserId(loginUser.getUserId());
                operLog.setOperContent("管理员：" + loginUser.getLoginAccount() + "审核订单，订单编号" + order.getOrderNo() + ",运费：" + carriage);
                operLogService.save(operLog);
            }
            else
            {
                getResponse().getWriter().write("审核失败");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /********************************************************************************
     * 通过订单取消申请
     ********************************************************************************/
    public void passApply()
    {
        try
        {
            User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
            
            int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
            Order order = orderService.getById(orderId);
            if(orderService.savePassApply(orderId, loginUser.getUserName()))
            {
                getResponse().getWriter().write("操作成功");
                
                OperLog operLog = new OperLog();
                operLog.setOperTime(new Date());
                operLog.setOperType(SystemConstants.OPERLOG_TYPE_HANDLE_DELETE_ORDER_REQUEST);
                operLog.setUserId(loginUser.getUserId());
                operLog.setOperContent("管理员：" + loginUser.getLoginAccount() + "通过订单取消申请，订单编号" + order.getOrderNo());
                operLogService.save(operLog);
            }
            else
            {
                getResponse().getWriter().write("操作失败");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    /********************************************************************************
     * 拒绝订单取消申请
     ********************************************************************************/
    public void refApply()
    {
        try
        {
            User loginUser = (User)ActionContext.getContext().getSession().get("login_user");
            
            int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
            Order order = orderService.getById(orderId);
            if(orderService.saveRefApply(orderId, loginUser.getUserName()))
            {
                getResponse().getWriter().write("操作成功");
                
                OperLog operLog = new OperLog();
                operLog.setOperTime(new Date());
                operLog.setOperType(SystemConstants.OPERLOG_TYPE_HANDLE_DELETE_ORDER_REQUEST);
                operLog.setUserId(loginUser.getUserId());
                operLog.setOperContent("管理员：" + loginUser.getLoginAccount() + "拒绝了订单取消申请，订单编号" + order.getOrderNo());
                operLogService.save(operLog);
            }
            else
            {
                getResponse().getWriter().write("操作失败");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    /********************************************************************************
     * 查看订单取消原因
     ********************************************************************************/
    public void lookReason()
    {
        try
        {
            int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
            Order order = orderService.getById(orderId);
            getResponse().getWriter().write(order.getCancelReason());
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    private Map<Integer, String> stateMap()
    {
        Map<Integer, String> map = new HashMap<Integer, String>();
        map.put(-1, "全部订单");
        map.put(0, "待审核");
        map.put(1, "待支付");
        map.put(2, "已支付");
        map.put(3, "出库中");
        map.put(4, "配送中");
        map.put(5, "待收货");
        map.put(6, "已收货");
        map.put(7, "已完成");
        map.put(8, "取消中");
        map.put(9, "已取消");
        return map;
    }
    
    /********************************************************************************
     * 添加订单
     ********************************************************************************/
    public void add()
    {
        try
        {
            User user = (User)ActionContext.getContext().getSession().get("login_user");
            String payInfo = request.getParameter("payInfo");
            int adderssId = Integer.parseInt(request.getParameter("adderssId"));
            String infoId = request.getParameter("infoId");
            double money = 0.0;
            String[] pis = payInfo.split(";");
            int[] ids = new int[pis.length];
            double[] nums = new double[pis.length];
            double[] prices = new double[pis.length];
            for(int i = 0; i < pis.length; i++)
            {
                String[] pi = pis[i].split(",");
                money += Double.parseDouble(pi[3].trim());
                ids[i] = Integer.parseInt(pi[0].trim());
                nums[i] = Double.parseDouble(pi[1].trim());
                prices[i] = Double.parseDouble(pi[2].trim());
            }
            
            int orderState = 0;//订单状态
            Date orderDate = new Date();//下单日期
            int orderCycle = 0;// 订单周期
            String sinfoFlow = DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS);
            String but = "\t"+ user.getUserName()+"提交订单;\r\t";
            String infoFlow = sinfoFlow + but;//信息流
            
            Address address = addressService.getById(adderssId);//订单配送地址
            
            Order order = new Order();
            
            order.setOrderState(orderState);
            order.setOrderDate(orderDate);
            order.setInfoFlow(infoFlow);
            order.setOrderAmount(money);
            order.setOrderCycle(orderCycle);
            order.setUserId(user.getUserId());
            order.setAddress(address);
            
            Set<OrderDetail> setDetail = new HashSet<OrderDetail>();
            
            for(int i = 0; i < ids.length; i++)
            {
                Good good = goodService.getById(ids[i]);
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setGoodId(good.getGoodId());
                orderDetail.setGoodName(good.getGoodName());
                orderDetail.setNum(nums[i]);
                orderDetail.setSalePrice(prices[i]);//购买单价
                orderDetail.setSpecification(good.getSpecification());
                orderDetail.setHeadValue(good.getHeadValue());
                setDetail.add(orderDetail);
            }
            order.setOrderDetails(setDetail);
            String orderNo = OrderNoUtil.getOrderNo();
            Order selOrder = orderService.getByNo(orderNo);
            while(null != selOrder)//如果订单编号已经存在，则重新生成订单号，直到无重复为止
            {
                orderNo = OrderNoUtil.getOrderNo();
                selOrder = orderService.getByNo(orderNo);
            }
            order.setOrderNo(orderNo);
            orderService.save(order);
            
            NewOrderListManager.createNewOrder();//新增订单后变更标志位
            
            String[] idinfo = infoId.split(";");
            Integer[] infoIds = new Integer[idinfo.length];
            for(int i = 0; i < idinfo.length; i++)
            {
                infoIds[i] = Integer.parseInt(idinfo[i]);
                
                buyGoodService.delete(infoIds[i]);
            }
            
            
            Order newOrder = orderService.getByNo(orderNo);
            getResponse().getWriter().write(newOrder.getOrderId() + "");
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
}