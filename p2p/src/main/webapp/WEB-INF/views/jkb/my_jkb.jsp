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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>账户总览</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>

    <link rel="stylesheet" href="<%=path%>/static/css/pagination.css"/>
    <!-- 提示框 -->
    <script src="<%=path %>/static/js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="<%=path %>/static/css/sweetalert.css">
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>

<!-- begin -->
<div class="account-right" style="width: 100%;height: 951px;">
    <div class="account-right-nav">
        <div class="sub-a-nav">
            <a href="javascript:void(0);" class="active" id="invest-manage-Link">投资管理</a>
        </div>
        <em class="em-line" style="left: 0px;"></em>
    </div>
    <div class="account-content" id="invest" style="display: block;">
        <div class="sub-nav">
            <a href="javascript:;" class="active" id="invest-s1">成功借出</a>
            <a href="javascript:;" id="invest-s2" class="">招标中的借款</a>
            <a href="javascript:;" id="invest-s3" class="">回款中的借款</a>
            <a href="javascript:;" id="invest-s4" class="">已回收的借款</a>
        </div>
        <div class="account-form cl">
            <input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
            <p class="text">至</p>
            <input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
            <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
            <button type="button" class="search" id="cashSearch">搜索</button>
        </div>
        <div class="invest-listData invest-listData1" style="display: block;">
            <ul class="investData list-box">
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">年利率</div>
                    <div class="children3">期限</div>
                    <div class="children4">还款方式</div>
                    <div class="children5">投资金额</div>
                    <div class="children6">投资时间</div>
                </li>
            </ul>
            <ul class="investData listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
            <ul class="paging"></ul>
        </div>
        <div class="invest-listData invest-listData2" style="display: none;">
            <ul class="investData list-box">
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">年利率</div>
                    <div class="children3">期限</div>
                    <div class="children4">还款方式</div>
                    <div class="children5">发布时间</div>
                    <div class="children6">投资金额</div>
                    <div class="children7">投资时间</div>
                </li>
            </ul>
            <ul class="investData listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
            <ul class="paging"></ul>
        </div>
        <div class="invest-listData invest-listData3" style="display: none;">
            <ul class="investData list-box">
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">年利率</div>
                    <div class="children3">期限</div>
                    <div class="children4">投资金额</div>
                    <div class="children5">已收金额</div>
                    <div class="children6">还款时间</div>
                    <div class="children7">操作</div>
                </li>
            </ul>
            <ul class="investData listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
            <ul class="paging"></ul>
        </div>
        <div class="invest-listData invest-listData4" style="display: none;">
            <ul class="investData list-box">
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">年利率</div>
                    <div class="children3">期限</div>
                    <div class="children4">投资金额</div>
                    <div class="children5">已收金额</div>
                    <div class="children6">发布时间</div>
                    <div class="children7">操作</div>
                </li>
            </ul>
            <ul class="investData listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
            <ul class="paging"></ul>
        </div>
    </div>

    <div class="popup payment-detail">
        <p class="title left">还款明细</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-list">
            <ul class="payment-detail-data list-box">
                <li class="">
                    <div class="children0">期数</div>
                    <div class="children1">还款日期</div>
                    <div class="children2">应收本金</div>
                    <div class="children3">应收利息</div>
                    <div class="children4">剩余本金</div>
                    <div class="children5">利息管理费</div>
                    <div class="children6">是否逾期</div>
                    <div class="children7">逾期天数</div>
                    <div class="children8">逾期罚息</div>
                    <div class="children9">已收本息</div>
                    <div class="children10">还款人</div>
                </li>
            </ul>
            <ul class="listData">
            </ul>
            <ul class="paging">
            </ul>
        </div>
    </div>
</div>
<!-- end -->


</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>


<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/account.js"></script>
<script>
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
    $(function(){
        $('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
        $('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    });
</script>
</html>
