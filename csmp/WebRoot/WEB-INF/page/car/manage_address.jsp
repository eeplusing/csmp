<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
<head>

<title></title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" 	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
<link rel="stylesheet" type="text/css" 	href="${pageContext.request.contextPath}/css/t_style.css">
<style type="text/css">
body{
       overflow: hidden;
       text-align: center;
}

#main{
    width: 1300px;
    margin: 0px auto;	
}
   
a {
	text-decoration: none;
}

input.a_d {
	border: none;
	background: #F40;
	width: 60px;
	height: 30px;
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	padding-top: 1px;
	display: block;
	margin: 5px auto;
	color: #FFF;
}

div.h4 {
	text-align: center;
	padding-top: 50px;
	padding-right: 150px;
}

div.di_zhi {
	text-align: center;
}

input.address {
	background: #ffffff;
	border-bottom-color: #ff6633;
	border-bottom-width: 1px;
	border-top-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px;
	solid: #ff6633;
	color: #000000;
	FONT-SIZE: 9pt;
	FONT-STYLE: normal;
	FONT-VARIANT: normal;
	FONT-WEIGHT: normal;
	HEIGHT: 30px;
	width: 400px;
	LINE-HEIGHT: normal;
}

input.bian_ma {
	background: #ffffff;
	border-bottom-color: #ff6633;
	border-bottom-width: 1px;
	border-top-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px;
	solid: #ff6633;
	color: #000000;
	FONT-SIZE: 9pt;
	FONT-STYLE: normal;
	FONT-VARIANT: normal;
	FONT-WEIGHT: normal;
	HEIGHT: 20px;
	width: 400px;
	LINE-HEIGHT: normal;
}

input.name {
	background: #ffffff;
	border-bottom-color: #ff6633;
	border-bottom-width: 1px;
	border-top-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px;
	solid: #ff6633;
	color: #000000;
	FONT-SIZE: 9pt;
	FONT-STYLE: normal;
	FONT-VARIANT: normal;
	FONT-WEIGHT: normal;
	HEIGHT: 20px;
	width: 390px;
	LINE-HEIGHT: normal;
}

