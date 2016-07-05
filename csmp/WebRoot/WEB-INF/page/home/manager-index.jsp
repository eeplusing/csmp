<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>卖炭网-后台管理</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/csmp/home.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/csmp/csmp.js"></script>
	<style type="text/css">
		#FloatDIV {
			position: absolute;
			width: 80px;
			height: 100px;
			top: 0px;
			border: activeborder 0px solid;
			z-index: 2
		}
		
		#FloatDIV img {
			width: 80px;
			height: 100px;
			cursor: pointer;
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
			border: 5px solid #FC9;
			width: 400px;
			height: 240px;
			margin: -200px 0 0 -200px;
			padding: 0px;
			position: fixed !important; /* 浮动对话框 */
			position: absolute;
			z-index: 5;
			border-radius: 5px;
			display: none;
		}
		
		.dialog p.close {
			margin: 0 0 12px;
			height: 24px;
			line-height: 24px;
			background: #FC9;
			text-align: right;
			padding-right: 10px;
		}
		
		.dialog p.close label {
			float: left;
			font-size: 16px;
			font-weight: bold;
			text-align: left;
		}
		
		.dialog p.close a {
			color: #000;
			font-size: 18px;
			text-decoration: none;
		}
		
		.dialog_text {
			border: 0px solid #0F0;
			font-size: 14px;
			color: #555;
			line-height: 150%;
		}
		
		.dialog_text ul li {
			display: block;
			width: 300px;
			height: 25px;
			margin: 10px 50px;
			background: #FC9;
			border: 2px solid #FC9;
		}
		
		.dialog_text ul li * {
			display: inline;
			height: 25px;
			width: 240px;
			border: none;
		}
		
		.save {
			width: 50px;
			height: 25px;
			margin-top: 10px;
			margin-left: 175px;
			border: none;
			background: #FC9;
		}
		
		.fullbg2 {
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
		
		.dialog2 {
			background-color: #fff;
			border: 5px solid #999;
			width: 220px;
			height: 120px;
			margin: -200px 0 0 -200px;
			padding: 0px;
			position: fixed !important; /* 浮动对话框 */
			position: absolute;
			z-index: 5;
			border-radius: 5px;
			display: none;
		}
		
		.dialog2 p.close {
			margin: 0 0 12px;
			height: 24px;
			line-height: 24px;
			background: #CCC;
			text-align: right;
			padding-right: 10px;
		}
		
		.dialog2 p.close a {
			color: #fff;
			text-decoration: none;
		}
		
		#dialog_text2 {
			font-size: 12px;
			color: #555;
		}
		
		#dialog_text2 li {
			width: 90%;
			height: 20px;
			margin-left: 5%;
			margin-top: 5px;
			border: 0px solid #F00;
		}
		
		.dialog3 {
			background: url("${pageContext.request.contextPath}/img/xg-back.png")
				no-repeat;
			width: 744px;
			height: 447px;
			left: 40%;
			margin: -200px 0 0 -200px;
			padding: 0px;
			position: fixed !important; /* 浮动对话框 */
			position: absolute;
			top: 50%;
			z-index: 5;
			border-radius: 5px;
			display: none;
		}
		
		#dialog_text2 span {
			height: 18px;
			display: inline;
		}
		
		#dialog_text2 input.carriage {
			width: 140px;
			height: 18px;
			border: 1px solid #CCC;
		}
		
		#dialog_text2 input.btton {
			display: block;
			width: 60px;
			height: 20px;
			margin: 5px auto;
			border: 1px solid #CCC;
		}
		
		.dia_log {
			background-color: #fff;
			border: 5px solid #999;
			width: 500px;
			height: 280px;
			margin: -200px 0 0 -200px;
			padding: 0px;
			position: fixed !important; /* 浮动对话框 */
			position: absolute;
			z-index: 5;
			border-radius: 5px;
			display: none;
		}
		
		.dialog1 p.close {
			margin: 0 0 12px;
			height: 24px;
			line-height: 24px;
			background: #CCC;
			text-align: right;
			padding-right: 10px;
		}
		
		.dialog1 p.close a {
			color: #fff;
			text-decoration: none;
		}
		
		.loginTop {
			color: #696969;
			font-size: 20px;
			font-weight: 900;
		}
		
		#dialog3 input {
			height: 26px;
			border: 1px solid #d9d9d9;
			padding-top: 4px;
			padding-left: 8px;
		}
		
		.fullbg5 {
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
		
		.dialog5 {
			background-color: #fff;
			border: 5px solid #FC9;
			width: 400px;
			height: 240px;
			margin: -200px 0 0 -200px;
			padding: 0px;
			position: fixed !important; /* 浮动对话框 */
			position: absolute;
			z-index: 5;
			border-radius: 5px;
			display: none;
		}
		
		.dialog5 p.close {
			margin: 0 0 12px;
			height: 24px;
			line-height: 24px;
			background: #FC9;
			text-align: right;
			padding-right: 10px;
		}
		
		.dialog5 p.close label {
			float: left;
			font-size: 16px;
			font-weight: bold;
			text-align: left;
		}
		
		.dialog5 p.close a {
			color: #000;
			font-size: 18px;
			text-decoration: none;
		}
		
		#dialog_text5 {
			width: 100%;
		}
		
		#dialog_text5 li {
			border: 0px solid #F00;
			width: 300px;
			height: 30px;
			display: block;
		}
		
		#dialog_text5 input[type=text] {
			width: 200px;
			height: 20px;
		}
		
		#dialog_text5 input[type=button] {
			width: 50px;
			height: 20px;
			background: #FC9;
			border: none;
		}
		
		#dialog_text5 select {
			width: 200px;
			height: 20px;
		}
		
		/* 登录 */
		.dialog7 {
			background: url("${pageContext.request.contextPath}/img/login-back2.png") no-repeat;
			width: 740px;
			height: 414px;
			left: 40%;
			padding: 0px;
			position: fixed !important; /* 浮动对话框 */
			position: absolute;
			top: 50%;
			z-index: 5;
			border-radius: 5px;
			display: none;
		}
		
		input.login_button {
			background: url("${pageContext.request.contextPath}/img/login-on0.png") no-repeat;
			height: 43px;
			width: 299px;
			margin-top: 30px;
			border: none;
			cursor: pointer;
		}
		
		td.tdText {
			text-align: right;
		}
		
		div.menu {
			width: 1350px;;
			height: 116px;
			border: 1px solid #FFF;
			min-width: 1350px;
			margin-top: 10px;
			background: url("${pageContext.request.contextPath}/img/home-bar.png");
		}
		
		ul.ul_menu {
			padding: 0;
			margin-left: 420px;
			margin-top: 65px;
			list-style: none;
		}
		
		li.li_menu {
			position: relative;
			float: left;
			height: 30px;
			margin-top: -15px;
		}
		
		li ul {
			position: absolute;
			display: none;
			top: 30px;;
		}
		
		li:hover ul,li.over ul {
			display: block;
		}
		
		input.but_info {
			height: 31px;
			width: 166px;
			border: none;
			background:
				url("${pageContext.request.contextPath}/img/operation-save.png")
				no-repeat;
			cursor: pointer;
		}
		
		li {
			float: left;
			width: 160px;
			height: 70px;
			border: 0px solid #F00;
		}
		
		.m_t {
			background: #F40;
			position: absolute;
			width: 152px;
			border: 4px solid #F40;
			display: none;
		}
		
		.m_t li {
			float: inherit;
			width: 140px;
			height: 25px;
			border-bottom: 2px dashed #EEE;
			margin-left: 5px;
		}
		
		.m_t a {
			width: 140px;
			height: 20px;
			color: #C4D15A;
			display: block;
			padding-top: 5px;
			text-align: center;
		}
		
		.m_t a:hover {
			width: 140px;
			height: 20px;
			color: #FFF;
			display: block;
			text-align: center;
		}
		
		.m_t span {
			margin: 0px;
		}
		#ds{
		    position: relative;
		    width: 200px;
		    height: 15px;
		    left: 1080px;
		    top: 35px;
            text-align: right;
            font-size: 12px;
		}
		
		#has_new_order{
		    display: none;
		    width: 200px;
		    height: 100px;
		    position: fixed;
		    right: 1px;
		    bottom: 1px;
		    border : 1px solid #99BBE8;
		    background : "#CFDEF4";
		    z-index: 99999;
		}
		
		#o_close{
		    height: 25px;
		}
		#o_close a{
		    margin-left: 180px;
		    color: #F40;
		}
		
		#o_main{
		    width: 188px;
		    height: 68px;
		    margin-left: 5px;
		    border: 1px solid #99BBE8;
		    font-size: 12px;
		}
		#o_main a{
		    display: inline-block;
		    margin-top: 5px;
		}
	</style>
