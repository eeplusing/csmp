package com.moutum.csmp.action;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cmb.MerchantCode;
import cmb.netpayment.Security;

import com.moutum.csmp.domain.Order;
import com.moutum.csmp.service.OrderService;
import com.moutum.csmp.util.DateUtil;
import com.moutum.csmp.util.SystemConstants;
import com.opensymphony.xwork2.ActionContext;


/**
 * @Title        : PaynetAction.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年3月4日 下午1:13:38
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 */
@Controller @Scope("prototype")
public class PaynetAction
{
    private static Logger log = Logger.getLogger(PaynetAction.class);
    
    @Resource OrderService orderService;
    
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    
    /**
     * 提交支付信息至招行接口
     * @return
     */
    public String index()
    {
        log.info("*****************************根据订单生成支付表单并提交至银行支付接口*****************************");
        int orderId = Integer.parseInt(((String[])ActionContext.getContext().getParameters().get("orderId"))[0]);
        String clientIP = getRemortIP();
        
        Order order = orderService.getById(orderId);
        double totalAmount = order.getOrderAmount() + order.getOrderCarriage();//支付金额=订单总价+运费
        String strKey = "Travolta20150317";//商户密钥
        String strDate = DateUtil.dateToString(order.getOrderDate(), DateUtil.YYYYMMDD);//订单日期
        String strBranchID = "0931";//开户分行号
        String strCono = "000862";//商户号
        String strBillNo = order.getOrderNo();//订单号
        String strAmount = totalAmount + "";//支付金额
        String strMerchantPara = "payeeNo=lzyycos";//商户自定义参数
        String strMerchantUrl = "http://fanyangxi.gicp.net/csmp/pay_result";//商户接受通知的URL
        String strPayerID = order.getUserId() + "";//付款方用户标识
        String strPayeeID = "yycoalorder";//收款方的用户标识
        String strClientIP = clientIP;//商户取得的客户端IP
        String strGoodsType = "54011600";//商品类型
        String strReserved = "";//保留属性
        
        MerchantCode mc = new MerchantCode();
        
        //生成支付验证码
        @SuppressWarnings("static-access")
        String strVerifyCode = mc.genMerchantCode(strKey, strDate, strBranchID, strCono, strBillNo, strAmount, strMerchantPara, strMerchantUrl, strPayerID, strPayeeID, strClientIP, strGoodsType, strReserved);
        
        request.getSession().setAttribute("strVerifyCode", strVerifyCode);
        request.getSession().setAttribute("order", order);
        request.getSession().setAttribute("totalAmount", totalAmount);
        request.getSession().setAttribute("strBranchID", strBranchID);
        request.getSession().setAttribute("strCono", strCono);
        request.getSession().setAttribute("strDate", strDate);
        request.getSession().setAttribute("strMerchantPara", strMerchantPara);
        request.getSession().setAttribute("strMerchantUrl", strMerchantUrl);
        
        return "payform";
    }
    
    /**
     * 接收招行支付结果信息
     * @return
     */
    public String result()
    {
        try
        {
            log.info("*****************************收到银行支付结果信息参数如下*****************************");
            String succeed = request.getParameter("Succeed");//取值Y(成功)或N(失败)
            String coNo = request.getParameter("CoNo");//商户号，6位长数字，由银行在商户开户时确定
            String billNo = request.getParameter("BillNo");//定单号(由支付命令送来)
            String amount = request.getParameter("Amount");//实际支付金额(由支付命令送来)
            String date = request.getParameter("Date");//交易日期(由支付命令送来)
            String msg = request.getParameter("Msg");//银行通知用户的支付结果消息。信息的前38个字符格式为：4位分行号＋6位商户号＋8位银行接受交易的日期＋20位银行流水号
            String merchantPara = request.getParameter("MerchantPara");//商户自己的参数
            String signature = request.getParameter("Signature");//银行用自己的Private Key对通知命令的签名
            
            StringBuffer resultMSG = new StringBuffer("");
            resultMSG.append("Succeed=" + succeed + "&");
            resultMSG.append("CoNo=" + coNo + "&");
            resultMSG.append("BillNo=" + billNo + "&");
            resultMSG.append("Amount=" + amount + "&");
            resultMSG.append("Date=" + date + "&");
            resultMSG.append("MerchantPara=" + merchantPara + "&");
            resultMSG.append("Msg=" + msg + "&");
            resultMSG.append("Signature=" + signature);
            log.info("*****************************收到银行支付结果信息如下：*****************************\r\n" + resultMSG.toString());
            Security security = new Security("C:\\PubKey\\CMBPK.key");//这里的参数为数字签名公钥文件路径名
            //if(security.checkInfoFromBank(resultMSG.toString()))//校验银行支付结果信息的合法性
            if(security.checkInfoFromBank(resultMSG.toString().getBytes("GB2312")))//校验银行支付结果信息的合法性
            {
                /**
                 * 如果支付结果信息合法
                 */
                request.getSession().setAttribute("succeed", succeed);
                request.getSession().setAttribute("coNo", coNo);
                request.getSession().setAttribute("billNo", billNo);
                request.getSession().setAttribute("amount", amount);
                request.getSession().setAttribute("date", date);
                request.getSession().setAttribute("msg", msg);
                request.getSession().setAttribute("merchantPara", merchantPara);
                request.getSession().setAttribute("signature", signature);
                
                if(null != succeed && succeed.equals("Y"))//如果支付成功
                {
                    /**
                     * 修改订单状态
                     */
                    Order order = orderService.getByNo(billNo);
                    if(null != order)
                    {
                        order.setOrderState(SystemConstants.ORDER_STAT_PAID);//修改订单状态为"3：已支付"
                        order.setPayTime(new Date());
                        order.setInfoFlow(order.getInfoFlow() + DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单支付成功;\r\t");
                        try
                        {
                            orderService.save(order);//更新订单至数据库
                            log.info("*****************************修改订单状态成功*****************************");
                            request.getSession().setAttribute("order", order);
                            return "paysuccess";
                        }
                        catch (Exception e)
                        {
                            e.printStackTrace();
                            return "upfaile";
                        }
                    }
                    else
                    {
                        log.error("---[BWQ]***库中无状态为\"2:已审核\"的对应订单号:" + billNo +"***");
                        return "error";
                    }
                }
                else
                {
                    log.error("---[BWQ]***支付失败***");
                    return "payfaile";
                }
            }
            else
            {
                log.error("---[BWQ]***支付结果信息非法***");
                return "payerror";
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return "payerror";
        }
    }
    
    private String getRemortIP()
    {
        if (request.getHeader("x-forwarded-for") == null)
        {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }
}