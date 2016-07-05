<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>pay_success</title>
    <meta name="CMBNETPAYMENT" content="China Merchants Bank">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <style type="text/css">
        body{
            margin: 0px;
            padding: 0px;
            border:0px solid #F00;
            overflow: auto;
        }
        .fullbg{
            background: #BFBFBF; 
            left: 0; 
            opacity: 0.5; /*CSS标准.该属性支持Firefox, Safari和 Opera.0.5表示透明度为50%*/
            position: absolute; 
            top: 0; 
            z-index: 3; 
            filter: alpha(opacity=50); /*透明度兼容IE6*/
            -moz-opacity: 0.5; /*透明度兼容老版本的Mozilla浏览器*/
            -khtml-opacity: 0.5; /*透明度兼容老版本的Safari浏览器*/
        }
        .dialog { 
	        background-color: #fff; 
	        border: 5px solid #999; 
	        width:400px;
	        height: 200px; 
	        left: 40%; 
	        margin: -200px 0 0 -100px; 
	        padding: 0px; 
	        position: fixed !important; /* 浮动对话框 */ 
	        position: absolute; 
	        top: 50%; 
	        z-index: 5; 
	        border-radius: 5px; 
	        display: none; 
	    }
	    .dialog p.close {
	        margin: 0 0 12px; 
	        height: 24px;
	        line-height: 24px;
	        background: #CCC;
	        text-align: right;
	        padding-right: 10px;
        } 
        .dialog p.close a { 
	        color: #fff;
	        text-decoration: none;
        } 
        .dialog_text{
            font-size: 14px;
            color: #999;
            line-height: 150%;
        }
    </style>
    <script type="text/javascript">
      function openSuccess(secs)
      {
         var bh = document.body.scrollHeight;//获取当前窗体的总高度
         var bw = $("body").width(); 
         $("#fullbg1").css({ 
             height:bh, 
             width:bw, 
             display:"block"
         });
         $("#dialog1").show();
         
         document.getElementById("jump").innerHTML = secs;
         if (--secs > 0){
           setTimeout("countDown(" + secs + " )", 1000);
         }else{
           location.href="order_info.action?orderId="+${order.orderId};
           closeBg();
         }
      }
      
      //关闭灰色 jQuery 遮罩 
       function closeBg() { 
           $("#fullbg1,#dialog1").hide(); 
       }
    </script>
  </head>
  
  <body onload="openSuccess(10);">
	  <br>支付成功
	  
	  <div align="center">
	   <div id="fullbg1" class="fullbg"></div>
	   <div id="dialog1" class="dialog">
	   <!-- <p class="close">
		<a href="#" onclick="closeBg();" title="关闭"><font size="5px">×</font></a>
	     </p> -->
	    <div align="center">
	     <table id="tableForm" align="center" style="margin-top: 10px;">
	      <tr style="height: 90px;">
	        <td><img alt="" src="${pageContext.request.contextPath}/images/accept.png" width="40px" height="40px"></td>
	        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight:900; color: blue; font-size:25px;">支付成功!</font></td>
	      </tr>
          <tr>
           <td align="center" colspan="2">
                                    系统将在<font color="red"><span id="jump"></span></font>秒后返回到订单详情页面,如果没有请<a href="order_info.action?orderId=${order.orderId}">点击手动跳转</a>
           </td>
          </tr>
         </table>
       </div>        
	 </div>
    </div>
  </body>
</html>