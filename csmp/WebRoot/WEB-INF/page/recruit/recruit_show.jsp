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
		font: bold 17px '隶书'; 
		width:90px;
	}
	
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
  	
  	.testareapart1{
  		font-size:16px; 
  	}
  	
  	.number{
  		text-align:right; 
  		font-size:16px; 
  		IME-MODE: disabled; 
  		border:none;
  		WIDTH: 30px; 
  		HEIGHT: 25px;
 	}
 	
  	.inputpart{
 		text-align:left; 
 		height:25px; 
 		font-size:16px; 
 		width:500px;
 		border:none;
  	}
  	
  	.lipart{
  		margin-left :40px; 
  		margin-top:20px;
  	}
  	
  	.spanpart{
 		margin-left:20px; 
  	}
  	
  </style>
 <title>岗位展示</title>
 <script type="text/javascript">
 function closeRecruit(){
 	if(window){
 			window.close();
 		}else{
 			win.close();
 		}
 }
 </script>
 </head>
 <body>
	<div style="list-style:none; margin-left:650px; margin-top:100px;">
		<div>
			<div>
				<ul>
					<li style="margin-left :20px; font-size:16px; font-weight:bold;">岗位描述</li>
					<li class="lipart"><span class="spanparrt"></span>岗位名称:&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="jobName"  readonly="readonly" type="text" class="inputpart" value="${recruit.jobName}"/>
					</li>
					<li class="lipart"><span class="spanparrt"></span>工作地点:&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="address" readonly="readonly" type="text" class="inputpart" value="${recruit.workAddress}"/>
					</li>
					<li class="lipart"><span class="spanparrt"></span>薪资待遇:&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="wage"  readonly="readonly" type="text" class="inputpart" value="${recruit.wage}"/>
					</li>
					<li style="margin-left :20px; margin-top:15px;"><span style="margin-left:20px; "></span>工作性质:&nbsp;&nbsp;&nbsp;
						<c:if test="${recruit.workNature ==0 }">
							&nbsp;<input type="text" style="border:none; font-size:16px;" id="workNature" checked="checked" name="workNature" value="全职">
						</c:if>
						<c:if test="${recruit.workNature==1 }">
							&nbsp;<input type="text" style="border:none; font-size:16px;" id="workNature" checked="checked" name="workNature" value="兼职">
						</c:if>
					</li>
					<li style="margin-left :20px; margin-top:15px;"><span style="margin-left:20px; "></span>性别要求:&nbsp;&nbsp;&nbsp;
						<c:if test="${recruit.sexRequire==0}">
							&nbsp;<input type="text" style="border:none; font-size:16px;" id="workNature" checked="checked" name="workNature" value="男">
						</c:if>
						<c:if test="${recruit.sexRequire==1}">
							&nbsp;<input type="text" style="border:none; font-size:16px;" id="workNature" checked="checked" name="workNature" value="女">
						</c:if>
						<c:if test="${recruit.sexRequire==2}">
							&nbsp;<input type="text" style="border:none; font-size:16px;" id="workNature" checked="checked" name="workNature" value="无">
						</c:if>
					</li>
					<li style="margin-left :20px; margin-top:15px; margin-bottom:20px;"><span style="margin-left:20px;"></span>人数限定:
						<input id="recruitMember"  readonly="readonly" value="${recruit.recruitMember}" class="number" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" size="16px" name="recruitMember" type="text" />人
					</li>
				</ul>
			</div>
			<hr style="width:680px;"/>
			<div>
				<ul>
					<li style="font-size:16px; margin-left :20px; margin-top:20px; font-weight:bold;">岗位职责</li>
					<li style="border:0px; width:600px; padding:10px; margin-left :30px; margin-top:20px;"><div  class="testareapart1" id="postduty">${recruit.postDuty}</div></li>
				</ul>
			</div>
			<div>
				<ul>
					<li style="font-size:16px; margin-left :20px; margin-top:20px; font-weight:bold;">任职条件</li>
					<li style="border:0px; width:600px; padding:10px; margin-left :30px; margin-top:20px;"><div  class="testareapart1"  id="factor">${recruit.factor}</div></li>
				</ul>
			</div>
			<div style="margin-top:30px; margin-left :500px;"><input class="saveButton" type="button" onclick="closeRecruit();" value="关闭"/></div>
			</div>
		</div>
  </body>
</html>
