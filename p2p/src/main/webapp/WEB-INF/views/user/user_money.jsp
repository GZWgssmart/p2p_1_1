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
<div class="account-right" style="width: 100%;height: 951px;">
        <!-- begin -->
            <div class="account-right-nav">
                <div class="sub-a-nav">
                    <a href="javascript:void(0);" class="all-a active">账户总览</a>
                    <a href="javascript:void(0);" class="slb-a">生利宝</a>
                </div>
                <em class="em-line" style="left:0px;"></em>
            </div>
            <div class="account-content" style="display: block;">

                <div class="all-view">
                    <div class="center-view">
                        <div class="center-header">
                            <img src="<%=path%>/static/upload/123.jpg" width="120" height="120">
                        </div>
                        <div class="center-self">
                            <p class="name">${user.phone}</p>
                            <p class="safety">安全等级： <span id="safeLevel">高</span></p>
                            <p class="center-icon">
                                <a href="#safe" class="icon icon-c-phone"></a>
                                <a href="#safe" class="icon icon-c-mail"></a>
                            </p>
                            <p id="registpay"><a href="javascript:;">登录汇付</a></p>
                            <p id="reset"></p>
                        </div>
                        <div class="center-user">
                            <p class="amt color"><span id="usableSum">${userMoney.kymoney}</span>元</p>
                            <p class="text"><i></i>可用余额</p>
                            <p class="link">
                                <a href="<%=path %>/logczz/page" class="active">充值</a>
                                <a href="<%=path %>/logtx/page">提现</a>
                            </p>
                        </div>
                        <div class="center-profit">
                            <p class="amt"><span id="earnSum">${userMoney.symoney}</span>元</p>
                            <p class="text">收益总额</p>
                            <p class="luckynum">
                                <i id="DetailsIcon"></i>
                                <a class="luckyLink" href="https://www.pujinziben.com/activity/lucky.html" target="_blank">抽奖次数<b id="luckynum">0</b>次</a>
                            </p>
                            <p class="icon icon-quan">代金券 <b id="voucher">0</b> 张，现金券 <b id="cashMap">0</b> 张</p>
                            <div class="luckyDetails" style="display: none;">
                                <h1>如何获得抽奖机会</h1>
                                <p>活动期间：单笔投资满1000元，可获得1次抽奖机会，单笔投资满2000元，可获得2次抽奖机会;以此类推(债权转让标除外)。</p>
                            </div>
                        </div>
                    </div>
                    <div class="center-main">
                        <div class="canvas">
                            <div class="center-total">
                                <p id="allTotal">${userMoney.zmoney}</p>
                                <p class="text">总资产</p>
                            </div>
                        </div>
                        <div class="center-data">
                            <p><i class="color color1"></i>投资总额：<span id="investSum">${userMoney.tzmoney}</span></p>

                            <p><i class="color color2"></i>冻结金额：<span id="freezeAmount">${userMoney.djmoney}</span></p>

                            <p><i class="color color3"></i>待收总额：<span id="forPaySum">${userMoney.dsmoney}</span></p>

                            <p><i class="color color4"></i>奖励金额：<span id="otherEarnAmount">${userMoney.jlmoney}</span></p>
                        </div>
                    </div>
                </div>
                <div id="huifuHtml"></div>
                <!-- 生利宝管理   -->
                <div class="slb-view" style="display: none;">
                    <div class="slb-all">
                        <div class="slb-left">
                            <p><span id="slbSum">0.00</span>元</p>
                            <h1>总金额</h1>
                            <a href="javascript:slbaoTrading();">转入/转出</a>
                        </div>
                        <ul class="slb-right">
                            <li>
                                <h2><span id="annuRate">0.000</span>%</h2>
                                <p>最近7日年化收益率</p>
                            </li>
                            <li>
                                <h2><span id="prdRate">0.000</span>%</h2>
                                <p>最新收益率</p>
                            </li>
                            <li>
                                <h2><span id="totalProfit">0.00</span>元</h2>
                                <p>生利宝历史累计收益</p>
                            </li>

                        </ul>
                    </div>
                    <div class="slb-govern">
                        <div class="sub-a-nav">
                            <a href="javascript:void(0);" class="active slb-to" id="to">转入</a>
                            <a href="javascript:void(0);" class="slb-go" id="go">转出</a>
                            <a href="javascript:void(0);" class="slb-sy" id="earn">收益</a>
                            <em class="em-list"></em>
                            <div class="account-form cl">
                                <input type="date" class="date icon icon-date" id="startDate">
                                <p class="text">至</p>
                                <input type="date" class="date icon icon-date" id="endDate">
                                <button type="button" class="search" id="slbSearch">搜索</button>
                            </div>
                        </div>
                        <div class="govern-list list-a">
                            <ul class="govern-list-box list-box">
                                <li class="title">
                                    <div class="children0">日期</div>
                                    <div class="children1">金额（元）</div>
                                    <div class="children2">生利宝余额（元）</div>
                                    <div class="children3">订单号</div>
                                    <div class="children4">信息</div>
                                </li>
                            </ul>
                            <ul class="govern-list-box listData">

                            </ul>
                            <ul class="paging" style="width:340px;margin:30px auto 0;">

                            </ul>
                        </div>

                    </div>
                </div>

            </div>
            <div class="popup regist-box">
                <p class="title left">注册汇付天下</p>
                <a href="javascript:void(0);" class="close icon icon-close"></a>
                <div class="popup-from">
                    <button type="button" class="btn" id="person-submit">个人用户注册</button>
                    <button type="button" class="btn" id="single-submit">企业用户注册</button>
                </div>
            </div>
        </div>
        <!-- end -->
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function(){
        $(".all-a").bind("click",function(){
            $(".slb-a").removeClass("active");
            $(this).addClass("active");
            $(".em-line").css("left",'0px');
            $(".slb-view").hide();
            $(".all-view").show();
        });

        $(".slb-a").bind("click",function(){
            $(".all-a").removeClass("active");
            $(this).addClass("active");
            $(".em-line").css("left",'120px');
            $(".all-view").hide();
            $(".slb-view").show();

        });

        $(".luckyLink").mouseover(function (){
            $(".luckyDetails").show();
        }).mouseout(function (){
            $(".luckyDetails").hide();
        });
    })
</script>
</html>
