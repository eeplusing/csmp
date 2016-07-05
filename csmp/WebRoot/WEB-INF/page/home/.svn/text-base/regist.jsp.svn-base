<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp"%>

<html>
  <head>
    <title>注册页面</title>
  
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/t_style.css">
	<style type="text/css">
       #divMain {
            margin-left: 240px;
            }
       #divTitle {
          line-height: 30px; 
          width: 880px; 
          height: 30px; 
          border: 1px solid #d0d0d0; 
          }
       #spanTitle {
           margin-left: 18px; 
           font-weight: 900;
           }
       #divBody {
            width: 880px; 
            height: 400px; 
            border-left: 1px solid #d0d0d0;
            border-bottom: 1px solid #d0d0d0;
            border-right: 1px solid #d0d0d0;
            }
       .tdText {
           width: 300px; 
           text-align: right;
           }
       .tdInput{
            width: 250px;
            }
       .tdError {
            width: 300px;
            }
       #tableForm {
            line-height: 50px;
            }
       .inputClass {
            width: 240px; 
            height: 32px; 
            border: 1px solid #7f9db9; 
            line-height: 32px; 
            padding-left: 10px;
            }
       #imgVerifycode {
            width: 100px;
            }
       #divVerifycode {
           text-align: center; 
           border: 1px solid #e2e2e2;
           }
       .errorClass {
           background: url(/csmp/images/error.png) no-repeat; 
           color: #f40000; 
           font-size: 10pt; 
           border:1px solid #ffb8b8; 
           background-color: #fef2f2; 
           padding: 8px 8px 8px 35px;
           }
       
	</style>
	
	 <script type="text/javascript">
	 
       function save(){
            var username = $("#username").val();
            var companyname = $("#companyname");
            var loginaccount = $("#loginaccount");
            var loginpass= $("#loginpass").val();
            var reloginpass= $("#reloginpass");//确认密码
           var userPhone= $("#userPhone");
            var email= $("#email").val();
            alert(username);
	         if(username == ""){
	          alert("用户姓名不能为空");
	          return false;
	           }
	         if(loginaccount==""){
	            alert("登录账号不合法");
	           return false;
	          }
	          if(loginpass==""){
	            alert("登录密码不能为空");
	           return false;
	          }
	          if(loginpass != reloginpass){
	            alret("两次输入的密码不一致！");
	            return false;
	          }
	          
	         if(userPhone==""){
	             alert("电话号码不能为空");
	             return false;
	          }
	         if(email==""){
	            alert("邮箱不能为空");
	            return false;
	         }
	        
	        $.ajax({
			    url:"home_addUser.action" ,
			    data: "username=" + username + "&companyname=" + companyname + "&loginaccount=" + loginaccount + "&loginpass=" + loginpass + "&userPhone=" + userPhone + "&email=" + email,
				type:"post", 
				cache:false,
				dataType:"text",
				success:function(msg){
				    alert(msg);
				  // document.location.href="#";
				}
			});
        }
	</script>
  </head>
  <body>
<div id="divMain">
  <div id="divTitle">
    <span id="spanTitle">新用户注册 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     注意：以下带<font color='red'>*</font>都是必填项
  </div>
  <div id="divBody">
<form action="#regist-form" method="post" id="registForm">
	<input type="hidden" name="method" value="regist"/>  
    <table id="tableForm">
      <tr>
        <td class="tdText">用户姓名：<fond color='red'>*</fond></td>
        <td class="tdInput">
          <input class="inputClass" type="text" name="userName" id="username" value=""/>
        </td>
        
        </tr>
       <tr>
        <td class="tdText">所属公司：</td>
        <td class="tdInput">
          <input class="inputClass" type="text" name="companyName" id="companyname" value=""/>
        </td>
       
      </tr>
                  <tr>
        <td class="tdText">登录账号：<fond color='red'>*</fond></td>
        <td class="tdInput">
          <input class="inputClass" type="text" name="loginAccount" id="loginaccount" value=""/>
        </td>
       
      </tr>
      <tr>
        <td class="tdText">登录密码：<fond color='red'>*</fond></td>
        <td>
          <input class="inputClass" type="password" name="loginPassword" id="loginpass" value=""/>
        </td>
        
      </tr>
      <tr>
        <td class="tdText">确认密码：<fond color='red'>*</fond></td>
        <td>
          <input class="inputClass" type="password" name="loginPassword" id="reloginpass" value=""/>
        </td>
        
      </tr>
      <tr>
        <td class="tdText">电话号码：<fond color='red'>*</fond></td>
        <td>
          <input class="inputClass" type="text" name="userPhone" id="userPhone" value=""/>
        </td>
        
      </tr>
      <tr>
        <td class="tdText">Email：<fond color='red'>*</fond></td>
        <td>
          <input class="inputClass" type="text" name="email" id="email" value=""/>
        </td>
        
      </tr>

      <tr>
        <td></td>
        <td>
          <input type="button" value="注册" onclick="save()"/>
        </td>
        <td>
          <label></label>
        </td>
      </tr>
     </table>
    </form>    
   </div>
  </div>
 </body>
</html>