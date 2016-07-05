<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>入库单详情</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  
<style type="text/css">
.page_no {
	margin-top: 10px;
	margin-bottom: 5px;
	margin-right:30px;
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
    
    
h1{ font-size:16px;}

/* from page*/
.form { 
	 width:1300px;
}
	 
.form th,.form td{
	padding:10px;
	border-top:1px solid #eee;
	vertical-align:top
}
	
.form th{ 
	text-align:right; 
	padding-right:6px; 
}
	
.form .tip{ 
	color:#666; 
	margin-left:8px;
}

.search{ 
	padding:8px ; 
	background-color:#F7F8FC; 
	border:1px solid #F7F8FC; 
	margin-bottom:10px;
	padding-left:50px;
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
	
table.stripe tr.alt td{
	background:#EAF8FF;	
}
	
table.stripe tr.over td {
	background:#8CE6FE;
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
  	
        $(".stripe tr").mouseover(function(){    
          $(this).addClass("over");}).mouseout(function(){    
                $(this).removeClass("over");
           });  
      	$(".stripe tr:even").addClass("alt");    
    }); 
    
    //查询
    function dosearch()
    {
       var goodId=$("#goodId").val();
       if(goodId==null)
       {
         goodId="";
       }
       
       $("#serch_in_storage").attr("href", "in_storage_detail.action?&goodId=" + goodId+"&billId="+${billId});
	   document.getElementById("serch_in_storage").click();
    }
    
    function goback()
    {
       $("#go_back").attr("href", "in_storage_list.action");
	   document.getElementById("go_back").click();
    }
  </script>
 </head>
 <body>
  <form action="">
   <div class="global" align="center">
     <div class="search">
	  <table width="100%" cellpadding="0" cellspacing="0" border="0">
	   <tr>
		  <td align="left">商品名称：
		    <select id="goodId" name="goodId" style="width:100px;">
             <option value="">--------</option>
              <c:forEach items="${gList}" var="glist">
               <c:if test="${goodId==glist.goodId}">
                 <option value="${glist.goodId}" selected="selected">${glist.goodName}</option>
               </c:if>
               <c:if test="${goodId!=glist.goodId}">
                 <option value="${glist.goodId}">${glist.goodName}</option>
               </c:if>
             </c:forEach>
            </select>
            <input style="margin-left:10px; margin-right:0px; font-weight:bold; " class="ea-btn" name="search" value="查 询" type=button onclick="dosearch()"/>
            <a href="" target="_self" id="serch_in_storage"></a>
         </td>
         <td align="right">
            <input class="ea-btn" name="back" value="返 回" type=button onclick="goback()"/>
            <a href="" target="_self" id="go_back"></a>
		  </td>
	   </tr>
      </table>
     </div>

     <table class="list stripe" cellpadding="0" cellspacing="0" border="0"> 
      <tr style="color: #FFF;"> 
       <th>仓库</th> 
       <th>商品名称</th> 
       <th>数量</th>   
       <th>申请人</th> 
       <th>申请时间</th>    
      </tr> 
      <c:forEach items="${pageBean.recordList}" var="idepot">
       <tr> 
        <td>
         <c:forEach items="${sList}" var="slist">
		  <c:if test="${slist.storageId == idepot.storageId }">
			${slist.storageName}
		  </c:if> 
		 </c:forEach>
        </td> 
        
        <td> 
         <c:forEach items="${gList}" var="glist">
		  <c:if test="${glist.goodId == idepot.goodId }">
			${glist.goodName}
		  </c:if> 
		 </c:forEach>
        </td>
        
        <td>${idepot.amount}</td>
        
        <td>${idepot.perator}</td> 
        <td><fmt:formatDate value="${idepot.time}" type="both"/></td>         
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
										href="in_storage_detail.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
										class="buton" title="Next Page" target="_self">下一页</a>
								</c:if> <c:if test="${pageBean.pageCount == 1}">
									<a href="#" class="n_page">1</a>
								</c:if> <c:if test="${pageBean.pageCount == 2}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 3}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a href="#" class="n_page">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 4}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a href="#" class="n_page">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 5}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a href="#" class="n_page">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 5}">
										<a href="#" class="n_page">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 6}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">6</a>
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">6</a>
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">6</a>
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a
											href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">6</a>
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a href="#" class="n_page">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 5}">
										<a
											href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">6</a>
										<a href="#" class="n_page">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 6}">
										<a href="#" class="n_page">6</a>
										<a
											href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">5</a>
										<a
											href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">4</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount > 6}">
									<c:if test="${pageBean.currentPage == pageBean.pageCount}">
										<a href="#" class="n_page">${pageBean.pageCount}</a>
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount - 1}</a>
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == pageBean.pageCount - 1}">
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount}</a>
										<a href="#" class="n_page">${pageBean.pageCount - 1}</a>
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount}</a>
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount - 1}</a>
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount}</a>
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount - 1}</a>
										<a
											href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">3</a>
										<a
											href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">4</a>
											<a href="#" class="n_page">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage >= pageBean.pageCount - 4}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a
												href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">4</a>
											<a href="#" class="n_page">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">5</a>
											<a href="#" class="n_page">4</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a
												href="in_storage_detail.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">5</a>
											<a href="#" class="n_page">4</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#" class="n_page">4</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
									</c:if>

									<c:if test="${pageBean.currentPage == 5}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">4</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a
												href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">4</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a href="#">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">4</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="in_storage_detail.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">4</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
									</c:if>

									<c:if test="${pageBean.currentPage > 5}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.currentPage + 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.currentPage + 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="in_storage_detail.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="in_storage_detail.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">3</a>
											<a
												href="in_storage_detail.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">2</a>
											<a
												href="in_storage_detail.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
												target="_self">1</a>
										</c:if>
									</c:if>
								</c:if> <c:if test="${pageBean.currentPage == 1}">
									<a href="#" class="buton n_click">上一页</a>
								</c:if> <c:if test="${pageBean.currentPage > 1}">
									<a
										href="in_storage_detail.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}&billId=${billId}"
										class="buton" title="Last Page" target="_self">上一页</a>
								</c:if></li>
						</ul>
						<div style="clear: both;"></div>
					</div>
				</td>
			</tr>
		</table>     
   </div> 
  </form>
 </body>
</html>