<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<html>
  <head>   
    <title>登录</title> 
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    
    <style type="text/css">
       .main{
          width: 1000px;
          height: 700px;
          margin-top:100px;
          margin-left:450px;
          background: url("${pageContext.request.contextPath}/img/ad-beijing.png") no-repeat;
          border: 1px solid  #fff;
       }
       .cen_tre{
          width: 1000px;
          height: 84px;
          margin-top:313px;
          background: url("${pageContext.request.contextPath}/img/ad-bar.png") no-repeat -27px 0px;   
       }
       .log_in{
           width: 425px;
           height: 242px;
           margin-left:287px;
           margin-top:-166px;
           background: url("${pageContext.request.contextPath}/img/ad-back.png") no-repeat;
       }
       .login_name{
           width: 148px; 
           height: 26px; 
           margin-top:15px; 
           font-size:14px; 
           padding-left:30px; 
           border:none; 
           background: url("${pageContext.request.contextPath}/img/ad-count.png") no-repeat;
       }
       .login_passwd{
           width: 148px; 
           height: 26px; 
           margin-top:15px; 
           font-size:14px; 
           padding-left:30px; 
           border:none; 
           background: url("${pageContext.request.contextPath}/img/ad-password.png") no-repeat;
       }
       .login_button{
	        background: url("${pageContext.request.contextPath}/img/ad-cou.png") no-repeat;
			height: 21px;
			width: 109px;
			margin-top: 30px;
			border: none;
			cursor: pointer;
			margin-left: 250px;
       }
    </style>
<script type="text/javascript">

    //用户登录
		function login(){
          var loginAccount = $("#login_account").val();
          var loginPassword = $("#login_pswd").val();
       
            $.ajax({
			      url:"home_login.action",
				  data:"loginAccount=" + loginAccount + "&loginPassword=" +loginPassword,
				  type:"post", 
				  cache:false,
				  dataType:"text",
				  success:function(msg){
					  if(msg=="2"){
					      alert("帐户不存在");
					  }
					  if(msg=="3"){
					      alert("账户名密码不匹配");
					  }
					  if(msg=="4"){
					      alert("账户名密码不匹配");
					  }
					  if(msg=="5"){
					      alert("帐户不可用");
					  }
					  if(msg=="6"){
					      alert("帐户不可用");
					  }
					  if(msg=="0"){
					     //alert("登录成功");
					      document.location.href="manager_index.action";
					  }
					  if(msg=="7"){
					   // alert("登录成功");
					      document.location.href="index.action";
					  }
				  }
           	});
          }
   
</script>
  </head>
  
  <body>
	<div class="main">	  
	   <div class="cen_tre"></div>
	    <div class="log_in">
	       <div>
	          <ul>
	            <li>
	               <img src="${pageContext.request.contextPath}/img/ad-yonghu.png" style="width:53px; height: 16px; margin-left: 180px; margin-top: 90px" />
	               <input id="login_account" type="text" class="login_name" />
	            </li>
	            <li>
	                <img src="${pageContext.request.contextPath}/img/ad-mima.png" style="width:37px; height: 16px; margin-left: 195px; " />
	                <input id="login_pswd" type="password" class="login_passwd"/>
	            </li>
	            <li>
	               <input type="button" id="submit" onclick="login();" class="login_button" />
	            </li>
	          </ul>
	       </div>
	    </div> 
	</div>
  </body>
</html>
	