<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>群组管理主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/checktree.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.checktree.js"></script>
    
    <style type="text/css">
div.right {
	width: 800px;
	display: block;
	border: 0px solid #F00;
}

div.top {
	width: 70%;
	height: 100px;
	margin: 0px auto;
	border-bottom: 2px solid #FC9;
}

div.top2 {
	width: 70%;
	height: 30px;
	margin: 0px auto;
	border-bottom: 0px solid #FC9;
}

div.top2 input {
	width: 90px;
	height: 22px;
	margin: 5px 10px;
	background: #FC9;
	border: none;
	cursor: pointer;
}

div.main div {
	float: left;
}

div.left {
	width: 20%;
	height: 1px;
	border: 0px solid;
}

div.right {
	width: 60%;
	border: 0px solid;
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
	width: 300px;
	height: 110px;
	left: 50%;
	margin: -200px 0 0 -200px;
	padding: 0px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 60%;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

.dialog2 {
	background-color: #fff;
	border: 5px solid #999;
	width: 400px;
	height: 160px;
	left: 50%;
	margin: -200px 0 0 -200px;
	padding: 0px;
	position: fixed !important; /* 浮动对话框 */
	position: absolute;
	top: 60%;
	z-index: 5;
	border-radius: 5px;
	display: none;
}

.dialog3 {
	background-color: #fff;
	border: 5px solid #999;
	width: 700px;
	height: 350px;
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

.dialog4 {
	background-color: #fff;
	border: 5px solid #999;
	width: 450px;
	height: 200px;
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

.dialog2 p.close {
	margin: 0 0 12px;
	height: 24px;
	line-height: 24px;
	background: #CCC;
	text-align: right;
	padding-right: 10px;
}

.dialog3 p.close {
	margin: 0 0 12px;
	height: 24px;
	line-height: 24px;
	background: #CCC;
	text-align: right;
	padding-right: 10px;
}

.dialog4 p.close {
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

.dialog2 p.close a {
	color: #fff;
	text-decoration: none;
}

.dialog3 p.close a {
	color: #fff;
	text-decoration: none;
}

.dialog4 p.close a {
	color: #fff;
	text-decoration: none;
}

#rs{
   margin-left: 20px;
}
#gid{
    width: 200px;
    height: 20px;
}
#dialog_text input[type=button]{
    margin-left: 20px;
    margin-top: 10px;
    width: 238px;
    height: 20px;
    border: none;
    background: #CCC;
}

#dialog_text2 {
    margin-left: 20px;
}
#dialog_text2 li{
    margin: 5px;
}
#dialog_text2  span{
     width: 80px;
}
#dialog_text2  input[type=text]{
     margin-left: 5px;
     width: 280px;
     height: 20px;
     border: 1px solid #CCC;
}

#dialog_text2  input[type=button]{
     margin-top: 5px;
     width: 354px;
     height: 20px;
     border: none;
     background: #CCC;
}

#dialog_text2  select{
     width: 280px;
     height: 20px;
     border: 1px solid #CCC;
     
}

#dialog_text3{
     width: 100%;
}
#dialog_text3 li{
     width: 110px;
     height: 25px;
     float: left;
     border: 0px solid #CCC;
}

#dialog_text3 input[type=button]{
     display: block;
     margin-left: 35%;
     width: 200px;
     height: 22px;
     border: none;
     background: #CCC;
}

#dialog_text4{
     width: 100%;
}

#dialog_text4 li{
     width: 150px;
     height: 25px;
     float: left;
     border: 0px solid #CCC;
}

