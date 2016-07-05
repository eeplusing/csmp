<%@page contentType="text/html;charset=utf-8"%>
<%@include file="../taglib.jsp"%>

<html>
<head>
<title>新增评论信息</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/star.js"></script>
<link type="text/css" href="${pageContext.request.contextPath}/css/star.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/t_style.css" />
<style type="text/css">
body{
  text-align: center;
}
</style>
<script type="text/javascript">
  function addEvaluate()
  {
     var evaContent=$("#tEvaluate").val();
     if(evaContent=="")
     {
        alert("请输入评论信息！");
        return false;
     }

     if(evaContent.length>100)
     {
        alert("您输入的信息已超出规定的字符数！");
        return false;
     }
     
     var score = $("#score").text();
     if(score==null || score==0)
     {
        alert("请选择评分！");
        return false;
     }
     
     var goodId = $("#goodId").val();
     
     $.post("add_evaluate.action", {
			"goodId" : goodId,"content" : evaContent, "score" : score
		}, function(status) {
			if (status=='"success"') {
				alert("评论成功！");
				parent.location.reload();
				$("#tEvaluate").val(''); 
			}else if(stauts=='"noLogin"')
			{
			    alert("请先登录再评论！");
			}else
			{
			    alert("评论失败！");
			}
	 });
  }
</script>
</head>
<body>
  <input type="hidden" id="goodId" name="goodId" value="${goodId}"> 
 <form method="post">
  <table style="width: 70%; border: 0; margin-top: 10px;">
    <tr>
     <td>
       <span><b>评论内容：</b></span>
       <div style="width: 400px;">
        <textarea id="tEvaluate" name="tEvaluate" rows="10" cols="100" style="width:710px; height:140px;  resize:none"></textarea>
       </div>
    </td>
   </tr>
   <tr>
    <td>
     <span><b>评分：</b></span>	
     <!--代码开始-->
     <div id="xzw_starSys">
	  <div id="xzw_starBox">      
		<ul class="star" id="star">		    
			<li><a href="javascript:void(0)" class="one-star">1</a></li>
			<li><a href="javascript:void(0)" class="two-stars">2</a></li>
			<li><a href="javascript:void(0)" class="three-stars">3</a></li>
			<li><a href="javascript:void(0)" class="four-stars">4</a></li>
			<li><a href="javascript:void(0)" class="five-stars">5</a></li>
		</ul>
		<div class="current-rating" id="showb"></div>
	 </div>
	 <!--评价文字-->
	 <div id="score" class="description" style="display:none"></div>
    </div>
    <!--代码结束-->   
   </td>
  </tr>
  <tr align="center">
    <td>
      <input type="button" id="subEvaluate" name="subEvaluate" value="提 交" onclick="addEvaluate();" style="font-size: 15px;height: 30px; width: 80px; border:none; background: #F40; color:#FFF; cursor: pointer;"/>
    </td>
  </tr>
 </table>
 </form>
</body>
</html>