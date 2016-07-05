<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>入库管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
    
     <style type="text/css">
        body{
              width: 100%;
              height: auto;
        }
        
        div.main{
              width:60%;
              margin: 0px 20%;
              border: 0px solid #C9F;
        }
        div.state{
              width:100%;
              border-bottom: 2px solid #DDD;
        }
        .state li{
              height:40px;
              float: left;
              border-bottom: 0px solid #DDD;
        }
        .state li a{
              height:30px;
              display:block;
              font-size:20px;
              font-weight:bold;
              color:#333;
              margin: 10px 30px;
              border: 0px solid #C9F;
              text-decoration: none;
        }
        
        .state li a:HOVER{
              height:30px;
              display:block;
              font-size:20px;
              font-weight:bold;
              color:#FF4400;
              margin: 10px 30px;
              border: 0px solid #C9F;
        }
        .state li span{
              height:20px;
              display:block;
              margin-top:10px;
              color: #DDD;
              border: 0px solid #C9F;
        }
        div.sel_no{
              width:100%;
              margin: 20px 0px;
              border: 0px solid #C9F;
        }
        div.sel_no li{
              width: 270px;
              height:25px;
              padding:0px;
              border:1px solid #CCC;
        }
        div.sel_no li input{
              float: left;
        }
        input.orderNo{
              width:200px;
              height:25px;
              display:block;
              margin: 0px;
              border: 0px solid #000;
              font-size: 16px;
              color: #333;
              border-right: 1px solid #CCC;
        }
        input.sel_but{
              width:69px;
              height:25px;
              display:block;
              margin: 0px;
              color: #333;
              cursor:pointer;
              border: 0px solid #000;
        }
        .list_head{
              height: 40px;
              background: #F5F5F5;
        }
        .list_head li{
              float: left;
              margin-top: 15px;
              border: 0px solid #000;
        }
        li.head_id{
              width: 400px;
              text-align: center;
              font-size: 12px;
        }
        li.head_price,li.head_num,li.head_g_oper,li.price,li.num,li.g_o{
              width: 80px;
              text-align: center;
              font-size: 12px;
        }
        li.head_t_m,li.head_y_m,li.t_m,li.y_m{
              width: 100px;
              text-align: center;
              font-size: 12px;
        }
        li.head_state,li.head_o_oper,li.o_s,li.o_o{
              width: 116px;
              text-align: center;
              font-size: 12px;
        }
        .page_no{
              margin-top: 10px;
              margin-bottom: 15px;
        }
        .page_no input{
              width:60px;
              height:20px;
              margin-left:10px;
              font-size: 12px;
              background: #FFF;
              border: 1px solid #CCC;
              float: right;
              cursor: pointer;
        }
        .order_list{
              border: 1px solid #FC9;
              margin-bottom: 10px;
        }
        .list_no{
              width: 100%;
              height: 40px;
              background: #FC9;
              font-size: 12px;
              color: #555;
        }
        
        .list_no input{
              height: 40px;
              border: 0px solid #000;;
              background: #FC9;
              margin-left: 15px;
        }
        .good_list li{
              float: left;
        }
        .img{
              display:inline;
        }
        li.price, li.num, li.g_o{
            margin-top: 10px;
        }
        li.t_m, li.y_m, li.o_s, li.o_o{
            padding-top: 10px;
            border-left: 1px solid #FC9;
        }
        .remark span{
              display:block;
              font-size:12px;
              width: 245px;
              word-break: break-all;
              word-wrap:break-word;
              overflow: hidden;
        }
        span.r{
            max-height:75px;
            color:#333;
        }
        span.hv{
            margin-top:5px;
            max-height:30px;
            color:#999;
        }
        .n_f{
              border-top: 1px solid #FC9;
        }
        li.img, li.remark{
              margin: 10px 5px;
        }
        li.img img{
              width: 129px;
              height: 107px;
              border: 1px solid #FC9;
        }
        .o_s{
            line-height: 150%;
        }
        .oo{
            width: 60px;
            height: 25px;
            font-size: 12px;
            font-weight: bold;
            color:#333;
            padding-top:5px;
            background: #FC9;
            border: none;
            cursor: pointer;
        }
        li.afocus a{
              height:30px;
              display:block;
              font-size:20px;
              font-weight:bold;
              color:#FF4400;
              margin: 10px 30px;
        }
    </style>
    
  <script type="text/javascript">
     
  //删除信息确认
      function del_sure(){
       var gnl=confirm("确认要删除该宝贝吗?");
        if (gnl==true){
           return true;
       }else{
           return false;
       }
     }
     function addpage(){
       window.location.replace("../add_idepot.jsp");
       }
     function uppage(){
       window.location.replace("/compile_idepot.jsp");
       }
 </script> 
  </head>
  
 <body>
   <div class="sel_no">
             <ul>
                <li>
                     <input type="button" value="入库单" onclick="addpage()" style="width:80px;height:30px;font-family:楷体;" align="right"/>
                </li>
             </ul>
             <div style="clear: both;"></div>
         </div>
    
    <!--<input type="button" value="编辑入库单" onclick="uppage()" style="width:80px;height:30px;font-family:楷体 ;color:red;" align="right">-->
       <div class="list_head">
             <ul>
               <li class="head_id"><p>信息编号</p></li>
               <li class="head_price"><p>仓库编号</p></li>
                    <li class="head_num"><p>类型</p></li>
                    <li class="head_g_oper"><p>商品编号</p></li>
                    <li class="head_t_m"><p>商品名称</p></li>
                    <li class="head_y_m"><p>数量</p></li>
                    <li class="head_state"><p>时间</p></li>
                    <li class="head_o_oper"><p>操作人</p></li>
                 </ul>
                 <div style="clear: both;"></div>
          </div>
           <div class="page_no">
                 <ul>
                     <li>
                         <c:if test="${pageBean.currentPage == pageBean.pageCount}">
                             <a href="#" class="buton n_click">下一页</a>
                         </c:if>
                         <c:if test="${pageBean.currentPage < pageBean.pageCount}">
                             <a href="order_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=5" class="buton" title="Next Page">下一页</a>
                         </c:if>
                         
                     </li>
                     <li>
                         <c:if test="${pageBean.pageCount == 1}">
                             <a href="#" class="n_page">1</a>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 2}">
                             <c:if test="${pageBean.currentPage == 1}">
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 3}">
                             <c:if test="${pageBean.currentPage == 1}">
                                 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                             	 <a href="#" class="n_page">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 4}">
                             <c:if test="${pageBean.currentPage == 1}">
                                 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                                 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="#" class="n_page">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 4}">
                             	 <a href="#" class="n_page">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 5}">
                             <c:if test="${pageBean.currentPage == 1}">
                                 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                             	 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="#" class="n_page">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 4}">
                             	 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                             	 <a href="#" class="n_page">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 5}">
                             	 <a href="#" class="n_page">5</a>
                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount == 6}">
                             <c:if test="${pageBean.currentPage == 1}">
                                 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
                                 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                                 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
                                 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                             	 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
                                 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="#" class="n_page">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 4}">
                             	 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
                                 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                             	 <a href="#" class="n_page">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 5}">
                             	 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
                             	 <a href="#" class="n_page">5</a>
                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 6}">
                             	 <a href="#" class="n_page">6</a>
                             	 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
                                 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                         </c:if>
                         <c:if test="${pageBean.pageCount > 6}">
                             <c:if test="${pageBean.currentPage == pageBean.pageCount}">
                             	 <a href="#" class="n_page">${pageBean.pageCount}</a>
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
                             	 <a href="#">...</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == pageBean.pageCount - 1}">
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
                             	 <a href="#" class="n_page">${pageBean.pageCount - 1}</a>
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
                             	 <a href="#">...</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 2}">
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
                             	 <a href="#">...</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="#" class="n_page">2</a>
	                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 1}">
                             	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
                             	 <a href="#">...</a>
                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
	                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
	                             <a href="#" class="n_page">1</a>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 3}">
                                 <c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
	                                 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
	                             	 <a href="#" class="n_page">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage >= pageBean.pageCount - 4}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
	                             	 <a href="#" class="n_page">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                             </c:if>
                             <c:if test="${pageBean.currentPage == 4}">
                                 <c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
	                                 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
	                             	 <a href="#" class="n_page">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="order_list.action?pageNum=5&pageSize=5">5</a>
	                             	 <a href="#" class="n_page">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="#" class="n_page">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                             </c:if>
                             
                             <c:if test="${pageBean.currentPage == 5}">
                                 <c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
	                                 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
	                             	 <a href="#" class="n_page">5</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
	                             	 <a href="#" class="n_page">5</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="#">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
	                             	 <a href="#" class="n_page">5</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=6&pageSize=5">6</a>
	                             	 <a href="#" class="n_page">5</a>
	                             	 <a href="order_list.action?pageNum=4&pageSize=5">4</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                             </c:if>
                             
                             <c:if test="${pageBean.currentPage > 5}">
                                 <c:if test="${pageBean.currentPage < pageBean.pageCount - 4}">
	                                 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=5">${pageBean.currentPage + 1}</a>
	                             	 <a href="#" class="n_page">${pageBean.currentPage}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=5">${pageBean.currentPage - 1}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 4}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage + 1}&pageSize=5">${pageBean.currentPage + 1}</a>
	                             	 <a href="#" class="n_page">${pageBean.currentPage}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=5">${pageBean.currentPage - 1}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 3}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 2}&pageSize=5">${pageBean.pageCount - 2}</a>
	                             	 <a href="#" class="n_page">${pageBean.currentPage}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=5">${pageBean.currentPage - 1}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                                 <c:if test="${pageBean.currentPage == pageBean.pageCount - 2}">
                                 	 <a href="order_list.action?pageNum=${pageBean.pageCount}&pageSize=5">${pageBean.pageCount}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.pageCount - 1}&pageSize=5">${pageBean.pageCount - 1}</a>
	                             	 <a href="#" class="n_page">${pageBean.currentPage}</a>
	                             	 <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=5">${pageBean.currentPage - 1}</a>
	                             	 <a href="#">...</a>
	                             	 <a href="order_list.action?pageNum=3&pageSize=5">3</a>
		                             <a href="order_list.action?pageNum=2&pageSize=5">2</a>
		                             <a href="order_list.action?pageNum=1&pageSize=5">1</a>
                                 </c:if>
                             </c:if>
                         </c:if>
                     </li>
                     <li>
                         <c:if test="${pageBean.currentPage == 1}">
                             <a href="#" class="buton n_click">上一页</a>
                         </c:if>
                         <c:if test="${pageBean.currentPage > 1}">
                             <a href="order_list.action?pageNum=${pageBean.currentPage - 1}&pageSize=5" class="buton" title="Last Page">上一页</a>
                         </c:if>
                     </li>
                 </ul>
                 <div style="clear: both;"></div>
             </div>
             
          <c:forEach items="${pageBean.recordList}" var="order">
	             <div class="order_list">
	                <div class="list_no">
	                    <input type="button" value="">订单号：${order.orderNo}
	                    <div style="clear: both;"></div>
	                </div>
	                <div class="good_list">
	                    <ul>
	                        <li class="g_i">
	                            <c:forEach items="${order.orderDetails}" var="od">
		                            <div class="good_info">
		                                <ul>
		                                    <li class="img">
		                                        <a href="#"><img alt="" src="order_showImage.action?goodId=${od.goodId}"></a>
		                                    </li>
		                                    <li class="remark">
		                                        <span class="r">${od.specification}</span>
		                                        <span class="hv">${od.headValue}</span>
		                                    </li>
		                                    <li class="price">
		                                           ${od.salePrice}
		                                    </li>
		                                    <li class="num">
		                                           ${od.num}
		                                    </li>
		                                    <li class="g_o">
		                                           <a href="#">退货</a>/<a href="#">换货</a>
		                                    </li>
		                                </ul>
		                                <div style="clear: both;"></div>
		                            </div>
	                            </c:forEach>
	                        </li>
	                        <li class="t_m">${order.orderAmount}</li>
	                        <li class="y_m">${order.orderCarriage}</li>
	                        <li class="o_s">
	                            <c:if test="${order.orderState == 0}">
	                                待审核<br />
	                                <a href="#" title="查看订单流转信息">订单详情</a><br />
	                            </c:if>
	                            <c:if test="${order.orderState == 1}">
	                                待支付<br />
	                                <a href="#" title="查看订单流转信息">订单详情</a><br />
	                            </c:if>
	                            <c:if test="${order.orderState == 2}">
	                                已支付,正在做出库前准备工作<br />
	                                <a href="#" title="查看订单流转信息">订单详情</a><br />
	                            </c:if>
	                            <c:if test="${order.orderState == 3}">
	                                正在出库...<br />
	                                <a href="#" title="查看订单流转信息">订单详情</a><br />
	                            </c:if>
	                            <c:if test="${order.orderState == 4 || order.orderState == 5}">
	                                物流运输中...<br />
	                            	<a href="#" title="查看订单流转信息">订单详情</a><br />
	                            	<a href="#">查看物流</a>
	                            </c:if>
	                            <c:if test="${order.orderState == 6}">
	                                待评价<br />
	                            	<a href="#" title="查看订单流转信息">订单详情</a><br />
	                            </c:if>
	                            <c:if test="${order.orderState == 7}">
	                                已完成<br />
	                            	<a href="#" title="查看订单流转信息">订单详情</a><br />
	                            </c:if>
	                            <c:if test="${order.orderState == 8}">
	                                申请取消中...<br />
	                            	<a href="#" title="查看订单流转信息">订单详情</a><br />
	                            </c:if>
	                        </li>
	                      
	                    </ul>
	                    <div style="clear: both;"></div>
	                </div>
	             	<div style="clear: both;"></div>
	             </div>
             </c:forEach>
    <!-- <table align="center" width="800" border="0" id="tblOrder" cellpadding="1" cellspacing="1" > 
       <tr>
         <td>信息编号</td>
         <td>仓库编号</td>
         <td>类型</td>
         <td>商品编号</td>
         <td>商品名称</td>
         <td>数量</td>
         <td>时间</td>
         <td>操作人</td>
       </tr>
     <c:forEach items="${idepot}" var="idepot" > 
       <tr>
        <td>${idepot.infoId }</td>
        <td>${idepot.storageId }</td>
        <td>${idepot.type }</td>
        <td>${idepot.goodId }</td>
        <td>${idepot.goodName}</td>
        <td>${idepot.amount}</td>
        <td>${idepot.time}</td>
        <td>${idepot.perator}</td>
        </tr>
     </c:forEach>
   
  </table>	 -->
  
</body>
</html>
