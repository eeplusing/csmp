<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset= utf-8"/>
  <title></title>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
	<style type="text/css">
	body{
		   overflow: hidden;
		}
		ul{ list-style:none;}
		
		#goodVariety{
			margin:left;
		}

		.content{
			height:35px;
			width:200px;
		}
		
		.content input{
			height:24px;
			width:200px;
			float:left;
		}
			
		.good_detail{
		font-size:18px; color:#113965;
		height:150px;
		width:920px;
		border:1px solid #ddd;
		}
		
		.sub{
			height:30px;
			width:80px;
			margin-top:20px;
			border:none; 
			font-size: 14px;
			font-weight:bold;
			color:#333;
			background: #FC9;
		}
		
	</style>
	
    <script type="text/javascript">
	    function goodModify(){
	    	 var goodId=${good.goodId};
             var goodVariety = $("#goodVariety").val();
             var goodVendor = $("#goodVendor").val();
             var goodOrigin = $("#goodOrigin").val();
             var goodName = $("#goodName").val().replace(/(^\s*)|(\s*$)/g, "");
             var busyType = $("#busyType").val();
             var calorificValue = $("#calorificValue").val();
             var specification = $("#specification").val().replace(/%/g, "...0...");
             var headValue = $("#headValue").val().replace(/%/g, "...0...");
             var reg = /^[1-9]{1,}[0-9]{0,}$/;
             if(!reg.test(calorificValue)){
                 alert("热值格式错误(大于1的整数)");
                 return false;
             }
             $.ajax({
				type : "POST",
				url : "good_modify.action",
				data : "goodId=" + goodId + "&goodVariety=" + goodVariety + "&goodName=" + goodName + "&specification=" + specification + 
					   "&headValue=" + headValue + "&busyType=" + busyType + "&calorificValue=" + calorificValue + "&goodVendor=" + goodVendor + 
					   "&goodOrigin=" + goodOrigin,
				dataType : "text",
				success : function(msg) {
				    if(msg == "ok"){
				        alert("操作成功");
					    location.reload();//刷新本页面
				    }else{
				        alert("操作失败");
				    }
				}
			 });
        }
        
        function closeGoodModify()
        {
        	this.dispose();
        }
	</script>
  </head>
  <body>
		<div style="height:718px;width:1255px;">
		<table style="margin:20px;padding:1px; ">
			<tr style="margin:20px;">
						<!-- 这里通过一个list类型的对象来动态生成一个下拉列表。
						1.label :指定下拉框前要显示的字 
						2.name: 元素的名字
						3.list="TypeList"表示action（这里是GoodManageAction.java）里有一个list<Type>类型的TypeList属性。
						4.listKey="id"：表示当前option的value从typeList里的当前Type对象的id属性取值。
						5.listValue="typeName"表示当前option的text从typeList里的当前type对象的name属性取值。 -->
				<td class="content">
				  <s:select label="商品类别" id="goodVariety" name="type" list="typeList" listKey="typeId" listValue="typeName"  style="height:24px; width:200px;"/>
			    </td>
			 </tr> 
			 <tr>
			    <td><span>商品产地:</span></td>
				<td class="content"><input type="text" id="goodOrigin" value="${good.goodOrigin}"></td>
				<td><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商:</span></td>
				<td class="content"><input type="text" id="goodVendor" value="${good.goodVendor}"></td>
			 </tr>
			 <tr>
				<td><span>商品名称:</span></td>
				<td class="content"><input type="text" id="goodName" value="${good.goodName}"></td>
				<td><span>&nbsp;&nbsp;&nbsp;行业属性:&nbsp;&nbsp;&nbsp;</span></td>
				<td class="content">
					<select id="busyType" style="height:23px;width:200px;">
						<c:if test="${good.busyType == '0'}">
							<option value="0" selected="selected">工业</option>
							<option value="1">民用</option>
						</c:if>
						<c:if test="${good.busyType == '1'}">
							<option value="0">工业</option>
							<option value="1" selected="selected">民用</option>
						</c:if>
					</select>
				</td>
				<td><span>&nbsp;&nbsp;&nbsp;热值:&nbsp;&nbsp;&nbsp;</span></td>
				<td class="content"><input type="text" id="calorificValue" value="${good.calorificValue}"></td>
			</tr>
		</table>
		
		<table style="margin-left:20px;padding:1px; ">
			<tr>
				<td><span>商品描述:</span><span style="margin-left:130px;"></span></td>
					<td>
						<textarea class="good_detail" id="specification" >${good.specification}</textarea>
					</td>
				</tr>
				<tr>
					<td><span>商品参数：</span></td>
					<td>
						<textarea class="good_detail" id="headValue" >${good.headValue}</textarea>
					</td>
				</tr>
		</table>
		<table>
			<tr>
				<td><span style="margin-left:560px;"></span></td>
				<td>
					<input class="sub" type="button" value="确认修改" onclick="goodModify()" />	
				</td>
			</tr>
		</table>
		</div>
</body>
</html>
