<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    <title>注册页面</title>
  
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
	   li{
         list-style-type:none;
         }
       input.prot{
         background:#FF4001;
         color:#FFF;
		 height:30px;
		 width: 180px;
		 border: none;
		 cursor: pointer;
		 margin-left: 270px;
       }
       .fullbg {
		  background: #BFBFBF;
		  left: 0;
		  opacity: 0.5; /*CSS标准.该属性支持Firefox, Safari和 Opera.0.5表示透明度为50%*/
		  position: absolute;
		  top: 0;
		  z-index: 3;
		  filter: alpha(opacity = 50); /*透明度兼容IE6*/
		  -moz-opacity: 0.5; /*透明度兼容老版本的Mozilla浏览器*/
		  -khtml-opacity: 0.5; /*透明度兼容老版本的Safari浏览器*/
		}

		.dialog {
			background-color: #fff;
			border: 2px solid #FF4001;
			width: 726px;
			height: 435px;
			padding: 0px;
			position: fixed !important; /* 浮动对话框 */
			position: absolute;
			z-index: 5;
			border-radius: 5px;
			display: none;
		}

		.dialog p.close {
			margin: 0 0 12px;
			height: 24px;
			line-height: 24px;
			background: #FF4001;
			text-align: right;
			padding-right: 10px;
		}
		.dialog p.close label{
		    float: left;
		    font-size: 16px;
		    font-weight:bold;
		    text-align: left;
		}
		.dialog p.close a {
			color: #000;
			font-size: 18px;
			text-decoration: none;
		}
		
	    #dialog_text {
		    border: 0px solid #0F0;
			font-size: 14px;
			color: #555;
			line-height: 150%;
		}
		div.mai_tan_top{
		    width: 100%;
		    height: 60px;
		    margin-top: 60px;
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
    
        span.table_hr{
          border: 1px solid #f0f0f0; 
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
		.text-input-refer {
			width: 1px; 
			height: 32px; 
			vertical-align: middle; 
			display: inline-block; 
			-ms-zoom: 1;
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
       input.next_step {
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
		.eva_title{
		  font-size: 16px;
		  font-weight: bold;
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
     
	    function showBg() {
	    	CsmpJS.showBG("fullbg","dialog", 0, 0);
         }
         
         //不同意协议
       function proto() { 
           document.location.href="index.action"; 
        }
          
          //同意协议（关闭灰色 jQuery 遮罩）
       function closeBg(){ 
            $("#fullbg,#dialog").hide();
            $("#but").val("");
      
		}
      
	 //下一步   
      function nextStep() 
       {
         var phone = $("#phone").val().replace(/(^\s*)|(\s*$)/g, "");
         var smsCode = $("#smsCode").val().replace(/(^\s*)|(\s*$)/g, "");
         var isMobile=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/;//手机号码验证规则
       // var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;   //座机验证规则
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
        //  if(!isPhone.test(phone)){ 
        // 	 alert("不支持座机，请用手机号进行注册！");
        // 	 $("#phone").focus();//输入框获得光标
        //  	  return false;
        //  }
        if(smsCode==null){
        	 alert("验证码不能为空！");
        	 $("#phone").focus();//输入框获得光标
        	 return false;
         }
         
         $.ajax({
			    url:"regist_usePhone.action",
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
				 if(msg==0){
					 document.location.href="regist_addPhone.action?phone="+phone;
				 }
				}
			}); 
       }
          
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
             var wait_time = 300;
             $("#wait_sms").text("300秒后可以重发");
             var timer = setInterval(function(){
                $("#wait_sms").text((--wait_time) + "秒后可以重发");
                if(wait_time <= 1){
                    clearInterval(timer);
                    $("#smsbot").css("display", "inline");
                    $("#wait_sms").css("display", "none").text("");
                }
             }, 1000);
          }
       
       var mdiv, b, c;
       $(function(){
    	   $("#cjs_m_top").mousedown(function(e){
    		   mdiv = $("#dialog");
   			   var left = $("#dialog").css("left").replace("px", "")*1;
   			   var top = $("#dialog").css("top").replace("px", "")*1;
   			   document.all?mdiv.setCapture():window.captureEvents(Event.MOUSEMOVE);
               b=e.clientX-left;
               c=parseInt(e.clientY)-parseInt(top);
   		   });
    	   window.document.addEventListener("mousemove", function(e){
   			    if(!mdiv){
                   return;
                }
   			    $(mdiv).css({"left":e.pageX-b, "top":e.pageY-c});
   		   }, false);
   		   window.document.addEventListener("mouseup", function(e){
   			   if(!mdiv){
                   return;
               }
               document.all?mdiv.releaseCapture():window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);
               mdiv="";
   		   }, false);
       });
	</script>
  </head>
  <body onload="showBg();">  
     <div id="main">
       <div class="mai_tan_top">
          <span class="mai_tan">卖炭网</span>
          <span class="user_reg">用户注册</span>
       </div><br/><br/>
       <div class="steps steps-4">
	     <ol>
		   <li class="active" ><i>1</i><span class="tsl" data-phase-id="r_p_createAccount">设置登录名</span></li>
		   <li ><i>2</i><span class="tsl" data-phase-id="r_p_fillUserInfo">填写账户信息</span></li>	
		   <li ><i class="iconfont">√</i><span class="tsl" data-phase-id="r_p_regSuc">注册成功</span></li>
		   <div style="clear: both;"></div>
	     </ol>
	   </div>
        <span class="table_hr"></span>
        <div style="padding-top: 100px;width: 385px; margin: 0px auto; ">
            <span>手机号码</span>&nbsp; 
            <input class="form-text" name="phone" id="phone" type="text"  placeholder="请输入您的手机号码" /><br/><br/> 
            
            <span style="margin-left: 15px;">验证码</span>&nbsp; 
            <input class="form-code" name="smsCode" id="smsCode" type="text" /> 
            
            <input type="button" class="code_button" value="获取验证码" onclick="getSmscode();"/> 
			<p id="wait_sms" style="font-size:12px; display:none;"></p><br/>
		  
            <input type="button" value="下一步" class="next_step" name="nextStep" id="nextStep" onclick="nextStep();"/>
        </div>
        <div class="footer">
           版权所有 &nbsp;&nbsp;  卖炭网&nbsp;&nbsp;  IPC备案号:正在申请中 &nbsp;&nbsp; 
           技术支持:&nbsp;西安魔盾电气工程自动化研究所有限公司   
		</div>
     </div>
 
      <!-- 注册协议 -->
	  <div >
		 <div id="fullbg" class="fullbg"></div>
			<div id="dialog" class="dialog">
			   <p class="close" id="cjs_m_top">
				  <a href="javascript:void(0);" onclick="proto();" title="关闭">×</a>
			   </p>
			   <div id="dialog_text">
					<p class="eva_title">注册协议</p><br/>
				  <div>
				    <ul style="font-size: 12px; margin-left: 15px;line-height:25px;">
				      <li>
				          <span style="font-weight: bold;">【审慎阅读】</span>您在申请注册流程中点击同意前，应当认真阅读以下协议。
				          <span style="font-weight: bold;text-decoration:underline;">请您务必审慎阅读、充分理解协议中相关条款内容，其中包括：</span>
				      </li>
				      <li style="font-weight: bold; text-decoration: underline;">1、与您约定免除或限制责任的条款；</li>
				      <li style="font-weight: bold; text-decoration: underline;">2、与您约定法律适用和管辖的条款；</li>
				      <li>如您对协议有任何疑问，可向平台客服咨询。</li>
				      <li><span style="font-weight: bold;">【特别提示】</span>
				          当您按照注册页面提示填写信息、阅读并同意协议且完成全部注册程序后，即表示您已充分阅读、
				          理解并接受协议的全部内容。如您因平台服务与淘宝发生争议的，适用《卖炭网注册协议及法律条款》处理。
				          如您在使用平台服务过程中与其他用户发生争议的，依您与其他用户达成的协议处理。
				      </li>
				      <li style="font-weight:bold; text-decoration: underline;">阅读协议的过程中，如果您不同意相关协议或其中任何条款约定，您应立即停止注册程序。</li>
				      <li><a href="regist_sellCarbon.action" target="_blank" style="font-size: 14px; color: red; font-weight: bold;">《卖炭网注册协议及法律条款》</a></li>
				      <!-- <li><a href="javascript:void(0);" style="font-size: 14px; color: red; font-weight: bold;">《隐私权协议》</a></li> -->
				    </ul>
				  </div><br/><br/>	
					<input type="button" value="同意协议" id="but" class="prot" onclick="closeBg();">
			   </div>
			</div>
	  </div>
  </body>
</html>