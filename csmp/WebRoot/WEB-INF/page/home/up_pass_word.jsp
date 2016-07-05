<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    <title>注册页面</title>
  
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
  <style type="text/css">
    input.ti_jiao{
     border:none; 
     background:#FC9; 
     width: 80px; 
     height:30px;  
     font-size: 15px; 
     font-weight: bold; 
     padding-top: 1px; 
     display:block; 
     margin: 5px auto;
     text-align: center;
    }
       
  </style>
	
	 <script type="text/javascript">
      function button(){
            var oldps = $("#oldps").val();
            var newps = $("#newps").val();
            var newps1 = $("#newps1").val();
          
	         if(oldps == ""){
	          alert("旧密码不能为空");
	          return false;
	           }
	         if(newps==""){
	            alert("新密码不合法");
	           return false;
	          }
	         if(newps==""){
	           alert("确认密码不能为空");
	            return false;
	         } 
	         
	          if(newps != newps1){
	            alert("两次输入的密码不一致！");
	           return false;
	          }
	          	      
	        $.ajax({
			    url:"home_updatePassWord.action",
			    data: "&newps=" + newps,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				    alert(msg);
				 //  document.location.href="#";
				}
			});
        }
	</script>
  </head>
  <body>
         <div style="text-align: center; padding-top:50px;">
             <span style="margin-right: 10px;">旧密码<fond color="red">*</fond></span> 
             <input id="oldps" type="text" name="oldPassWord" value=""/><br/>
             
           <span style="margin-right: 10px;">新密码<fond color="red">*</fond></span>
             <input id="newps" type="text" name="newPassWord" value=""/><br/>
             
           <span style="margin-right: 35px;">确认新密码<fond color="red">*</fond></span>
             <input id="newps1" type="text" name="newPassWord" value=""/><br/>
         </div>
           <input type="button" value="确  定"  class="ti_jiao" onclick="button()"/>
    
 </body>
</html>