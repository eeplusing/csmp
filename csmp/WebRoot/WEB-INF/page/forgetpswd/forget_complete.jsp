<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    <title>忘记密码</title>
  
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
	<style type="text/css">
        div.main{
           width: 1310px;
	       margin: 10px auto;
	       overflow: hidden;
        }
	   div.mai_tan_top{
		    width: 100%;
		    height: 60px;
		    margin-top: 60px;
		}
		span.mai_tan {
		    margin-left: 180px;
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
		  margin-left: 700px;
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
	
	</style>
    <script type="text/javascript">
    
    //返回
       function backbut(){

			document.location.href="index.action";
					
          }
    </script>
  </head>
  <body>  
     <div class="main">
       <div class="mai_tan_top">
          <span class="mai_tan">卖炭网</span>
          <span class="user_reg">忘记密码</span>
       </div>
        <span class="table_hr"></span><br/><br/><br/><br/>
        <div style="background: #F3FDF6; height: 200px; "><br/><br/>
           <span style="margin-left:400px; font-size: 20px; font-weight: bold;">密码修改成功，请返回登录页面重新登录！</span><br/><br/>
           
           <input type="button" class="but_ton" onclick="backbut()" value="返  回"/><br/><br/>
        </div>
        <div class="footer">
           版权所有 &nbsp;&nbsp;卖炭网&nbsp;&nbsp;IPC备案号:正在申请中 &nbsp;&nbsp;技术支持:&nbsp;西安魔盾电气工程自动化研究所有限公司    
		</div>
     </div>
  </body>
</html>