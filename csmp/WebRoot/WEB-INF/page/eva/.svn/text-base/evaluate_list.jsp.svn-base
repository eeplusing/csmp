<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../taglib.jsp"%>

<html>
<head>
<title>商品评论列表</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/t_style.css" />
<style type="text/css">
body {
	text-align: center;
}

h1,h2,h3,h4 {
	margin: 0;
	padding: 3px;
	text-align: left;
	font-size: 12px;
	font-weight: 400;
}

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

.fenge
{
  border-bottom:#eee 1px dashed;
}
</style>
</head>
<body>
	<div>
		<span id="spn_average_score">共有商品评论&nbsp;<b style="color: blue;">${pageBean.recordCount}</b>&nbsp;</span>条
	</div>
	<!--商品评论条目开始-->
	<table style="width: 70%; border: 0; margin-top: 10px;">
		<c:forEach items="${pageBean.recordList}" var="eva">
			<tr>
				<td>
					<h1>
						<b>评论人：</b>
						<c:forEach items="${list}" var="lis">
							<c:if test="${lis.userId == eva.userId }">
						            ${lis.userName}
						          </c:if>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>评论时间：</b>
						<fmt:formatDate value="${eva.evaluateTime}" type="both"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>评论等级：</b><c:forEach begin="1" end="${eva.evaluateGrade}"  step="1">
						                <img src="${pageContext.request.contextPath}/images/321.png" style="az-index:3; left:0; vertical-align: middle;"/>
						              </c:forEach>
					</h1>
					<h2>
						<b>评论内容：</b>${eva.evaluateContent}
					</h2>
				</td>
			</tr>
			<tr>
			  <td class="fenge"></td>
			</tr>
		</c:forEach>
	</table>
   <table style="width: 70%; border: 0; margin-top: 10px;">
   <tr>
   <td>
	<div class="page_no">
		<ul>
			<li><c:if test="${pageBean.currentPage >= pageBean.pageCount && pageBean.pageCount > 0}">
					<a href="#" class="buton n_click">下一页</a>
				</c:if> 
				<c:if test="${pageBean.currentPage < pageBean.pageCount}">
					<a href="evaluate_search.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
						class="buton" title="Next Page" target="_self">下一页</a>
				</c:if> 
				<c:if test="${pageBean.pageCount == 1}">
					<a href="#" class="n_page">1</a>
				</c:if> <c:if test="${pageBean.pageCount == 2}">
					<c:if test="${pageBean.currentPage == 1}">
						<a href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a href="#" class="n_page">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 2}">
						<a href="#" class="n_page">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
				</c:if> <c:if test="${pageBean.pageCount == 3}">
					<c:if test="${pageBean.currentPage == 1}">
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a href="#" class="n_page">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 2}">
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a href="#" class="n_page">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 3}">
						<a href="#" class="n_page">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
				</c:if> <c:if test="${pageBean.pageCount == 4}">
					<c:if test="${pageBean.currentPage == 1}">
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a href="#" class="n_page">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 2}">
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a href="#" class="n_page">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 3}">
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a href="#" class="n_page">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 4}">
						<a href="#" class="n_page">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
				</c:if> <c:if test="${pageBean.pageCount == 5}">
					<c:if test="${pageBean.currentPage == 1}">
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a href="#" class="n_page">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 2}">
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a href="#" class="n_page">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 3}">
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a href="#" class="n_page">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 4}">
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a href="#" class="n_page">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 5}">
						<a href="#" class="n_page">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
				</c:if> <c:if test="${pageBean.pageCount == 6}">
					<c:if test="${pageBean.currentPage == 1}">
						<a
							href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">6</a>
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a href="#" class="n_page">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 2}">
						<a
							href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">6</a>
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a href="#" class="n_page">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 3}">
						<a
							href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">6</a>
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a href="#" class="n_page">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 4}">
						<a
							href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">6</a>
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a href="#" class="n_page">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 5}">
						<a
							href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">6</a>
						<a href="#" class="n_page">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 6}">
						<a href="#" class="n_page">6</a>
						<a
							href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">5</a>
						<a
							href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">4</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
				</c:if> <c:if test="${pageBean.pageCount > 6}">
					<c:if test="${pageBean.currentPage == pageBean.pageCount}">
						<a href="#" class="n_page">${pageBean.pageCount}</a>
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount - 1}</a>
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount - 2}</a>
						<a href="#">...</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == pageBean.pageCount - 1}">
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount}</a>
						<a href="#" class="n_page">${pageBean.pageCount - 1}</a>
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount - 2}</a>
						<a href="#">...</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 2}">
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount}</a>
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount - 1}</a>
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount - 2}</a>
						<a href="#">...</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a href="#" class="n_page">2</a>
						<a
							href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 1}">
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount}</a>
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount - 1}</a>
						<a
							href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">${pageBean.pageCount - 2}</a>
						<a href="#">...</a>
						<a
							href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">3</a>
						<a
							href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
							target="_self">2</a>
						<a href="#" class="n_page">1</a>
					</c:if>
					<c:if test="${pageBean.currentPage == 3}">
						<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a href="#">...</a>
							<a
								href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">4</a>
							<a href="#" class="n_page">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage >= pageBean.pageCount - 4}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a
								href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">4</a>
							<a href="#" class="n_page">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
					</c:if>
					<c:if test="${pageBean.currentPage == 4}">
						<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a href="#">...</a>
							<a
								href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">5</a>
							<a href="#" class="n_page">4</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a
								href="evaluate_search.action?pageNum=5&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">5</a>
							<a href="#" class="n_page">4</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a href="#" class="n_page">4</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
					</c:if>

					<c:if test="${pageBean.currentPage == 5}">
						<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a href="#">...</a>
							<a
								href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">6</a>
							<a href="#" class="n_page">5</a>
							<a
								href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">4</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a
								href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">6</a>
							<a href="#" class="n_page">5</a>
							<a
								href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">4</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a href="#">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">6</a>
							<a href="#" class="n_page">5</a>
							<a
								href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">4</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=6&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">6</a>
							<a href="#" class="n_page">5</a>
							<a
								href="evaluate_search.action?pageNum=4&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">4</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
					</c:if>

					<c:if test="${pageBean.currentPage > 5}">
						<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a href="#">...</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.currentPage + 1}</a>
							<a href="#" class="n_page">${pageBean.currentPage}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.currentPage - 1}</a>
							<a href="#">...</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.currentPage + 1}</a>
							<a href="#" class="n_page">${pageBean.currentPage}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.currentPage - 1}</a>
							<a href="#">...</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 2}</a>
							<a href="#" class="n_page">${pageBean.currentPage}</a>
							<a
								href="evaluate_search.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.currentPage - 1}</a>
							<a href="#">...</a>
							<a
								href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a
								href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a
								href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
						<c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
							<a href="evaluate_search.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount}</a>
							<a href="evaluate_search.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.pageCount - 1}</a>
							<a href="#" class="n_page">${pageBean.currentPage}</a>
							<a href="evaluate_search.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">${pageBean.currentPage - 1}</a>
							<a href="#">...</a>
							<a href="evaluate_search.action?pageNum=3&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">3</a>
							<a href="evaluate_search.action?pageNum=2&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">2</a>
							<a href="evaluate_search.action?pageNum=1&pageSize=${pageBean.pageSize}&goodId=${goodId}"
								target="_self">1</a>
						</c:if>
					</c:if>
				</c:if> 
				<c:if test="${pageBean.currentPage == 1 && pageBean.pageCount > 0}">
					<a href="#" class="buton n_click">上一页</a>
				</c:if>
				<c:if test="${pageBean.currentPage > 1}">
					<a href="evaluate_search.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodId=${goodId}"
						class="buton" title="Last Page" target="_self">上一页</a>
				</c:if>
				</li>
		</ul>
		<div style="clear: both;"></div>
	</div>
	</td>
	</tr>
	</table>
</body>
</html>