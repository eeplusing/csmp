<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>出库单列表</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  
  <style type="text/css">
	.page_no {
		margin-top: 10px;
		margin-bottom: 15px;
	}
	
	.page_no input {
		width: 60px;
		height: 20px;
		margin-left: 10px;
		font-size: 12px;
		background: #FFF;
		border: 1px solid #CCC;
		float: right;
		cursor: pointer;
	}
	
	.page_no li {
		margin-left: 10px;
		float: right;
	}
	
	.page_no li a {
		float: right;
		margin-left: 10px;
		border: 1px solid #CCC;
		width: 20px;
		height: 15px;
		padding-top: 2px;
		text-align: center;
		font-size: 12px;
		background: #FFF;
		color: #333;
		cursor: pointer;
	}

	.page_no li a:HOVER {
		text-decoration: none;
	}

	.page_no li a.n_page {
		background: #FC9;
	}

	.page_no li a.buton {
		width: 60px;
		height: 15px;
		text-align: center;
		padding-top: 2px;
		font-size: 12px;
		background: #FFF;
		border: 1px solid #CCC;
	}

   .page_no li a.n_click {
	color: #CCC;
	}
    body {
	  text-align: center;
    }   
    
    input,select{
      border: 1px solid #CCCCCC;
      color: #555555;
      display: inline-block;
      line-height: normal;
      padding: 4px;
    } 
    
.list{ 
	width:1300px; 
	border:1px solid #ccc; 
	margin-bottom:10px;
}
	
.list th,.list td{ 
	text-align:center; 
	padding:8px;
}
	
.list th{ 
	border-bottom:1px solid #ddd;
	background-color:#589FD3
    
}
	
.list td{ 
	border-bottom:1px solid #ddd;
}  
    
    .allTab tr.alt td { /* css 注释：默认隔行背景颜色 */
	 background:#EAF8FF;
	 }   

	.allTab tr.over td{  /*鼠标经过变色   */
	background:#8CE6FE;
	} 
	.allTab tr td{  /*鼠标经过变色   */
	background:#FFF;
	} 
	
	.ea-btn-green{
  	font-size:16px;
  	font-weight:bold;
  	background:#FF4400;
  	border: 1px solid #FF4400;
  	color:#FFF;
  	text-align:center;
  	cursor:pointer;
  	line-height: 14px;
  	display:inline-block;
  	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
  	text-shadow: 0 -1px 1px rgba(0, 0, 0, 0.2);
  	padding: 6px 15px;
  	outline:0 none;
  	height:30px; 
 	border-radius:4px; 
 	width:100px; 
}
	
.ea-btn-green:link{
  	color: #FFF;
  	font-weight:bold;
}
	
.ea-btn-green:visited{
  	color: #FFF;
  	font-weight:bold;
}
	
.ea-btn-green:hover{
  	border:1px solid #FF4400;
 	background:#FF4400;
 	color:#FFF;
  	font-weight:bold;
 	text-decoration: none;
}
	
.ea-btn-green:active{
  	border:1px solid #FF4400;
  	background:#FF4400;
 	color:#FFF;
  	font-weight:bold;
  	text-decoration: none;
}

.ea-btn{
  	font-size:16px;
  	font-weight:bold;
  	background:#FF4400;
  	border: 1px solid #FF4400;
 	color:#FFF;
  	text-align:center;
  	cursor:pointer;
  	line-height: 14px;
  	display:inline-block;
  	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
  	text-shadow: 0 -1px 0 rgba(255,255,255,1);
  	padding: 6px 15px;
  	outline:0 none;
  	height:30px; 
 	border-radius:4px; 
 	width:100px; 
}
	
.ea-btn:link{
  	color:#FFF;
}
	
.ea-btn:visited{
  	color:#FFF;
}
	
.ea-btn:hover{
  	border:1px solid #c6c6c6;
  	background:#FF4400;
  	color:#FFF;
  	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  	text-decoration: none;
}

.ea-btn:active{
  	border:1px solid #cccccc;
  	background:#FF4400;
  	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset;
  	color:#FFF;
  	text-decoration: none;
}
	
.search{ 
	padding:8px ; 
	background-color:#F7F8FC; 
	border:1px solid #F7F8FC; 
	margin-bottom:10px;
	padding-left:50px;
}

