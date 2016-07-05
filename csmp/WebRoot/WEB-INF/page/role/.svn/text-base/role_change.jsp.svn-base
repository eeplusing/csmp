<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/t_style.css"></link>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  <style type="text/css">
  	div li{
  		list-style: none;  	
  	}
  	.button{
  		height:30px; 
		cursor:pointer; 
		margin-left:7px;   
		margin-top:1px; 
		border:none; 
		background-color: #F40; 
		color:#fff;  
		border-radius:4px;  
		font: bold 16px; 
		width:90px;
	}
   </style>
    <title>更改角色</title>
 <script type="text/javascript">
    function change(){
 		 var name = $("#name").val().replace(/(^\s*)|(\s*$)/g, "");
 		 var id = $("#id").val();
 		 var rank = $("#rank").val().replace(/(^\s*)|(\s*$)/g, "");
 		 if(window){
 			 window.parent.modify(id, name, rank);
 		 }else{
 			 win.parent.modify(id, name, rank);
         }
    }
 </script>
  </head>
  <body>
		<table style="margin-left:20px;">
			<tr style="height:60px;">
				<td>更改角色:</td>
				<td style="width:20px"></td>
				<td style="width:20px"></td>
			</tr>
			<tr>
				<td><input id="id" Style="display:none; float:left" type="text" value="${role.roleId}"/></td>
				<td>角色名：</td>
				<td><input id="name" type="text" value="${role.roleName}" /></td>
			</tr>
			<tr>
				<td></td>
				<td>角色类型：</td>
				<td>
				    <select id="rank">
				        <c:if test="${role.roleRank == 1}">
					        <option value="1" selected="selected">客户</option>
					        <option value="0">管理员</option>
				        </c:if>
				        <c:if test="${role.roleRank == 0}">
					        <option value="1">客户</option>
					        <option value="0" selected="selected">管理员</option>
				        </c:if>
				    </select>
				</td>
			</tr>
			<tr style="height:40px;"></tr>
			<tr>
				<td></td>
				<td></td>
				<td><input onclick =" change()"type="button"class="button" value="确定"/></td>
			</tr>
		</table>
  </body>
</html>