#dialog_text4 input[type=button]{
     display: block;
     margin-left: 33%;
     width: 150px;
     height: 22px;
     border: none;
     background: #CCC;
}
</style>
    <script>
		$(function() {
		    var height = parseInt($(".div_tree").css("height").replace("px", ""));
        if(height < 300) height = 300;//设置最小高度535
        if(window){
		     window.parent.set_fheight("main", height + 20);
		     window.parent.set_fheight("mpage", height + 20);
		}else{
			 win.parent.set_fheight("main", height + 20);
			 window.parent.set_fheight("mpage", height + 20);
		} 
		
			$("ul.tree").checkTree({});
		});
		function showBg() {
		    var ids = new Array(); 
		    var index = 0;
		    	$(":checkbox").each(function(){
		        	if($(this).attr("checked") == true){
		            	if($(this).val().substring(0, 2)=="1U"){
   		                	ids[index++] = $(this).val().substring(2);
		              	}
		          	}
		    	});	
		    	if(index < 1){
		        	alert("必须选择一个客户");
		        	return false;
		    	}
		    	if(index > 1){
		        	alert("等级设置不支持批量操作，只能单选");
		        	return false;
		    	}
		    	$("#userId").val(ids[--index]);
            	var dh = document.body.scrollHeight; 
            	var bw = $("body").width(); 
            	$("#fullbg").css({ 
                	height:dh, 
                	width:bw, 
                	display:"block" 
            	});
            	$("#dialog").show();
            	$.ajax({
			    	url:"group_getAllGrade.action",
					type:"post", 
					cache:false,
					dataType:"text",
					success:function(msg){
					    var gstr = "<span>等级:</span><select id=\"gid\">";
					    var grades = msg.split(";");
					    for(var i = 0; i < grades.length - 1; i++){
					        var ginfo = grades[i].split(",");
					        gstr += "<option value=\"" + ginfo[0] + "\">" + ginfo[1] + "</option>";
				    	}
				    	gstr += "</select>";
				    	$("#rs").html(gstr);
					}
				});
        }
        function showBg2() {
           		var dh = document.body.scrollHeight;
            	var bw = $("body").width(); 
            	$("#fullbg2").css({ 
                	height:dh, 
                	width:bw, 
                	display:"block"
            	});
            	$("#dialog2").show();
            	$.ajax({
				    url:"group_getGroupGrade.action",
					type:"post", 
					cache:false,
					dataType:"text",
					success:function(msg){
				    	var gstr = "";
				    	var grades = msg.split(";");
				    	for(var i = 0; i < grades.length - 1; i++){
				        	var ginfo = grades[i].split(",");
				        	gstr += "<option value=\"" + ginfo[0] + "\">" + ginfo[1] + "</option>";
				    	}
				    	$("#gradeId").html(gstr);
					}
				});
        }
        //关闭灰色 jQuery 遮罩 
       function closeBg() { 
            $("#fullbg,#dialog,#fullbg2,#dialog2,#fullbg3,#dialog3,#fullbg4,#dialog4").hide();
            $("#rs").html("");
            $("#groupId").val();
            $("#us").html("<div style=\"clear: both;\"></div>");
            $("#cgroupId").val();
            $("#gs").html("<div style=\"clear: both;\"></div>");
            $("#groupName").val();
            $("#gradeId").html("<option value=\"-1\">--请选择--</option>");
            $("#groupLeader").html("<option value=\"-1\">--请选择--</option>");
        }
        
        function save(){
            var userId = $("#userId").val();
            var gradeId = $("#gid").val();
            $.ajax({
			    url:"group_updateUser.action",
				type:"post", 
				data: "userId=" + userId + "&gradeId=" + gradeId,
				cache:false,
				dataType:"text",
				success:function(msg){
				    alert(msg);
				    closeBg();
				    location.reload();
				}
			});
        }
        
        function sel_leader(){
            $.ajax({
			    url:"group_getLeader.action",
				type:"post", 
				data: "gradeId=" + $("#gradeId").val(),
				cache:false,
				dataType:"text",
				success:function(msg){
				    var gstr = "";
				    var grades = msg.split(";");
				    for(var i = 0; i < grades.length - 1; i++){
				        var ginfo = grades[i].split(",");
				        gstr += "<option value=\"" + ginfo[0] + "\">" + ginfo[1] + "</option>";
				    }
				    $("#groupLeader").html(gstr);
				}
			});
        }
        
        function save_group(){
            var groupName = $("#groupName").val().replace(/(^\s*)|(\s*$)/g, "");
            if(groupName == null || groupName == "" || groupName.length == 0){
                alert("群组名不可为空!");
                return false;
            }else{
	            $.ajax({
				    url:"group_save.action",
					type:"post", 
					data: "gradeId=" + $("#gradeId").val() + "&groupName=" + groupName + "&groupLeader=" + $("#groupLeader").val(),
					cache:false,
					dataType:"text",
					success:function(msg){
					    alert(msg);
					    closeBg();
					    location.reload();
					}
				});
            }
        }
        
        function modify_user(){
            	var ids = new Array(); 
		    	var index = 0;
		    	$(":checkbox").each(function(){
		        	if($(this).attr("checked") == true){
		            	if($(this).val().substring(0, 2)=="3G"){
   		                	ids[index++] = $(this).val().substring(2);
		              	}
		          	}
		    	});
		    	if(index < 1){
		        	alert("必须选择一个三类群组");
		        	return false;
		    	}
		    	if(index > 1){
		        	alert("该操作不支持批量操作，只能选择一个三类群组");
		        	return false;
		    	}
		    	$("#groupId").val(ids[--index]);
		    	var dh = document.body.scrollHeight; 
            	var bw = $("body").width(); 
            	$("#fullbg3").css({ 
                	height:dh, 
                	width:bw, 
                	display:"block" 
            	});
            	$("#dialog3").show();
            	$.ajax({
			    	url:"group_getGroupMem.action",
			    	data: "groupId=" + $("#groupId").val(),
					type:"post", 
					cache:false,
					dataType:"text",
					success:function(msg){
				    	var ustr = "";
				    	var users = msg.split(";");
				    	for(var i = 0; i < users.length - 1; i++){
					        var uinfo = users[i].split(",");
					        if(uinfo[2] == 1){
					            ustr += "<li><input type=\"checkbox\" checked=\"checked\" value=\"" + uinfo[0] + "\">" + uinfo[1] + "</li>";
					        }else{
					            ustr += "<li><input type=\"checkbox\" value=\"" + uinfo[0] + "\">" + uinfo[1] + "</li>";
				    	    }
				    	}
				    	$("#us").html(ustr + $("#us").html());
					}
				});
        }
        
        function modify_group(){
            var ids = "";
            $("#us input").each(function(){
                if($(this).attr("checked") == true){
                     ids += $(this).val() + ",";
                }
            });
            $.ajax({
			    url:"group_modifyGroupMem.action",
			    data: "groupId=" + $("#groupId").val() + "&userIds=" + ids,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				    alert(msg);
				    closeBg();
				    location.reload();
				}
			});
        }
        
        function modify_sgroup(){
            	var ids = new Array();
		   		var index = 0;
		    	$(":checkbox").each(function(){
		        	if($(this).attr("checked") == true){
		            	if($(this).val().substring(0, 2)=="2G"){
   		                	ids[index++] = $(this).val().substring(2);
		              	}
		          	}
		    	});
		    	if(index < 1){
		        	alert("必须选择一个二类群组");
		        	return false;
		    	}
		    	if(index > 1){
		        	alert("该操作不支持批量操作，只能选择一个二类群组");
		        	return false;
		    	}
		    	$("#cgroupId").val(ids[--index]);
		    	var dh = document.body.scrollHeight; 
            	var bw = $("body").width(); 
            	$("#fullbg4").css({ 
                	height:dh, 
                	width:bw, 
                	display:"block"
            	});
            	$("#dialog4").show();
            	$.ajax({
			    	url:"group_getSecondGroupMem.action",
			    	data: "cgroupId=" + $("#cgroupId").val(),
					type:"post", 
					cache:false,
					dataType:"text",
					success:function(msg){
				    	var gstr = "";
				    	var groups = msg.split(";");
				    	for(var i = 0; i < groups.length - 1; i++){
					        var ginfo = groups[i].split(",");
					        if(ginfo[2] == 1){
					            gstr += "<li><input type=\"checkbox\" checked=\"checked\" value=\"" + ginfo[0] + "\">" + ginfo[1] + "</li>";
					        }else{
					            gstr += "<li><input type=\"checkbox\" value=\"" + ginfo[0] + "\">" + ginfo[1] + "</li>";
				    	    }
				    	}
				    	$("#gs").html(gstr + $("#gs").html());
					}
				});
        }
        
        function modify_cgroup(){
            var ids = "";
            $("#gs input").each(function(){
                if($(this).attr("checked") == true){
                     ids += $(this).val() + ",";
                }
            });
            $.ajax({
			    url:"group_modifySecondGroupMem.action",
			    data: "cgroupId=" + $("#cgroupId").val() + "&groupIds=" + ids,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				    alert(msg);
				    closeBg();
				    location.reload();
				}
			});
        }
	</script>
  </head>
  
  <body style="margin: 0px;">
    <div class="div_tree">
        <div class="top" ></div>
        <div class="top2" >
            <span style="margin-left: 60px;"></span>
            <input type="button" value="设置等级" onclick="showBg();">
            <input type="button" value="编辑群组成员" onclick="modify_sgroup();">
            <input type="button" value="编辑客户成员" onclick="modify_user();">
            <input type="button" value="添加群组" onclick="showBg2();">
        </div>
        <div class="main">
           <div class="left"></div>
           <div class="right">
               <ul class="tree">
                    <c:forEach items="${groupMap}" var="rgs">
                        <li>
                            <input type="checkbox" value="${rgs.key.groupId}">
                            <label>${rgs.key.groupName}</label>
                            <ul>
                                <c:if test="${rgs.value != null}">
                                    <c:forEach items="${rgs.value}" var="rg">
                                        <li>
						                    <input type="checkbox" value="2G${rg.key.group.groupId}">
	                                        <label>二类:${rg.key.group.groupName}</label>
	                                        <ul>
	                                            <c:if test="${rg.value != null}">
	                                                    <li>
															<input type="checkbox" value="1U${rg.key.leader.userId}">
															<label>${rg.key.leader.userName}</label>
														</li>
	                                                <c:forEach items="${rg.value}" var="r">
	                                                    <li>
	                                                        <input type="checkbox" value="3G${r.key.groupId}">
	                                                        <label>三类:${r.key.groupName}</label>
	                                                        <ul>
	                                                            <c:if test="${r.value != null}">
	                                                                <c:forEach items="${r.value}" var="user">
	                                                                    <li>
	                                                                        <input type="checkbox" value="1U${user.userId}">
	                                                                        <label>${user.userName}</label>
	                                                                    </li>
	                                                                </c:forEach>
	                                                            </c:if>
	                                                        </ul>
	                                                    </li>
	                                                </c:forEach>
	                                            </c:if>
	                                        </ul>
                                        </li>
					                </c:forEach>
                                </c:if>
                                <c:forEach items="${noPraentGroup}" var="g">
	                                <li>
	                                    <input type="checkbox" value="3G${g.groupId}">
	                                    <label>三类:${g.groupName}</label>
	                                    <ul>
	                                        <c:if test="${g.users != null}">
	                                            <c:forEach items="${g.users}" var="gu">
	                                                <li>
	                                                    <input type="checkbox" value="1U${gu.userId}">
	                                                    <label>${gu.userName}</label>
	                                                </li>
	                                            </c:forEach>
	                                        </c:if>
	                                    </ul>
	                                </li>
	                            </c:forEach>
                                <c:forEach items="${noGroupUsers}" var="u">
                                     <li>
	                                     <input type="checkbox" value="1U${u.userId}">
	                                     <label>${u.userName}</label>
	                                 </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
				</ul>
           </div>
        </div>
        <div>
			<div id="fullbg" class="fullbg"></div>
			<div id="dialog" class="dialog">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div id="dialog_text">
				    <input type="hidden" id="userId">
				    <div id="rs"></div>
				    <input type="button" value="保   存" onclick="save();">
				</div>
			</div>
		</div>
		
		<div>
			<div id="fullbg2" class="fullbg"></div>
			<div id="dialog2" class="dialog2">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div id="dialog_text2">
				    <ul>
				         <li>
				             <span>群组名称:</span><input type="text" id="groupName" class="">
				         </li>
				         <li>
				             <span>群组等级:</span>
						     <select id="gradeId" onchange="sel_leader();">
						         <option value="-1">--请选择--</option>
						     </select>
				         </li>
				         <li>
				             <span>群组组长:</span>
						     <select id="groupLeader">
						         <option value="-1">--请选择--</option>
						     </select>
				         </li>
				         <li>
				             <input type="button" value="保   存" onclick="save_group();">
				         </li>
				    </ul>
				    <div style="clear: both;"></div>
				</div>
			</div>
		</div>
		
		<div>
			<div id="fullbg3" class="fullbg"></div>
			<div id="dialog3" class="dialog3">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<input type="hidden" id="groupId">
				<div id="dialog_text3">
				    <ul id="us">
				        <div style="clear: both;"></div>
				    </ul>
				    <input type="button" value="保   存" onclick="modify_group();">
				    <div style="clear: both;"></div>
				</div>
			</div>
		</div>
		
		<div>
			<div id="fullbg4" class="fullbg"></div>
			<div id="dialog4" class="dialog4">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<input type="hidden" id="cgroupId">
				<div id="dialog_text4">
				    <ul id="gs">
				        <div style="clear: both;"></div>
				    </ul>
				    <input type="button" value="保   存" onclick="modify_cgroup();">
				    <div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
    </div>
</body>
</html>
