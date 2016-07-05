<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>卖炭网-首页</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/csmp/home.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/js/csmp/index.js"></script>

<style type="text/css">
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
	border: 5px solid #999;
	width: 550px;
	height: 330px;
	left: 40%;
	margin: -200px 0 0 -200px;
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

.dialog_text {
	font-size: 14px;
	color: #999;
	line-height: 150%;
}

.eva_title {
	margin-left: 20px;
	font-size: 16px;
	font-weight: bold;
	color: #999;
}

.eva_acount {
	display: block;
	width: 430px;
	margin: 5px 0px 5px 95px;
	height: 210px;
	font-size: 14px;
	color: #333;
	line-height: 150%;
}

#dialog_text_2 input,#dialog_text_3 input {
	margin-left: 95px;
	margin-top: 5px;
	width: 430px;
	height: 30px;
	color: #333;
	font-size: 14px;
	border: none;
	background: #CCC;
	cursor: pointer;
}

#dialog_text_3 span,select {
	height: 20px;
	font-size: 14px;
	color: #555;
	display: inline;
}

#dialog_text_3 select {
	width: 430px;
	border: 1px solid #999;
}

#dialog_text_3 span {
	margin-left: 20px;
}

#FloatDIV {
	position: absolute;
	width: 80px;
	height: 100px;
	top: 0px;
	border: activeborder 0px solid;
	z-index: 2
}

#FloatDIV img {
	width: 80px;
	height: 100px;
	cursor: pointer;
}

#dialog_5 input,#dialog_6 input {
	width: 235px;
	height: 26px;
	border: 1px solid #d9d9d9;
	padding-top: 4px;
	padding-left: 8px;
}

.dia5_input {
	width: 235px;
	height: 26px;
	border: 1px solid #d9d9d9;
	padding-top: 4px;
	padding-left: 8px;
}

.yzm {
	width: 90px;
	height: 26px;
	border: 1px solid #d9d9d9;
	vertical-align: middle;
	margin-right: 10px;
	padding-top: 4px;
	padding-left: 8px;
}

