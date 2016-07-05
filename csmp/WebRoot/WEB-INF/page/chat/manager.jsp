<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>manager</title>
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/t_style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/validate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery/jquery-calendar.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/component/jquery-calendar.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/component/jquery.fileDownload.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/form/jquery.form.js"></script>
	
	<style type="text/css">
	    p{display: inline; font-size:14px; padding: 3px 0px; color:blue;}
	    a{word-break: break-all; word-wrap:break-word; font-size:16px; color:blue; text-decoration:none;}
	    a:hover{font-size:16px; color:red; text-decoration:underline;}
	    #message img{width: 150px; height: 100px;}
	    #message div{width: 301px; border: solid 0px red; margin: 3px 0px; font-size:14px; word-break: break-all; word-wrap:break-word;}
	    #msgee{width:320px; height:100px; font-size:14px;}
	</style>
	
    <script type="text/javascript">
        $(function(){
           $("#mes").focus();
           $.post("cr_getUser.action?manager="+$('#sender').val(),null,function(data){
               var datas = data.split("|");
               var lastElement=document.createElement("div");  
               lastElement.innerHTML = "<p>" + datas[0] + "&nbsp;&nbsp;&nbsp;&nbsp;" + datas[2] + "</p><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + datas[3];
               $('#sendee').val(datas[1]);
               $("#message").append(lastElement);
           });
           
           setInterval(function(){
              $.post("cr_getNewMessage.action?sender="+$('#sender').val()+"&sendee="+$('#sendee').val()+"&time="+new Date().getTime(),null,function(data){
                 if(data != "no_message"){
                    var datas = data.split("|");
                    if($('#sendee').val() == "no-sendee"){
                       $('#sendee').val(datas[1]);
                    }
                    var messages = datas[2].split(";");
                    for(var i = 0; i < messages.length - 1; i++){
                       var messageInfo = messages[i].split("#");
                       var lastElement=document.createElement("div");
                       if(messageInfo[4] == "0"){
                           lastElement.innerHTML = "<p>" + messageInfo[0] + "&nbsp;&nbsp;&nbsp;&nbsp;" + messageInfo[1]
                                                         + "</p><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + messageInfo[2];
                       }else if(messageInfo[4] == "2"){
                           lastElement.innerHTML = "<p>" + messageInfo[0] + "&nbsp;&nbsp;&nbsp;&nbsp;" + messageInfo[1]
                                                         + "</p><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发送文件<a href='#' onclick='filedownload(\"" + messageInfo[3] + "\")'>"
                                                         + messageInfo[2] + "</a>点击进行下载";
                       }else{
                           lastElement.innerHTML = "<p>" + messageInfo[0] + "&nbsp;&nbsp;&nbsp;&nbsp;" + messageInfo[1]
                                                          + "</p><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发送图片<a href='#' onclick='filedownload(\"" + messageInfo[3] + "\")'>"
                                                          + "<img src='cr_showImage.action?imageUrl=" + messageInfo[3] + "' alt='" + messageInfo[2] +"'/>" + "</a>点击进行下载";
                       }
                       $("#message").append(lastElement);
                       runBottom();
                    }
                 }
              });
           },500);
        });
        
        function filedownload(filePath){
            $.fileDownload("f_download.action",{
				preparingMessageHtml : "文件正在生成,请稍后...",
				failMessageHtml : "文件生成失败，请重试",
				httpMethod : "POST",
				data : "path=" + filePath
			});
        }
        
        function quick(e){
           var keycode = e.keyCode || e.which || e.charCode;
           if((keycode == 13 && e.shiftKey) || (keycode == 13 && e.ctrlKey)){
              send();
           }
        }
        
        function send(){
           var options = {
                url : "cr_sendMessage.action?sender=" + $("#sender").val() + "&sendee=" + $("#sendee").val() + "&msgee=" + $("#msgee").val(),
                type : "POST",
                success : function(msg){
                    $("#file").val("");
                    $("#msgee").val("");
                    var datas = msg.split("|");
                    for(var i = 0; i < datas.length - 1; i++){
                        var messageInfo = datas[i].split("#");
                        var lastElement=document.createElement("div");
                        if(messageInfo[0] == "0"){
                            lastElement.innerHTML = "<p>" + messageInfo[1] + "&nbsp;&nbsp;&nbsp;&nbsp;" + messageInfo[2]
                                                          + "</p><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + messageInfo[3];
                        }else if(messageInfo[0] == "2"){
                            lastElement.innerHTML = "<p>" + messageInfo[1] + "&nbsp;&nbsp;&nbsp;&nbsp;" + messageInfo[2]
                                                          + "</p><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发送文件<a href='#' onclick='filedownload(\"" + messageInfo[4] + "\")'>"
                                                          + messageInfo[3] + "</a>点击进行下载";
                        }else{
                            lastElement.innerHTML = "<p>" + messageInfo[1] + "&nbsp;&nbsp;&nbsp;&nbsp;" + messageInfo[2]
                                                          + "</p><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发送图片<a href='#' onclick='filedownload(\"" + messageInfo[4] + "\")'>"
                                                          + "<img src='cr_showImage.action?imageUrl=" + messageInfo[4] + "' alt='" + messageInfo[3] +"'/>" + "</a>点击进行下载";
                        }
                        $("#message").append(lastElement);
                        runBottom();
                    }
                }
            };
            $("#mes_from").ajaxSubmit(options);
        }
        
        function runBottom(){
           $('#message').scrollTop(10000000);
        }
    </script>

  </head>
  
  <body style="margin: 0px; padding: 0px;">
    
    <div id="gb" style="width: 321px; height: 754px; border: solid 1px #000;">
        <div id="message" style="width: 321px; height: 610px; border: solid 0px red; overflow: auto;"></div>
        <div>
           <form id="mes_from" method="post" enctype="multipart/form-data">
              <input id="sender" name="sender" type="hidden" value="${sender}">
              <input id="sendee" name="sendee" type="hidden" value="${sendee}">
              <textarea id="msgee" name="msgee" rows="7" cols="49" onkeydown="quick(event);"></textarea>
              <input id="file" name="uploadFile" type="file" style="width: 243px; height: 30px; border: solid 0px red; background: #FFF">
              <input type="button" title="发送消息快键Shift+Enter或Ctrl+Enter" value="发送>>" onclick="send();" style="width: 74px; height: 30px;"/>
           </form>
        </div>
    </div>
  </body>
</html>