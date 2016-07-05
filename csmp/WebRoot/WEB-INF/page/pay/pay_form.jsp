<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>结算表单</title>
    <script type="text/javascript">
        window.onload = function(){
            document.forms[0].submit();//提交表单
        };
    </script>
  </head>
  
  <body>
    <form action="https://netpay.cmbchina.com/netpayment/BaseHttp.dll?PrePayC2" method="post">
    	<input type="hidden"  name="BranchID" value="${strBranchID}">
        <input type="hidden" name="CoNo" value="${strCono}">
        <input type="hidden" name="Date" value="${strDate}">
        <input type="hidden" name="BillNo" value="${order.orderNo}">
        <input type="hidden" name="Amount" value="${totalAmount}">
        <input type="hidden" name="MerchantPara" value="${strMerchantPara}">
        <input type="hidden" name="MerchantUrl" value="${strMerchantUrl}">
        <input type="hidden" name="MerchantCode" value="${strVerifyCode}">
    </form>
  </body>
</html>
