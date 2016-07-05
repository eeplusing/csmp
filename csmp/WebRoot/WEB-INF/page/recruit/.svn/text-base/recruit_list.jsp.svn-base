<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>招聘岗位</title>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/themes/default/easyui.css"/>
  	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/t_style.css"></link>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.artDialog.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>
    <style type="text/css">
    body{
        margin: 0px;
        padding: 0px;
        overflow: hidden;
    }
    
    .global{
  		list-style: none;  	
  		width:1300px;
  		margin: 0px auto;
  	}
    
    div.page_no {
		width: 1300px; 
		height: 30px;
		background: #F3F3F3;
		border: 1px solid #DEDEE0;
	}

	div.page_no li {
		float: right;
		border: 0px solid #F00;
	}
	
	table.stripe tr.alt td{
		background:#EEEEEE;
	}
	
	table.stripe tr.over td {
		background:#EAF8FF;
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
    
	table,td,th{
	 	text-align:center;
	 	border-collapse: collapse;	
	 	font-size:14px; 
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
		border: 0px solid #999;
		width: 700px;
		height: 800px;
		left: 41%;
		margin: -200px 0 0 -200px;
		padding: 0px;
		position: fixed !important; /* 浮动对话框 */
		position: absolute;
		top: 14%;
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
	
	#dialog_text{
  		width: 700px;
   		height: 900px;
   		padding-top:20px;
   		border: 0px;
	}
	
	#mpage{
   		width: 100%;
   		height: 802px;
   		border:0px;
	}
	
	.Content{
		display:block; 
		width: 1300px;
		text-align: center;
		margin: auto;
	}
	
	th{
		background: #589FD3;
		background-size:40px 100%;
		border : none;
	}
	
	.Button{
		margin-left:20px;
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
	
	.workAddress{
		text-indent:70px; 
		text-align:left; 
		height:17px; 
		overflow:hidden;
	}
	
	.jobName{
		text-indent:70px; 
		text-align:left; 
		height:17px; 
		overflow:hidden;
	}
	</style>
	<script type="text/javascript">
	 $(document).ready(function(){
	 	$("input[name = 'subBox']").attr('checked',false);   	 
        $(".stripe tr").mouseover(function()
		{    
         		$(this).addClass("over");
        	}).mouseout(function(){    
			     $(this).removeClass("over");
		      });  
      	$(".stripe tr:even").addClass("alt"); 
	 
	    var height = parseInt($(".global").css("height").replace("px", ""));
        if(height < 300) height = 300;//设置最小高度535
        if(window){
		     window.parent.set_fheight("main", height + 20);
		     window.parent.set_fheight("mpage", height + 20);
		}else{
			 win.parent.set_fheight("main", height + 20);
			 window.parent.set_fheight("mpage", height + 20);
		} 
	    
	 	   
      	});  
	
		function add (){
		 	$("#alinked").attr("href","recruit_addandchange.action");
			document.getElementById("alinked").click();
		}
		
		function deletenews(){
			$("#fullbg,#dialog").hide();
			$(".Content").css("display","none");
			$("#dataLoad").css("display","block");
			var judge =  $("input[name='subBox']:checked").length ==0 ? true : false;
				if(judge==false){
					var array = $("input[name='subBox']:checked");
					var array1 = new Array($("input[name='subBox']:checked").length);
					for(var i =0;i<$("input[name='subBox']:checked").length;i++){
						array1[i] = array[i].value;
					}
					$.messager.confirm('确认','确认删除？',function(data){
						if (data) {
                			$.ajax({
								type : "POST",
								url : "recruit_delete.action",
								data :"recruitIds="+array1,
								dataType : "text",
								success : function(msg){
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
			}
		
		function changeRecruit(obj){
			$("#alinked").attr("href","recruit_addandchange.action?recruitId="+obj);
			document.getElementById("alinked").click();
		}
		
		function showrecruit(obj){
			$("#alinked").attr("href","recruit_showrecruit.action?recruitId="+obj);
			document.getElementById("alinked").click();
		}
		
		function to_page(iden) {
			if (iden == "fpage") {
		 		$(".Content").css("display","none");
			  	$("#dataLoad").css("display","block");
			  	$("#linked").attr("href", "recruit_list.action?pageNum=1&pageSize=${pageBean.pageSize}");
			}else if (iden == "lpage") {
		 	 	$(".Content").css("display","none");
			   	$("#dataLoad").css("display","block");
			  	$("#linked").attr("href", "recruit_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}");
			} else {
				$(".Content").css("display","none");
			  	$("#dataLoad").css("display","block");
			  	$("#linked").attr("href", "recruit_list.action?pageNum=${pageBean.currentPage}&pageSize=${pageBean.pageSize}");
			}
			document.getElementById("linked").click();
	 	}
	 
	   function Next(){
	 		$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "recruit_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}");
			document.getElementById("linked").click();
	 	}
	 
	 	function Last(){
	 		$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "recruit_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}");
			document.getElementById("linked").click();
		 }
	 
	</script>
  </head>
  
  <body>
  <a href="javascript:void(0);" id="alinked" target="_blank"></a>
  <a href="javascript:void(0);" id="linked"></a>
  <div class="global">
 
  		<!-- 载入框 -->
		<div id="dataLoad" style=" margin-top:-300px; display:none;"><!--页面载入显示-->
   			<table style="margin-top:50px;" width=100% height=100% border=0 align=center align=middle>
   				 <tr height=50%><td align=center>&nbsp;</td></tr>
    			<tr><td align=center><img src="img/zairu.gif"/></td></tr>
    			<tr><td align=center>数据载入中，请稍后......</td></tr>
    			<tr height=50%><td align=center>&nbsp;</td></tr>
   			</table>
 		 </div>
  
  	<div class="Content">
  	
  	<!-- 主体 -->
  	<c:if test="${userFlag!=-1 }">
  		<div style="background:#F7F8FC; width:1300px; height:60px; padding-top:0px; ">
  		<!-- 按键 -->
     		<ul style="padding-top:10px; margin-left:20px;">
    	 		<li style=" float:left; margin-top:3px;">
    			 	<input type="button" id="add" onclick="add();" class="Button"  value="添加岗位" />
   	 			</li>
    		 	<li style="float:left; margin-top:3px;">
     		 		<input type="button" id="delete" onclick="deletenews();" class="Button"  value="删除岗位" />
   			 	</li> 
     		</ul>
  		</div>
  	</c:if>
  	
  	<!--上下页  -->
  	<div style="float:left;">
  	
  	   	<div class="page_no">
              <ul>
                  <li>
                      <a href="#" id="alink" style="display:none;"></a>
                      <c:if test="${pageBean.currentPage == pageBean.pageCount}">
                          <a href="javascript:void(0);" style="cursor:default;" class="buton n_click">下一页</a>
                      </c:if>
                      <c:if test="${pageBean.currentPage < pageBean.pageCount}">
                          <a onclick="Next();"  href="javascript:void(0);" class="buton" title="Next Page">下一页</a>
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
                          <input type="button" style="cursor:default;"  class="last n_last" value="&lt;&lt;">
                      </c:if>
                      <c:if test="${pageBean.currentPage > 1}">
                          <input type="button" style="cursor:pointer;" class="last" title="首页" onclick="to_page('fpage')" value="&lt;&lt;">
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
          
          <div style="width:300px;"></div>
  	
  		  <!-- 表格 -->
   		  <table class="stripe">
   			<thead>
   				<tr style="height:40px;color: FFF;">
   				 <c:if test="${userFlag!=-1 }">
  			 		<th style="width:30px; border:none;"><span style="height:40px; width:20px; "></span></th>
  			 	 </c:if>
  			 		<th style="width:215px;">职务名称</th>
  			 		<th style="width:160px;">工作性质</th>
  					<th style="width:215px;">工作地点</th>
   			 		<th style="width:175px;">性别要求</th>
   			 		<th style="width:160px;">招聘人数</th>
   			 		<th style="width:215px;">发布人</th>
   			 		<th style="width:215px;">发布时间</th>
   		  	 		<th style="display:none;"></th>
   			 		<th style="display:none;"></th>
    	     		<th style="display:none;"></th>
   			 		<th style="display:none;"></th>
   			 		<c:if test="${userFlag!=-1 }">
    		 			<th style="width:120px;">操作</th>
    		 		</c:if>
   				</tr>
   			</thead>
   			<tbody>
   				<c:forEach items="${pageBean.recordList}" var="recruit">
  			 		<tr style=" height:40px;">
  			 		 <c:if test="${userFlag!=-1 }">
   						<td><input name="subBox" value="${recruit.recruitId}" style="cursor:pointer; height:20px; width:20px;"  type="checkbox"/></td>
 					 </c:if>
 						<td><div class="jobName" ><a href="javascript:void(0);" onclick="showrecruit('${recruit.recruitId}');">${recruit.jobName}</a></div></td>
  						<td>
  					 		<c:if test="${recruit.workNature ==0}">
 						  		<label style="display:block;">全职</label>
   						  		<label style="display:none;">兼职</label>
  					 		</c:if>
  					 		<c:if test="${recruit.workNature == 1}">
  					 	   		<label style="display:none;">全职</label>
  					 			<label style="display:block;">兼职</label>
  					 		</c:if>
  						</td>
   						<td><div class="workAddress">${recruit.workAddress}</div></td>
   						<td>
   							<c:if test="${recruit.sexRequire ==0}">
   								<label style="display:block;">男</label>
   								<label style="display:none;">女</label>
   								<label style="display:none;">无</label>
   							</c:if>
   							<c:if test="${recruit.sexRequire ==1}">
   								<label style="display:none;">男</label>
   								<label style="display:block;">女</label>
   								<label style="display:none;">无</label>
   							</c:if>
   							<c:if test="${recruit.sexRequire ==2}">
   								<label style="display:none;">男</label>
   								<label style="display:none;">女</label>
   								<label style="display:block;">无</label>
   							</c:if>
   						</td>
  						<td>
  							<label>${recruit.recruitMember}</label>人
  						</td>
   						<td>
   							<c:forEach items="${users}" var="user">
								<c:if test="${user.userId == recruit.userId}">
   									<label style="display:block;">${user.userPhone}</label>
   								</c:if>
   							</c:forEach>
   						</td>
						<td><label><fmt:formatDate value="${recruit.time}" type="both"/></label></td>
   						<td style="display:none;"><label>${recruit.recruitId}</label></td>
   						<td style="display:none;"><label>${recruit.wage}</label></td>
   						<td style="display:none;"><label>${recruit.postDuty}</label></td>
   						<td style="display:none;"><label>${recruit.factor}</label></td>
   						<c:if test="${userFlag!=-1}">
   							<td><input type="button" class="Button" value="编辑岗位" onclick="changeRecruit('${recruit.recruitId}');"/></td>
   						</c:if>
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
