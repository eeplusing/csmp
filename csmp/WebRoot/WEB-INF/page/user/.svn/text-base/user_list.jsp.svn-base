<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>账号管理</title>
  	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/t_style.css"></link>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  	<style type="text/css">
  	.global{
  		list-style: none;  	
  		width:1300px;
  		margin: 0px auto;
  	}
  	
 	.menu{
		background:#F7F8FC;
		width:1300px;
		height:60px;
   	 	padding-top:0px;
  	}
  	
  	.menu li{
		float:left;
		margin-left:20px;
		display:block;
		width:100px;
		text-align:center;
		color:#474bcc;	
  	}
  	
  	.menu label{
		float:left;
		display:block;
		text-align:center;
		color:#333;
		height:30px; 
		margin-top:15px;  
		padding-top:4px; 
		font:bold 16px; 
		margin-left:40px;
		margin-right:10px;
	}
	
	table,td,th{
		text-align:center;
		border-collapse: collapse;	
		font-size:14px;
	}
	
	table.stripe tr.alt td{
		background:#EEEEEE;
	}
	
	table.stripe tr.over td {
		background:#EAF8FF;
	} 
	
	.select{
		height:40px;background:#fff url(img/icons.png) no-repeat right -24px;
		color: #333; 
		font-size: 16px;
		border:1px solid #E4E4E4;
		cursor:pointer;
		position:relative;
		_filter:alpha(opacity=0);
		margin-top:15px; 
		height:30px;
		width:150px;
		cursor:pointer;
	}
	
	div.page_no {
		width: 1300px; 
		margin-top : 10px;
		height: 30px;
		background: #F3F3F3;
		border: 1px solid #DEDEE0;
	}
	
	div.page_no li {
		float: right;
		border: 0px solid #F00;
	}
	
	div.page_no li a {
		display: block;
		margin: 5px 10px;
		border: 1px solid #DEDEE0;
		width: 20px;
		height: 15px;
		padding-top: 2px;
		text-align: center;
		font-size: 12px;
		background: #FFF;
		color: #333;
		cursor: pointer;
	}
	
	div.page_no li a.buton {
		width: 60px;
		height: 15px;
		text-align: center;
		padding-top: 2px;
		font-size: 12px;
		background: #FFF;
		border: 1px solid #CCC;
	}
	
	div.page_no li a.n_click {
		color: #CCC;
	}
	
	div.page_no li input {
		float: right;
		display: block;
		margin: 5px 0px;  
	}
	
	.page_num {
		width: 30px;
		border-left: none;
		border-right: none;
		padding-top:4px;
		margin_left:10px;
		float:left;
	}
	
	input.last {
		border: 1px solid #DEDEE0;
		background: #FFF;
		cursor: pointer;
	}
	
	input.n_last {
		color: #CCC;
		cursor: auto;
	}
	
	.searchbutton{
 		float:left; 
 		border-radius:4px; 
 		background-color: #F40; 
 		margin-top:14px; 
 		color:#fff;  
 		text-align: center;  
 		padding-top:0px; 
 		font-size:16px; 
 		font-weight:bold; 
 		cursor:pointer; 
 		height:30px; 
 		width:100px; 
 		border-radius:4px; 
 		border:none;
	}
	
	.Content{
		display:block; 
		width:1300px;
	}
 	
 	.shuru{
		width:100px; 
		border-radius:4px; 
		margin-top:15px; 
		height:30px;  
		float:left;
		font-size:16px; 
	}
	
	#checkAll{
		height:20px; 
		width:20px; 
		float:left; 
		cursor:pointer; 
		margin-top:10px; 
	}
	
	li .quanxuan{
		float:left;
		padding-top:12px;
		font-size:16px;  
	}
	
	.ope{
		float:left;
		margin-top:3px;
	}
	
	li input.button{
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
	
	th{
		background: #589FD3;
		background-size:40px 100%;
		border : none;
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
		width: 350px;
		height: 250px;
		margin:-200px 450px 0px 450px;
		padding: 0px;
		position: fixed !important; /* 浮动对话框 */
		position: absolute;
		z-index: 5;
		border-radius: 5px;
		display: none;
	}
	
	.dialog p.close {
		margin-top: 0px;
		height: 38px;
		line-height: 24px;
		background: #CCC;
		text-align: right;
		padding-right: 10px;
	}
	
	.dialog p.close a {
		color: #fff;
		border:0px;
		text-decoration: none;
	}
	
	#dialog_text {
   		width: 100%;
   		height: 690px;
   		border: 0px solid #F00;
	}
	
	#mpage {
   		width: 100%;
 		height: 210px;
	}
  </style>
  <script type="text/javascript">
  //添加斑马纹与鼠标移动纹
    $(document).ready(function(){ 
    	var height = parseInt($(".global").css("height").replace("px", ""));
        height = 556;
        if(window){
		     window.parent.set_fheight("main", height + 20);
		     window.parent.set_fheight("mpage", height + 20);
		}else{
			 win.parent.set_fheight("main", height + 20);
			 window.parent.set_fheight("mpage", height + 20);
		} 
		  
        $(".stripe tr").mouseover(function(){    
          $(this).addClass("over");}).mouseout(function(){    
                $(this).removeClass("over");
           });  
      	$(".stripe tr:even").addClass("alt");    
     });   
    $(function(){
  		if(${user_stat}==9){
  		  $('#groupfreeze').css("display","block");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","block");
  		  }
  		else if(${user_stat}==0){
  		  $('#groupfreeze').css("display","block");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","block");
  		  }
      	else if(${user_stat}==1){
  		  $('#groupfreeze').css("display","block");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","block");
  		  }
    	else if(${user_stat}==2){
  		  $('#groupfreeze').css("display","none");
  		  $('#groupwarm').css("display","block");
  		  $('#groupwithdraw').css("display","block");
  		  }
  		else if(${user_stat}==3){
  		  $('#groupfreeze').css("display","none");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","none");
  		  }
  		else if(${user_stat}==4){
  		  $('#groupfreeze').css("display","block");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","block");
  		  }
  		else if(${user_stat}==5){
  		  $('#groupfreeze').css("display","block");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","block");
  		  }
  		else if(${user_stat}==6){
  		  $('#groupfreeze').css("display","block");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","block");
  		  }
  		else if(${user_stat}==7){
  		  $('#groupfreeze').css("display","block");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","block");
  		  }
  		else if(${user_stat}==8){
  		  $('#groupfreeze').css("display","block");
  		  $('#groupwarm').css("display","none");
  		  $('#groupwithdraw').css("display","block");
  		 }
  		//判断CHECKBOX
  		$('#checkAll').click(function() {
	       $('input[name="subBox"]').attr("checked",this.checked); 
	   	  });
	   	var $subBox = $("input[name='subBox']");
	  	$subBox.click(function(){
	       $('#checkAll').attr("checked",$subBox.length == $("input[name='subBox']:checked").length ? "checked" : false);
	    });
	    //冷冻
	    $('#groupfreeze').click(function(){
		    var judge =  $("input[name='subBox']:checked").length ==0 ? true : false;
		    	if(judge==false){
			    	var array = $("input[name='subBox']:checked");
			    	var array1 = new Array($("input[name='subBox'].length"));
			    	for(var i =0; i<array.length;i++){
			      		array1[i]=array[i].value;
			    	}
		      		$(".Content").css("display","none");
					$("#dataLoad").css("display","block");
					$.ajax({
						type : "POST",
						url : "user_groupfreeze.action",
						data : "userIds=" + array1,
						dataType : "text",
						success : function(msg) {
							if(msg == "ok"){
						    	alert("成功");
							}else{
						    	alert("失败");
							}
							location.reload();
						}
					});
				 //$("#linked").attr("href","user_groupfreeze.action?userIds="+array1);
				 // document.getElementById("linked").click();
				}else{
					alert("填空");
				}
	    });
	    //解冻
	    $('#groupwarm').click(function(){
		    var judge =  $("input[name='subBox']:checked").length ==0 ? true : false;
		    	if(judge==false){
		      		var array = $("input[name='subBox']:checked");
		      		var array1 = new Array($("input[name='subBox'].length"));      
		      		for(var i =0; i<array.length;i++){
		      	  		array1[i]=array[i].value;
		      		}
		      		$(".Content").css("display","none");
			  		$("#dataLoad").css("display","block");
			  		$.ajax({
			  			type : "POST",
						url : "user_groupwarm.action",
						data : "userIds=" + array1,
						dataType : "text",
						success : function(msg) {
				  			if(msg == "ok"){
					  			alert("成功");
				  			}else{
					  			alert("失败");
				  				}
					  		location.reload();
				  		}
					});
				  //$("#linked").attr("href","user_groupwarm.action?userIds="+array1);
				  //document.getElementById("linked").click();
				}else{
					alert("填空");
				}
	      });
	      //注销
	    $('#groupwithdraw').click(function(){
	    	var judge =  $("input[name='subBox']:checked").length ==0 ? true : false;
	    		if(judge==false){
	      			var array = $("input[name='subBox']:checked");
	      			var array1 = new Array($("input[name='subBox'].length"));      
	      			for(var i =0; i<array.length;i++){
	      	  			array1[i]=array[i].value;
	      			}
	      			$(".Content").css("display","none");
		  			$("#dataLoad").css("display","block");
		  			$.ajax({
			  			type : "POST",
			  			url : "user_groupwithdraw.action",
			  			data : "userIds=" + array1,
			  			dataType : "text",
			  			success : function(msg) {
				  			if(msg == "ok"){
				  	  			alert("成功");
				  			}else{
					  			alert("失败");
				  				}
					  		location.reload();
				  		}
		    		});
			  //$("#linked").attr("href","user_groupwithdraw.action?userIds="+array1);
			  //document.getElementById("linked").click();
				}else{
		  			alert("填空");
				}
	  		});
    });
    //查找
    function searchsearch(){
   		var account = $("#account").attr("value");
   		var name = $("#name").attr("value");
   		var grade = $("#grade").attr("value");
   		var group = $("#group").attr("value");
   		var role = $("#role").attr("value");
   		var userstat = $("#select").attr("value");
		$(".Content").css("display","none");
		$("#dataLoad").css("display","block");
		$("#linked").attr("href","user_list.action?userstat="+userstat+"&useraccount="+account+"&username="+name+"&usergrade="+grade+"&usergroup="+group+"&userrole="+role);
		document.getElementById("linked").click();
   	}
   	//翻页		
   	function to_page(iden) {
		if (iden == "fpage") {
		 	$(".Content").css("display","none");
			$("#dataLoad").css("display","block");
			$("#linked").attr("href", "user_list.action?pageNum=1&pageSize=${pageBean.pageSize}&userstat=${user_stat}&useraccount=${userAccount}&username=${userName}&usergroup=${userGroup}&userrole=${userRole}&usergrade=${userGrade}");
		} else if (iden == "lpage") {
		 	$(".Content").css("display","none");
			$("#dataLoad").css("display","block");
			$("#linked").attr("href", "user_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&userstat=${user_stat}&useraccount=${userAccount}&username=${userName}&usergroup=${userGroup}&userrole=${userRole}&usergrade=${userGrade}");
		} else {
		 	$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "user_list.action?pageNum=${pageBean.currentPage}&pageSize=${pageBean.pageSize}&userstat=${user_stat}&useraccount=${userAccount}&username=${userName}&usergroup=${userGroup}&userrole=${userRole}&usergrade=${userGrade}");
		}
		document.getElementById("linked").click();
	 }
	 
	 function Next(){
	 		$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "user_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&userstat=${user_stat}&useraccount=${userAccount}&username=${userName}&usergroup=${userGroup}&userrole=${userRole}&usergrade=${userGrade}");
			document.getElementById("linked").click();
	 }
	 
	 //更改角色
	 function changerole(userId){
		$(".Content").css("display","none");
		$("#dataLoad").css("display","block");
		$("#dialog").show();
        $("#mpage").attr("src","user_changerole.action?userId="+userId);	
	 }
	 
	 function saverole(obj1,obj2){
	 		 $("#fullbg,#dialog").hide();
			 $(".Content").css("display","none");
			 $("#dataLoad").css("display","block");
			 $.ajax({
				  type : "POST",
				  url : "user_saverole.action",
				  data : "userId="+obj1+"&rolename="+obj2,
				  dataType : "text",
				  success : function(msg) {
   					  location.reload();
				  }
			  });
	  }
	 
	 function Last(){
	 		$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "user_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&userstat=${user_stat}&useraccount=${userAccount}&username=${userName}&usergroup=${userGroup}&userrole=${userRole}&usergrade=${userGrade}");
			document.getElementById("linked").click();
	 }
	 
	 function closeBg() { 
        $("#fullbg,#dialog").hide();
        $("#mpage").attr("src","");
        $(".Content").css("display","block");
		$("#dataLoad").css("display","none");
    }
   	</script>

  </head>
  <body>
  <a href="javascript:void(0);" id="linked"></a>
   <div class="global">

   	<div id="dataLoad" style=" margin-top:-300px; display:none;"><!--页面载入显示-->
  		 <table width=100% height=100% border=0 align=center align=middle>
    			<tr height=50%><td align=center>&nbsp;</td></tr>
				<tr><td align=center><img src="img/zairu.gif"/></td></tr>
    			<tr><td align=center>数据载入中，请稍后......</td></tr>
    			<tr height=50%><td align=center>&nbsp;</td></tr>
   		</table>
  	</div>
  
  	<div>
		<div id="fullbg"  class="fullbg"></div>
		<div id="dialog" class="dialog">
			<p class="close">
				<a href="javascript:void(0);" onclick="closeBg();" title="关闭">×</a>
			</p>
			<div id="dialog_text">
				<iframe src="" id="mpage" scrolling="auto" name="modify_main"></iframe>
				<div style="clear: both;"></div>
			</div>
		</div>
	 </div>
  
  <!-- 全部状态账户-->
  <div  class="Content" id="allstate">
   <div class="menu">
   		<ul>
   			<li style="width:150px;">
   				<div><select class="select" id="select" name="selectVariety">
   					<c:if test="${user_stat == 9}">
   						<option id="nine" value="9" selected="selected">所有状态</option>
   					</c:if>
   					<c:if test="${user_stat != 9}">
   						<option id="nine" value="9">所有状态</option>
   					</c:if>
   					<c:if test="${user_stat == 0}">
   						<option id="zero" value="0" selected="selected">在线</option>
   					</c:if>
   					<c:if test="${user_stat != 0}">
   						<option id="zero" value="0">在线</option>
   					</c:if>
   					<c:if test="${user_stat == 1}">
   						<option id="one" value="1" selected="selected">离线</option>
   					</c:if>
   					<c:if test="${user_stat != 1}">
   						<option id="one" value="1">离线</option>
   					</c:if>
   					<c:if test="${user_stat == 2}">
   						<option id="two" value="2"selected="selected">被冻结</option>
   					</c:if>
   					<c:if test="${user_stat != 2}">
   						<option id="two" value="2">被冻结</option>
   					</c:if>
   					<c:if test="${user_stat == 3}">
   						<option id="three" value="3"selected="selected">被注销</option>
   					</c:if>
   					<c:if test="${user_stat != 3}">
   						<option id="three" value="3">被注销</option>
   					</c:if>
   					<c:if test="${user_stat == 4}">
   						<option id="four" value="4"selected="selected">正在购物</option>
   					</c:if>
   					<c:if test="${user_stat != 4}">
   						<option  id="four" value="4">正在购物</option>
   					</c:if>
   					<c:if test="${user_stat == 5}">
   						<option  id="five" value="5"selected="selected">正在支付</option>
   					</c:if>
   					<c:if test="${user_stat != 5}">
   						<option id="five"value="5">正在支付</option>
   					</c:if>
   					<c:if test="${user_stat == 6}">
   						<option id="six" value="6"selected="selected">订单查询</option>
   					</c:if>
   					<c:if test="${user_stat != 6}">
   						<option  id="six" value="6">订单查询</option>
   					</c:if>	
   					<c:if test="${user_stat == 7}">
   						<option  id="seven" value="7" selected="selected">浏览商品</option>
   					</c:if>
   					<c:if test="${user_stat != 7}">
   						<option id="seven" value="7">浏览商品</option>
   					</c:if>
   					<c:if test="${user_stat == 8}">
   						<option id="eight" value="8" selected="selected">查看购物车</option>
   					</c:if>
   					<c:if test="${user_stat != 8}">
   						<option id="eight" value="8">查看购物车</option>
   					</c:if>
   				</select></div>
   		</li>
   		<label>账号:</label>
   		<li style="margin-left:0px;">
   		    <input type="text" class ="shuru" id="account" value="${userAccount}"/>
   		</li>
   		<label>姓名:</label>
   		<li style="margin-left:0px;">
   			<input type="text" class ="shuru" id="name" value="${userName}" />
   		</li>
   		<label>等级:</label>
   		<li style="margin-left:0px;">
   			<select id="grade" class ="shuru" style="cursor:pointer; ">
   				<c:forEach items="${grades}" var="grade">
   		     		<c:if test="${userGrade == grade.gradeId}">
   		         		<option value="${grade.gradeId}" selected="selected">${grade.gradeName}</option>
   		     		</c:if>
   		     		<c:if test="${userGrade != grade.gradeId}">
   		         		<option value="${grade.gradeId}">${grade.gradeName}</option>
   		     		</c:if>
   				</c:forEach>
   			</select>
   		</li>
   		<label>群组:</label>
   		<li style="margin-left:0px;">
   		<select id="group" class ="shuru" style=" cursor:pointer; ">
	   		<c:forEach items="${groups}" var="group">
   			    <c:if test="${userGroup == group.groupId}">
   			        <option value="${group.groupId}" selected="selected">${group.groupName}</option>
   		    	</c:if>
   		    	<c:if test="${userGroup != group.groupId}">
	   		        <option value="${group.groupId}">${group.groupName}</option>
   			    </c:if>
   			</c:forEach>
   		</select>
   		</li>
   		<label>角色:</label>
   		<li style="margin-left:0px;">
	   		<select id="role" class ="shuru" style=" cursor:pointer; ">
   				<c:forEach items="${roles}" var="role">
   		    	  <c:if test="${userRole == role.roleId}">
	   		    	  <option value="${role.roleId}" selected="selected">${role.roleName}</option>
	   		  	</c:if>
	   		  	<c:if test="${userRole != role.roleId}">
	   		      	<option value="${role.roleId}">${role.roleName}</option>
	   		  	</c:if>
   				</c:forEach>
   			</select>
   		</li>
   		<li><input type="button" onclick="searchsearch();" id="search" class="searchbutton"  value="查&nbsp;&nbsp;询"/> </li>
   	</ul>
   </div>
   	<!-- 对账户进行操作 -->
   	<div id="ope"  style="margin-left:20px;">
   	<ul>
   		<li  style="float:left;">
   			<input id="checkAll"    onclick="usercheck();" type="checkbox"/><label class="quanxuan">&nbsp;&nbsp;全&nbsp;选</label></li>
   		<c:if test="${user_stat!=2&&user_stat!=3}">
   			<li   class="ope" >
   				<input id="groupfreeze" class="button"  type="button" value="批量冻结"/>
   			</li>
   		</c:if>
   		<c:if test="${user_stat==2}">
   			<li  class="ope" >
   				<input id="groupwarm" class="button"  type="button" value="批量解冻"/>
   			</li>
   		</c:if>
   		<c:if test="${user_stat!=3}">
   			<li class="ope" >
   				<input id="groupwithdraw" class="button"  type="button" value="批量注销"/>
   			</li>
   		</c:if>
   	</ul>
   	</div>
   	<div style="float:left;">
   		<div class="page_no">
              <ul>
                  <li>
                      <a href="#" id="alink" style="display:none;"></a>
                      <c:if test="${pageBean.currentPage == pageBean.pageCount}">
                          <a href="javascript:void(0);" class="buton n_click">下一页</a>
                      </c:if>
                      <c:if test="${pageBean.currentPage < pageBean.pageCount}">
                          <a onclick="Next();"  href="javascript:void(0);" class="buton" title="Next Page">下一页</a>
                      </c:if>
                      <c:if test="${pageBean.currentPage == 1 && pageBean.pageCount == 0}">
                          <a href="javascript:void(0);" class="buton n_click">下一页</a>
                      </c:if>
                  </li>
                  <li>
                      <c:if test="${pageBean.currentPage == pageBean.pageCount}">
                          <input type="button" class="last n_last" value="&gt;&gt;">
                      </c:if>
                      <c:if test="${pageBean.currentPage < pageBean.pageCount}">
                          <input type="button" class="last" title="尾页" value="&gt;&gt;" onclick="to_page('lpage')">
                      </c:if>
                      <c:if test="${pageBean.currentPage == 1 && pageBean.pageCount == 0}">
                          <input type="button" class="last n_last" value="&gt;&gt;">
                      </c:if>
                  </li>
                  <li>
                      <label class="page_num">&nbsp;&nbsp;${pageBean.currentPage}</label>
                  </li>
                  <li>
                      <c:if test="${pageBean.currentPage == 1}">
                          <input type="button"  class="last n_last" value="&lt;&lt;">
                      </c:if>
                      <c:if test="${pageBean.currentPage > 1}">
                          <input type="button"  class="last" title="首页" onclick="to_page('fpage')" value="&lt;&lt;">
                      </c:if>
                  </li>
                  <li>
                      <c:if test="${pageBean.currentPage == 1}">
                          <a href="javascript:void(0);" class="buton n_click">上一页</a>
                      </c:if>
                      <c:if test="${pageBean.currentPage > 1}">
                          <a onclick = "Last();" href="javascript:void(0);" class="buton" title="Last Page" >上一页</a>
                      </c:if>
                  </li>
              </ul>
              <div style="clear: both;"></div>
          </div>
        <div style="width:300px;"></div>
   	<!-- 用户名表单 -->
   		<table class="stripe">
                <thead style="background:">	<!-- 表头 -->
                    <tr style="height:40px;color: FFF;">
                       <th style="width:53px; border:none;"><span style="height:40px; width:20px; "></span></th>
                       <th style="width:113px;">账号</th>
                       <th style="width:143px;">姓名</th>
                       <th style="width:143px;">手机号码</th>
                       <th style="width:283px;">注册单位</th>
                       <th style="width:103px;">状态</th>
                       <th style="width:203px;">电子邮箱</th>
                      <!-- <th style="width:176px;">当日连续登录错误次数</th> -->
                       <!-- <th style="width:180px">统计日期</th> -->
                       <th style="width:93px">等级</th>
                       <th style="width:118px">群组编号</th>
                       <th style="width:118px">角色信息</th>
                       <th style="width:118px">操作</th>
                    </tr>
                </thead>
              	<tbody>
                <!-- 账号列表 -->
              	<c:forEach items="${pageBean.recordList}" var="user">
                	<tr style="height:40px;">
                		<td><input name="subBox" value="${user.userId}" style="cursor:pointer; height:20px; width:20px;"  type="checkbox"/></td>
                		<td><label>${user.loginAccount}</label></td>
                		<td><label>${user.userName}</label></td>
                		<td><label>${user.userPhone}</label></td>
                		<td><label>${user.companyName}</label></td>
                		<td>
                			<c:if test="${user.state==0}">
                				<label>在线</label>
                			</c:if>
                			<c:if test="${user.state==1}">
	                			<label>离线</label>
    	            		</c:if>
        	         		<c:if test="${user.state==2}">
            	    			<label>被冻结</label>
                			</c:if>
                   			<c:if test="${user.state==3}">
                				<label>已被注销</label>
                			</c:if>
	                    	<c:if test="${user.state==4}">
    	            			<label>正在购物</label>
        	        		</c:if>
            	        	<c:if test="${user.state==5}">
                				<label>正在支付</label>
                			</c:if>
                    		<c:if test="${user.state==6}">
	                			<label>订单查询</label>
    	            		</c:if>
        	           		<c:if test="${user.state==7}">
                				<label>浏览商品</label>
            	    		</c:if>
                  			<c:if test="${user.state==8}">
                				<label>查看购物车</label>
	                		</c:if>
    	            </td>
        	        <td><label>${user.email}</label></td>
            	    <!--  <td><label>${user.errorNum}</label></td> -->
                	<!--  <td><label>${user.countDate}</label></td> -->
	                <td><label>${user.grade.gradeName}</label></td>
    	            <td><label>${user.group.groupName}</label></td>
        	        <td><label>${user.role.roleName}</label></td>
            	    <td><div>
                		<ul>
		                	<li  style="float:top;">
                				<c:if test="${user.state!=3}">
	                				<input id="changerole" onclick="changerole('${user.userId}');" type="button"  class="button"  value="更改角色"/>
    	        	    		</c:if>
            	   	    	</li>
	    	            </ul>
    	            </div></td> 
                </tr>
			</c:forEach>
          </tbody>
        </table>
   	</div>
   </div>
   <div style="clear: both;"></div>
  </div>
  </body>
</html>
