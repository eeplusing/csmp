<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    <title>注册页面</title>
  
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
	<style type="text/css">
	    #main{
	       width: 1310px;
	       margin: 10px auto;
	       overflow: hidden;
	    }
		div.mai_tan_top{
		    width: 100%;
		    height: 60px;
		    margin-top: 60px;
		}
		span.mai_tan {
		    margin-left: 180px;
	        font-size: 36px; 
	        font-weight: bold; 
	        color: #FF4001; 
	        font-family: Courier New;
        }
        span.user_reg {
	        font-size: 26px; 
	        font-weight: bold;
        }
        div.steps {
		    height: 46px; 
		    border-bottom: 2px solid #E6E6E6; 
		}
		div.steps ol {
			margin-left: 420px; 
			width: 540px;
		}
		div.steps ol li {
			width: 170px; 
			height: 46px; 
			color: #999; 
			line-height: 46px; 
			padding-left: 70px; 
			font-family: "微软雅黑","华文细黑","黑体",arial; 
			font-size: 16px; 
			font-weight: bold; 
			float: left; 
			display: inline;
		}
		div.steps ol li i {
			background: url("${pageContext.request.contextPath}/img/ico-circle2.png") no-repeat 0px 0px; 
			width: 24px; 
			height: 24px; 
			text-align: center; 
			color: #FFF; 
			line-height: 24px; 
			font-size: 14px; 
			font-style: normal; 
			font-weight: bold; 
			margin-right: 5px; 
			display: inline-block; 
			-ms-zoom: 1;
		}
		div.steps ol li.active {
			color: #3E3E3E; 
			border-bottom: 2px solid #F40; 
		}
		div.steps ol li.active i {
			background-image: url("${pageContext.request.contextPath}/img/ico-circle1.png");
		} 
		div.steps-4 ol li {
			width: 150px; 
			padding-left: 30px;
		}
    
        span.table_hr{
          border: 1px solid #f0f0f0; 
        }
        div ul.table_top{
            font-size: 16px;
            font-weight: bold;
        }
        span.table_hr{
            border: 1px solid #f0f0f0; 
        }
        input.ph_one{
          border-top : none; 
          border-bottom : none; 
          border-left : none; 
          border-right : none; 
        }
        span.login_name{
             margin-left: 40px;
             font-size: 14px;
             font-weight: bold;
        }
       li.login_pswd{
             margin: 30px 0px;
             text-align: left;
             font-size: 16px;
             font-weight: bold;
       }
       li.login_txt{
           margin: 15px 0px;
           height: 30px;
           font-size: 18px;
           text-align: right;
       }
       li.login_txt input{
           float: right;
             width: 250px; 
			 height: 30px;
			 font-size: 18px;
       }
       
       li.login_txt label{
          display:inline-block;
          margin-top: 4px;
       }
        input.con_firm {
	      background:#FF4001;
          color:#FFF;
          font-size:16px;
          font-weight:bold;
		  height:35px;
		  width: 180px;
		  border: none;
		  cursor: pointer;
		  margin:30px 102px;
		  
       }
	  div.footer{
	        border-top: 1px solid #CCC;
		    bottom:0;
		    width:1310px;
		    height:80px;
		    line-height:80px;
		    text-align:center;
		    font-size: 12px;
		    color: #5D6B7A;   
		}
	</style>
    <script type="text/javascript">
    
      //注册信息  
     function confirm() 
      {
         var phone = $("#phone").val();
         var userName = $("#user_name").val();
         var loginPswd = $("#loginPswd").val();
         var newloginPswd = $("#newloginPswd").val();
         var company = $("#company").val();
         var email = $("#email").val();
         
         if(userName==""){
	        alert("昵称不能为空");
	        return false;
	      }
         if(loginPswd==""){
	        alert("登录密码不能为空");
	        return false;
	      }
         if(loginPswd != newloginPswd){
            alert("两次输入的密码不一致");
            return false;
         }
         if(newloginPswd == ""){
            alert("确认密码不能为空");
            return false;
         }
   
           $.ajax({
			     url:"regist_addUser.action" ,
			     data:"phone="+phone + "&userName="+userName + "&loginPswd="+loginPswd +"&newloginPswd="+newloginPswd +"&company="+company + "&email=" +  email ,
				 type:"post", 
				 cache:false,
				 dataType:"text",
				 success:function(msg){
				     if(msg=="1"){
				        // alert("注册成功");
				         document.location.href="regist_complete.action?phone=" + phone;
				     }else if(msg=="2"){
				         alert("账号已经存在");
				     }else if(msg=="3"){
				         alert("注册失败");
				     }
				}
			});
      }    
    </script>
  </head>
  <body>  
     <div id="main">
       <div class="mai_tan_top">
          <span class="mai_tan">卖炭网</span>
          <span class="user_reg">用户注册</span>
       </div>
       <div class="steps steps-4">
	     <ol>
		   <li class="active" ><i>1</i><span class="tsl" data-phase-id="r_p_createAccount">设置登录名</span></li>
		   <li class="active" ><i>2</i><span class="tsl" data-phase-id="r_p_fillUserInfo">填写账户信息</span></li>	
		   <li ><i class="iconfont">√</i><span class="tsl" data-phase-id="r_p_regSuc">注册成功</span></li>
		   <div style="clear: both;"></div>
	     </ol>
	   </div>
        <span class="table_hr"></span><br/><br/> 
        <div style="width: 385px; margin: 0px auto;">
            <ul>
              <li>
                <input id="phone" type="hidden"  value="${usePhone}">
                 <span class="login_name">登录名&nbsp;&nbsp;&nbsp;&nbsp;${usePhone}</span>
              </li>
              <li class="login_pswd">设置昵称</li>
              <li class="login_txt">
                 <label>昵称<font style="color:#F40;">*</font></label><input id="user_name" type="text" name="userName" class="com_pany">
              </li>
              
              <li class="login_pswd">设置登录密码</li>
                
              <li class="login_txt">
                 <label>登录密码<font style="color:#F40;">*</font></label><input id="loginPswd" type="password" name="loginPswd" class="com_pany">
              </li>
              <li class="login_txt">
                 <label>再次确认<font style="color:#F40;">*</font></label><input id="newloginPswd" type="password"  name="newloginPswd" class="com_pany">
              </li>
              
              <li class="login_pswd">设置注册公司</li>
              
              <li class="login_txt">
                 <label>公司名称</label><input id="company" type="text" name="company" class="com_pany "> 
              </li>
              
              <li class="login_pswd">设置邮箱</li>
              
              <li class="login_txt">
                 <label>邮箱</label><input id="email" type="text" name="email" class="com_pany ">
              </li>
            </ul><br/> 
          <input type="button" value="确 定" class="con_firm" onclick="confirm();"/>
          <div style="clear: both;"></div>
        </div>
        <div class="footer">
           版权所有 &nbsp;&nbsp;卖炭网&nbsp;&nbsp;IPC备案号:正在申请中 &nbsp;&nbsp;技术支持:&nbsp;西安魔盾电气工程自动化研究所有限公司
		</div>
     </div>
  </body>
</html>