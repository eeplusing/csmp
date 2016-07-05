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
  	
  	.testareapart{
  		resize: none; 
  		font-size:16px; 
  		border: none; 
  		overflow: auto;
  	}
  	
  	.number{
  		text-align:right; 
	  	font-size:16px; 
  		IME-MODE: disabled; 
  		WIDTH: 30px; 
  		HEIGHT: 25px;
  	}
  	
  	.inputpart{
 		text-align:left; 
 		height:25px; 
 		font-size:16px; 
 		width:500px;
  	}
  	
  	.lipart{
  		margin-left :40px; 
  		margin-top:20px;
  	}
  	
  	.spanpart{
  		margin-left:20px; 
  	}
  </style>
  <title>岗位添加与修改</title>
 <script type="text/javascript">
 function addchange(){
 	var recruitId = $("#recruitid").val().replace(/(^\s*)|(\s*$)/, "");
 	var recruitJobName1 = $("#jobName").val().replace(/(^\s*)|(\s*$)/, "");
 	var recruitJobName = recruitJobName1.replace(/%/g, "88888888888");
 	var recruitWage1 = $("#wage").val().replace(/(^\s*)|(\s*$)/, "");
 	var recruitWage = recruitWage1.replace(/%/g, "88888888888");
 	var recruitAddress1 = $("#address").val().replace(/(^\s*)|(\s*$)/, "");
 	var recruitAddress = recruitAddress1.replace(/%/g, "88888888888");
 	var recruitWorkNature = $("#workNature:checked").val();
 	var recruitSexRequire = $("#sexRequire:checked").val();
 	var recruitMember = $("#recruitMember").val().replace(/(^\s*)|(\s*$)/, "");
 	var postduty1 = $("#postduty").val();
 	var postduty = postduty1.replace(/%/g, "88888888888");
 	var factor1 = $("#factor").val();
 	var factor = factor1.replace(/%/g, "88888888888");
 	if( recruitAddress.length==0 || recruitJobName.length==0 ||  recruitWage.length==0 || recruitWorkNature != 0 && recruitWorkNature != 1 || recruitSexRequire!=0 && recruitSexRequire!=1 && recruitSexRequire!=2 || recruitMember.length == 0 || postduty.length== 0 || factor.length==0){
 		alert("请填写相关信息！");
 		return false;
 	}else{
 		$.ajax({
				type : "POST",
				url : "recruit_addchange.action",
				data : "recruitId="+recruitId+"&recruitJobName="+recruitJobName+"&recruitWage="+recruitWage+"&recruitAddress="+recruitAddress+"&recruitWorkNature="+recruitWorkNature+"&recruitSexRequire="+recruitSexRequire+"&recruitMember="+recruitMember+"&postduty="+postduty+"&factor="+factor,
				dataType : "text",
				success : function(msg) {
 					if(window){
 						window.close();
 					}else{
 						win.close();
 					}
				 }
		});
 	}
 }
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
				<c:if test="${recruitIdFlag==-1}">
					<input type="hidden" id="recruitid" value="-1"/>
				</c:if>
				<c:if test="${recruitIdFlag==1}">
					<input type="hidden" id="recruitid" value="${recruit.recruitId}"/>
				</c:if>
			<ul>
				<li style="margin-left :20px; font-size:16px; font-weight:bold;">岗位描述</li>
				<li class="lipart"><span class="spanparrt"></span>岗位名称:&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="jobName" type="text" class="inputpart" value="${recruit.jobName}"/></li>
				<li class="lipart"><span class="spanparrt"></span>工作地点:&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="address" type="text" class="inputpart" value="${recruit.workAddress}"/></li>
				<li class="lipart"><span class="spanparrt"></span>薪资待遇:&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="wage" class="inputpart" style="width:200px;">
						<c:if test="${recruit.wage == '面议' }">
							<option selected="selected" value="面议">面议</option>
						</c:if>
						<c:if test="${recruit.wage != '面议' }">
							<option value="面议">面议</option>
						</c:if>
						<c:if test="${recruit.wage == '2000元以下' }">
							<option selected ="selected" value="2000元以下">2000元以下</option>
						</c:if>
						<c:if test="${recruit.wage != '2000元以下' }">
							<option value="2000元以下">2000元以下</option>
						</c:if>
						<c:if test="${recruit.wage == '2000到3000元以下'}">
							<option selected="selected" value="2000到3000元以下">2000到3000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage != '2000到3000元以下'}">
							<option value="2000到3000元以下">2000到3000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage == '3000到4000元以下'}">
							<option selected="selected" value="3000到4000元以下">3000到4000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage != '3000到4000元以下'}">
							<option value="3000到4000元以下">3000到4000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage == '4000到5000元以下'}">
							<option selected="selected" value="4000到5000元以下">4000到5000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage != '4000到5000元以下'}">
							<option value="4000到5000元以下">4000到5000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage == '5000到6000元以下'}">
							<option selected="selected" value="5000到6000元以下">5000到6000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage != '5000到6000元以下'}">
							<option value="5000到6000元以下">5000到6000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage == '6000到7000元以下'}">
							<option selected="selected" value="6000到7000元以下">6000到7000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage != '6000到7000元以下'}">
							<option value="6000到7000元以下">6000到7000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage == '7000到8000元以下'}">
							<option selected="selected" value="7000到8000元以下">7000到8000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage != '7000到8000元以下'}">
							<option value="7000到8000元以下">7000到8000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage == '8000到9000元以下'}">
							<option selected="selected" value="8000到9000元以下">8000到9000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage != '8000到9000元以下'}">
							<option value="8000到9000元以下">8000到9000元以下</option>
						</c:if>
						<c:if test = "${recruit.wage == '9000以上'}">
							<option selected="selected" value="9000以上">9000以上</option>
						</c:if>
						<c:if test = "${recruit.wage != '9000以上'}">
							<option value="9000以上">9000以上</option>
						</c:if>
					</select>
				</li>
				<li style="margin-left :20px; margin-top:15px;"><span style="margin-left:20px;"></span>工作性质:&nbsp;&nbsp;&nbsp;
				<c:if test="${recruit.workNature ==0 }">
					全职&nbsp;<input type="radio" id="workNature" checked="checked" name="workNature" value="0">&nbsp;&nbsp;&nbsp;
					兼职&nbsp;<input type="radio" id="workNature" name="workNature" value="1">
				</c:if>
				<c:if test="${recruit.workNature==1 }">
					全职&nbsp;<input type="radio" id="workNature" name="workNature" value="0">&nbsp;&nbsp;&nbsp;
					兼职&nbsp;<input type="radio" id="workNature" checked="checked" name="workNature" value="1">
				</c:if>
				<c:if test="${recruit.workNature!=1 && recruit.workNature!=0}">
					全职&nbsp;<input type="radio" id="workNature" name="workNature" value="0">&nbsp;&nbsp;&nbsp;
					兼职&nbsp;<input type="radio" id="workNature"  name="workNature" value="1">
				</c:if>
				</li>
				<li style="margin-left :20px; margin-top:15px;"><span style="margin-left:20px; "></span>性别要求:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${recruit.sexRequire==0}">
						男&nbsp;<input type="radio" id="sexRequire" checked="checked" name="sexRequire" value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						女&nbsp;<input type="radio" id="sexRequire" name="sexRequire" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						无&nbsp;<input type="radio" id="sexRequire" name="sexRequire" value="2">
					</c:if>
					<c:if test="${recruit.sexRequire==1}">
						男&nbsp;<input type="radio" id="sexRequire"  name="sexRequire" value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						女&nbsp;<input type="radio" id="sexRequire" checked="checked" name="sexRequire" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						无&nbsp;<input type="radio" id="sexRequire" name="sexRequire" value="2">
					</c:if>
					<c:if test="${recruit.sexRequire==2}">
						男&nbsp;<input type="radio" id="sexRequire"  name="sexRequire" value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						女&nbsp;<input type="radio" id="sexRequire" name="sexRequire" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						无&nbsp;<input type="radio"  checked="checked" id="sexRequire" name="sexRequire" value="2">
					</c:if>
					<c:if test="${recruit.sexRequire!=1 && recruit.sexRequire!=0 && recruit.sexRequire!=2}">
						男&nbsp;<input type="radio" id="sexRequire"  name="sexRequire" value="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						女&nbsp;<input type="radio" id="sexRequire"  name="sexRequire" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						无&nbsp;<input type="radio" id="sexRequire" name="sexRequire" value="2">
					</c:if>
				</li>
				<li style="margin-left :20px; margin-top:15px; margin-bottom:20px;"><span style="margin-left:20px;"></span>人数限定:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="recruitMember" value="${recruit.recruitMember}" class="number" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" size="16px" name="recruitMember" type="text" />人
				</li>
			</ul>
		</div>
		<hr style="width:680px;"/>
		<div>
			<ul>
				<li style="font-size:16px; margin-left :20px; margin-top:20px; font-weight:bold;">岗位职责</li>
				<li style="border:1px solid #A9A9A9; width:600px; padding:10px; margin-left :30px; margin-top:20px;"><textarea class="testareapart" cols="77" rows="5" id="postduty">${postDuty}</textarea></li>
			</ul>
		</div>
		<div>
			<ul>
				<li style="font-size:16px; margin-left :20px; margin-top:20px; font-weight:bold;">任职条件</li>
				<li style="border:1px solid #A9A9A9; width:600px; padding:10px; margin-left :30px; margin-top:20px;"><textarea class="testareapart" cols="77" rows="5" id="factor">${factor}</textarea></li>
			</ul>
		</div>
		<div style="margin-top:30px; margin-left :500px;"><input class="saveButton" type="button" onclick="closeRecruit();" value="关闭"/></div>
		<div style="margin-top:-30px; margin-left :50px;"><input class="saveButton" type="button" onclick="addchange();" value="保存"/></div>
		</div>
	</div>
  </body>
</html>
