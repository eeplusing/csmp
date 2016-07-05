<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/t_style.css"></link>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  <style type="text/css">
    body{
        margin: 0px;
        padding: 0px;
    }
    
	div li{
	    list-style: none;  	
	}
	
	.button{
 		height:30px; 
		cursor:pointer; 
		margin-left:7px;   
		margin-top:1px; 
		border:none; 
		background-color: #F40; 
		color:#fff;  
		border-radius:4px;  
		font: bold 17px '隶书'; 
		width:90px;
	}
	
	.global{
		list-style:none; 
		margin-left:500px; 
		margin-top:100px;
	}
	
	.lipart{
		margin-left :20px; 
		margin-top:20px;
	}
	
	.inputpart{
		text-align:left; 
		height:25px; 
		font-size:16px; 
		width:500px;
	}
	
	.radiopart{
		border:none; 
		text-align:left; 
		height:25px; 
		font-size:16px; 
		width:500px;
	}
	
	.userpart{
		margin-left:14px;   
		border:none; 
		text-align:left; 
		height:25px; 
		font-size:16px; 
		width:500px;
	}
	
	.testareapart{
		font-size:16px; 
		height:40%; 
		resize: none;
	}
	
	.testareapart1{
		font-size:16px; 
	}
	
	.inputbutton{
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
   </style>
    <title>新闻描述</title>
 	<script type="text/javascript">
 	function closeRecruit(){
 		if(window){
 			window.close();
 		}else{
 			win.close();
 		}
 	}
 	
 	function saveNews(){
 		var newsTitle1 = $("#newsTitle").val().replace(/(^\s*)|(\s*$)/, "");
 		var newsType = $("#newsType:checked").val();
 		var userId = $("#userId").val().replace(/(^\s*)|(\s*$)/, "");
 		var newsContent1 = $("#newsContent").val();
 		var newsTitle = newsTitle1.replace(/%/g, "88888888888");
        var newsContent = newsContent1.replace(/%/g, "88888888888");
 		if( newsTitle.length==0 || newsContent.length==0 || newsType != 0 && newsType != 1 ){
 			alert("请填写相关信息！");
 			return false;
 		}else{
 			$.ajax({
				type : "POST",
				url : "news_save.action",
				data : "newsTitle="+newsTitle+"&newsType="+newsType+"&userId="+userId+"&newsContent="+newsContent,
				dataType : "text",
				success : function(msg) {
					if(window){
						window.close();
 					}else{
 						win.close();
 					}
				  }
			  });
 		}
 	}
 </script>
 </head>
 <body>
	<div class="global">
		<div>
			<div>
				<ul>
					<li style="margin-left :20px; font-size:16px; font-weight:bold;">新闻信息</li>
					<li class="lipart"><span style="margin-left:20px; "></span>新闻标题:&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${newsFlag!=-1}">
							<input id="newsTitle" readonly="readonly" type="text" style="border:none;" class="inputpart" value="${news.newsTitle}"/>
						</c:if>
						<c:if test="${newsFlag==-1}">
							<input id="newsTitle"  type="text" style="border: 1px bold #A9A9A9;" class="inputpart"/>
						</c:if>
					</li>
					<li class="lipart"><span style="margin-left:20px; "></span>新闻类型:&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${newsFlag!=-1 }">
						<c:if test="${news.newsType==0 }">
							<input id="newsType"  readonly="readonly" type="text" class="radiopart" value="企业新闻"/>
						</c:if>
						<c:if test="${news.newsType==1 }">
							<input id="newsType"  readonly="readonly" type="text" class="radiopart" value="政府文件"/>
						</c:if>
						</c:if>
						<c:if test="${newsFlag==-1 }">
							企业新闻&nbsp;<input type="radio" id="newsType" name="newsType" value="0">&nbsp;&nbsp;&nbsp;
							政府文件&nbsp;<input type="radio" id="newsType"  name="newsType" value="1">
						</c:if>
					</li>
					<li class="lipart"><span style="margin-left:20px; "></span>发布人:&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${newsFlag!=-1}">
							<c:forEach items="${users}" var="user">
								<c:if test="${user.userId==news.userId}">
									<input id="userId"  readonly="readonly" type="text" class="userpart" value="${user.userPhone}"/>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${newsFlag==-1}">
							<input  readonly="readonly" type="text" class="userpart" value="${login_user.userPhone}"/>
							<input  id="userId" type="hidden" value="${login_user.userId}"/>
						</c:if>
					</li>
					<c:if test="${newsFlag!=-1}">
						<li style="margin-left :20px; margin-top:15px;"><span style="margin-left:20px; "></span>发布时间:&nbsp;&nbsp;&nbsp;
							<input id="newsTime"  readonly="readonly" type="text" class="userpart" value="${news.newsTime}"/>
						</li>
					</c:if>
					<li style="margin-left :20px; margin-top:45px;"><span style="margin-left:20px; "></span>新闻内容:&nbsp;&nbsp;&nbsp;(新闻字数控制在1336个字！)&nbsp;&nbsp;&nbsp;
					<li style="border:0px; width:600px; padding:10px; margin-left :30px; margin-top:20px;">
						<c:if test="${newsFlag!=-1}">
							<div   class="testareapart1" >${news.newsContent}</div>
						</c:if>
						<c:if test="${newsFlag==-1}">
							<textarea  style=" border: 1px bold #A9A9A9;" class="testareapart"  cols="83" rows="5"  id="newsContent"></textarea>
						</c:if>
					</li>
			</ul>
		</div>
		
		<ul>
			<li style="float:left;">
				<c:if test="${newsFlag==-1}">
					<div style="margin-top:30px; margin-left :50px;">
						<input class="inputbutton" type="button" onclick="saveNews();" value="保存"/>
					</div>
				</c:if>
			</li>
			<li style="float:right;">
				<div style="margin-top:30px; margin-right :800px;">
					<input class="inputbutton" type="button" onclick="closeRecruit();" value="关闭"/>
				</div>
			</li>
		</ul>
	</div>
</div>
</body>
</html>
