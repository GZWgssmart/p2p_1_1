<%@ page import="com.gs.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<%--18770714017    18770714017xyp--%>
<html>
<head>
    <title>安全设置</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>
<div class="account-right">
    <div class="account-right-nav">
        <div class="sub-a-nav">
            <a href="javascript:void(0);" class="active">安全中心</a>
        </div>
        <em></em>
    </div>
    <div class="account-content" style="display: block;">
        <div class="safe">
            <div class="safe-top">
                <p class="safe-t-text">您的资料完善度</p>
                <p class="safe-t-line"><em style="width: 30%;"></em></p>
                <p class="safe-t-r">低</p>
            </div>
            <div class="safe-content">
                <ul class="safe-list">
                    <li>
                        <div class="safe-list-1">
                            <p class="icon icon-true" id="cellPhone-icon">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</p>
                        </div>
                        <div class="safe-list-2" id="cellPhone-text">1817****439</div>
                        <div class="safe-list-3">
                            <a href="javascript:;" id="cellPhone" class="on">已绑定</a>
                            <a href="javascript:;" id="changePhone">修改</a>
                        </div>
                    </li>
                    <li>
                        <div class="safe-list-1">
                            <p class="icon icon-wrong" id="email-icon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</p>
                        </div>
                        <div class="safe-list-2" id="email-text">获取最新的投资讯息和账户信息变动通知</div>
                        <div class="safe-list-3">
                            <a href="javascript:;" id="email">进行绑定</a>
                        </div>
                    </li>
                    <li>
                        <div class="safe-list-1">
                            <p class="icon icon-wrong" id="realName-icon">身份认证</p>
                        </div>
                        <div class="safe-list-2" id="realName-text">一旦实名认证通过将不能修改</div>
                        <div class="safe-list-3">
                            <a href="javascript:;" id="realName">去认证</a>
                        </div>
                    </li>
                    <li>
                        <div class="safe-list-1">
                            <p class="icon icon-true">登录密码</p>
                        </div>
                        <div class="safe-list-2">
                            ******
                        </div>
                        <div class="safe-list-3">
                            <a href="javascript:;" id="password-btn">修改</a>
                        </div>
                    </li>
                    <!-- <li>
                        <div class="safe-list-1">
                            <p class="icon icon-true">交易密码</p>
                        </div>
                        <div class="safe-list-2">
                            ******
                        </div>
                        <div class="safe-list-3">
                            <a href="javascript:;"  id="dealpwd"></a>
                            <a href="recoverpwd.html#deal"  id="forgetpwd">忘记密码</a>
                        </div>
                    </li> -->
                </ul>
            </div>
        </div>
    </div>
    <div class="popup bind-email">
        <p class="title left">绑定邮箱</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <div class="label cl">
                <label>添加邮箱</label><input type="text" id="addEmail" maxlength="30" placeholder="输入您的邮箱地址">
            </div>
            <button type="button" class="btn" id="email-submit">添加邮箱</button>
        </div>
    </div>
    <div class="popup change-phone">
        <p class="title left">修改手机号</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from step1">
            <div class="label cl">
                <label>原手机号</label>
                <p class="text" id="oldPhoneNum"></p>
            </div>
            <div class="label label-msg cl">
                <label>验证码</label>
                <input type="text" id="oldMobliePhoneCode" maxlength="6" placeholder="输入您短信验证码">
                <button type="button" id="getMsgCodeOld">获取验证码</button>
            </div>
            <button type="button" class="btn" id="phone-submit-one">验证</button>
        </div>
        <div class="popup-from step2">
            <div class="label cl">
                <label>新手机号</label>
                <input type="text" id="newMobliePhone" maxlength="11" placeholder="输入您的新手机号码">
            </div>
            <div class="label label-msg cl">
                <label>验证码</label>
                <input type="text" id="newMobliePhoneCode" maxlength="6" placeholder="输入您短信验证码">
                <button type="button" id="getMsgCode">获取验证码</button>
            </div>
            <button type="button" class="btn" id="phone-submit">修改</button>
        </div>
        <div class="popup-result">
            <div class="success">
                <p>手机号修改成功，请重新登录！</p>
                <button type="button" class="btn" id="phone-submit-success">确定</button>
            </div>
        </div>
    </div>
    <div class="popup change-pwd" style="display: none;">
        <p class="title left">修改密码</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <div class="label cl">
                <label>原始密码</label><input type="password" id="oldPassword" maxlength="18" autocomplete="new-password" placeholder="输入原始密码">
            </div>
            <div class="label cl">
                <label>新密码</label><input type="password" id="newPassword" maxlength="18" autocomplete="new-password" placeholder="输入新密码">
            </div>
            <div class="label cl">
                <label>确认密码</label><input type="password" id="confirmPassword" maxlength="18" autocomplete="new-password" placeholder="再次输入新密码">
            </div>
            <button type="button" class="btn" id="pwd-submit">确定</button>
        </div>
        <div class="popup-result">
            <div class="success">
                <p>密码修改成功!</p>
                <button type="button" class="btn" id="submit-success">确定</button>
            </div>
        </div>
    </div>
</div>
</body>

</html>
