<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品浏览详情</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
<script type="text/javascript">
	function reinitIframe(){ 
      var iframe = document.getElementById("rform"); 
      try{ 
           var bHeight = iframe.contentWindow.document.body.scrollHeight; 
           var dHeight = iframe.contentWindow.document.documentElement.scrollHeight; 
           var height = Math.max(bHeight, dHeight); 
           iframe.height = height; 
      }catch (ex){} 
    } 
    window.setInterval("reinitIframe()", 100); 
    
    function reinitIframe1(){ 
      var iframe1 = document.getElementById("rform1"); 
      try{ 
           var bHeight1 = iframe1.contentWindow.document.body.scrollHeight; 
           var dHeight1 = iframe1.contentWindow.document.documentElement.scrollHeight; 
           var height1 = Math.max(bHeight1, dHeight1); 
           iframe1.height = height1; 
      }catch (ex){} 
    } 
    window.setInterval("reinitIframe1()", 100);
    
    function showLogin(){
        CsmpJS.showBG("fullbg_4","dialog_4", 0, 0);
    }
    
    function closeBg() { 
        $("#fullbg_4,#dialog_4").hide();
        $("#login_account").val("");
        $("#login_pswd").val("");
    }
    
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
					  alert("登录成功");
					  document.location.href="manager_index.action";
				  }
				  if(msg=="7"){
					  closeBg();
					  document.getElementsByTagName("a")[0].click();
				  }
			  }
         });
    }
    
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
    
</script>
<style type="text/css">
body {
    margin:0px;
    padding:0px;
    width:100%;
	text-align: center;
}
div.main{
    width: 1050px;
    margin: 10px auto;
}
.td {
	padding: 50px;
}
.div_good{
	margin: 0;
	padding: 3px;
	text-align: left;
	font-size: 14px;
	font-weight: 400;
}
.price_i{
   font-size:24px;
   color:#F00;
   font-weight: bold;
}
div.ave_text{
    height: 300px;
    overflow: hidden;
}
div.good_info{
    border-bottom:2px solid #F40;
    margin-bottom: 20px;
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
input.login_button {
	background: url("${pageContext.request.contextPath}/img/login-on0.png") no-repeat;
	height: 43px;
	width: 299px;
	margin-top: 30px;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
    <div class="main">
		<div class="good_info">
			<table width="70%">
				<tr>
					<td class="td">
						<div align="center">
							<c:forEach items="${good.images}" var="image">
		                        <c:if test="${image.isDefault == 1}">
		                            <img alt="" src="${pageContext.request.contextPath}${image.imagePath}" width="300px" height="251px" style="border:none;"/>
		                        </c:if>
		                    </c:forEach>
						</div>
					</td>
					<td width="400px">
						<div align="center">
							<div id='goodName' class="div_good"><b>商品名称：</b> <font color="#999">${good.goodName }</font></div>
							<div id='specification' class="div_good"><b>规格：</b><font color="#999">${good.specification }</font></div>
							<div id='headValue' class="div_good"><b>参数：</b><font color="#999">${good.headValue }</font></div>
							<div class="div_good">
								<b>价格：</b><font class="price_i">￥
								<c:forEach items="${good.prices}" var="price">
								    <c:if test="${user != null }">
									    <c:if test="${price.grade.gradeId == user.grade.gradeId }">
				                          <font class="price_i">${price.price}/${good.type.typeUnit}</font>
				                        </c:if>
								    </c:if>
									<c:if test="${user == null}">
									    <c:if test="${price.grade.gradeNum == 3}">
				                          ${price.price}/${good.type.typeUnit}
				                        </c:if>
								    </c:if>
								</c:forEach>
								</font>
								<div style="margin-top: 50px;" align="right">
									<a href="javascript:;" onclick="javascript:CsmpJS.login(null,buy,${good.goodId});" title='加入购物车' style="border:none; text-decoration:none;"> 
										<img src='${pageContext.request.contextPath}/images/car3.png' />
									</a>
									
									<a href="javascript:;" onclick="javascript:CsmpJS.login('address_buyNow.action',null,${good.goodId});" title='立即购买' style="text-decoration:none;"> 
									    <img src='${pageContext.request.contextPath}/images/good_img/buy.jpg' style="width:80px; height:22px;" />
						            </a>
								</div>						
							</div>						
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- 评价信息 -->
		<div class="eva_list">
		   <iframe name="rform" id="rform" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%"
	         src="evaluate_search.action?goodId=${good.goodId}" >
		   </iframe>
		</div>
		<!-- 评价 -->
		<c:if test="${odList !=null }">
		  <div class="ave_text">
		   <iframe name="rform1" id="rform1" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%"
	         src="go_evaluate.action?goodId=${good.goodId}" >
		   </iframe>
		  </div>
		</c:if>
		
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
							    <input id="login_account" type="text" style="width: 298px; height: 43px; margin-top:30px; margin-left:50px; font-size:18px; padding-left:50px; border:none; background: url('${pageContext.request.contextPath}/img/login-user.png') no-repeat;"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="width: 300px; height: 45px;">
							    <input id="login_pswd" type="password" style="width: 298px; height: 43px; margin-top:30px; margin-left:50px; font-size:18px; padding-left:50px; border:none; background: url('${pageContext.request.contextPath}/img/login-password.png') no-repeat;"/>
							</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2">
							    <input type="button" id="submit" value="" onclick="login();" class="login_button" />
							    <br /><br />
							    <a href="javascript:void(0);" style="color: blue; vertical-align: bottom; margin-left: 230px;">免费注册</a>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div> 
</body>
</html>