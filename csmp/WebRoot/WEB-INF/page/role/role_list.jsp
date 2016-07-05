<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>账号管理</title>
  	
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/themes/default/easyui.css"/>
  	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/t_style.css"></link>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.artDialog.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>
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
		color:#474bcc;	/*蓝色*/
  	}
	
	table.stripe tr.alt td{
		background:#EEEEEE;
	}
	
	table.stripe tr.over td {
		background:#EAF8FF;
	} 
  	
  	.menu label{
		float:left;
		display:block;
		text-align:center;
		color:#ccc;	/*蓝色*/
		height:30px; 
		margin-top:15px;  
		padding-top:4px; 
		font-size:16px; 
 		font-weight:bold; 
		margin-left:40px;
		margin-right:10px;
	}
	
	table,td,th{
		text-align:center;
		border-collapse: collapse;	
		font-size:14px; 
		border:1px dashed #CCCCCC;
	}
	.tablecss{
	border:0px;
	}
	.tablecss td{
		text-align:center;
		border-collapse: collapse;	
		font-size:14px; 
		border:0px;
	}
	
	div.page_no {
		width:250px; 
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
	
	.Content {		
		display:block; 
		width:1300px;
	}
 	
	.button {
		height:25px; 
		cursor:pointer; 
		margin-left:7px;   
		padding-top:1px; 
		border:none; 
		background-color: #F40; 
		color:#fff;  
		border-radius:4px;  
		font-size:14px; 
 		font-weight:bold; 
		width:70px;
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
		margin:40px 450px 0px 450px;
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
	
	#add {
		cursor:pointer;  
		border:1px solid #F0F0F0; 
		margin-top:5px;
	}
	
	#delete {
		cursor:pointer;  
		border:1px solid #F0F0F0; 
		margin-left:10px;
	}
	
	#add:HOVER {
           padding: 0px;
           cursor: pointer;
           border: 1px solid #33A0E5;
           color: #33A0E5;
       }
       
	#delete:HOVER {
           padding: 0px;
           cursor: pointer;
           border: 1px solid #33A0E5;
           color: #33A0E5;
       }
  </style>
  <script type="text/javascript">
    $(function(){
    	var height = parseInt($(".global").css("height").replace("px", ""));
        if(height < 300) height = 300;//设置最小高度535
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
    	$("#add").click(function(){
			  $(".Content").css("display","none");
			  $("#dataLoad").css("display","block");
    			//var bh = $("body").height(); 
           		//var bw = $("body").width(); 
            	//$("#fullbg").css({ 
                	//height:bh*1.25, 
                	//width:bw, 
                	//display:"block" 
            	//});
            $("#dialog").show();
            $("#mpage").attr("src","role_add.action");	
    	});
 
		$("#delete").click(function(){
		 	$(".Content").css("display","none");
			$("#dataLoad").css("display","block");
			var judge =  $("input[name='subBox']:checked").length ==0 ? true : false;
				if(judge==false){
				 	var array = $("input[name='subBox']:checked");
		      	 	var array1 = new Array($("input[name='subBox']:checked").length);   
		      	 	for(var i =0; i<array.length;i++){
		      	  		array1[i]=array[i].value;
		      	 	}
				  	$.messager.confirm('确认','确认删除?',function(data){
				  		if (data) {
			 	  			$.ajax({		
					  			type : "POST",
					  			url : "role_delete.action",
					  			data : "roleIds="+array1,
					  			dataType : "text",
					  			success : function(msg) {
 									location.reload();
						  		}
						  		
					  		});
					  	}
            			else {
                			alert("取消");
                			location.reload();
            			}
				 	});
				}else{
					alert("打钩");
					location.reload();
				}
    	});
    });
    
	function changename(obj1,obj2) {
			//var bh = $("body").height(); 
            //var bw = $("body").width(); 
            //$("#fullbg").css({ 
                //height:bh*1.25, 
                //width:bw, 
                //display:"block" 
            //});
            $(".Content").css("display","none");
			$("#dataLoad").css("display","block");
            $("#dialog").show();
            $("#mpage").attr("src","role_changename.action?roleId="+obj1+"&roleName="+obj2);	
	}
		
   	function to_page(iden) {
		if (iden == "fpage") {
		 	  $(".Content").css("display","none");
			  $("#dataLoad").css("display","block");
			  $("#linked").attr("href", "role_list.action?pageNum=1&pageSize=${pageBean.pageSize}");
		} else if (iden == "lpage") {
		 	  $(".Content").css("display","none");
			  $("#dataLoad").css("display","block");
			  $("#linked").attr("href", "role_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}");
		} else {
			  $(".Content").css("display","none");
			  $("#dataLoad").css("display","block");
			  $("#linked").attr("href", "role_list.action?pageNum=${pageBean.currentPage}&pageSize=${pageBean.pageSize}");
		}
		document.getElementById("linked").click();
	 }
	 
	function modify(rid, name, rank){
		$("#fullbg,#dialog").hide();
		$(".Content").css("display","none");
		$("#dataLoad").css("display","block");
		$.ajax({
			  type : "POST",
			  url : "role_modify.action",
			  data : "roleId=" + rid + "&roleName=" + name + "&roleRank=" + rank,
			  dataType : "text",
			  success : function(msg) {
				  if(msg == "ok"){
			  	      alert("成功");
			      }
 				  location.reload();
			   }
		});
	 }
	 	
	 function add(name, rank){
	 		 $("#fullbg,#dialog").hide();
			 $(".Content").css("display","none");
			 $("#dataLoad").css("display","block");
			 $.ajax({
				  type : "POST",
				  url : "role_addrole.action",
				  data : "roleName=" + name + "&roleRank" + rank,
				  dataType : "text",
				  success : function(msg) {
   					  location.reload();
				  }
			  });
	  }
	 
	  function giveRight(roleid){
	         $("#ilinked").attr("href", "right_getRightTree.action?roleId=" + roleid);
			 document.getElementById("ilinked").click();
	   }
	 
	  function Next(){
	 		$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "role_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}");
			document.getElementById("linked").click();
	  }
	 
	 function Last(){
	 		$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "role_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}");
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
  <a href="javascript:void(0);" id="ilinked" target="_blank"></a>
  <div class="global">
   
  <div>
	<div id="fullbg" class="fullbg"></div>
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
  <div id="dataLoad" style=" margin-top:00px; display:none;"><!--页面载入显示-->
   		<table class="tablecss" width=100% height=100% border=0 align=center align=middle>
    		<tr height=50%><td align=center>&nbsp;</td></tr>
    		<tr><td align=center><img src="img/zairu.gif"/></td></tr>
    		<tr><td align=center>数据载入中，请稍后......</td></tr>
    		<tr height=50%><td align=center>&nbsp;</td></tr>
   		</table>
  </div>
  
  <!-- 全部状态账户-->
   <div  class="Content" id="allstate">
		<div style="float:left; margin-top: 20px;">
			<div style="width:300px;"></div>
   			<!-- 用户名表单 -->
   			<table class="stripe" style="border:1px solid #589FD3; width: 1300px;">
        		<thead>	<!-- 表头 -->
           				<tr style="height:25px; padding-top:5px; background:#589FD3;">
           				  <th colspan="6" style="border: 0px; text-align:left; font-size:16px; text-indent:35px; font-weight:bold;color: #FFF;">角色管理列表</th>
           				</tr>
           				<tr style="background:#F0F0F0; height:30px;">
           				 <th colspan="3" style="border: 0px; text-align:left;">
           				  <input id="add" type="button" value="添  加" />
           				  <input id="delete"  type="button" value="删  除"/>
           				 </th>
           				 <th colspan="3" style="border: 0px;" align="right">
           					<div class="page_no"  style="float:right; border:0px;">
              					<ul>
                  					<li>
                      					<a href="#" id="alink" style="display:none;"></a>
                      						<c:if test="${pageBean.currentPage == pageBean.pageCount}">
                          						<a href="javascript:void(0);" style="cursor:default;" class="buton n_click">下一页</a>
                      						</c:if>
                      						<c:if test="${pageBean.currentPage < pageBean.pageCount}">
                          						<a onclick="Next();"  style="cursor:pointer;" href="javascript:void(0);" class="buton" title="Next Page">下一页</a>
                      						</c:if>
                  					</li>
                  					<li>
                      					<c:if test="${pageBean.currentPage == pageBean.pageCount}">
                          					<input type="button" style="cursor:default;" class="last n_last" value="&gt;&gt;">
                      					</c:if>
                      					<c:if test="${pageBean.currentPage < pageBean.pageCount}">
                          					<input type="button" style="cursor:pointer;" class="last" title="尾页" value="&gt;&gt;" onclick="to_page('lpage')">
                      					</c:if>
                  					</li>
                  					<li>
                      					<label class="page_num">&nbsp;&nbsp;${pageBean.currentPage}</label>
                 					</li>
                  					<li>
                						<c:if test="${pageBean.currentPage == 1}">
                   							<input type="button" style="cursor:default;" class="last n_last" value="&lt;&lt;">
                						</c:if>
                						<c:if test="${pageBean.currentPage > 1}">
                   							<input type="button" style="cursor:pointer;"  class="last" title="首页" onclick="to_page('fpage')" value="&lt;&lt;">
                						</c:if>
             						</li>
             						<li>
             							<c:if test="${pageBean.currentPage == 1}">
                							<a href="javascript:void(0);" style="cursor:default;" class="buton n_click">上一页</a>
            							</c:if>
            							<c:if test="${pageBean.currentPage > 1}">
                							<a onclick = "Last();" style="cursor:pointer;" href="javascript:void(0);" class="buton" title="Last Page" >上一页</a>
            							</c:if>
          							</li>
       							</ul>
      							<div style="clear: both;"></div>
  							</div>
  					</th>
  				</tr>
  				<tr style="height:30px;">
    				<th style="width:30px; border-width:1px; border-color:#CCCCCC; border-style: solid solid solid none;"><span  style="height:40px; width:20px; ">-</span></th>
    				<th style="width:100px; border:1px solid #CCCCCC;">角色Id</th>
    				<th style="width:200px; border:1px solid #CCCCCC;">角色名称</th>
    				<th style="width:300px; border:1px solid #CCCCCC;">角色类型</th>
   					<th style="width:300px; border:1px solid #CCCCCC;"></th>
    				<th style="width:125px ; border-width:1px; border-color:#CCCCCC; border-style: solid none solid solid;">操作</th>
   				</tr>
 			</thead>
 			<tbody>
  			<!-- 账号列表 -->
   				<c:forEach items="${pageBean.recordList}" var="role">
   					<c:if test="${role.roleId != 1}">
     					<tr style="height:30px;">
       						<td><input name="subBox" value="${role.roleId}" style="cursor:pointer; height:20px; width:20px;"  type="checkbox"/></td>
       						<td><label>${role.roleId}</label></td>
        					<td><label>${role.roleName}</label></td>
        					<td>
        					    <c:if test="${role.roleRank == 0}">
        					        管理员
        					    </c:if>
        					    <c:if test="${role.roleRank == 1}">
        					        客户
        					    </c:if>
        					</td>
        					<td></td>
        					<td>
        						<div><ul>
               						<li  style="display:block;  float:top; margin-top:5px;">
                						<input id="changeName" type="button" class="button" onclick="changename('${role.roleId}','${role.roleName}');" value="编辑"/>
               						</li>
               						<li  style="display:block;  float:top; margin-top:7px; margin-bottom:5px;">
                						<input id="changeName" type="button" class="button" onclick="giveRight('${role.roleId}');" value="授权"/>
               						</li>
         						</ul></div>
         					</td> 
       					</tr>
       				</c:if>
				</c:forEach>
  			</tbody>
		</table>
	</div>
</div>
<div style="clear: both;"></div>
</div>
</body>
</html>
