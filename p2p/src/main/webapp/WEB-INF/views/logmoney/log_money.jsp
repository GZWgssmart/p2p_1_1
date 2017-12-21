<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>账户总览</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>
<%@include file="../master/head.jsp" %>
<div class="account cl">
    <%@include file="../master/left.jsp" %>

    <!-- begin -->
    <div class="account-right">

        <div class="account-right-nav">
            <div class="sub-a-nav">
                <a class="active" href="javascript:void(0);">资金记录</a>
            </div>
            <em></em>
        </div>
        <div class="account-content">
            <div class="fund-param-list">
                <p>交易类型：</p>
                <ul class="cl">
                    <li class="active"><a href="javascript:;">全部</a></li>
                    <li><a href="javascript:;">投资</a></li>
                    <li><a href="javascript:;">充值</a></li>
                    <li><a href="javascript:;">提现</a></li>
                    <li><a href="javascript:;">还款</a></li>
                    <li><a href="javascript:;">奖励</a></li>
                    <li><a href="javascript:;">冻结</a></li>
                </ul>
            </div>
            <div class="account-form cl">
                <p class="text long">交易时间：</p>
                <input class="date icon icon-date" id="startDate" type="text" readonly="readonly">
                <p class="text">至</p>
                <input class="date icon icon-date" id="endDate" type="text" readonly="readonly">
                <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
                <button class="search" id="fundSearch" type="button">搜索</button>
            </div>
            <div class="account-list">
                <ul class="fund-list-box list-box">
                    <li class="title">
                        <div class="children0">交易时间</div>
                        <div class="children1">交易类型</div>
                        <div class="children2">交易金额</div>
                        <div class="children3">可用余额</div>
                        <div class="children4">操作</div>
                    </li>
                </ul>
                <ul class="fund-list-box listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                <ul class="paging"></ul>
            </div>
        </div></div>
    <!-- end -->
</div>
<%@include file="../master/foot.jsp" %>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function(){
        $(".cl li").bind("click",function(){
            $(".cl li").removeClass("active");
            $(this).addClass("active");
        });

        $(".luckyLink").mouseover(function (){
            $(".luckyDetails").show();
        }).mouseout(function (){
            $(".luckyDetails").hide();
        });
    })
</script>
</html>
