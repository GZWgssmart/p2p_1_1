<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>身份认证</title>
	<link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
	<link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />

<body>
<!-- head end -->
	<div class="registpay-content">
		<div class="regist-box" style="display: block;">
			<img class="hf-logo" src="<%=path%>/static/resources/front/v01/src/images/huifu.png" width="120" height="40">
			<h3>注册汇付天下</h3>
			<p class="error-msg icon icon-error"></p>
			<div class="from">
				<label for="Name" class="icon icon-user"></label>
				<input type="text" name="Name" id="Name" maxlength="18" placeholder="输入真实姓名">
			</div>
			<div class="from">
				<label for="idCard" class="icon icon-idcard"></label>
				<input type="text" name="" id="idCard" maxlength="18" placeholder="输入身份证号">
			</div>
			<div class="from">
				<label for="phone" class="icon icon-mobile"></label>
				<input type="text" name="" id="phone" maxlength="11" placeholder="输入手机号"/>
			</div>
			<div class="from">
				<label for="email" class="icon icon-email"></label>
				<input type="text" name="" id="email" maxlength="30" placeholder="输入邮箱"/>
			</div>
			<div class="from from-msg">
				<label for="msgcode" class="icon icon-msg"></label>
				<input type="text" name="" id="msgcode" maxlength="6" placeholder="输入短信验证码"/>
				<div class="msg-btn">
					<button type="button" id="getMsgCode">获取验证码</button>
				</div>
			</div>
			<button class="btn" type="button">注册</button>
		</div>
		<div id="registPay" style="display:none;"></div>
	</div>
<!-- foot -->
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/registpay.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/src/libs/public.js"></script>
</body>
</html>