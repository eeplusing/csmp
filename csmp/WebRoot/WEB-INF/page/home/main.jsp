<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>主页</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/csmp/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.kxbdmarquee.js"></script>
</head>
<body>
	<div id="all">
		<div class="wrapper">
			<div id="focus">
				<ul>
				    <li><a href="javascript:void(0);" title="wwww.maitanwang.com" target="_blank"><img src="${pageContext.request.contextPath}/css/img/banner.jpg" alt="甘肃央元热能有限公司" title="甘肃央元热能有限公司" /></a></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
		</div>
		<div id="main">
			<ul>
				<li class="m_li m_l">
					<div>
						<ul>
							<li class="m_l_t">
							    <ul>
							       <li class="qx"></li>
							       <li class="qm"><a href="news_list.action" target="_blank">更多&lt;&lt;</a></li>
							    </ul>
							</li>
							<li class="m_l_m">
							   <div>
							       <ul>
							           <c:forEach items="${newsList}" var="news">
							               <li class="new_title">
							                   <span><fmt:formatDate value="${news.newsTime}" type="date" dateStyle="medium"/></span>
							                   <span><a href="news_showNews.action?newsId=${news.newsId}" class="new_link" target="_blank">${news.newsTitle}</a></span>
							               </li>
							           </c:forEach>
							       </ul>
							       <div style="clear: both;"></div>
							   </div>
							</li>
						</ul>
						<div style="clear: both;"></div>
					</div>
				</li>
				<li class="m_li m_c">
					<div>
						<ul>
							<li class="m_c_t">
							    <ul>
							        <li class="m_c_t_t mct_hot" name="mei">煤炭工业</li>
							        <li class="m_c_t_t" name="zhongzi">精品煤炉</li>
							        <li class="m_c_t_t" name="huafei">高产化肥</li>
							        <li class="m_c_t_t" name="shuiguo">农药产品</li>
							    </ul>
								<div style="clear: both;"></div>
						    </li>
							<li class="m_c_m">
								<div class="m_c_m_d cose">
									<table class="dgrid">
										<thead>
											<tr>
												<td class="a">产品名称</td>
												<td class="a">价格</td>
												<td class="a">库存量</td>
												<td class="a">产地</td>
												<td class="b">供应商</td>
											</tr>
										</thead>
										<tbody>
											<s:if test="!#coles.isEmpty">
                        						<s:iterator value="coles" id="good" status="gno">
													    <tr>
															<td class="a"><a class="ggid" href="good_getGoodScanDetail.action?goodId=${good.goodId}" target="_blank">${good.name}</a></td>
															<td class="a">
																<c:forEach items="${good.prices}" var="price">
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
																</c:forEach>
															</td>
															<td class="a">${good.amount}</td>
															<td class="a">${good.goodOrigin}</td>
															<td class="b">${good.goodVendor}</td>
														</tr>
												</s:iterator>
                    						</s:if>
										</tbody>
									</table>
									<div style="clear: both;"></div>
								</div>
								<div class="m_c_m_d">
									<table class="dgrid">
										<thead>
											<tr>
												<td class="a">产品名称</td>
												<td class="a">价格</td>
												<td class="a">库存量</td>
												<td class="a">产地</td>
												<td class="b">供应商</td>
											</tr>
										</thead>
										<tbody style="text-align: center;">
										    <s:if test="!#cooks.isEmpty">
                        						<s:iterator value="cooks" id="good" status="gno">
													    <tr>
															<td class="a"><a class="ggid" href="good_getGoodScanDetail.action?goodId=${good.goodId}" target="_blank">${good.name}</a></td>
															<td class="a">
																<c:forEach items="${good.prices}" var="price">
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
																</c:forEach>
															</td>
															<td class="a">${good.amount}</td>
															<td class="a">${good.goodOrigin}</td>
															<td class="b">${good.goodVendor}</td>
														</tr>
												</s:iterator>
                    						</s:if>
										</tbody>
									</table>
									<div style="clear: both;"></div>
								</div>
								<div class="m_c_m_d">
									<table class="dgrid">
										<thead>
											<tr>
												<td class="a">产品名称</td>
												<td class="a">价格</td>
												<td class="a">库存量</td>
												<td class="a">产地</td>
												<td class="b">供应商</td>
											</tr>
										</thead>
										<tbody style="text-align: center;">
										    <s:if test="!#chems.isEmpty">
                        						<s:iterator value="chems" id="good" status="gno">
													    <tr>
															<td class="a"><a class="ggid" href="good_getGoodScanDetail.action?goodId=${good.goodId}" target="_blank">${good.name}</a></td>
															<td class="a">
																<c:forEach items="${good.prices}" var="price">
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
																</c:forEach>
															</td>
															<td class="a">${good.amount}</td>
															<td class="a">${good.goodOrigin}</td>
															<td class="b">${good.goodVendor}</td>
														</tr>
												</s:iterator>
                    						</s:if>
										</tbody>
									</table>
									<div style="clear: both;"></div>
								</div>
								<div class="m_c_m_d">
									<table class="dgrid">
										<thead>
											<tr>
												<td class="a">产品名称</td>
												<td class="a">价格</td>
												<td class="a">库存量</td>
												<td class="a">产地</td>
												<td class="b">供应商</td>
											</tr>
										</thead>
										<tbody style="text-align: center;">
											<s:if test="!#pests.isEmpty">
                        						<s:iterator value="pests" id="good" status="gno">
													    <tr>
															<td class="a"><a class="ggid" href="good_getGoodScanDetail.action?goodId=${good.goodId}" target="_blank">${good.name}</a></td>
															<td class="a">
																<c:forEach items="${good.prices}" var="price">
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
																</c:forEach>
															</td>
															<td class="a">${good.amount}</td>
															<td class="a">${good.goodOrigin}</td>
															<td class="b">${good.goodVendor}</td>
														</tr>
												</s:iterator>
                    						</s:if>
										</tbody>
									</table>
									<div style="clear: both;"></div>
								</div>
							</li>
						</ul>
						<div style="clear: both;"></div>
					</div>
				</li>
				<li class="m_li m_r">
					<div>
						<ul>
							<li class="m_r_t">
							    <ul>
							       <li></li>
							    </ul>
							    <div style="clear: both;"></div>
							</li>
							<li class="re_t">
							    <ul>
							        <li>产品</li>
									<li>数量</li>
									<li>地点</li>
									<li>时间</li>
							    </ul>
							    <div style="clear: both;"></div>
							</li>
							<li class="m_r_m">
							 <div id="marquee">
							    <div class="jilu">
									<ul>
										<li class="jl_a">无烟煤</li>
										<li class="jl_b">12000</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">沫煤</li>
										<li class="jl_b">33000</li>
										<li class="jl_c">山西</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">青烟煤</li>
										<li class="jl_b">1000</li>
										<li class="jl_c">陕西</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">蜂窝煤</li>
										<li class="jl_b">2000</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">硬煤</li>
										<li class="jl_b">8000</li>
										<li class="jl_c">山西</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">动力煤</li>
										<li class="jl_b">30000</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">电煤</li>
										<li class="jl_b">20000</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">原煤</li>
										<li class="jl_b">100</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">天然焦</li>
										<li class="jl_b">700</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">烟煤</li>
										<li class="jl_b">9000</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">褐煤</li>
										<li class="jl_b">5000</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">长焰煤</li>
										<li class="jl_b">28000</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">焦煤</li>
										<li class="jl_b">43000</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">贫煤</li>
										<li class="jl_b">6500</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
									<ul>
										<li class="jl_a">精煤</li>
										<li class="jl_b">5800</li>
										<li class="jl_c">甘肃</li>
										<li class="jl_d">6-14</li>
										<div style="clear: both;"></div>
									</ul>
								</div>
							  </div>
							</li>
						</ul>
					</div>
				</li>
			</ul>
			<div style="clear: both;"></div>
		</div>
		<div class="g_line">
		    <ul>
		        <li class="g_l"></li>
		        <li class="g_c">合作伙伴</li>
		        <li class="g_r"></li>
		    </ul>
		    <div style="clear: both;"></div>
		</div>
        <div id="footer">
			<ul>
				<li class="sh">
					<div></div>
				</li>
				<li class="jh">
					<div></div>
				</li>
				<li class="tw">
					<div></div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>