.loginTop {
	color: #696969;
	font-size: 20px;
	font-weight: 900;
}
/* 登录 */
.dialog2 {
	background: url("${pageContext.request.contextPath}/img/login-back2.png") no-repeat;
	width: 740px;
	height: 414px;
	left: 40%;
	padding: 0px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 50%;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

.dialog1 p.close {
	margin: 0 0 12px;
	height: 24px;
	line-height: 24px;
	background: #CCC;
	text-align: right;
	padding-right: 10px;
}

.dialog1 p.close a {
	color: #fff;
	text-decoration: none;
}

td.tdText {
	text-align: right;
}

td.tdInput {
	width: 370px;
}

td.tdInput input {
	float: left;
	margin-right: 5px;
}

input.login_button {
	background: url("${pageContext.request.contextPath}/img/login-on0.png") no-repeat;
	height: 43px;
	width: 299px;
	margin-top: 30px;
	border: none;
	cursor: pointer;
}

#leftsead{position:fixed;top:258px;right:0px;}
#leftsead li img{float:right;}
</style>
<script type="text/javascript">
        $(function(){
		    //用户名
		    $("#login_account").focus(function(){
		        $(this).css("border", "none").css("background", "url('${pageContext.request.contextPath}/img/login-user0.png') no-repeat");
		    });
		    
		    $("#login_account").blur(function(){
		        if($(this).val().replace(/(^\s*)|(\s*$)/g, "") == ""){
		            $(this).val("");
		            $(this).css("border", "none").css("background", "url('${pageContext.request.contextPath}/img/login-user.png') no-repeat");
		        }
		    });
		    
		    //密码
		    $("#login_pswd").focus(function(){
		        $(this).css("border", "none").css("background", "url('${pageContext.request.contextPath}/img/login-password0.png') no-repeat");
		    });
		    
		    $("#login_pswd").blur(function(){
		        if($(this).val().replace(/(^\s*)|(\s*$)/g, "") == ""){
		            $(this).val("");
		            $(this).css("border", "none").css("background", "url('${pageContext.request.contextPath}/img/login-password.png') no-repeat");
		        }
		    });		    
        });
        
        function open_customer(){
			window.open("open_customer.action", "customer", "width=320, height=750px, toolbar=no, menubar=no, resizable=no, location=no, status=no");
		}
        
        function showBg(oid) {
            var bh = document.body.scrollHeight;//获取当前窗体的总高度
           var bw = $("body").width(); 
            $("#fullbg").css({ 
                height:bh, 
                width:bw, 
                display:"block" 
            });
            $("#dialog").show();
            $.ajax({
			    url:"order_flowInfo.action?orderId=" + oid,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				    $("#dialog_text").html(msg);
				}
			});
        }
        
        function showBg2(oid) {
            $("#orderId").val(oid);
            var bh = document.body.scrollHeight;//获取当前窗体的总高度
            var bw = $("body").width(); 
            $("#fullbg_2").css({ 
                height:bh, 
                width:bw, 
                display:"block"
            });
            $("#dialog_2").show();
        }
        
        function cancel(oid){
            $("#orderId").val(oid);
            var bh = document.body.scrollHeight;//获取当前窗体的总高度
            var bw = $("body").width(); 
            $("#fullbg_3").css({ 
                height:bh, 
                width:bw, 
                display:"block"
            });
            $("#dialog_3").show();
        }
         
        
        //关闭灰色 jQuery 遮罩 
       function closeBg() { 
            $("#fullbg,#dialog,#fullbg_2,#dialog_2,#fullbg_3,#dialog_3,#fullbg_4,#dialog_4,#fullbg_6,#dialog_6,#fullbg_7,#dialog_7").hide();
            $("#dialog_text").html("");
            $("#eva_acount").val("");
            $("#orderId").val("");
            $("#cancel_reason").val("0");
            $("#other_reason").val(""); 
            $("#loginAccount").val("");
            $("#loginPassword").val("");
            $("#randCode").val("");         
            $("#userName").val("");
            $("#loginAccount").val("");
            $("#loginpass").val("");
            $("#reloginpass").val("");
            $("#userPhone").val("");
            $("#email").val("");  
            $("#oldps").val("");
            $("#newps").val("");
            $("#newps1").val("");
        }
        
        function save_eva(){
            var eva_acount = $("#eva_acount").val().replace(/(^\s*)|(\s*$)/g, "");
            var orderId = $("#orderId").val();
            if(eva_acount == null || eva_acount == "" || eva_acount.length == 0){
                alert("评价内容不可为空！");
                return false;
            }else{
                $.ajax({
                    type: "POST",
				    url: "order_addEva.action",
				    data: "orderId=" + orderId + "&eva_acount=" + eva_acount,
				    dataType: "text",
				    success: function(msg){
				        alert(msg);
				        closeBg();
				        if(window){
				            window.frames[0].location.reload();//刷新第一个子页面
				        }else{
				            win.frames[0].location.reload();
				        }
				    }
                });
            }
        }
        
        function can_write(){
            var reason = $("#cancel_reason").val();
            if(reason == 4){
                $("#other_reason").css("display", "block");
            }else{
                $("#other_reason").val("");
                $("#other_reason").css("display", "none");
            }
        }
        
        function apply_cancel(){
            var reason = $("#cancel_reason").val();
            var other_reason = $("#other_reason").val().replace(/(^\s*)|(\s*$)/g, "");
            if(reason == 0){
                alert("您尚未选择取消原因！");
                return false;
            }else if(reason == 4){
                if(other_reason == null || other_reason == "" || other_reason.length == 0){
                    alert("请输入取消原因！");
                    return false;
                }else{
                    reason = other_reason;
                }
            }
            var orderId = $("#orderId").val();
		    $.ajax({
				type : "POST",
				url : "order_cancel.action",
				data : "orderId=" + orderId + "&reason=" + reason,
				dataType : "text",
				success : function(msg) {
					alert(msg);
					closeBg();
					if (window) {
						window.frames[0].location.reload();//刷新第一个子页面
					} else {
						win.frames[0].location.reload();
					}
				}
			});
		}
		
		function showLogin() {
            CsmpJS.showBG("fullbg_4","dialog_4", 0, 0);
        }
		
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
					      alert("帐户已经在线");
					  }
					  if(msg=="0"){
					     //alert("登录成功");
					      document.location.href="manager_index.action";
					  }
					  if(msg=="7"){
					   // alert("登录成功");
					    document.location.href="index.action";
					  }
					  if(msg=="8"){
					   alert("你的账户被冻结！");
					  }
					  if(msg=="9"){
					   alert("你的账户不存在！");
					  }
				 }
          	});
          }
         function showRegist() {
             CsmpJS.showBG("fullbg_5","dialog_5", 0, 0);
         }
        
         function save(){ 
             var username = $("#username").val().replace(/(^\s*)|(\s*$)/g, "");
             var companyname = $("#companyname").val().replace(/(^\s*)|(\s*$)/g, "");
             var loginaccount = $("#loginaccount").val().replace(/(^\s*)|(\s*$)/g, "");
             var loginpass = $("#loginpass").val().replace(/(^\s*)|(\s*$)/g, "");
             var reloginpass = $("#reloginpass").val().replace(/(^\s*)|(\s*$)/g, "");//确认密码
            var userPhone = $("#userPhone").val().replace(/(^\s*)|(\s*$)/g, "");
             var email = $("#email").val().replace(/(^\s*)|(\s*$)/g, "");
             //var smsCode = $("#smsCode").val().replace(/(^\s*)|(\s*$)/g, "");
	        if(username == ""){
	             alert("用户姓名不能为空");
	             return false;
	         }
	         if(loginaccount==""){
	             alert("登录账号不合法");
	             return false;
	         }
	         if(loginpass==""){
	             alert("登录密码不能为空");
	             return false;
	         }
	         if(loginpass != reloginpass){
	             alert("两次输入的密码不一致！");
	             return false;
	         }
	          
	         if(userPhone==""){
	             alert("电话号码不能为空");
	             return false;
	         }
	         if(email==""){
	             alert("邮箱不能为空");
	             return false;
	         }
	         //if(smsCode==""){
	         //    alert("请输入手机验证码");
	          //   return false;
	         //}
	        
	         $.ajax({
			     url:"home_addUser.action" ,
			     data: "username=" + username + "&companyname=" + companyname + "&loginaccount=" + loginaccount + "&loginpass=" + loginpass + "&userPhone=" + userPhone + "&email=" + email,
				 type:"post", 
				 cache:false,
				 dataType:"text",
				 success:function(msg){
				     if(msg=="1"){
				         alert("注册成功");
				         document.location.href="index.action";
				     }else if(msg=="0"){
				         alert("验证码不对");
				     }else if(msg=="2"){
				         alert("账号已经存在");
				     }else if(msg=="3"){
				         alert("注册失败");
				     }
				}
			});
        }
        
        function showUpdatePassW() {
            var bh = document.body.scrollHeight;//获取当前窗体的总高度
           var bw = $("body").width(); 
            $("#fullbg_6").css({ 
                height:bh, 
                width:bw, 
                display:"block"
            });
            $("#dialog_6").show();
        }
        
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
			    data: "oldps=" + oldps + "&newps=" + newps,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				   if(msg == "0"){
				       alert("密码修改成功");
				       closeBg();
				   }else if(msg == "1"){
				       alert("旧密码错误");
				   }else if(msg == "2"){
				       alert("操作失败"); 
				   }
				}
			});
          }

        function setHeight()
        {
            var h;
            if(window.document.documentElement)
                h = window.document.documentElement.scrollHeight;
            else
              h = window.document.body.scrollHeight;
            window.parent.document.getElementById("mpage").style.height=h+ "px";
         }
         
         
        function showUpdateInfo(){ 
        
           CsmpJS.showBG("fullbg_7","dialog_7", 120, 200);
            
	       $.ajax({
			type : "POST",
			url : "home_updateInfo.action",
			dataType : "text",
			success : function(msg) {   
			   var user = eval('(' + msg + ')');
			    $("#login_at").text(user.loginAccount);
			    $("#user_name").val(user.userName);
			    $("#user_phone").val(user.userPhone);
			    $("#company_name").val(user.companyName);
			    $("#up_email").val(user.email);
			  }
		   });
	    }
  
        //信息修改
       function butInfo(){
            var userName = $("#user_name").val();
            var userPhone = $("#user_phone").val();
            var companyName = $("#company_name").val();
            var email = $("#up_email").val();
	        $.ajax({
			    url:"home_upInfo.action",
			    data: "&userName=" + userName  +"&userPhone=" + userPhone +"&companyName=" + companyName +"&email=" + email,
				type:"post", 
			    cache:false,
				dataType:"text",
				success:function(msg){
				    alert(msg);
				    closeBg();
				}
			});
        }
        
        
        function get_smscode(){
            //CsmpJS.loading();
            wait_click();
            var phoneNo = $("#userPhone").val().replace(/(^\s*)|(\s*$)/g, "");
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
				}
			});
        }
        
        function wait_click(){
            $("#smsbot").css("display", "none");
            $("#wait_sms").css("display", "inline");
            var wait_time = 30;
            $("#wait_sms").text("30秒后可以重发");
            var timer = setInterval(function(){
               $("#wait_sms").text((--wait_time) + "秒后可以重发");
               if(wait_time <= 1){
                   clearInterval(timer);
                   $("#smsbot").css("display", "inline");
                   $("#wait_sms").css("display", "none").text("");
               }
            }, 1000);
        }
        function c_order(){
            document.getElementById("my-order").click();
        }
        function set_fheight(did, h){
	        $("#" + did).css("height", h);
	    }