/*green button*/
.ea-btn-green{
  	font-size:16px;
  	font-weight:bold;
  	background:#FF4400;
  	border: 1px solid #FF4400;
  	color:#FFF;
  	text-align:center;
  	cursor:pointer;
  	line-height: 14px;
  	display:inline-block;
  	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
  	text-shadow: 0 -1px 1px rgba(0, 0, 0, 0.2);
  	padding: 6px 15px;
  	outline:0 none;
  	height:30px; 
 	border-radius:4px; 
 	width:100px; 
}
	
.ea-btn-green:link{
  	color: #FFF;
  	font-weight:bold;
}
	
.ea-btn-green:visited{
  	color: #FFF;
  	font-weight:bold;
}
	
.ea-btn-green:hover{
  	border:1px solid #FF4400;
 	background:#FF4400;
 	color:#FFF;
  	font-weight:bold;
 	text-decoration: none;
}
	
.ea-btn-green:active{
  	border:1px solid #FF4400;
  	background:#FF4400;
 	color:#FFF;
  	font-weight:bold;
  	text-decoration: none;
}

.ea-btn{
  	font-size:16px;
  	font-weight:bold;
  	background:#FF4400;
  	border: 1px solid #FF4400;
 	color:#FFF;
  	text-align:center;
  	cursor:pointer;
  	line-height: 14px;
  	display:inline-block;
  	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
  	text-shadow: 0 -1px 0 rgba(255,255,255,1);
  	padding: 6px 15px;
  	outline:0 none;
  	height:30px; 
 	border-radius:4px; 
 	width:100px; 
}
	
.ea-btn:link{
  	color:#FFF;
}
	
.ea-btn:visited{
  	color:#FFF;
}
	
.ea-btn:hover{
  	border:1px solid #c6c6c6;
  	background:#FF4400;
  	color:#FFF;
  	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  	text-decoration: none;
}

.ea-btn:active{
  	border:1px solid #cccccc;
  	background:#FF4400;
  	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15) inset;
  	color:#FFF;
  	text-decoration: none;
}

