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
        .form-text {		 
			border: 1px solid #707070; 
			border-image: none; 
			width: 230px; 
			height: 30px; 
			line-height: 17px; 
			font-size: 14px; 
			
		}
		.form-text:focus {
			border-color: #229BF9;
		}
		.form-code{
		    width: 115px; 
			height: 30px; 
			line-height: 17px; 
			font-size: 14px
		}
		input.code_button{
		   width: 108px; 
		   height: 28px;
		   background: #FF4001;
		   color: #FFF;
		   font-size:14px;
		   font-weight:bold;
		   border: none;
		   cursor: pointer;
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
		  margin-left: 50px;
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
      
      //获取验证码   
         function getSmscode(){
           wait_click();
           var phoneNo = $("#phone").val().replace(/(^\s*)|(\s*$)/g, "");
            if(phoneNo == null || phoneNo == "" || phoneNo.length == 0){
                alert("请输入手机号码！");
                return false;
            }
            $.ajax({
			    url:"home_sendCode.action",
			    data: "&phoneNo=" + phoneNo,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				 if(msg == 1){
				   alert("获取成功");
				 }
				}
			});
        }
      
       //倒计时 
         function wait_click(){
             $("#smsbot").css("display", "none");
             $("#wait_sms").css("display", "inline");
             var wait_time = 60;
             $("#wait_sms").text("60秒后可以重发");
             var timer = setInterval(function(){
                $("#wait_sms").text((--wait_time) + "秒后可以重发");
                if(wait_time <= 1){
                    clearInterval(timer);
                    $("#smsbot").css("display", "inline");
                    $("#wait_sms").css("display", "none").text("");
                }
             }, 1000);
          }
         //确定  
         function confirm() 
          {
            var phone = $("#phone").val().replace(/(^\s*)|(\s*$)/g, "");
            var smsCode = $("#smsCode").val().replace(/(^\s*)|(\s*$)/g, "");
            var isMobile=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/;//手机号码验证规则
           if(phone == null){ 
   	         alert("电话号码不能为空！");
   	         $("#phone").focus();//输入框获得光标
   	        return false;
   	         }
            if(!isMobile.test(phone)){ 
           	 alert("请填写正确电话号码!");       	
           	 $("#phone").focus();//输入框获得光标
           	 return false;
            }

           if(smsCode==null){
          	 alert("验证码不能为空！");
          	 $("#phone").focus();//输入框获得光标
          	 return false;
           }
            
            $.ajax({
   			    url:"forget_forgetPassword.action",
   			    data: "phone="+phone + "&smsCode=" + smsCode,
   				type:"post", 
   				cache:false,
   				dataType:"text",
   				success:function(msg){
   					
   			       if(msg == 1){
   				     alert("验证码不正确");	           
   				   }
   				   if(msg == 2){
   				     alert("验证码过时,请重新获取");
   				   }
   				   if(msg == 3){
     				  alert("您的账户不存在");
     			   }
   				   if(msg==0){
   					  document.location.href="forget_Phone.action?phone="+phone;
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
		   <li ><i>2</i><span class="tsl" data-phase-id="r_p_fillUserInfo">重置登录密码</span></li>	
		   <li ><i class="iconfont">√</i><span class="tsl" data-phase-id="r_p_regSuc">完成</span></li>
	     </ol>
	     <div style="clear: both;"></div>
	   </div>
       <div class="ph_list">
           <input type="hidden" value="${user}"/>
           <span>手机号码</span>&nbsp; 
           <input class="form-text" name="phone" id="phone" type="text"/><br/><br/>   
           
           <span style="margin-left: 15px;">验证码</span>&nbsp; 
           <input class="form-code" name="smsCode" id="smsCode" type="text" />
                    
           <input type="button" class="code_button" value="获取验证码" onclick="getSmscode();"/> 
		   <p id="wait_sms" style="font-size:12px; display:none;"></p><br/>
			
		   <input type="button" value="确  定" class="confirm" onclick="confirm();"/>
           <div style="clear: both;"></div>
       </div>
       
        <div class="footer">
           版权所有 &nbsp;&nbsp;卖炭网&nbsp;&nbsp;IPC备案号:正在申请中 &nbsp;&nbsp;技术支持:&nbsp;西安魔盾电气工程自动化研究所有限公司   
		</div>
	 </div>
  </body>
</html>