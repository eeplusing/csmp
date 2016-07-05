<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<style type="text/css">
  	.global{
  		list-style: none;  	
  		width:1300px;
  		margin: 0px auto;
  	}
  	
  	.Content{
		display:block; 
		width:1300px;
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
	 
	table.stripe tr.alt td{
		background:#EEEEEE;
	}
	
	table.stripe tr.over td {
		background:#EAF8FF;
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
	
	th{
		background: #589FD3;
		background-size:40px 100%;
		border: none;
	}
	
	 table,td,th{
	 	text-align:center;
	 	border-collapse: collapse;	
	 	font-size:14px; 
	 }
  	</style>
    <title>权限管理</title>
  	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/t_style.css"></link>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
	 $(document).ready(function(){ 
    	var height = parseInt($(".global").css("height").replace("px", ""));
        height = 472;
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
     
	function to_page(iden) {
		if (iden == "fpage") {
		 	$(".Content").css("display","none");
			$("#dataLoad").css("display","block");
			$("#linked").attr("href", "right_list.action?pageNum=1&pageSize=${pageBean.pageSize}");
		} else if (iden == "lpage") {
		 	$(".Content").css("display","none");
			$("#dataLoad").css("display","block");
			$("#linked").attr("href", "right_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}");
		} else {
		 	$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "right_list.action?pageNum=${pageBean.currentPage}&pageSize=${pageBean.pageSize}");
		}
		document.getElementById("linked").click();
	 }
	 
	 function Next(){
	 		$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "right_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}");
			document.getElementById("linked").click();
	 }
	 
	 function Last(){
	 		$(".Content").css("display","none");
		    $("#dataLoad").css("display","block");
			$("#linked").attr("href", "right_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}");
			document.getElementById("linked").click();
	 }
	</script>    
  </head>
  
  <body>
     <a href="javascript:void(0);" id="linked"></a>
     <div class="global">
      <div class="Content">
        <div style="float:left; margin-top: 20px;">
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
     	  <div style="float:left;">
     		<table class="stripe" width="1300px">
     			<thead>
     				<tr style="height:40px;color: FFF;">
  			 			<th style="width:250px;">权限名称</th>
   			 			<th style="width:300px;">请求方法</th>
  			 			<th style="width:362px;">描述</th>
  			 			<th style="width:322px;">所属模块</th>
     				</tr>
     			</thead>
     			<tbody>
     			<c:forEach items="${pageBean.recordList}" var="right">
    				<tr style="height:40px;">
    					<td>
    						<label style="font-size:16px; ">${right.rightName}</label>
    					</td>
    					<td>
    						<label style="font-size:16px; ">${right.function}</label>
    					</td>
					    <td>
    						<label style="font-size:16px; ">${right.rightRemark}</label>
    					</td>
					    <td>
					    <c:if test="${right.modleId==41}">
    						<label style="font-size:16px; ">首页</label>
    					</c:if>
					    <c:if test="${right.modleId==7}">
    						<label style="font-size:16px; ">账户管理</label>
    					</c:if>
					    <c:if test="${right.modleId==8}">
    						<label style="font-size:16px; ">角色管理</label>
    					</c:if>
					    <c:if test="${right.modleId==9}">
    						<label style="font-size:16px; ">权限管理</label>
    					</c:if>
					    <c:if test="${right.modleId==10}">
    						<label style="font-size:16px; ">群组管理</label>
    					</c:if>
					    <c:if test="${right.modleId==11}">
    						<label style="font-size:16px; ">岗位发布</label>
    					</c:if>
					    <c:if test="${right.modleId==42}">
    						<label style="font-size:16px; ">新闻发布</label>
    					</c:if>
					    <c:if test="${right.modleId==43}">
    						<label style="font-size:16px; ">数据导出</label>
    					</c:if>
					    <c:if test="${right.modleId==13}">
    						<label style="font-size:16px; ">基本信息</label>
    					</c:if>
					    <c:if test="${right.modleId==14}">
    						<label style="font-size:16px; ">商品分类</label>
    					</c:if>
					    <c:if test="${right.modleId==15}">
    						<label style="font-size:16px; ">订单管理</label>
    					</c:if>
					    <c:if test="${right.modleId==16}">
    						<label style="font-size:16px; ">入库管理</label>
    					</c:if>
					    <c:if test="${right.modleId==17}">
    						<label style="font-size:16px; ">出库管理</label>
    					</c:if>
					    <c:if test="${right.modleId==18}">
    						<label style="font-size:16px; ">仓库信息</label>
    					</c:if>
    					</td>
				    </tr>
				   </c:forEach>
     			</tbody>
		     </table>
     	</div>
       </div>
       </div>
       <div style="clear: both;"></div>
     </div>
  </body>
</html>
