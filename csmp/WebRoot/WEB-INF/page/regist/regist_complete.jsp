<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    <title>注册页面</title>
  
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
	<style type="text/css">
 
		div.mai_tan_top{
		    margin-left: 365px;
		    padding-top: 60px;
		}
		span.mai_tan {
	        font-size: 36px; 
	        font-weight: bold; 
	        color: #FF4001; 
	        font-family: Courier New;
        }
        span.user_reg {
	        font-size: 26px; 
	        font-weight: bold;
        }
 
        span.table_hr{
          border: 1px solid #f0f0f0; 
        }
        div.footer{
	        border-top: 1px solid #CCC;
		    bottom:0;
		    width:1310px;
		    height:80px;
		    line-height:80px;
		    text-align:center;
		    font-size: 12px;
		    color: #5D6B7A;   
		}
		input.but_ton{  
	      background:#FF4001;
          color:#FFF;
          font-size:14px;
          font-weight:bold;
		  height:25px;
		  width: 80px;
		  border: none;
		  cursor: pointer;
		  margin-top:30px;
		  margin-left: 900px;
		}
	</style>
    <script type="text/javascript">
    
    //返回
       function backbut(){

			document.location.href="index.action";
					
          }
    </script>
  </head>
  <body onload="showBg()">  
     <div id="Main">
       <div class="mai_tan_top">
          <span class="mai_tan">卖炭网</span>
          <span class="user_reg">用户注册</span>
       </div>
        <span class="table_hr"></span><br/><br/><br/><br/>
        <div style="background: #F3FDF6; height: 200px;"><br/><br/>
           <span style="margin-left:700px; font-size: 20px; font-weight: bold;">恭喜注册成功！您的账户为:</span><br/><br/>
           <span style="margin-left:700px; font-size: 14px;">登录名:  ${userPhone}</span>&nbsp;&nbsp;<br/><br/>
           <input type="button" class="but_ton" onclick="backbut()" value="返  回"/><br/><br/>
        </div>
        <div class="footer">
           版权所有 &nbsp;&nbsp;  卖炭网&nbsp;&nbsp;  IPC备案号:正在申请中 &nbsp;&nbsp; 
           技术支持:<a href="javascript:void(0);">西安魔盾电气工程自动化研究所有限公司</a>    
		</div>
     </div>
  </body>
</html>