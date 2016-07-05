<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../taglib.jsp"%>

<html>
<head>
<title>浏览商品</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
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
#div_all table{
    margin: 0px;
    padding: 0px;
    float: left;
}
h1,h2,h3 {
	margin: 0;
	padding: 3px;
	text-align: left;
	font-size: 14px;
	font-weight: 400;
}

.ctd {
    width: 290px;
    height: 440px;
	padding: 17px;
	border: none;
}
.hctd{
    width: 290px;
    height: 440px;
    padding: 15px;
    border: 2px solid #FF6600;
}

.hot_play{ position:relative;}
.hot_play ul{ float:left;}
.hot_play li{ float:left; position:relative; overflow:hidden;}
.hot_play span{display:block; position:absolute; left:240px;  top:0px; }
</style>
<script type="text/javascript">
    $(function(){
        $(".ctd").hover(function(){
            $(this).attr("class", "hctd");
        },function(){
            $(this).attr("class", "ctd");
        });
        var height = parseInt($("#div_all").css("height").replace("px", ""));
        if(height < 300) height = 300;//设置最小高度740
        if(window){
           window.parent.set_gheight(height + 20);
		}else{
	       win.parent.set_gheight(height + 20);
		}
    });
</script>
</head>
<body>
<div align="center" id="div_all">
		<!--商品条目开始-->
		<table style="border: 0; margin-top: 10px;">
			<c:forEach items="${pageBean.recordList}" var="good" varStatus="sp">
				<c:if test="${sp.count%4==1}">
					<tr>
				</c:if>

				<td class="ctd">
					<span style="display:block;">
						<div class="hot_play">
                            <ul>
                                <li>
		                            <a href="good_getGoodScanDetail.action?goodId=${good.goodId}" target="_blank">
		                               <!-- <img alt="" src="home_showImage.action?goodId=${good.goodId}" width="290px" height="251px" />       -->
		                               <c:forEach items="${good.images}" var="image">
		                                   <c:if test="${image.isDefault == 1}">
		                                       <img alt="" src="${pageContext.request.contextPath}${image.imagePath}" width="290px" height="251px" />
		                                   </c:if>
		                               </c:forEach>
							        </a>
							        <c:if test="${sp.count%5==0 || sp.count%4==0}">
		                                <span class="back"><img alt="" src="${pageContext.request.contextPath}/images/goods-news.png"></span>
		                            </c:if>
		                            <div style="clear: both;"></div>
                                </li>
                            </ul>
                            <div style="clear: both;"></div>
                        </div>
                        <div style="clear: both;"></div>
				    </span>
					<h1>
						<b>名称：</b><a href="good_getGoodScanDetail.action?goodId=${good.goodId}"
							target="_blank"><font color="blue">${good.goodName }</font></a>
					</h1>
					<h2 style="width:280px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" >
						<b>规格：</b><span style="line-height: 17px; font-size: 12px;">
						   <font color="#999">${good.specification}</font></span>
					</h2>
					<h3>
						<b>价格：</b><span style="color: red; font-weight: bold; font-size: 20px;">￥ <c:forEach
								items="${good.prices}" var="price">
								<c:if test="${user != null }">
								 <c:if test="${price.grade.gradeId == user.grade.gradeId && user.grade.gradeNum != 0}">
				                    ${price.price}/${good.type.typeUnit}
				                 </c:if>
				                 <c:if test="${user.grade.gradeNum == 0 && price.grade.gradeNum == 3}">
				                    ${price.price}/${good.type.typeUnit}
				                 </c:if>
								</c:if>
								<c:if test="${user == null }">
								 <c:if test="${price.grade.gradeNum == 3 }">
				                    ${price.price}/${good.type.typeUnit}
				                 </c:if>
								</c:if>
							</c:forEach></span>
					</h3>
					<h4 style="text-align:right;">
						<a href="javascript:;" onclick="javascript:CsmpJS.login(null,buy,${good.goodId})" title='加入购物车' style="text-decoration:none;"> 
						  <img src='${pageContext.request.contextPath}/images/car3.png' />
						</a>
						<a href="javascript:;" onclick="javascript:CsmpJS.login('address_buyNow.action',null,${good.goodId})" title='立即购买' style="text-decoration:none;"> 
						  <img src='${pageContext.request.contextPath}/images/good_img/buy.jpg' style="width:80px; height:22px;" />
						</a>
					</h4></td>
				<c:if test="${sp.count%4==0}">
					</tr>
				</c:if>
			</c:forEach>
		</table>
        
		<table style="width: 70%; border: 0; margin-top:20px;">
			<tr>
				<td>
					<div class="page_no">
						<ul>
							<li><c:if
									test="${pageBean.currentPage >= pageBean.pageCount && pageBean.pageCount > 0}">
									<a href="#" class="buton n_click">下一页</a>
								</c:if> <c:if test="${pageBean.currentPage < pageBean.pageCount}">
									<a
										href="good_getGoodShow.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
										class="buton" title="Next Page" target="_self">下一页</a>
								</c:if> <c:if test="${pageBean.pageCount == 1}">
									<a href="#" class="n_page">1</a>
								</c:if> <c:if test="${pageBean.pageCount == 2}">
									<c:if test="${pageBean.currentPage == 1}">
										<a href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a href="#" class="n_page">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 3}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a href="#" class="n_page">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 4}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a href="#" class="n_page">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 5}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a href="#" class="n_page">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 5}">
										<a href="#" class="n_page">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount == 6}">
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">6</a>
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">6</a>
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<a
											href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">6</a>
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a href="#" class="n_page">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<a
											href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">6</a>
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a href="#" class="n_page">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 5}">
										<a
											href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">6</a>
										<a href="#" class="n_page">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 6}">
										<a href="#" class="n_page">6</a>
										<a
											href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">5</a>
										<a
											href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">4</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
								</c:if> <c:if test="${pageBean.pageCount > 6}">
									<c:if test="${pageBean.currentPage == pageBean.pageCount}">
										<a href="#" class="n_page">${pageBean.pageCount}</a>
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount - 1}</a>
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == pageBean.pageCount - 1}">
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount}</a>
										<a href="#" class="n_page">${pageBean.pageCount - 1}</a>
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 2}">
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount}</a>
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount - 1}</a>
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a href="#" class="n_page">2</a>
										<a
											href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 1}">
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount}</a>
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount - 1}</a>
										<a
											href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">${pageBean.pageCount - 2}</a>
										<a href="#">...</a>
										<a
											href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">3</a>
										<a
											href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
											target="_self">2</a>
										<a href="#" class="n_page">1</a>
									</c:if>
									<c:if test="${pageBean.currentPage == 3}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">4</a>
											<a href="#" class="n_page">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage >= pageBean.pageCount - 4}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a
												href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">4</a>
											<a href="#" class="n_page">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
									</c:if>
									<c:if test="${pageBean.currentPage == 4}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">5</a>
											<a href="#" class="n_page">4</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a
												href="good_getGoodShow.action?pageNum=5&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">5</a>
											<a href="#" class="n_page">4</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#" class="n_page">4</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
									</c:if>

									<c:if test="${pageBean.currentPage == 5}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">4</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a
												href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">4</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a href="#">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">4</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=6&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">6</a>
											<a href="#" class="n_page">5</a>
											<a
												href="good_getGoodShow.action?pageNum=4&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">4</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
									</c:if>

									<c:if test="${pageBean.currentPage > 5}">
										<c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#">...</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.currentPage + 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.currentPage + 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.currentPage + 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 2}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 2}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
										<c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.pageCount - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.pageCount - 1}</a>
											<a href="#" class="n_page">${pageBean.currentPage}</a>
											<a
												href="good_getGoodShow.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">${pageBean.currentPage - 1}</a>
											<a href="#">...</a>
											<a
												href="good_getGoodShow.action?pageNum=3&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">3</a>
											<a
												href="good_getGoodShow.action?pageNum=2&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">2</a>
											<a
												href="good_getGoodShow.action?pageNum=1&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
												target="_self">1</a>
										</c:if>
									</c:if>
								</c:if> <c:if test="${pageBean.currentPage == 1 && pageBean.pageCount > 0}">
									<a href="#" class="buton n_click">上一页</a>
								</c:if> <c:if test="${pageBean.currentPage > 1}">
									<a href="good_getGoodShow.action?pageNum=${pageBean.currentPage - 1}&pageSize=${pageBean.pageSize}&goodName=${goodName}&busyName=${busyName}&typeId=${typeId}&ptypeId=${ptypeId}&calorificValues=${calorificValues}&price=${prices}"
										class="buton" title="Last Page" target="_self">上一页</a>
								</c:if></li>
						</ul>
						<div style="clear: both;"></div>
					</div>
				</td>
			</tr>
		</table>
		<div style="clear: both;"></div>
	</div>
</body>
</html>