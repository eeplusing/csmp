<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    <title>忘记密码</title>
  
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script> 
     <script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
	<style type="text/css">
      #main{
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
         div.steps {
		    height: 46px; 
		    border-bottom: 2px solid #E6E6E6; 
		}
		div.steps ol {
			margin-left: 420px;
			width: 540px;
		}
		div.steps ol li {
			width: 170px; 
			height: 46px; 
			color: #999; 
			line-height: 46px; 
			padding-left: 70px; 
			font-family: "微软雅黑","华文细黑","黑体",arial; 
			font-size: 16px; 
			font-weight: bold; 
			float: left; 
			display: inline;
		}
		div.steps ol li i {
			background: url("${pageContext.request.contextPath}/img/ico-circle2.png") no-repeat 0px 0px; 
			width: 24px; 
			height: 24px; 
			text-align: center; 
			color: #FFF; 
			line-height: 24px; 
			font-size: 14px; 
			font-style: normal; 
			font-weight: bold; 
			margin-right: 5px; 
			display: inline-block; 
			-ms-zoom: 1;
		}
		div.steps ol li.active {
			color: #3E3E3E; 
			border-bottom: 2px solid #F40;
		}
		div.steps ol li.active i {
			background-image: url("${pageContext.request.contextPath}/img/ico-circle1.png");
		}
		div.steps-4 ol li {
			width: 150px; 
			padding-left: 30px;
		}
		div.ph_list{
		   margin-top: 90px;
		   margin-left: 495px;
		  
		}
          .inputClass {		 
			border: 1px solid #707070; 
			border-image: none; 
			width: 230px; 
			height: 30px; 
			line-height: 17px; 
			font-size: 14px; 
			
		}
		.inputClass:focus {
			border-color: #229BF9;
		}
        input.confirm {
	      background:#FF4001;
          color:#FFF;
          font-size:16px;
          font-weight:bold;
		  height:35px;
		  width: 180px;
		  border: none;
		  cursor: pointer;
		  margin-top:30px;
		  margin-left: 120px;
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
	  
     function button() 
      {
        var phone = $("#phone").val().replace(/(^\s*)|(\s*$)/g, "");
        var password = $("#password").val().replace(/(^\s*)|(\s*$)/g, "");
        var newPassWord=$("#newPassWord").val().replace(/(^\s*)|(\s*$)/g, "");
      
        if(phone == null){ 
	         alert("电话号码不能为空！");
	         $("#phone").focus();//输入框获得光标
	        return false;
	        }
        if(password == null){ 
	         alert("电话号码不能为空！");
	         $("#password").focus();//输入框获得光标
	        return false;
           }
        if(password != newPassWord){ 
	         alert("您两次出入的密码不一致");
	         $("#newPassWord").focus();//输入框获得光标
	        return false;
          }
        if(newPassWord == null){ 
	         alert("电话号码不能为空！");
	         $("#newPassWord").focus();//输入框获得光标
	        return false;
          }

        $.ajax({
			    url:"forget_resetPassword.action",
			    data:"phone="+phone+"&password="+password,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				 if(msg==0){
					 document.location.href="forget_Password.action";
				 }
				}
			}); 
       }
     
	</script>
  </head>
  <body >  
     <div id="main">
       <div class="mai_tan_top">
          <span class="mai_tan">卖炭网</span>
          <span class="user_reg">忘记密码</span>
       </div>
       <div class="steps steps-4">
	     <ol>
		   <li class="active" ><i>1</i><span class="tsl" data-phase-id="r_p_createAccount">验证身份</span></li>
		   <li class="active" ><i>2</i><span class="tsl" data-phase-id="r_p_fillUserInfo">重置登录密码</span></li>	
		   <li ><i class="iconfont">√</i><span class="tsl" data-phase-id="r_p_regSuc">完成</span></li>
	     </ol>
	     <div style="clear: both;"></div>
	   </div>
       <div class="ph_list">
           <input type="hidden" value="${usePhone}" id="phone"/>            
           <span >&nbsp; &nbsp; &nbsp; 新的登录密码:</span>&nbsp;
           <input id="password" type="password" name="newPassWord" class="inputClass" value="" /><br/><br/><br/>
            
           <span>确认新的登录密码:</span>&nbsp;
           <input id="newPassWord" type="password" name="newPassWord" class="inputClass" value="" /><br/>
		   <input type="button" value="确 定" onclick="button()" class="confirm" />
       </div> 
        <div class="footer">
           版权所有 &nbsp;&nbsp;卖炭网&nbsp;&nbsp;IPC备案号:正在申请中&nbsp;&nbsp;技术支持:&nbsp;西安魔盾电气工程自动化研究所有限公司   
		</div>
	 </div>
  </body>
</html>