.global{
  	list-style: none;  	
  	width:1300px;
  	margin: 0px auto;
}
  </style>
  <script type="text/javascript">
  
  	$(document).ready(function(){ 
  	    var height = parseInt($(".global").css("height").replace("px", ""));
        if(height < 300) height = 300;//设置最小高度535
        if(window){
		     window.parent.set_fheight("main", height + 20);
		     window.parent.set_fheight("mpage", height + 20);
		}else{
			 win.parent.set_fheight("main", height + 20);
			 window.parent.set_fheight("mpage", height + 20);
		} 
		
	     /**奇偶行间隔变色*/
    	$(".allTab tr").mouseover(function(){    //如果鼠标移到class为stripe的表格的tr上时，执行函数    
      		$(this).addClass("over");
      	}).mouseout(function(){  				//给这行添加class值为over，并且当鼠标一出该行时执行函数      
            $(this).removeClass("over");		//移除该行的class  
            });   
  		$(".allTab tr:even").addClass("alt");    //给class为stripe的表格的偶数行添加class值为alt 
  	});   
    //新增
    function doAdd()
    {
       $("#go_add").attr("href", "bill_outStorage.action");
	   document.getElementById("go_add").click();
    }
    
    //查询
    function dosearch()
    {
       var billNo=$("#billNo").val();
    	if (billNo == "请输入出库单编号" || billNo==null) {
			billNo = "";
			alert("请输入出库单编号！");
		}
       $("#serch_out_storage").attr("href", "bill_list.action?billNo=" + billNo);
	   document.getElementById("serch_out_storage").click();
    }
    
    //确认出库
    function doUp()
    {
    		var chknum = 0;
       		var chk = document.getElementsByName("billId");
       		var billId="";//出库单id      
      		var storageId="";//仓库id       
      		var stockAmount="";//当前库容
      		var amount="";//出库数量
       		for(var i = 0; i < chk.length; i++) {
		    	if(chk[i].checked) {
                	chknum++;
                	billId = chk[i].value;
                	storageId = document.getElementById('storageId'+chk[i].value).value;
                	stockAmount = document.getElementById('stockAmount'+chk[i].value).value;
                	amount = document.getElementById('amount'+chk[i].value).value;
            	} 
       		}
       		if(chknum == 0)
       		{
          		alert("请先选中要确认的记录！");
          		return;
       		}else if(chknum > 1)
       		{
          		alert( "一次只能确认一条记录！" );
          		return;
       		}else
       		{
          		var temp= parseFloat(stockAmount) - parseFloat(amount);
	
    		    if(temp<0)
          		{
             		if(window.confirm("您的库存不足!")){
						$.ajax({
			      			url:"update_out_storage.action" ,
			      			data: "billId=" + billId + "&amount=" + amount + "&storageId=" + storageId,
				  			type:"post", 
				  			cache:false,
				  			dataType:"json",				
				  			success:function(result1){
				     			if(result1=='success')
				     			{
				        			alert("确认成功！");
				        			$("#go_back").attr("href", "bill_list.action");
	                    			document.getElementById("go_back").click();
				     			}else
				     			{
				        			alert("确认失败！");
				     			}			    
			      			}
	             		});
			   		}
             		}else
             		{
               			$.ajax({
			      			url:"update_out_storage.action" ,
			      			data: "billId=" + billId + "&amount=" + amount + "&storageId=" + storageId,
				  			type:"post", 
				  			cache:false,
				  			dataType:"json",				
				  			success:function(result1){
				     			if(result1=='success')
				     			{
				         			alert("确认成功！");
				         			$("#go_back").attr("href", "bill_list.action");
	                     			document.getElementById("go_back").click();
				     			}else
				     			{
				         			alert("确认失败！");
				     			}			    
			       			}
	            		});
             		}
       			} 
    }
  </script>
 </head>
 <body>
   <div class="global" align="center">
     <div class="search">
      <table width="100%" cellpadding="0" cellspacing="0" border="0">
	   <tr>
	      <td align="left">
	        <input class="ea-btn-green" style="font-weight:bold;" name="add" value="新 增" type=button onclick="doAdd()"/>
            <a href="" target="main" id="go_add"></a>
            <font color="#CCC">|</font>
            <input class="ea-btn-green" style="font-weight:bold;" name="send" value="确 认" type=button onclick="doUp()"/>
            <a href="" target="main" id="go_back"></a>
	      </td>
		  <td align="right">出库单编号：<input type="text"  id="billNo" name="billNo" value="${billNo}" />
		   <input class="ea-btn" style="margin-left:10px; margin-right:20px; font-weight:bold; " name="search" value="查 询" type=button onclick="dosearch()"/>
           <a href="" target="main" id="serch_out_storage"></a>
          </td>
	   </tr>
      </table>
    </div>

     <table class="list allTab" cellpadding="0" cellspacing="0" border="0"> 
      <tr class="tr_no" style="color:#FFF;"> 
	       <th width="5%">-</th> 
	       <th>单据编号</th> 
	       <th>仓库</th> 
	       <th>出库人</th> 
	       <th>出库时间</th> 
	       <th>状态</th>      
      </tr> 
      <c:forEach items="${pageBean.recordList}" var="bill">
       <tr > 
        <td> 
          <!-- 出库单id -->
		  <c:if test="${bill.billStat == 0 }">
		      <input type="checkbox" name="billId" value="${bill.billId}"/>
		  </c:if>
          <c:if test="${bill.billStat == 1 }">
		      <input type="checkbox" name="billId" value="${bill.billId}" disabled/>
		  </c:if>

		  <c:forEach items="${storageList}" var="slist">
		    <c:if test="${slist.storageId == bill.storageId }">  
			  <!-- 当前库容 -->
			  <input type=hidden name='stockAmount${bill.billId}' id='stockAmount${bill.billId}' value="${slist.stockAmount}"/>
			  <!-- 仓库id -->		
			  <input type=hidden name='storageId${bill.billId}' id='storageId${bill.billId}' value="${slist.storageId}"/>	  
		    </c:if> 
		  </c:forEach>
		  <!-- 出库总数量 -->
		  <c:forEach items="${idepotList}" var="ilist">
		     <c:if test="${ilist.billId == bill.billId }">
	           <input type=hidden name='amount${bill.billId}' id='amount${bill.billId}' value="${ilist.amount}"/>
	         </c:if>
	      </c:forEach>
        </td> 
        
        <td> 
         <!-- 出库单详情 -->
         <a href="bill_outDetail.action?billId=${bill.billId}" style="text-decoration:none; color: blue;">
			 ${bill.billNo}
         </a> 
        </td>
        
        <td>
         <c:forEach items="${storageList}" var="slist">
		  <c:if test="${slist.storageId == bill.storageId }">
			${slist.storageName}
		  </c:if> 
		 </c:forEach>
        </td> 
        
        <td>${bill.proposer}</td> 
        <td><fmt:formatDate value="${bill.createTime}" type="both"/></td> 
        
        <td>
		  <c:if test="${bill.billStat == 0 }">
		                 未操作
		  </c:if>
	      <c:if test="${bill.billStat == 1 }">
		                  已完成
		  </c:if>
        </td>
      </tr> 
      </c:forEach>
     </table>     

   <table style="width: 100%; border: 0; margin-top:20px;">
			<tr>
				<td>
					<div class="page_no">
						<ul>
							<li><c:if
									test="${pageBean.currentPage == pageBean.pageCount}">
									<a href="#" class="buton n_click">下一页</a>
								</c:if> <c:if test="${pageBean.currentPage < pageBean.pageCount}">
									<a
										href="in_storage_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
										class="buton" title="Next Page" target="main">下一页</a>
								</c:if> <c:if test="${pageBean.pageCount == 1}">
									<a href="#" class="n_page">1</a>
								</c:if> <c:if test="${pageBean.pageCount == 2}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 3}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a href="#" class="n_page">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 4}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a href="#" class="n_page">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 5}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a href="#" class="n_page">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 5}">
										<a href="#" class="n_page">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 6}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">6</a>
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">6</a>
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">6</a>
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a
											href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">6</a>
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a href="#" class="n_page">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 5}">
										<a
											href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">6</a>
										<a href="#" class="n_page">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 6}">
										<a href="#" class="n_page">6</a>
										<a
											href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">5</a>
										<a
											href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">4</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount > 6}">
									<c:if test="${pageBean.currentPage == pageBean.pageCount}">
										<a href="#" class="n_page">${pageBean.pageCount}</a>
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount - 1}</a>
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == pageBean.pageCount - 1}">
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount}</a>
										<a href="#" class="n_page">${pageBean.pageCount - 1}</a>
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount}</a>
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount - 1}</a>
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount}</a>
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount - 1}</a>
										<a
											href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">3</a>
										<a
											href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
											target="main">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">4</a>
											<a href="#" class="n_page">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage >= pageBean.pageCount - 4}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a
												href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">4</a>
											<a href="#" class="n_page">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">5</a>
											<a href="#" class="n_page">4</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a
												href="in_storage_list.action?pageNum=5&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">5</a>
											<a href="#" class="n_page">4</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a href="#" class="n_page">4</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
									</c:if>

									<c:if test="${pageBean.currentPage == 5}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">4</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a
												href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">4</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a href="#">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">4</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=6&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="in_storage_list.action?pageNum=4&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">4</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
									</c:if>

									<c:if test="${pageBean.currentPage > 5}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.currentPage + 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.currentPage + 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 2}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.pageCount - 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="in_storage_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="in_storage_list.action?pageNum=3&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">3</a>
											<a
												href="in_storage_list.action?pageNum=2&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">2</a>
											<a
												href="in_storage_list.action?pageNum=1&pageSize=${pageBean.pageSize}&billNo=${billNo}"
												target="main">1</a>
										</c:if>
									</c:if>
								</c:if> <c:if test="${pageBean.currentPage == 1}">
									<a href="#" class="buton n_click">上一页</a>
								</c:if> <c:if test="${pageBean.currentPage > 1}">
									<a
										href="in_storage_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&billNo=${billNo}"
										class="buton" title="Last Page" target="main">上一页</a>
								</c:if></li>
						</ul>
						<div style="clear: both;"></div>
					</div>
				</td>
			</tr>
		</table>
	</div>
 </body>
</html>