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
            <a href="javascript:void(0);" class="active" id="loanLink">借款管理</a>
        </div>
        <em class="em-line"></em>
    </div>
    <div class="account-content" id="loan">
        <div class="sub-nav">
            <a href="javascript:;" class="active" id="loan-s">审核中</a>
            <a href="javascript:;" class="" id="loan-l">申请失败</a>
            <a href="javascript:;" id="loan-z" class="">招标中</a>
            <a href="javascript:;" id="loan-c" class="">成功</a>
        </div>
        <div class="account-form account-form-manage cl" style="display: block;">
            <lable class="lable-long">发布时间：</lable>
            <input type="text" class="date icon icon-date" id="startDate" readonly="readonly">
            <p class="text">至</p>
            <input type="text" class="date icon icon-date" id="endDate" readonly="readonly">
            <input type="hidden" id="state" readonly="readonly">
            <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
            <button type="button" class="search" id="loanSearch">搜索</button>
        </div>

        <div class="loan-listData loan-listData1" style="display: block;">
            <ul class="loanData list-box">
                <li class="title title1">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">还款方式</div>
                    <div class="children3">金额（元）</div>
                    <div class="children4">年利率</div>
                    <div class="children5">期限（月）</div>
                    <div class="children6">申请时间</div>
                    <div class="children7">状态</div>
                </li>
            </ul>
            <ul class="loanData listData"></ul>
            <ul class="paging"></ul>
        </div>

        <div class="loan-listData loan-listData2" style="display: none;">
            <ul class="loanData list-box">
                <li class="title title1">
                    <div class="children0">标题</div>
                    <div class="children1">类型</div>
                    <div class="children2">审核理由</div>
                    <div class="children3">还款方式</div>
                    <div class="children4">金额（元）</div>
                    <div class="children5">年利率</div>
                    <div class="children6">申请时间</div>
                    <div class="children7">状态</div>
                </li>
            </ul>
            <ul class="loanData listData"></ul>
            <ul class="paging"></ul>
        </div>

    </div>

</div>
<!-- end -->


</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/publlic.js"></script>


<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/my_jkb.js"></script>
<script>

    $(function(){
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();
        var state = $("#state").val();
        $('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
        $('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
            //初始化数据查询
            initIpayData();

        $("#loan-s").bind("click",function(){
            state = 1;
            $(".sub-nav a").removeClass("active");
            $(this).addClass("active");
            initIpayData(startDate,endDate,state);
            $(".loan-listData1").show();
            $(".loan-listData2").hide();
        });
        $("#loan-z").bind("click",function(){
            state = 3;
            $(".sub-nav a").removeClass("active");
            $(this).addClass("active");
            initIpayData(startDate,endDate,state);
            $(".loan-listData1").show();
            $(".loan-listData2").hide();
        });
        $("#loan-c").bind("click",function(){
            state = 4;
            $(".sub-nav a").removeClass("active");
            $(this).addClass("active");
            initIpayData(startDate,endDate,state);
            $(".loan-listData1").show();
            $(".loan-listData2").hide();
        });
        $("#loan-l").bind("click",function(){
            state = 2;
            $(".sub-nav a").removeClass("active");
            $(this).addClass("active");
            initIpayData2(startDate,endDate,state);
            $(".loan-listData2").show();
            $(".loan-listData1").hide();
        });
    });
</script>
</html>
