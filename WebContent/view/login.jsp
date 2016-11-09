<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆页面</title>
<meta name="author" content="DeathGhost" />
<script type="text/javascript" src="js/jQuery-VerificationCode/js/jquery.js" ></script>
<script src="js/jQuery-VerificationCode/js/verificationNumbers.js" tppabs="js/verificationNumbers.js"></script>
<script src="js/jQuery-VerificationCode/js/Particleground.js" tppabs="js/Particleground.js"></script>
<link rel="stylesheet" type="text/css" href="js/jQuery-VerificationCode/css/style.css" tppabs="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>

<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可a
  $(".submit_btn").click(function(){
	 // location.href="javascrpt:;"/*tpa=http://***index.html*/;
	 $.ajax({ 
         type : "POST",
         url :  '${pageContext.request.contextPath}/userController/doNotNeedSession_login',
         data :  $("#loginInputForm").serialize(),//序列化表单提交input 值
		 success : function(data) {
			var obj = jQuery.parseJSON(data);
			if (obj.success) {
				window.location.href="${pageContext.request.contextPath}/view/index.jsp";
			}
			else{				
				$("#loginid").val("");
				$("#password").val("");
			}			
		 },
         error:function(data){
        	 alert("请求出错");   
         }
	
	});
	 
  });
});


</script>
</head>
<body>
<form id="loginInputForm" >

<dl class="admin_login">
 <dt>
  <strong>小脚印评价系统</strong>
  <em>Appraise System</em>
 </dt>
 <dd class="user_icon">
  <input type="text" name="loginid" placeholder="账号" class="login_txtbx"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" name="password" placeholder="密码" class="login_txtbx"/>
 </dd>
<dd class="val_icon">
  <div class="checkcode">
    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  </div>
  <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
 </dd>
 <dd>
  <input type="button" value="立即登陆" class="submit_btn"/>
 </dd>
<span id="reminder" style="color:red;">账号或密码有误</span>
  <p>© 2015-2016 jq22 版权所有</p>
  <p>小脚印</p>
 </dd>
</dl>
 </form>
</body>
</html>