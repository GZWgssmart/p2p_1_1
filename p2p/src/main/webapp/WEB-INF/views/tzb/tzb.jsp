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
            <a href="javascript:void(0);" class="" id="invest-manage-Link" class="active">投资管理</a>
            <a href="javascript:void(0);" id="invest-detail-Link">收款明细</a>
        </div>
        <em class="em-line" style="left: 0px;"></em>
    </div>
    <div class="account-content" id="invest" style="display: block;">
        <div class="sub-nav">
            <a href="javascript:;" class="active" id="invest-s1">成功借出</a>
            <a href="javascript:;" id="invest-s2">招标中的借款</a>
            <a href="javascript:;" id="invest-s3">回款中的借款</a>
        </div>
        <div class="account-form cl">
            <input type="text" class="date icon icon-date" id="invest-startDate" readonly="readonly">
            <p class="text">至</p>
            <input type="text" class="date icon icon-date" id="invest-endDate" readonly="readonly">
            <input type="hidden" id="state">
            <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
            <button type="button" class="search" id="investSearch">搜索</button>
        </div>
        <div class="invest-listData invest-listData1">
            <ul class="investData list-box">
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">年利率</div>
                    <div class="children3">期限(个月)</div>
                    <div class="children4">还款方式</div>
                    <div class="children5">投资金额</div>
                    <div class="children6">投资时间</div>
                </li>
            </ul>
            <ul class="investData listData"></ul>
            <ul class="paging"></ul>
        </div>
        <div class="invest-listData invest-listData3">
            <ul class="investData list-box">
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">年利率</div>
                    <div class="children3">期限(个月)</div>
                    <div class="children4">投资金额</div>
                    <div class="children5">已收金额</div>
                    <div class="children6">还款时间</div>
                </li>
            </ul>
            <ul class="investData listData">
            </ul>
            <ul class="paging">
            </ul>
        </div>
    </div>
    <div class="account-content" id="payment" style="display: none;">
        <div class="invest-detail-list-top">
            <div class="invest-detail-list-row">
                <div class="row row1">
                    <p>待收本息情况：</p>
                </div>
                <div class="row row2">
                    <p class="row-top"><span id="allForPIOneMonth">0</span>元</p>
                    <p class="row-bottom">未来一个月</p>
                </div>
                <div class="row row3">
                    <p class="row-top"><span id="allForPIThreeMonth">0</span>元</p>
                    <p class="row-bottom">未来三个月</p>
                </div>
                <div class="row row4">
                    <p class="row-top"><span id="allForPIYear">0</span>元</p>
                    <p class="row-bottom">未来一年</p>
                </div>
                <div class="row row5">
                    <p class="row-top"><span id="allForPI">0</span>元</p>
                    <p class="row-bottom">全部</p>
                </div>
            </div>
        </div>
        <div class="account-form cl">
            <input type="text" class="date icon icon-date" id="payment-startDate" readonly="readonly">
            <p class="text">至</p>
            <input type="text" class="date icon icon-date" id="payment-endDate" readonly="readonly">
            <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
            <button type="button" class="search" id="invest-detailSearch">搜索</button>
        </div>
        <div class="invest-detailTable">
            <ul class="list-box">
                <li class="title">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">年利率</div>
                    <div class="children3">期限(个月)</div>
                    <div class="children4">投资金额</div>
                    <div class="children5">已收金额</div>
                    <div class="children6">发布时间</div>
                </li>
            </ul>
            <ul class="detailData listData"></ul>
            <ul class="paging detailPaging"></ul>
        </div>
    </div>


</div>


</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/tzb.js"></script>

<script>

</script>
</html>