<script type="text/javascript">
	var MarginLeft = 0; //浮动层离浏览器右侧的距离
	var MarginTop = 400; //浮动层离浏览器顶部的距离
	$(function() {
	    //用户名
		$("#login_account").focus(function(){
		    $(this).css("border", "none").css("background", "url('${pageContext.request.contextPath}/img/login-user0.png') no-repeat");
		});
		    
		$("#login_account").blur(function(){
		    if($(this).val().replace(/(^\s*)|(\s*$)/g, "") == ""){
		        $(this).val("");
		        $(this).css("border", "none").css("background", "url('${pageContext.request.contextPath}/img/login-user.png') no-repeat");
		    }
		});
		    
		//密码
		$("#login_pswd").focus(function(){
		    $(this).css("border", "none").css("background", "url('${pageContext.request.contextPath}/img/login-password0.png') no-repeat");
		});
		    
		$("#login_pswd").blur(function(){
		    if($(this).val().replace(/(^\s*)|(\s*$)/g, "") == ""){
		        $(this).val("");
		        $(this).css("border", "none").css("background", "url('${pageContext.request.contextPath}/img/login-password.png') no-repeat");
		    }
	    });
		    
		Move();
		get_customer();
		$("#support").click(function() {
			window.open("open_manager.action", "manager", "width=320, height=750px, toolbar=no, menubar=no, resizable=no, location=no, status=no");
			$(this).attr("src", "${pageContext.request.contextPath}/images/kefu1.png");
		});
		
		$("#save").click(function(){
		    var money_reg=/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
		    var pid = $("#pid").val();
		    var goodId = $("#goodId").val();
		    var name = $("#priceName").val().replace(/(^\s*)|(\s*$)/g, "");
		    var gid = $("#grade").val();
		    var pnum = $("#price").val().replace(/(^\s*)|(\s*$)/g, "");
		    if(name == null || name == "" || name.length == 0){
		        alert("价格名称不可为空！");
                return false;
		    }
            if(pnum == null || pnum == "" || pnum.length == 0){
		        alert("价格不可为空！");
                return false;
		    }
		    if(!money_reg.test(pnum)){
		        alert("价格不合法！");
                return false;
		    }
		    $.ajax({
				type : "POST",
				url : "price_modify.action",
				data : "pid=" + pid + "&name=" + name + "&gid=" + gid + "&pnum=" + pnum + "&goodId=" + goodId + "&operType=0",
				dataType : "text",
				success : function(msg) {
				    alert(msg);
				    closeBg();
			        main.window.frame.window.location.reload();//刷新孙子窗口，窗口的iframe的name值为“gframe”
				}
			});
		});
		
		$("#save1").click(function(){
		    var money_reg=/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
		    var goodId = $("#goodId1").val();
		    var name = $("#priceName1").val().replace(/(^\s*)|(\s*$)/g, "");
		    var gid = $("#grade1").val();
		    var pnum = $("#price1").val().replace(/(^\s*)|(\s*$)/g, "");
		    if(name == null || name == "" || name.length == 0){
		        alert("价格名称不可为空！");
                return false;
		    }
            if(pnum == null || pnum == "" || pnum.length == 0){
		        alert("价格不可为空！");
                return false;
		    }
		    if(!money_reg.test(pnum)){
		        alert("价格不合法！");
                return false;
		    }
		    $.ajax({
				type : "POST",
				url : "price_modify.action",
				data : "name=" + name + "&gid=" + gid + "&pnum=" + pnum + "&goodId=" + goodId + "&operType=1",
				dataType : "text",
				success : function(msg) {
				    alert(msg);
				    closeBg();
			        main.window.frame.window.location.reload();//刷新孙子窗口，窗口的iframe的name值为“gframe”
				}
			});
			
		});
		
		setInterval(function(){
		    $.ajax({
				type : "POST",
				url : "has_new_order.action",
				data : null,
				dataType : "text",
				success : function(msg) {
				    if(msg == "1"){
				       if($("#has_new_order").css("display") == "none"){
				           $("#has_new_order").slideDown(500);
				       }
				    }
				}
			});
		}, 30000);
	});
    
    function check_new_order(){
        $("#has_new_order").slideUp(500);
        CsmpJS.login("order_morder.action?pageNum=1&pageSize=10&oraState=0", null, null);
    }
    
	function get_customer(){
		$.ajax({
			type : "POST",
			url : "cr_getCustomer.action",
			dataType : "text",
			success : function(msg) {
				if (msg == "1") {
					$("#support").attr("src", "${pageContext.request.contextPath}/images/kefu3.gif");
				}
			}
		});
		setTimeout("get_customer();", 3000);//1分钟发送一次数据请求，查看是否有客户需要帮助
	}
	
	function Move() {
		var b_top = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
		$("#FloatDIV").css("top", b_top + MarginTop);
		setTimeout("Move();", 30);
	}

	function setHeight() {
		var h;
		if (window.document.documentElement)
			h = window.document.documentElement.scrollHeight;
		else
			h = window.document.body.scrollHeight;

		window.parent.document.getElementById("mpage").style.height = h + "px";
	}
	
    function closeBg() { 
        $("#fullbg,#dialog,#fullbg1,#dialog1,#fullbg2,#dialog2,#fullbg3,#dialog3,#fullbg4,#dialog4,#fullbg5,#dialog5,#fullbg6,#dialog6,#fullbg_7,#dialog_7").hide();
        $("#priceName").val("");
        $("#grade").html("");
        $("#price").val("");
        $("#priceName1").val("");
        $("#grade1").html("");
        $("#price1").val("");
	    $("#order").val("");
	    $("#carriage").val("");
        $("#auto_carriage_y").attr("checked", "checked");
        $(".type_good input[type=text]").each(function(){
            $(this).val("");
        });      
        $("#oldps").val("");
        $("#newps").val("");
        $("#newps1").val("");
        
        $("#userName").val("");
        $("#loginAccount").val("");
        $("#loginpass").val("");
        $("#reloginpass").val("");
        $("#userPhone").val("");
        $("#email").val("");
      }
	
	function modify_price(pid){
	    $.ajax({
			type : "POST",
			url : "price_find.action",
			data : "pid=" + pid + "&operType=0",
			dataType : "text",
			success : function(msg) {
			    var price = eval('(' + msg + ')');
			    var grades = price.grades;
			    $("#pid").val(price.pid);
			    $("#priceName").val(price.priceName);
			    $("#price").val(price.price);
			    $("#goodId").val(price.goodId);
			    for(var i = 0; i < grades.length; i++){
			        var op = "";
			        if(price.gid == grades[i].id){
			            op = "<option selected=\"selected\" value=\"" + grades[i].id + "\">" + grades[i].name + "</option>";
			        }else{
			            op = "<option value=\"" + grades[i].id + "\">" + grades[i].name + "</option>";
			        }
			        $("#grade").append(op);
			    }
			}
		});
		CsmpJS.showBG("fullbg","dialog", 120, 200);
	}
	
	function add_price(gid){
	    $("#goodId1").val(gid);
	    $.ajax({
			type : "POST",
			url : "price_find.action",
			data : "pid=" + pid + "&operType=1",
			dataType : "text",
			success : function(msg) {
			    var grades = eval('(' + msg + ')');
			    for(var i = 0; i < grades.length; i++){
			        var op = "<option value=\"" + grades[i].id + "\">" + grades[i].name + "</option>";
			        $("#grade1").append(op);
			    }
			}
		});
		CsmpJS.showBG("fullbg1","dialog1", 120, 200);
	}
	
    function check_order(oid){
        $("#orderId").val(oid);
        CsmpJS.showBG("fullbg2","dialog2", 120, 200);
    }
    
    function check(){//执行审核订单
       var orderId = $("#orderId").val().replace(/(^\s*)|(\s*$)/g, "");
	    var carriage = $("#carriage").val().replace(/(^\s*)|(\s*$)/g, "");
	    var money_reg=/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
	    var is_auto = 0;
        if($("#auto_carriage_y").attr("checked") == false){
            if(carriage == null || carriage == "" || carriage.length == 0){
                alert("运费不可以为空");
                return false;
            }
            if(!money_reg.test(carriage)){
	            alert("运费格式错误");
                return false;
	        }
        }else{
            is_auto = 1;
        }
        $.ajax({
		    type : "POST",
		    url : "order_check.action",
		    data : "orderId=" + orderId + "&carriage=" + carriage + "&isAuto=" + is_auto,
		    dataType : "text",
	        success : function(msg) {
		        closeBg();
		        alert(msg);
		    	main.window.location.reload();//刷新name="main"的frame页面
		    }
	    });
	}
	
	//打开种类添加窗口
	function open_addType(){
	    CsmpJS.showBG("fullbg6","dialog6", 120, 200);
	}  
	         
	function up_Type(tid){
	     var gradeArray = ["一级","二级","三级"];
	     $.ajax({
			 type : "POST",
			 url : "type_upType.action",
			 data : "pid=" + tid,
			 dataType : "text",
			 success : function(msg) {
			     var type = eval("(" + msg + ")");
			     $("#type_id").val(type.typeId);
			     $("#type_name").val(type.typeName);
			     if(type.typeUnit == null || type.typeUnit == "" || type.typeUnit == "null"){
			         $("#type_unit").val("");
			     }else{
			         $("#type_unit").val(type.typeUnit);
			     }
			     if(type.remark == null || type.remark == "" || type.remark == "null"){
			         $("#rem_ark").val("");
			     }else{
			         $("#rem_ark").val(type.remark);
			     }
			     var pid = type.parentId;
			     var pts = type.pts;
			     var grade_op = "";
			     for(var i = 1; i < 4; i++){
			         if(i == type.typeGrade){
			             grade_op += "<option value=\"" + i + "\" selected=\"selected\">" + gradeArray[i - 1] + "</option>";
			         }else{
			             grade_op += "<option value=\"" + i + "\">" + gradeArray[i - 1] + "</option>";
			         }
			     }
			     $("#type_grade").html(grade_op);
			     var parent_op = "<option value=\"0\">--请选择--</option>";
			     for(var i = 0; i < pts.length; i++){
			         if(i == 0){//如果有父类别，则不需要默认父类"0"
			             parent_op = "";
			         }
			         if(pts[i].pid == pid){
			             parent_op += "<option value=\"" + pts[i].pid + "\" selected=\"selected\">" + pts[i].pname + "</option>";
			         }else{
			             parent_op += "<option value=\"" + pts[i].pid + "\">" + pts[i].pname + "</option>";
			         }
			     }
			     $("#parent_id").html(parent_op);
			 }
	     });
	     CsmpJS.showBG("fullbg5","dialog5", 120, 200);
	}
	
	/*加载父类别列表*/
	function load_ptype(){
	     var tg = $("#type_grade").val();
	     var tid = $("#type_id").val();
	     if(tg == "1"){//如果选择一级类别，则没有父类
	         $("#parent_id").html("<option value=\"0\">--请选择--</option>");
	     }else{
	         $.ajax({
				 type : "POST",
				 url : "type_loadParent.action",
				 data : "tg=" + tg + "&tid=" + tid,
				 dataType : "text",
				 success : function(msg) {
				     $("#parent_id").html(getTypeInfo(msg));
				 }
			 });
	     }
	}
	
	/*新增种类时加载父类别列表*/
	function add_load_ptype(){
	     var tg = $("#add_type_grade").val();
	     if(tg == "1"){//如果选择一级类别，则没有父类
	         $("#add_parent_id").html("<option value=\"0\">--请选择--</option>");
	     }else{
	         $.ajax({
				 type : "POST",
				 url : "type_loadParent.action",
				 data : "tg=" + tg,
				 dataType : "text",
				 success : function(msg) {
				     $("#add_parent_id").html(getTypeInfo(msg));
				 }
			 });
	     }
	}
	
	function getTypeInfo(msg){
	    var types = eval("(" + msg + ")");
	    var parent_op = "<option value=\"0\">--请选择--</option>";
		for(var i = 0; i < types.length; i++){
			if(i == 0){//如果有父类别，则不需要默认父类"0"
				parent_op = "";
			}
			if(types[i].pid == pid){
				parent_op += "<option value=\"" + types[i].pid + "\" selected=\"selected\">" + types[i].pname + "</option>";
			}else{
				parent_op += "<option value=\"" + types[i].pid + "\">" + types[i].pname + "</option>";
			}
		}
		return parent_op;
	}
	
	//编辑商品种类
	function upType(){ 
		 var typeName = $("#type_name").val().replace(/(^\s*)|(\s*$)/g, "");
		 var remark = $("#rem_ark").val().replace(/(^\s*)|(\s*$)/g, "");
		 var unit = $("#type_unit").val().replace(/(^\s*)|(\s*$)/g, "");
		 var typeGrade = $("#type_grade").val().replace(/(^\s*)|(\s*$)/g, "");
		 var parentId = $("#parent_id").val().replace(/(^\s*)|(\s*$)/g, "");
	     var typeId = $("#type_id").val().replace(/(^\s*)|(\s*$)/g, "");
         $.ajax({
				type : "POST",
				url  : "type_updateType.action",
				data : "typeId=" + typeId + "&typeName=" + typeName + "&remark=" + remark + "&typeGrade=" + typeGrade + "&parentId=" + parentId + "&unit=" + unit,
				dataType : "text",
				success : function(msg) {
				   alert(msg);
				   closeBg();
				   main.window.location.reload();//刷新本页面
				}
		 });
	}
	
	//添加商品种类
	function addType(){ 
		 var typeName = $("#add_type_name").val().replace(/(^\s*)|(\s*$)/g, "");
		 var remark = $("#add_rem_ark").val().replace(/(^\s*)|(\s*$)/g, "");
		 var unit = $("#add_type_unit").val().replace(/(^\s*)|(\s*$)/g, "");
		 var typeGrade = $("#add_type_grade").val().replace(/(^\s*)|(\s*$)/g, "");
		 var parentId = $("#add_parent_id").val().replace(/(^\s*)|(\s*$)/g, "");
         $.ajax({
				type : "POST",
				url  : "type_addType.action",
				data : "typeName=" + typeName + "&remark=" + remark + "&typeGrade=" + typeGrade + "&parentId=" + parentId + "&unit=" + unit,
				dataType : "text",
				success : function(msg) {
				    alert(msg);
				    closeBg();
				    main.window.location.reload();//刷新本页面
				}
		 });
	}  
	
	function showUpdatePassW(){
	    CsmpJS.showBG("fullbg3","dialog3", 120, 200);
    }
    
    function button(){
       var oldps = $("#oldps").val();
       var newps = $("#newps").val();
       var newps1 = $("#newps1").val();
	   if(oldps == ""){
	     alert("旧密码不能为空");
	     return false;
	   }
	   if(newps==""){
	     alert("新密码不合法");
	     return false;
	   }
	   if(newps==""){
	     alert("确认密码不能为空");
	     return false;
	   } 
	   if(newps != newps1){
	     alert("两次输入的密码不一致！");
	     return false;
	   }
	   $.ajax({
		 url:"home_updatePassWord.action",
		 data: "&newps=" + newps + "&oldps=" + oldps,
		 type:"post", 
		 cache:false,
		 dataType:"text",
		 success:function(msg){
		  if(msg=="0"){
		     alert("密码修改成功");
		     closeBg();
		  }
			
		 }
	  });
    }
 
    function showUpdateInfo(){ 
       var bh = document.body.scrollHeight;//获取当前窗体的总高度
       var bw = $("body").width(); 
        $("#fullbg4").css({ 
            height:bh, 
            width:bw, 
            display:"block"
        });
        $("#dialog4").show();
            
        $.ajax({
			type : "POST",
			url : "home_updateInfo.action",
			dataType : "text",
			success : function(msg) {   
				var user = eval('(' + msg + ')');
				$("#userPhone").text(user.userPhone);
				$("#userName").val(user.userName);
				$("#companyName").val(user.companyName);
			    $("#email").val(user.email);
			}
		});
     }
        
     //信息修改
    function butInfo(){
        var userPhone = $("#userPhone").val();
        var userName = $("#userName").val();       
        var companyName = $("#companyName").val();
        var email = $("#email").val();  
        $.ajax({
			url:"home_upInfo.action",
			data: "userPhone=" + userPhone + "&userName=" + userName + "&companyName=" + companyName +"&email=" + email,
			type:"post", 
		    cache:false,
			dataType:"text",
			success:function(msg){
			    alert(msg);
				closeBg();
			}
        });
    }
        
    function setframe_height(h){
        $("#main").css("height", h);
        $("#mpage").css("height", h);
    }
    function setframe_css(k, v){
        $("#main").css(k, v);
    }
    function set_fheight(did, h){
	    $("#" + did).css("height", h);
	}
	
	function goExit(){
		$.ajax({
			url:"home_loginOut.action",
			type:"post", 
			cache:false,
			dataType:"text",
			success:function(msg){
				if(msg == "0"){
					location.href="login";
				}
			}
		});
	}
	
	function showLogin() {
        CsmpJS.showBG("fullbg_7","dialog_7", 0, 0);
    }
    
    //用户登录
	function login(){
         var loginAccount = $("#login_account").val();
         var loginPassword = $("#login_pswd").val();
       
         $.ajax({
			 url:"home_login.action",
			 data:"loginAccount=" + loginAccount + "&loginPassword=" +loginPassword,
			 type:"post", 
			 cache:false,
			 dataType:"text",
			 success:function(msg){
				 if(msg=="2"){
					alert("帐户不存在");
				 }
				 if(msg=="3"){
					alert("账户名密码不匹配");
				 }
				 if(msg=="4"){
					alert("账户名密码不匹配");
				 }
				 if(msg=="5"){
					alert("帐户不可用");
				 }
				 if(msg=="6"){
					alert("帐户已经在线");
				 }
				 if(msg=="0"){
					     //alert("登录成功");
					document.location.href="manager_index.action";
				 }
				 if(msg=="7"){
					   // alert("登录成功");
					document.location.href="index.action";
				 }
				 if(msg=="8"){
					alert("你的账户被冻结！");
				 }
				 if(msg=="9"){
					alert("你的账户不存在！");
				 }
			}
         });
	}