table.b_dan {
	width: 753px;
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
	border: 5px solid #999;
	width: 800px;
	height: 400px;
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

.dialog {
	background-color: #fff;
	border: 5px solid #999;
	width: 600px;
	height: 300px;
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
input.bot{
    border:none;
    background:#FC9;
    width: 60px;
    height:30px;
    font-size: 15px; 
    font-weight: bold; 
    padding-top: 8px; 
    display:block; 
    margin: 5px auto;
}
</style>

<script type="text/javascript">
  
    //删除信息确认
      function delSure(addressId){
       
        if (confirm("确定删除该地址?")){ 
           $.ajax({
			  type : "POST",
			  url : "address_delect.action",
			  data : "addressId=" + addressId, 
			  dataType : "text",
		      success : function(msg) {
			      if(msg=="-1"){
				       location.reload();//刷新本页面
				   }else if(msg=="1"){
				       alert("地址删除失败，可能原因：该地址与订单关联，数据操作失败");
				   }
		      }
           }); 
        }
      };
     
      //修改地址
    
      function upAddres() {
             
           var addresId = $("#addressid").val();
           var addres = $("#up_addres").val();
           var code = $("#up_code").val();
           var name = $("#up_name").val();
           var phone = $("#up_phone").val();
		   $.ajax({
			   url : "address_updateAddress.action",
			   data : "addressId=" + addresId + "&address=" + addres + "&postCode=" + code + "&consigneName=" + name + "&consignephone=" + phone,
			   type : "post",
			   cache : false,
			   dataType : "text",
			   success : function(msg) {
				   if(msg=="-1"){
				       alert("修改成功");
				       closeBg();
                       location.reload();//刷新本页面
				   }		
			   }
		   });
       }
       
   //添加地址
      function save(){
            var code_reg = /^[0-9]{6}$/;
            var addres = $("#addres").val().replace(/(^\s*)|(\s*$)/g, "");
            if (addres == '建议您如实填写详细收货地址') {
		 	    addres = "";
		      }
            var code = $("#code").val().replace(/(^\s*)|(\s*$)/g, "");
            var name = $("#name").val().replace(/(^\s*)|(\s*$)/g, "");
            var phone= $("#phone").val().replace(/(^\s*)|(\s*$)/g, "");
            var isMobile=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/;//手机号码验证规则
		    var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;  //座机验证规则
		    
	       if(addres == ""){
	          alert("请输入收货地址");
	          return false;
	           }
	        if(!code_reg.test(code)){
	            alert("邮政编码不合法");
	           return false;
	          }
	        if(code==""){
	            alert("请输入邮政编码");
	           return false;
	          }
	        if(name==""){
	            alert("请输入收货人姓名");
	            return false;
	         }
	        if(phone==""){
	           alert("请输入收货人电话");
	           return false;
	         }
	        if(!isMobile.test(phone)&& !isPhone.test(phone)){ //如果用户输入的值不同时满足手机号和座机号的正则
        	    alert("请填写正确电话号码!");//就弹出提示信息
        	    $("#phone").focus();//输入框获得光标
        	     return false;
               } 
                 
	        $.ajax({
			    url:"address_add.action" ,
			    data: "address=" + addres + "&postCode=" + code + "&consigneName=" + name + "&consignePhone=" + phone,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				    alert(msg);
				    closeBg();
				    location.reload();//刷新本页面
				}
			});
        }
        //查询要修改的地址信息
        function open_win(name, addres, code, phone){
            
            $("#up_name").val(name);
            $("#up_addres").val(addres);
            $("#up_code").val(code);
            $("#up_phone").val(phone); 
            var dh = document.body.scrollHeight;
            var bw = $("body").width();
            $("#fullbg").css({ 
                height:dh, 
                width:bw, 
                display:"block" 
            });
            $("#dialog").show();
        }
        
        function closeBg() { 
            $("#fullbg,#dialog").hide();     
            $("#up_name").val("");
            $("#up_addres").val("");
            $("#up_code").val("");   
            $("#up_phone").val("");
        }
  
  </script>
</head>

<body>
<div id="main">
	 <form action="address_add.action" method="post" id="formid">
		<div class="h4">
			<h4>
				<font color="red">新增收货地址</font>&nbsp;&nbsp;&nbsp;&nbsp; 注意：以下带
				<font color='red'>*</font>都是必填项
			</h4>
			<br />
		</div>
		<div class="di_zhi">
			<span style="margin-left: 25px;"></span> 
			收货地址 <font color='red'>*</font>
			 <input id="addres" class="address" type="text" name="address" value="${empty value ? '建议您如实填写详细收货地址':value}" onfocus="this.value='';" onblur="if(this.value==''){this.value='建议您如实填写详细收货地址'}"/><br /> <br /> 
			
			<span style="margin-left: 25px;"></span> 
			邮政编码 <font color='red'>*</font> 
			<input id="code" class="bian_ma" type="text" name="postCode" value=""><br /><br /> 
			
			收货人姓名 <font color='red'>*</font> 
			<input id="name" class="name" type="text" name="consigneName" value=""><br /><br /> 
			
			收货人电话 <font color='red'>*</font>
		    <input id="phone" class="name" type="text" name="consignePhone" value=""><br /><br />
		</div>
		<input class="a_d" type="button" value="保 存" onclick="javascript:CsmpJS.login(null,save,null);" />
	 </form><br /><hr><br />
	
	<table align="center" class="b_dan">
		<thead>
			<tr style="background:#F40; color:#FFF;height: 35px;">
				<td>收货人</td>
				<td>详细地址</td>
				<td>邮编</td>
				<td>电话/手机</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
		  <c:forEach items="${address}" var="addre">
			 <div class="num">
				<input type="hidden" value="${addre.addressId}" class="addressId" id="addressid">
			 </div>
			 <tr>
				<td>${addre.consigneName }</td>
				<td>${addre.address }</td>
				<td>${addre.postCode}</td>
				<td>${addre.consignePhone }</td>
				<td>
				   <a href="javascript:void(0);" onclick="open_win('${addre.consigneName }','${addre.address }','${addre.postCode}','${addre.consignePhone }')">修改</a>
				   | <a href="#" onclick="delSure('${addre.addressId}')">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	<div>
		<div id="fullbg" class="fullbg"></div>
		<div id="dialog" class="dialog">
			<p class="close">
				<a href="#" onclick="closeBg();" title="关闭">×</a>
			</p>
			<div class="di_zhi" id="dialog_text">
				<span style="margin-right:150px;"></span>
				 <p class="eva_title">
				   <h4>修改地址</h4>
				</p>
                
				<span style="margin-left: 18px;"></span>
				收货人姓名 <font color='red'>*</font> <input id="up_name" class="bian_ma" type="text" name="consigneName" value=""><br /> <br /> 
				收货地址 <font color='red'>*</font><input id="up_addres" class="address" type="text" name="address" /><br /> <br />
				<span style="margin-left: 18px;"></span>
				邮政编码 <font color='red'>*</font> <input id="up_code" class="bian_ma" type="text" name="postCode" value=""><br /> <br /> 
				收货人电话 <font color='red'>*</font> <input id="up_phone" class="bian_ma" type="text" name="consignePhone" value=""><br /> <br />
				
				<input class="bot" type="button" value="确   定" id="bton" onclick=" return upAddres()">
			</div>
		</div>
	</div>
</body>
</html>
