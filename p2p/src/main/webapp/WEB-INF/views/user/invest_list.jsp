<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0046)https://www.pujinziben.com/investlist.html#006 -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>我要投资-普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <meta name="keywords" content="投资理财产品，小额投资理财，投资理财公司，个人理财、供应链金融产品，三方存管">
    <meta name="description" content="普金资本是目前国内知名的拥有国资背景的资理财公司，为投资理财用户提供多样的投资理财产品。投资额度小，短期投资周转快，高收益的安全理财尽在普金资本。">
    <link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/public.css">
    <link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/index.css">
    <link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg"
          type="image/x-icon">
</head>

<body onhashchange="hashChange()" rlt="1" style="">

<%@include file="../master/top.jsp" %>
<%@include file="../master/head.jsp" %>

<!-- invest list -->
<div class="invest-list">
    <div class="wrap">
        <div class="invest-top">
            <div class="invest-top-left">
                <div class="invest-top-list">
                    <p>项目期限：</p>
                    <ul class="cl">
                        <li class="active"><a href="<%=path %>#0">全部</a></li>
                        <li><a href="<%=path %>#1">1-3个月</a></li>
                        <li><a href="<%=path %>#2">3-6个月</a></li>
                        <li><a href="<%=path %>#3">6-9个月</a></li>
                        <li><a href="<%=path %>#4">大于9个月</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>年化收益：</p>
                    <ul>
                        <li class="active"><a href="<%=path %>#00">全部</a></li>
                        <li><a href="<%=path %>#01">&lt;=10%</a></li>
                        <li><a href="<%=path %>#02">10%-15%</a></li>
                        <li><a href="<%=path %>#03">15%-25%</a></li>
                    </ul>
                </div>
                <div class="invest-top-list">
                    <p>项目类型：</p>
                    <ul>
                        <li class="active"><a href="<%=path %>#000">全部</a></li>
                        <li><a href="<%=path %>#003">多金宝</a></li>
                        <li><a href="<%=path %>#004">普金保</a></li>
                        <li><a href="<%=path %>#005">恒金保</a></li>
                        <li><a href="<%=path %>#006">新手标</a></li>
                        <li><a href="https://www.pujinziben.com/creditorlist.html">债权转让</a></li>
                    </ul>
                </div>
            </div>
            <div class="invest-top-right">
                <div class="invest-top-list">
                    <div class="textmiddle">借款标题</div>
                    <input type="text" class="text" id="claimm-can-title">
                    <button type="button" class="search" id="claimm-can-Search">搜索</button>
                </div>
            </div>
        </div>
        <div class="invest-list-bottom">
            <ul class="invest-row listData">

            </ul>
            <ul class="paging cl" style="width: 260px; margin: 30px auto 0px;">
            </ul>
        </div>
</div>
</div>
<%@include file="../master/foot.jsp" %>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/invest_list.js"></script>


</body>
</html>