</script>
</head>
<body onload="setHeight()">
	<div id="page-all">
	    <div id="header">
	        <div id="top">
	            <div id="top_left">
	                <ul>
	                    <li>手机版</li>
	                    <li class="coll_page">收藏本站</li>
	                    <li>网站地图</li>
	                    <li class="mao">在线客服</li>
	                </ul>
	                <div style="clear: both;"></div>
	            </div>
	            <div id="top_rig">
	                <c:if test="${luser == null}">
						<ul>
							<li onclick="showLogin();">登录</li>
							<li>|</li>
							<li><a href="regist_getList.action">注册</a></li>
						</ul>
					</c:if>
					<c:if test="${luser != null}">
						<ul>
							<li><a href="javascript:void(0);" class="l_out" title="退出系统">退出</a></li>
							<li onclick="showUpdatePassW();">密码修改</li>
							<li onclick="showUpdateInfo();">修改信息</li>
							<li class="login-account">${luser.userPhone},欢迎光临卖炭网</li>
						</ul>
					</c:if>
	                <div style="clear: both;"></div>
	            </div>
	            <div style="clear: both;"></div>
	        </div>
	        <div id="menu">
	            <div id="menu_list">
	                <ul>
	                    <li class="home"><label>首页</label></li>
						<li class="good-scan"><label>商品浏览</label></li>
						<li class="my-cart"><label>我的购物车</label></li>
						<li class="my-order" id="my-order"><label>我的订单</label></li>
	                </ul>
	                <div style="clear: both;"></div>
	            </div>
	            <div style="clear: both;"></div>
	        </div>
       	    <div style="clear: both;"></div>
	    </div>
		<div id="main">
			<iframe src="main.action" id="mpage" name="main" scrolling="no" frameborder="no" border="0"></iframe>
			<div style="clear: both;"></div>
		</div>
		<div id="footer">
			<iframe src="footer.action" id="fpage" name="footer" scrolling="no" frameborder="no" border="0"></iframe>
			<div style="clear: both;"></div>
		</div>
		
		<!-- 订单流转信息 -->
		<div>
			<div id="fullbg" class="fullbg"></div>
			<div id="dialog" class="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div id="dialog_text"></div>
			</div>
		</div>
		
		<!-- 订单评价 -->
		<div>
			<div id="fullbg_2" class="fullbg"></div>
			<div id="dialog_2" class="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div id="dialog_text_2">
					<p class="eva_title">评价内容</p>
					<input type="hidden" id="orderId">
					<textarea rows="" cols="" class="eva_acount" id="eva_acount"></textarea>
					<input type="button" value="确    定" onclick="save_eva();">
				</div>
			</div>
		</div>
		
		<!-- 订单取消 -->
		<div>
			<div id="fullbg_3" class="fullbg"></div>
			<div id="dialog_3" class="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div id="dialog_text_3">
					<span>取消理由：</span> <select name="cancelReason"
						class="cancel_reason" id="cancel_reason" onchange="can_write();">
						<option value="0" selected="selected">请选择取消理由</option>
						<option value="1">不想买了</option>
						<option value="2">信息填写错误</option>
						<option value="3">支付遇到问题</option>
						<option value="4">其他原因</option>
					</select>
					<textarea rows="" cols="" class="eva_acount" id="other_reason"
						style="display:none;"></textarea>
					<input type="button" value="确    定" onclick="apply_cancel();">
				</div>
			</div>
		</div>

		<!-- 登录 -->
		<div align="center">
			<div id="fullbg_4" class="fullbg"></div>
			<div id="dialog_4" class="dialog2">
				<p style="text-align: right; margin-right: 15px; margin-top: 8px;">
					<a href="javascript:void(0);" onclick="closeBg();" title="关闭"><img
						src="${pageContext.request.contextPath}/img/login-out.png"
						style="width: 26px; height: 26px;text-align: right;" /></a>
				</p>
				<div class="loginTopDiv">
					<span class="loginTop"></span>
				</div>
				<div>
					<table style="margin-left: 300px; margin-top: 25px;">
						<tr>
							<td colspan="2" style="width: 300px; height: 45px;">
							    <input id="login_account" type="text" style="width: 298px; height: 43px; margin-top:30px; font-size:18px; padding-left:50px; border:none; background: url('${pageContext.request.contextPath}/img/login-user.png') no-repeat;">
							</td>
						</tr>
						<tr>
							<td colspan="2" style="width: 300px; height: 45px;">
							    <input id="login_pswd" type="password" style="width: 298px; height: 43px; margin-top:30px; font-size:18px; padding-left:50px; border:none; background: url('${pageContext.request.contextPath}/img/login-password.png') no-repeat;">
							</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2">
							    <input type="button" id="submit" value="" onclick="login();" class="login_button" />
							    <br /><br />
							    <a href="regist_getList.action" target="_blank" style="color: blue; vertical-align: bottom; margin-left: 115px;">免费注册</a>
							    <a href="forget_getForgrt.action" target="_blank" style="color: blue; vertical-align: bottom; margin-left: 20px;">忘记密码</a>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</div>

        <!-- 密码修改 -->
		<div align="center">
			<div id="fullbg_6" class="fullbg"></div>
			<div id="dialog_6" class="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭"><font size="5px">×</font></a>
				</p>
				<div class="loginTopDiv" align="center">
					<span class="loginTop">修改密码</span>
				</div>
				<div>
					<table id="tableForm" align="center">
						<tr>
							<td class="tdText">旧密码：</td>
							<td><input id="oldps" type="password" name="oldPassWord" class="inputClass" value="" /><font color='red'>*</font></td>
						</tr>
						<tr>
							<td height="20" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="tdText">新密码：</td>
							<td><input id="newps" type="password" name="newPassWord" class="inputClass" value="" /><font color='red'>*</font></td>
						</tr>
						<tr>
							<td height="20" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="tdText">确认新密码：</td>
							<td><input id="newps1" type="password" name="newPassWord" class="inputClass" value="" /><font color='red'>*</font></td>
						</tr>
						<tr>
							<td height="20" colspan="2">&nbsp;</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2"><input type="button" value="保 存" onclick="button()" style="font-size: 15px; height: 30px; width: 80px; border:none; background: #FC9; cursor: pointer;" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 信息修改 -->
		<div align="center">
			<div id="fullbg_7" class="fullbg"></div>
			<div id="dialog_7" class="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭"><font size="5px">×</font></a>
				</p>
				<div class="loginTopDiv" align="center">
					<span class="loginTop">信息修改</span>
				</div>
				<div>
					<table id="tableForm" align="center">
						<tr>
							<td class="tdText">登录账号：</td>
							<td class="tdText" id="login_at" style="text-align: left;"></td>
						</tr>
						<tr>
							<td height="5" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="tdText">联系人姓名：</td>
							<td class="tdInput"><input id="user_name" type="text"
								name="userName" class="inputClass" value=""
								style="width: 207px; height: 30px" /></td>
						</tr>

						<tr>
							<td class="tdText">手机号码：</td>
							<td class="tdInput"><input id="user_phone" type="text"
								name="userPhone" class="inputClass" value=""
								style="width: 207px; height: 30px" /></td>
						</tr>

						<tr>
							<td class="tdText">注册单位：</td>
							<td class="tdInput"><input id="company_name" type="text"
								name="companyName" class="inputClass" value=""
								style="width: 207px; height: 30px" /></td>
						</tr>

						<tr>
							<td class="tdText">电子邮箱：</td>
							<td class="tdInput"><input id="up_email" type="text"
								name="email" class="inputClass" value=""
								style="width: 207px; height: 30px" /></td>
						</tr>
						<tr>
							<td height="10" colspan="2">&nbsp;</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2"><input type="button" value="保 存"
								onclick="butInfo();"
								style="font-size:15px; height:30px; width:80px;border:none; background:#FC9; cursor:pointer;" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div id="loading"></div>
		<div style="clear: both;"></div>
		
		<div id="leftsead">
	      <ul>
		   <li><img src="${pageContext.request.contextPath}/images/lianxi.jpg" class="shows" /></li>
	      </ul>
        </div><!--leftsead end-->
	</div>
</body>
</html>
