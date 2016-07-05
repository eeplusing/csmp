<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/themes/default/easyui.css"/>
  	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/t_style.css"></link>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.artDialog.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>
  	<style type="text/css">
  		.saveButton{
			height:30px; 
			cursor:pointer; 
			margin-left:7px; 
			margin-top:1px; 
			border:none; 
			background-color: #F40; 
			color:#fff;  
			border-radius:4px;  
			font-size:16px; 
 			font-weight:bold; 
			width:90px;
		}
  	</style>
  	<script type="text/javascript">
  	$(function(){
  		var hasright = $("#hasRight").html();
  		if(-1 != hasright.indexOf("[]")){
  			$("#rightvision input").each(function(){
				var value = $(this).val();
					if(((hasright.indexOf("112[]")==0 || hasright.indexOf("[]112[]")>0) && (value=="112;113"))||((hasright.indexOf("7[]")==0 || hasright.indexOf("[]7[]")>0) && (value=="7;110"))||((hasright.indexOf("6[]")==0 || hasright.indexOf("[]6[]")>0) && (value=="6;111"))||((hasright.indexOf("81[]")==0 || hasright.indexOf("[]81[]")>0) && (value=="81;82"))||((hasright.indexOf("49[]")==0 || hasright.indexOf("[]49[]")>0) && (value=="49;56;57;58")) || ((hasright.indexOf("50[]")==0 || hasright.indexOf("[]50[]")>0) && (value=="50;59;61;66")) || ((hasright.indexOf("54[]")==0 || hasright.indexOf("[]54[]")>0) && (value=="54;55")) || ((hasright.indexOf("52[]")==0 || hasright.indexOf("[]52[]")>0) && (value=="52;53")) || ((hasright.indexOf("67[]")==0 || hasright.indexOf("[]67[]")>0) && (value=="63;67;68")) || ((hasright.indexOf("64[]")==0 || hasright.indexOf("[]64[]")>0) && (value=="63;64"))||((hasright.indexOf("76[]")==0 || hasright.indexOf("[]76[]")>0) && (value=="76;77"))||((hasright.indexOf("87[]")==0 || hasright.indexOf("[]87[]")>0) && (value=="87;88"))||((hasright.indexOf("86[]")==0 || hasright.indexOf("[]86[]")>0) && (value=="86;88"))||((hasright.indexOf("10[]")==0 || hasright.indexOf("[]10[]")>0) && (value=="10;41")) || ((hasright.indexOf("14[]")==0 || hasright.indexOf("[]14[]")>0) && (value=="14;42"))||((hasright.indexOf("21[]")==0 || hasright.indexOf("[]21[]")>0) && (value=="21;47")) || ((hasright.indexOf("20[]")==0 || hasright.indexOf("[]20[]")>0) && (value=="20;46"))||((hasright.indexOf("19[]")==0 || hasright.indexOf("[]19[]")>0) && (value=="19;45")) || ((hasright.indexOf("18[]")==0 || hasright.indexOf("[]18[]")>0)&& (value=="18;44")) || ((hasright.indexOf("105[]")==0 || hasright.indexOf("[]105[]")>0)&& (value=="105;106")) || hasright.indexOf(value+"[]")==0 || hasright.indexOf("[]"+value+"[]")>0)
					{
						$(this).attr('checked','true');
					}
  			});
  		}
  		$("#商品分类1").attr("checked",$("#商品分类").length == $("#商品分类:checked").length ? "true" : false);
  		$("#商品分类").click(function(){
  			$("#商品分类1").attr("checked",$("#商品分类").length == $("#商品分类:checked").length ? "true" : false);
  		});
  		$("#基本信息1").attr("checked",$("#基本信息").length == $("#基本信息:checked").length ? "true" : false);
  		$("#基本信息").click(function(){
  			$("#基本信息1").attr("checked",$("#基本信息").length == $("#基本信息:checked").length ? "true" : false);
  		});
  		$("#订单管理1").attr("checked",$("#订单管理").length == $("#订单管理:checked").length ? "true" : false);
  		$("#订单管理").click(function(){
  			$("#订单管理1").attr("checked",$("#订单管理").length == $("#订单管理:checked").length ? "true" : false);
  		});
  		$("#入库管理1").attr("checked",$("#入库管理").length == $("#入库管理:checked").length ? "true" : false);
  		$("#入库管理").click(function(){
  			$("#入库管理1").attr("checked",$("#入库管理").length == $("#入库管理:checked").length ? "true" : false);
  		});
  		$("#出库管理1").attr("checked",$("#出库管理").length == $("#出库管理:checked").length ? "true" : false);
  		$("#出库管理").click(function(){
  			$("#出库管理1").attr("checked",$("#出库管理").length == $("#出库管理:checked").length ? "true" : false);
  		});
  		$("#仓库信息1").attr("checked",$("#仓库信息").length == $("#仓库信息:checked").length ? "true" : false);
  		$("#仓库信息").click(function(){
  			$("#仓库信息1").attr("checked",$("#仓库信息").length == $("#仓库信息:checked").length ? "true" : false);
  		});
  		$("#岗位发布1").attr("checked",$("#岗位发布").length == $("#岗位发布:checked").length ? "true" : false);
  		$("#岗位发布").click(function(){
  			$("#岗位发布1").attr("checked",$("#岗位发布").length == $("#岗位发布:checked").length ? "true" : false);
  		});
  		$("#权限管理1").attr("checked",$("#权限管理").length == $("#权限管理:checked").length ? "true" : false);
  		$("#权限管理").click(function(){
  			$("#权限管理1").attr("checked",$("#权限管理").length == $("#权限管理:checked").length ? "true" : false);
  		});
  		$("#群组管理1").attr("checked",$("#群组管理").length == $("#群组管理:checked").length ? "true" : false);
  		$("#群组管理").click(function(){
  			$("#群组管理1").attr("checked",$("#群组管理").length == $("#群组管理:checked").length ? "true" : false);
  		});
  		$("#角色管理1").attr("checked",$("#角色管理").length == $("#角色管理:checked").length ? "true" : false);
  		$("#角色管理").click(function(){
  			$("#角色管理1").attr("checked",$("#角色管理").length == $("#角色管理:checked").length ? "true" : false);
  		});
  		$("#新闻发布1").attr("checked",$("#新闻发布").length == $("#新闻发布:checked").length ? "true" : false);
  		$("#新闻发布").click(function(){
  			$("#新闻发布1").attr("checked",$("#新闻发布").length == $("#新闻发布:checked").length ? "true" : false);
  		});
  		$("#账户管理1").attr("checked",$("#账户管理").length == $("#账户管理:checked").length ? "true" : false);
  		$("#账户管理").click(function(){
  			$("#账户管理1").attr("checked",$("#账户管理").length == $("#账户管理:checked").length ? "true" : false);
  		});
  		$("#数据导出1").attr("checked",$("#数据导出").length == $("#数据导出:checked").length ? "true" : false);
  		$("#数据导出").click(function(){
  			$("#数据导出1").attr("checked",$("#数据导出").length == $("#数据导出:checked").length ? "true" : false);
  		});
  	});
  	function clike(ide){
  		if(ide == "商品分类")
  		{
  			if($("#商品分类:checked").length == 4){
  			$("#商品分类1").attr('checked',false);
  				$("#商品分类").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#商品分类1").attr('checked',true);
  				$("#商品分类").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "基本信息")
  		{
  			if($("#基本信息:checked").length == 7){
  			$("#基本信息1").attr('checked',false);
  				$("#基本信息").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#基本信息1").attr('checked',true);
  				$("#基本信息").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "首页权限"){
  			if($("#首页权限:checked").length == 1){
  				$("#首页权限1").attr('checked',false);
  				$("#首页权限").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#首页权限1").attr('checked',true);
  				$("#首页权限").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "订单管理"){
  			if($("#订单管理:checked").length == 5){
  				$("#订单管理1").attr('checked',false);
  				$("#订单管理").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#订单管理1").attr('checked',true);
  				$("#订单管理").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "入库管理"){
  			if($("#入库管理:checked").length == 4){
  				$("#入库管理1").attr('checked',false);
  				$("#入库管理").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#入库管理1").attr('checked',true);
  				$("#入库管理").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "出库管理"){
  			if($("#出库管理:checked").length == 4){
  				$("#出库管理1").attr('checked',false);
  				$("#出库管理").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#出库管理1").attr('checked',true);
  				$("#出库管理").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "仓库信息"){
  			if($("#仓库信息:checked").length == 5){
  				$("#仓库信息1").attr('checked',false);
  				$("#仓库信息").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#仓库信息1").attr('checked',true);
  				$("#仓库信息").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "岗位发布"){
  			if($("#岗位发布:checked").length == 2){
  				$("#岗位发布1").attr('checked',false);
  				$("#岗位发布").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#岗位发布1").attr('checked',true);
  				$("#岗位发布").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "权限管理"){
  			if($("#权限管理:checked").length == 1){
  				$("#权限管理1").attr('checked',false);
  				$("#权限管理").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#权限管理1").attr('checked',true);
  				$("#权限管理").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "群组管理"){
  			if($("#群组管理:checked").length == 5){
  				$("#群组管理1").attr('checked',false);
  				$("#群组管理").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#群组管理1").attr('checked',true);
  				$("#群组管理").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "角色管理"){
  			if($("#角色管理:checked").length == 5){
  				$("#角色管理1").attr('checked',false);
  				$("#角色管理").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#角色管理1").attr('checked',true);
  				$("#角色管理").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "新闻发布"){
  			if($("#新闻发布:checked").length == 2){
  				$("#新闻发布1").attr('checked',false);
  				$("#新闻发布").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#新闻发布1").attr('checked',true);
  				$("#新闻发布").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "账户管理"){
  			if($("#账户管理:checked").length == 5){
  				$("#账户管理1").attr('checked',false);
  				$("#账户管理").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#账户管理1").attr('checked',true);
  				$("#账户管理").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}else if(ide == "数据导出"){
  			if($("#数据导出:checked").length == 3){
  				$("#数据导出1").attr('checked',false);
  				$("#数据导出").each(function(){
  					$(this).attr('checked',false);
  				});
  			}
  			else
  			{	
  				$("#数据导出1").attr('checked',true);
  				$("#数据导出").each(function(){
  					$(this).attr('checked','true');
  				});
  			}
  		}
  	}
  	
  	function closeRight()
  	{
  		if(window){
 			window.close();
 		}else{
 			win.close();
 		}
  	}
  	
  	function save()
  	{
  		var ids = "";
  		$("#rightvision input").each(function(){
  			if($(this).attr('checked') == true)
  			{
  				ids += $(this).val()+";";
  			}
  		});
  		var se = confirm("是否添加权限？");
  		if(se==true){
  			$.ajax({
					url : "right_save.action",
					type : "post", 
					cache : false,
					data : "rightIds=" + ids + "&roleId=" + $("#roleId").val(),
					dataType : "text",
					success : function(msg){
						if(msg=='ok'){
							if(window){
 								window.close();
 							}else{
 								win.close();
 							}
						}
					}
			});
		}
		else{}
  	}
  	</script>
   <title>授权</title>
  </head>
  <body style="overflow:hidden; height:1000px; margin-left: 600px; padding: 0px;">
  	<input type="hidden" id="roleId" value="${roleId}"/>
  	<div>
  		<c:forEach items="${rightMap}" var="fm">
  			<ul>
  				<li style="font-size:20px; margin-bottom:5px; color:#0F0;">${fm.key}</li>
  				<li>
  					<ul>
  						<c:forEach items="${fm.value}" var="sm">
  							<li style="font-size:16px; margin-left:40px; margin-bottom:5px; color:#F00;">${sm.key}</li>
  							<li style="margin-left:60px; margin-bottom:10px;">
  							<div style="margin-left:20px; float:left; margin-top:0px; ">
  								<input type="checkbox" style="height:16px; width:16px;" id="${sm.key}1" value="1" onclick="clike('${sm.key}');" /><span style="margin-top:-2px; font-size:16px;">全选</span>
  							</div>
  							<div id="rightvision" style="margin-bottom:0px;">
  								<c:forEach items="${sm.value}" var="right">
  									<c:if test="${right.value.rightId != 112 && right.value.rightId != 113 && right.value.rightId != 110 && right.value.rightId != 7 &&right.value.rightId != 111 && right.value.rightId != 6 && right.value.rightId != 58 && right.value.rightId != 57 && right.value.rightId != 56 && right.value.rightId != 49 && right.value.rightId != 66 && right.value.rightId != 61 && right.value.rightId != 59 && right.value.rightId != 50 && right.value.rightId != 55 && right.value.rightId != 54 && right.value.rightId != 52 && right.value.rightId != 53 && right.value.rightId != 68 && right.value.rightId != 67 && right.value.rightId != 63 && right.value.rightId != 64 && right.value.rightId != 82 && right.value.rightId != 81 && right.value.rightId != 77 && right.value.rightId != 76 && right .value.rightId != 88 && right.value.rightId != 87 && right.value.rightId != 86 && right.value.rightId != 41 && right.value.rightId != 10 && right.value.rightId != 42 && right.value.rightId != 14 && right.value.rightId != 47 && right.value.rightId != 21 && right.value.rightId!= 20 && right.value.rightId != 46 && right.value.rightId != 45 && right.value.rightId != 19 && right.value.rightId != 18 && right.value.rightId != 44 && right.value.rightId != 105 && right.value.rightId !=106}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="${right.value.rightId}" /><span style="font-size:14px;">${right.value.rightName}</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 105}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="105;106" /><span style="font-size:14px;">授权操作</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 18}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="18;44" /><span style="font-size:14px;">设置等级</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 19}">
	  									<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="19;45" /><span style="font-size:14px;">编辑群组成员</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 20}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="20;46" /><span style="font-size:14px;">编辑客户成员</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 21}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="21;47" /><span style="font-size:14px;">添加群组</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 14}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="14;42" /><span style="font-size:14px;">新建新闻</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 10}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="10;41" /><span style="font-size:14px;">岗位添加与修改</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 86}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="86;88" /><span style="font-size:14px;">新增仓库</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 87}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="87;88" /><span style="font-size:14px;">编辑仓库</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 76}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="76;77" /><span style="font-size:14px;">新增入库单</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 81}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="81;82" /><span style="font-size:14px;">新增出库单</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 64}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="63;64" /><span style="font-size:14px;">新增商品分类</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 67}">
	  									<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="63;67;68" /><span style="font-size:14px;">编辑商品分类</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 52}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="52;53" /><span style="font-size:14px;">发布商品</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 54}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="54;55" /><span style="font-size:14px;">修改商品</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 50}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="50;59;61;66" /><span style="font-size:14px;">编辑图片</span>
	  								</c:if>
  									<c:if test="${right.value.rightId == 56}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="49;56;57;58" /><span style="font-size:14px;">修改价格</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 6}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="6;111" /><span style="font-size:14px;">修改角色</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 7}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="7;110" /><span style="font-size:14px;">添加角色</span>
  									</c:if>
  									<c:if test="${right.value.rightId == 112}">
  										<input style="margin-left:20px;" id="${sm.key}" type="checkbox" value="112;113" /><span style="font-size:14px;">更改账号角色</span>
  									</c:if>
  									<c:if test="${right.key%7==6}">
  										<br style="margin-top:10px; margin-left:127px;"/>
  									</c:if>
  								</c:forEach>
  							</div>
  						</li>
  						</c:forEach>
  					</ul>
  				</li>
  			</ul>
  		</c:forEach>
  	</div>
  	<div style="margin-top:10px; margin-left :500px;"><input class="saveButton" type="button" onclick="closeRight();" value="关闭"/></div>
	<div style="margin-top:-30px; margin-left :50px;"><input class="saveButton" type="button" onclick="save();" value="保存"/></div>
  	<div id="hasRight" style="display:none;"  >${hasRight}</div>
  </body>
</html>
