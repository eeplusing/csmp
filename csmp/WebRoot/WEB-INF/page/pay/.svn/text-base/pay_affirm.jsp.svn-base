<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>结算表单</title>
    
  </head>
  
  <body>
    <form action="pay_index.action" method="post">
        支付信息：订单号<font color="red" size="10">${order.orderId}</font>,支付总金额<font color="red" size="10">￥${order.totalPrices}</font>元
        <br>请先进行确认，无误后在进行支付
        <input type="hidden" name="orderId" value="${order.orderId}">
        <br><br><br><input type="submit" value="立即支付">
    </form>
  </body>
</html>