</script>
</head>
<body onload="setHeight()">
	<div id="page-all">
		<div class="menu">
		    <div id="ds">系统访问量:<font style="color: #F40; font-weight: bold; margin: 0px 2px;">${ds.browseTimes}</font>次</div>
			<ul class="ul_menu">
				<li class="li_menu">
				   <a href="javascript:void(0);" target="main">
						<img src="${pageContext.request.contextPath}/img/xitong.png" style="width:89px; height: 22px; margin-left: 35px;" />
				   </a>
					<ul class="m_t">
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('user_list.action', null, null)" target="main"><span>账户管理</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('role_list.action', null, null)" target="main"><span>角色管理</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('right_list.action', null, null)" target="main"><span>权限管理</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('group_list.action', null, null)" target="main"><span>群组管理</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('recruit_list.action', null, null)" target="main"><span>岗位发布</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('news_list.action', null, null)" target="main"><span>新闻发布</span></a></li>
					</ul>
				</li>
				<li class="li_menu">
				      <a href="javascript:void(0);" target="main">
						<img src="${pageContext.request.contextPath}/img/shangpin.png" style="width:90px; height: 22px; margin-left: 35px;" />
				     </a>
					<ul class="m_t">
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('good_manage_main.action', null, null)" target="main"><span>基本信息</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('type_showList.action', null, null)" target="main"><span>商品分类</span></a></li>
					</ul>
				</li>
				<li class="li_menu">
				     <a href="javascript:void(0);" onclick="javascript:CsmpJS.login('order_morder.action', null, null)" target="main">
						<img src="${pageContext.request.contextPath}/img/dingdan.png" style="width:90px; height: 22px; margin-left: 35px;" />
				     </a>
				</li>
				 <li class="li_menu">
				     <a href="javascript:void(0);" target="main">
					   <img src="${pageContext.request.contextPath}/img/kucun.png"  style="width:90px; height: 22px; margin-left: 35px;" />
				     </a>
					<ul class="m_t">
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('in_storage_list.action', null, null)"  target="main"><span>入库管理</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('bill_list.action', null, null)" target="main"><span>出库管理</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('kucun_info.action', null, null)" target="main"><span>仓库信息</span></a></li>
						<li><a href="javascript:void(0);" onclick="javascript:CsmpJS.login('go_export_data.action', null, null)" target="main"><span>数据导出</span></a></li>
					</ul>
			    </li>
				<li class="li_menu">
				      <a href="javascript:void(0);" target="main"> 
				         <img src="${pageContext.request.contextPath}/img/xitongcaozuo.png" style="width:90px; height: 22px; margin-left: 35px;" />
				      </a>
					<ul class="m_t">
						<li><a href="javascript:void(0);" onclick="showUpdatePassW();"><span>密码修改</span></a></li>
						<li><a href="javascript:void(0);" onclick="showUpdateInfo();"><span>信息修改</span></a></li>
						<li><a href="javascript:void(0);" class="l_out" title="退出系统" onclick="goExit();">退出系统</a></li>
					</ul>
			  </li>
			</ul>
		</div>

		<div id="main">
			<iframe src="good_manage_main.action" id="mpage" name="main" scrolling="no"></iframe>
			<div style="clear: both;"></div>
		</div>
		<div id="footer">
			<iframe src="footer.action" id="fpage" name="footer"></iframe>
			<div style="clear: both;"></div>
		</div>
		<!-- 编辑价格 -->
		<div>
			<div id="fullbg" class="fullbg"></div>
			<div id="dialog" class="dialog">
				<p class="close">
					<label>价格编辑</label> <a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div id="dialog_text" class="dialog_text">
					<input type="hidden" id="pid"> <input type="hidden"
						id="goodId">
					<ul>
						<li>价格名称:<input type="text" class="priceName" id="priceName" /></li>
						<li><span style="margin-left: 24px;"></span>等级: <select
							class="grade" id="grade">
								<option selected="selected"></option>
						</select></li>
						<li><span style="margin-left: 27px;"></span>价格:<input
							type="text" class="price" id="price" /></li>
					</ul>
					<input type="button" value="保存" id="save" class="save">
					<div style="clear: both;"></div>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
		</div>

		<!-- 新增价格 -->
		<div>
			<div id="fullbg1" class="fullbg"></div>
			<div id="dialog1" class="dialog">
				<p class="close">
					<label>新增价格</label> <a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div id="dialog_text1" class="dialog_text">
					<input type="hidden" id="goodId1">
					<ul>
						<li>价格名称:<input type="text" class="priceName" id="priceName1" /></li>
						<li><span style="margin-left: 24px;"></span>等级: <select
							class="grade" id="grade1">
						</select></li>
						<li><span style="margin-left: 27px;"></span>价格:<input
							type="text" class="price" id="price1" /></li>
					</ul>
					<input type="button" value="保存" id="save1" class="save">
					<div style="clear: both;"></div>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
		</div>

		<!-- 审核订单 -->
		<div>
			<div id="fullbg2" class="fullbg2"></div>
			<div id="dialog2" class="dialog2">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div id="dialog_text2">
					<ul>
						<li><span>默认运费:</span> <input type="radio" value="1"
							name="auto_carriage" id="auto_carriage_y" checked="checked">是
							<input type="radio" value="0" name="auto_carriage"
							id="auto_carriage_n">否</li>
						<li><span>输入运费:</span> <input type="hidden" id="orderId">
							<input type="text" class="carriage" id="carriage"></li>
						<li><input type="button" class="btton" value="确定"
							onclick="check();"></li>
					</ul>

				</div>
			</div>
		</div>

		<!-- 编辑商品种类 -->
		<div>
			<div id="fullbg5" class="fullbg5"></div>
			<div id="dialog5" class="dialog5">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div class="type_good" id="dialog_text5">
					<input type="hidden" id="type_id">
					<ul>
						<li style="text-align: center;margin-left: 50px;"><h4>编辑商品种类</h4></li>
						<li style="margin-left: 75px;">种类级别:<select id="type_grade"
							onchange="load_ptype();"></select>
						</li>
						<li style="margin-left: 75px;">种类名称:<input id="type_name"
							class="ty_na" type="text" name="typeName" value="">
						</li>
						<li style="margin-left: 107px;">单位:<input id="type_unit"
							class="ty_na" type="text" name="typeUnit" value="">
						</li>
						<li style="margin-left: 107px;">描述:<input id="rem_ark"
							class="ty_re" type="text" name="remark" value="" />
						</li>
						<li style="margin-left: 90px;">父类ID:<select id="parent_id">
								<option value="0">--请选择--</option>
						</select>
						</li>
						<li style="margin-left: 175px;"><input class="bot"
							type="button" value="确  定" id="bton" onclick="upType();">
						</li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>

		<!-- 添加商品种类 -->
		<div>
			<div id="fullbg6" class="fullbg5"></div>
			<div id="dialog6" class="dialog5">
				<p class="close">
					<a href="#" onclick="closeBg();" title="关闭">×</a>
				</p>
				<div class="type_good" id="dialog_text5">
					<ul>
						<li style="text-align: center;margin-left: 50px;"><h4>添加商品种类</h4></li>
						<li style="margin-left: 75px;">种类级别:<select
							id="add_type_grade" onchange="add_load_ptype();">
								<option value="1">一级</option>
								<option value="2">二级</option>
								<option value="3">三级</option>
						</select>
						</li>
						<li style="margin-left: 75px;">种类名称:<input id="add_type_name"
							class="ty_na" type="text" name="typeName" value="">
						</li>
						<li style="margin-left: 107px;">单位:<input id="add_type_unit"
							class="ty_na" type="text" name="typeUnit" value="">
						</li>
						<li style="margin-left: 107px;">描述:<input id="add_rem_ark"
							class="ty_re" type="text" name="remark" value="" />
						</li>
						<li style="margin-left: 90px;">父类ID:<select
							id="add_parent_id">
								<option value="0">--请选择--</option>
						</select>
						</li>
						<li style="margin-left: 175px;"><input class="bot"
							type="button" value="确  定" id="add_bton" onclick="addType();">
						</li>
					</ul>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>

		<!-- 密码修改 -->
		<div align="center">
			<div id="fullbg3" class="fullbg"></div>
			<div id="dialog3" class="dialog3">
				<p style="text-align: right; margin-right: 15px; margin-top: 8px;">
					<a href="javascript:void(0);" onclick="closeBg();" title="关闭">
						<img src="${pageContext.request.contextPath}/img/login-out.png"
						style="width: 26px; height: 26px;text-align: right;" />
					</a>
				</p>
				<div>
					<table id="tableForm" align="center"
						style="margin-top: 80px; margin-left: 90px;">
						<tr>
							<td class="tdText"><img
								src="${pageContext.request.contextPath}/img/operation-past.png"
								style="width: 57px; height: 18px;" /></td>
							<td><input id="oldps" type="password" name="oldPassWord"
								class="inputClass" value="" /><font color='red'>*</font></td>
						</tr>
						<tr>
							<td height="15" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="tdText"><img
								src="${pageContext.request.contextPath}/img/operation-new.png"
								style="width: 59px; height: 18px;" /></td>
							<td><input id="newps" type="password" name="newPassWord"
								class="inputClass" value="" /><font color='red'>*</font></td>
						</tr>
						<tr>
							<td height="15" colspan="2">&nbsp;</td>
						</tr>
						<tr>
							<td class="tdText"><img
								src="${pageContext.request.contextPath}/img/operation-re.png"
								style="width: 95px; height: 18px;" /></td>
							<td><input id="newps1" type="password" name="newPassWord"
								class="inputClass" value="" /><font color='red'>*</font></td>
						</tr>
						<tr>
							<td height="15" colspan="2">&nbsp;</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2"><input type="button" value=""
								onclick="button();"
								style=" height:32px;  width:166px; background:url( ${pageContext.request.contextPath}/img/operation-save.png); " />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 信息修改 -->
		<div align="center">
			<div id="fullbg4" class="fullbg"></div>
			<div id="dialog4" class="dialog3">
				<p style="text-align: right; margin-right: 15px; margin-top: 8px;">
					<a href="javascript:void(0);" onclick="closeBg();" title="关闭">
						<img src="${pageContext.request.contextPath}/img/login-out.png"
						style="width: 26px; height: 26px;text-align: right;" />
					</a>
				</p>
				<div>
					<table id="tableForm" align="center"
						style="margin-top: 60px; margin-left: 90px;">
						<tr style="height: 40px;">
							<td class="tdText"><img
								src="${pageContext.request.contextPath}/img/xg-zhanghao.png"
								style="width: 86px; height: 19px;" /></td>
							<td class="tdInput" id="userPhone"></td>
						</tr>
						<tr style="height: 40px;">
							<td class="tdText"><img
								src="${pageContext.request.contextPath}/img/xg-xingming.png"
								style="width: 106px; height: 20px;" /></td>
							<td class="tdInput"><input id="userName" type="text"
								name="user_Name" class="inputClass" value=""
								style="width: 207px; height: 30px" /></td>
						</tr>
						<tr style="height: 40px;">
							<td class="tdText"><img
								src="${pageContext.request.contextPath}/img/xg-danwei.png"
								style="width: 86px; height: 20px;" /></td>
							<td class="tdInput"><input id="companyName" type="text"
								name="company_Name" class="inputClass" value=""
								style="width: 207px; height: 30px" /></td>
						</tr>

						<tr style="height: 40px;">
							<td class="tdText"><img
								src="${pageContext.request.contextPath}/img/xg-youxiang.png"
								style="width: 83px; height: 20px;" /></td>
							<td class="tdInput"><input id="email" type="text"
								name="em_ail" class="inputClass" value=""
								style="width: 207px; height: 30px" /></td>
						</tr>

						<tr style="text-align: center; height: 70px;">
							<td colspan="2"><input type="button" value=""
								onclick="butInfo()" class="but_info" /></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<!-- 登录 -->
		<div align="center">
			<div id="fullbg_7" class="fullbg"></div>
			<div id="dialog_7" class="dialog7">
				<p style="text-align: right; margin-right: 15px; margin-top: 8px;">
					<a href="javascript:void(0);" onclick="closeBg();" title="关闭"><img
						src="${pageContext.request.contextPath}/img/login-out.png"
						style="width: 26px; height: 26px;text-align: right;" /></a>
				</p>
				<div class="loginTopDiv">
					<span class="loginTop"></span>
				</div>
				<div>
					<table style="margin-left: 300px; margin-top: 25px;">
						<tr>
							<td colspan="2" style="width: 300px; height: 45px;">
							    <input id="login_account" type="text" style="width: 298px; height: 43px; margin-top:30px; font-size:18px; padding-left:50px; border:none; background: url('${pageContext.request.contextPath}/img/login-user.png') no-repeat;">
							</td>
						</tr>
						<tr>
							<td colspan="2" style="width: 300px; height: 45px;">
							    <input id="login_pswd" type="password" style="width: 298px; height: 43px; margin-top:30px; font-size:18px; padding-left:50px; border:none; background: url('${pageContext.request.contextPath}/img/login-password.png') no-repeat;">
							</td>
						</tr>
						<tr style="text-align: center;">
							<td colspan="2">
							    <input type="button" id="submit" value="" onclick="login();" class="login_button" />
							    <br /><br />
							    <a href="regist_getList.action" style="color: blue; vertical-align: bottom; margin-left: 230px;">免费注册</a>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</div>
		
	</div>
	<!-- 悬浮窗 -->
	<div id="FloatDIV">
		<img id="support" src="${pageContext.request.contextPath}/images/kefu1.png" title="响应客户">
	</div>

    <div id="has_new_order">
        <div id="o_close">
            <a href="#" onclick="javascript:$('#has_new_order').slideUp(500);" title="关闭">×</a>
        </div>
        <div id="o_main">
            <a href="#" onclick="check_new_order();">有新的订单生成，点击此处查看</a>
        </div>
    </div>
	<div style="clear: both;"></div>
</body>
</html>