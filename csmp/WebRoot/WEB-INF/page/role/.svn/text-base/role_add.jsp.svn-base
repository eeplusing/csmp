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
 <title>角色添加</title>
 <script type="text/javascript">
     function add(){
 		  var name = $("#name").val().replace(/(^\s*)|(\s*$)/g, ""); 
 		  var rank = $("#rank").val().replace(/(^\s*)|(\s*$)/g, ""); 
		  if(name.length==0){
			  alert("请输入用户名");
			  $("#name").focus();
			  return false;
		  }
 		  if(window){
 			  window.parent.add(name, rank);
 		  }else{
 			  win.parent.add(name, rank);
          }
     }
 </script>
  </head>
  <body>
		<table style="margin-left:20px;">
			<tr style="height:60px;">
				<td colspan="3">添加角色:</td>
			</tr>
			<tr>
				<td colspan="2">角色名：</td>
				<td><input id="name" type="text" /></td>
			</tr>
			<tr>
				<td colspan="2">角色类型：</td>
				<td>
				    <select id="rank">
				        <option value="1">客户</option>
				        <option value="0">管理员</option>
				    </select>
				</td>
			</tr>
			<tr style="height:40px;"></tr>
			<tr>
				<td></td>
				<td></td>
				<td><input onclick ="add()" type="button"class="button" value="确定"/></td>
			</tr>
		</table>
  </body>
</html>