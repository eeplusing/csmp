<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新闻动态</title>
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
		width:1300px;
		text-align: center;
		margin:auto;
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
	
	th{
		background: #589FD3;
		background-size:40px 100%;
		border : none;
	}
	</style>
	<script type="text/javascript">
	    $(document).ready(function(){
	    	$("input[name = 'subBox']").attr('checked',false);
        	$(".stripe tr").mouseover(function(){    
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
      
		
		function to_page(iden) {
			if (iden == "fpage") {
		 	  $(".Content").css("display","none");
			  $("#dataLoad").css("display","block");
			  $("#benye").attr("href", "news_list.action?pageNum=1&pageSize=${pageBean.pageSize}");
			} else if (iden == "lpage") {
		 	  $(".Content").css("display","none");
			  $("#dataLoad").css("display","block");
			  $("#benye").attr("href", "news_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}");
			} else {
			  $(".Content").css("display","none");
			  $("#dataLoad").css("display","block");
			  $("#benye").attr("href", "news_list.action?pageNum=${pageBean.currentPage}&pageSize=${pageBean.pageSize}");
			}
			document.getElementById("benye").click();
	 	}
	 	
	 	function add ()
	 	{
	 		$("#linked").attr("href","news_addNews.action?newsId=-1");
			document.getElementById("linked").click();
	 	}

	 	function deletenew ()
	 	{
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
							if(data){
								$.ajax({
									type : "POST",
									url : "news_delete.action",
									data :"newsIds="+array1,
									dataType : "text",
									success : function(msg){
										location.reload();
									}
								});
							}
							else{
								alert("取消");
                				location.reload();
							}
						});
					}else{
						alert("打钩");
						location.reload();
					}
	 	}
	 	
	   function Next(){
	 		$(".Content").css("display","none");
			$("#dataLoad").css("display","block");
			$("#benye").attr("href", "news_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}");
			document.getElementById("benye").click();
	 	}
	 
	 function Last(){
	 		$(".Content").css("display","none");
			$("#dataLoad").css("display","block");
			$("#benye").attr("href", "news_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}");
			document.getElementById("benye").click();
	 }
	 
	</script>
  </head>
  
  <body>
	 <a href="javascript:void(0);" id="linked" target="_blank"></a>
 	 <a href="javascript:void(0);" id="benye"></a>
  
  <div class="global">
  
  <!-- 载入框 -->
		<div id="dataLoad" style=" margin-top:-100px; margin-left:0px; display:none;"><!--页面载入显示-->
   			<table style="margin-top:50px;" width=100% height=100% border=0 align=center align=middle>
   				<tr height=50%><td align=center>&nbsp;</td></tr>
    			<tr><td align=center><img src="img/zairu.gif"/></td></tr>
    			<tr><td align=center>数据载入中，请稍后......</td></tr>
    			<tr height=50%><td align=center>&nbsp;</td></tr>
   			</table>
 		 </div>

  
  	<div class="Content">
  	<!-- 主体 -->
  		<c:if test="${userFlag==1}">
  			<div style="background:#F7F8FC; width:1300px; height:60px; padding-top:0px; ">
  				<!-- 按键 -->
     				<ul style="padding-top:10px; margin-left:20px;">
    					<li style=" float:left; margin-top:3px;">
    		 				<input type="button" onclick="add();" id="add" class="Button"  value="添加新闻" />
   	 		 			</li>
    	 				<li style="float:left; margin-top:3px;">
     		 				<input type="button" id="delete" onclick="deletenew();" class="Button"  value="删除新闻" />
   			 			</li> 
     				</ul>
  			</div>
  		</c:if>
  	
  	<div style="float:left;">
  	
  	   <div class="page_no">
              <ul>
                  <li>
                      <a href="#" id="alink" style="display:none;"></a>
                      <c:if test="${pageBean.currentPage == pageBean.pageCount}">
                          <a href="javascript:void(0);" style="cursor:default;" class="buton n_click">下一页</a>
                      </c:if>
                      <c:if test="${pageBean.currentPage < pageBean.pageCount}">
                          <a onclick="Next();" style="cursor:pointer;" href="javascript:void(0);" class="buton" title="Next Page">下一页</a>
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
  		 <tr style="height:40px; color: FFF;">
  		 	<c:if test="${userFlag!=-1 }">
  			 <th style="width:32px; border:none;"><span style="height:40px; width:20px; "></span></th>
  			</c:if>
  			 <th style="width:307px;">新闻类型</th>
   			 <th style="width:482px;">新闻标题</th>
  			 <th style="width:362px;">发布人</th>
  			 <th style="width:322px;">发布时间</th>
   		</tr>
   </thead>
   <tbody>
   	<c:forEach items="${pageBean.recordList}" var="news">
   		<tr style="height:40px;">
   		 <c:if test="${userFlag!=-1 }">
   			<td><input name="subBox" value="${news.newsId}" style="cursor:pointer; height:20px; width:20px;"  type="checkbox"/></td>
   		 </c:if>
   			<td>
   				<c:if test="${news.newsType ==0}">
   					<label style="display:block;">企业新闻</label>
  					<label style="display:none;">政府文件</label>
   				</c:if>
   				<c:if test="${news.newsType == 1}">
   					<label style="display:none;">企业新闻</label>
   					<label style="display:block;">政府文件</label>
   				</c:if>
   			</td>
   			<td><div style=" text-indent:90px; text-align:left; height:17px; overflow:hidden;"><a href="news_showNews.action?newsId=${news.newsId}"  target="_blank" >${news.newsTitle}</a></div></td>
   			<td>
   				<c:forEach items="${users}" var="user">
   					<c:if test="${user.userId == news.userId}">
   						<label style="display:block;">${user.userPhone}</label>
   					</c:if>
   				</c:forEach>
   			</td>
   			<td><label><fmt:formatDate value="${news.newsTime}" type="both"/></label></td>
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
