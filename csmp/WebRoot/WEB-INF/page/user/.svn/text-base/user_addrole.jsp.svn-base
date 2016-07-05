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
 <title>账户角色更改</title>
 <script type="text/javascript">
 function add(){
 			var rolename = document.getElementById("selectrole");
 			var userid = ${user.userId}; 
 		 if(window){
 			window.parent.saverole(userid,rolename.value);
 		}else{
 			win.parent.saverole(userid,rolename.value);
         }
 		}
 </script>
  </head>
  <body>
		<table style="margin-left:20px;">
			<tr style="height:60px;">
				<td colspan="2">账户:</td>
				<td>${user.userPhone}</td>
			</tr>
			<tr>
				<td colspan="2">角色名：</td>
				<td> 
					<select id="selectrole">
						<c:forEach items="${roles}" var="role">
							<c:if test="${role.roleId == user.role.roleId}">
								<option id="${role.roleId}" selected="selected">${role.roleName}</option>
							</c:if>
							<c:if test="${role.roleId != user.role.roleId}">
								<option id="${role.roleId}">${role.roleName}</option>
							</c:if>
						</c:forEach>
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