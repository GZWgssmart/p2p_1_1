<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.gs.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path %>/static/p2p/public.css">
    <link rel="stylesheet" href="<%=path %>/static/p2p/index.css">
    <link rel="icon" href="<%=path %>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon">
    <link rel="stylesheet" href="<%=path%>/static/css/index.css"/>
</head>


<body>
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
<![endif]-->
<!-- top -->
<%@include file="./master/top.jsp" %>

<!-- nav -->
<%@include file="./master/head.jsp" %>
<!-- banner -->
<div class="ppt">
    <div class=".benn">
        <a href="https://www.pujinziben.com/activity/lucky.html" target="_blank" class="nivo-imageLink" style="display: none;">
            <img src="<%=path %>/static/p2p/20171214165234484.jpg">
        </a>
        <a href="https://www.pujinziben.com/activity/activity_09.html" target="_blank" class="nivo-imageLink" style="display: none;">
            <img src="<%=path %>/static/p2p/20171214165137984.jpg">
        </a>
        <a href="https://www.pujinziben.com/news.html?id=102" target="_blank" class="nivo-imageLink" style="display: none;">
            <img src="<%=path %>/static/p2p/20171018160753035.jpg">
        </a>
        <a href="https://www.pujinziben.com/account.html" target="_blank" class="nivo-imageLink" style="display: none;">
            <img src="<%=path %>/static/p2p/201707101417398884.jpg">
        </a>
        <a href="https://www.pujinziben.com/news.html?id=87" target="_blank" class="nivo-imageLink" style="display: block;">
            <img src="<%=path %>/static/p2p/201704281355082037.jpg">
        </a>

    </div>
    <div class="pptNum">
        <span class="normal">5</span>
        <span class="normal">4</span>
        <span class="normal">3</span>
        <span class="normal">2</span>
        <span class="cur normal">1</span>
    </div>

</div>
<!-- news -->
<div class="news">
    <div class="wrap">
        <div class="news-list icon icon-news">
            <ul id="news-list" style="height: 192px; top: -96px;">

            </ul>
        </div>
        <div class="bang-list">
            <a href="https://www.pujinziben.com/board.html" target="_blank" class="icon icon-bang">投资、推荐排行榜</a>
        </div>
    </div>
</div>
<!-- statis -->
<div class="statis">
    <div class="wrap">
        <div class="statis-main">
            <ul class="statis-top cl">
                <li class="first"><p>普金资本高收益网络借贷信息中介平台</p></li>
                <li class="center"><p>累计投资金额：<span id="investAmount">30,761,918.00</span><span class="small">元</span></p></li>
                <!--<li class="center"><p>累计赚取收益：<span id="hasInterest">0</span><span class="small">元</span></p></li>-->
                <li class="last"><p>累计注册投资人：<span id="userTotal">11,170</span><span class="small">人</span></p></li>
            </ul>
            <div class="explian cl">
                <a href="https://www.pujinziben.com/about.html" class="first">
                    <p class="icon icon-ex1"></p>
                    <div class="text">
                        <h3>实力雄厚</h3>
                        <p>国资背景，抱柱之信</p>
                        <p>赣州城投旗下参股企业</p>
                    </div>
                </a>
                <a href="https://www.pujinziben.com/safety.html" class="center">
                    <p class="icon icon-ex2"></p>
                    <div class="text">
                        <h3>安全稳健</h3>
                        <p>专注城投供应链金融服务</p>
                        <p>银行级风控措施+大数据</p>
                    </div>
                </a>
                <!-- 					<a href="activity/activity_01.html" class="last" target="_blank"> -->
                <a href="https://www.pujinziben.com/#" class="last">
                    <p class="icon icon-ex3"></p>
                    <div class="text">
                        <h3>新手福利</h3>
                        <p>新用户投资即获红包</p>
                        <p>推荐用户投资得红包</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- product -->
<div class="product wrap">
    <div class="product-n" id="newUser">


        <div class="product-new">
            <div class="title cl"><img alt="" src="<%=path %>/static/p2p/product-new-icon2.png"></div>
            <ul class="product-new-main cl">
                <li class="rate cl">
                    <p><span id="ty-rate">12</span>%</p>
                    <span>预期年化收益率</span>
                </li>
                <li class="date">
                    <div class="date-item">
                        <div class="line icon icon-progress">
                            <p>募集进度：</p>
                            <p class="progress"><em style="width: 100%;"></em></p>
                            <p class="progress-text"><span id="xs-schedules">100.00</span>%</p>
                        </div>
                        <p class="icon icon-doll">项目金额：<span id="xs-doll">10.00万元</span></p>
                        <p class="icon icon-time">投资期限：<span id="ty-date">1个月</span></p>
                    </div>
                </li>
                <li>
                    <div class="button">
                        <button type="button" id="ty-btn" disabled="disabled" style="background-color: rgb(176, 176, 176);">还款中</button>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 恒金保 -->
    <div class="product-h" id="pj_hengjin">
        <div class="product-h-l">
            <img src="<%=path %>/static/p2p/product_01.png" alt="恒金保">
            <a href="https://www.pujinziben.com/product.html#hengjinb" class="top"></a>
            <a href="https://www.pujinziben.com/investlist.html#006" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-h">
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="https://www.pujinziben.com/invest.html?id=391">YC2017TD0009</a>
                            </p>
                            <p class="p-rate"><span>9+1</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress"><em style="width:100.00%"></em></p>
                                <p class="progress-text">100.00%</p>
                            </div>
                            <p class="icon icon-doll">项目金额：20.87万元</p>
                            <p class="icon icon-time">投资期限：6个月</p>
                        </div>
                        <div class="submit"><button type="button" class="submit disabled" onclick="toInvest(391,4)">还款中</button></div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=386">YC2017TD0008</a></p>
                            <p class="p-rate"><span>9</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress"><em style="width:100.00%"></em></p>
                                <p class="progress-text">100.00%</p>
                            </div>
                            <p class="icon icon-doll">项目金额：27.40万元</p>
                            <p class="icon icon-time">投资期限：6个月</p>
                        </div>
                        <div class="submit"><button type="button" class="submit disabled" onclick="toInvest(386,4)">还款中</button></div>
                </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top">
                            <p class="product-title">
                                <a href="https://www.pujinziben.com/invest.html?id=366">YC2017TD0007</a>
                            </p>
                            <p class="p-rate"><span>9</span><span class="small">%</span></p>
                            <span class="p-rate-text">预期年化收益率</span>
                        </div>
                        <div class="bottom">
                            <div class="line icon icon-progress">
                                <p>募集进度：</p>
                                <p class="progress"><em style="width:100.00%"></em></p>
                                <p class="progress-text">100.00%</p>
                            </div>
                            <p class="icon icon-doll">项目金额：14.00万元</p>
                            <p class="icon icon-time">投资期限：6个月</p>
                        </div>
                        <div class="submit"><button type="button" class="submit disabled" onclick="toInvest(366,4)">还款中</button></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 普金保 -->
    <div class="product-h" id="pj_pujin">
        <div class="product-h-l">
            <img src="<%=path %>/static/p2p/product_02.png" alt="多金保">
            <a href="https://www.pujinziben.com/product.html#pujinb" class="top"></a>
            <a href="https://www.pujinziben.com/investlist.html#004" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-p">
                <li>
                    <div class="product-content">
                        <div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=383">PJ2017BZ0030(2)</a></p><p class="p-rate"><span>10</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div>
                        <div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：50.00万元</p><p class="icon icon-time">投资期限：3个月</p></div>
                        <div class="submit"><button type="button" class="submit disabled" onclick="toInvest(383,4)">还款中</button></div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=382">PJ2017BZ0030(1)</a></p><p class="p-rate"><span>10</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div>
                        <div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：50.00万元</p><p class="icon icon-time">投资期限：3个月</p></div>
                        <div class="submit"><button type="button" class="submit disabled" onclick="toInvest(382,4)">还款中</button></div></div></li>
                <li>
                    <div class="product-content">
                        <div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=327">PJ2016BZ0006</a></p><p class="p-rate"><span>10</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div>
                        <div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：20.00万元</p><p class="icon icon-time">投资期限：3个月</p></div>
                        <div class="submit"><button type="button" class="submit disabled" onclick="toInvest(327,5)">已还完</button></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- 多金宝 -->
    <div class="product-h" id="pj_duojin">
        <div class="product-h-l">
            <img src="<%=path %>/static/p2p/product_03.png" alt="多金宝">
            <a href="https://www.pujinziben.com/product.html#duojinb" class="top"></a>
            <a href="https://www.pujinziben.com/investlist.html#003" class="bottom"></a>
        </div>
        <div class="product-h-m">
            <ul class="product-list" id="product-d">

                <li>
                    <div class="product-content">
                        <div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=406">PJ2017BZ0044</a></p><p class="p-rate"><span>8+2</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div>
                        <div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:80.77%"></em></p><p class="progress-text">80.77%</p></div><p class="icon icon-doll">项目金额：100.00万元</p><p class="icon icon-time">投资期限：2个月</p></div>
                        <div class="submit"><button type="button" class="submit" onclick="toInvest(406,2)">立即投标</button></div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=405">PJ2017BZ0045</a></p><p class="p-rate"><span>8+2</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div>
                        <div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：20.00万元</p><p class="icon icon-time">投资期限：2个月</p></div>
                        <div class="submit"><button type="button" class="submit disabled" onclick="toInvest(405,4)">还款中</button></div>
                    </div>
                </li>
                <li>
                    <div class="product-content">
                        <div class="top"><p class="product-title"><a href="https://www.pujinziben.com/invest.html?id=403">PJ2017BZ0043</a></p><p class="p-rate"><span>9+1</span><span class="small">%</span></p><span class="p-rate-text">预期年化收益率</span></div>
                        <div class="bottom"><div class="line icon icon-progress"><p>募集进度：</p><p class="progress"><em style="width:100.00%"></em></p><p class="progress-text">100.00%</p></div><p class="icon icon-doll">项目金额：50.00万元</p><p class="icon icon-time">投资期限：3个月</p></div>
                        <div class="submit"><button type="button" class="submit disabled" onclick="toInvest(403,4)">还款中</button></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!--债权转让 -->

</div>
<!-- news -->
<div class="news-main wrap">
    <div class="news-main-left" style="display: block;">
        <div class="news-main-top">
            <h3>媒体报道</h3>
            <p class="more icon icon-more"><a href="https://www.pujinziben.com/about.html#gsdt?type=1">更多</a></p>
        </div>
        <div class="news-main-content" id="dynamic">
            <ul class="news-main-list">
                <li>
                    <a href="https://www.pujinziben.com/news.html?id=106" target="_blank" class="news-main-content-left"><img src="<%=path %>/static/p2p/20171121164504311.jpg" alt="年底投资有风险 选择普金资本安全可靠！" width="210" height="140"></a>
                    <a href="https://www.pujinziben.com/news.html?id=106" target="_blank" class="list-title">年底投资有风险 选择普金资本安全可靠！</a>
                    <a href="https://www.pujinziben.com/news.html?id=106" target="_blank" class="list-main">随着近年来中国经济的快速发展，社会财富不断增长，个人金融资产也不断增加，理财的必要性也逐渐体现出来了。同时，年关将至，...</a>
                </li>
                <li>
                    <a href="https://www.pujinziben.com/news.html?id=105" target="_blank" class="news-main-content-left"><img src="<%=path %>/static/p2p/20171118092607167.jpg" alt="这个双十一，你准备好了没有？" width="210" height="140"></a>
                    <a href="https://www.pujinziben.com/news.html?id=105" target="_blank" class="list-title">这个双十一，你准备好了没有？</a><a href="https://www.pujinziben.com/news.html?id=105" target="_blank" class="list-main">
                    随着双十一的临近，国内的金融投资市场也呈现出一派繁荣景象。不过，时值年底，对于普通的投资者来说，如果没有选择...</a>
                </li>
                <li>
                    <a href="https://www.pujinziben.com/news.html?id=102" target="_blank" class="news-main-content-left"><img src="<%=path %>/static/p2p/20171017161015190.jpg" alt="【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！" width="210" height="140"></a>
                    <a href="https://www.pujinziben.com/news.html?id=102" target="_blank" class="list-title">【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！</a>
                    <a href="https://www.pujinziben.com/news.html?id=102" target="_blank" class="list-main">
                        2017年10月13日，江西省互联网金融协会第二届第一次会员代表大会在南昌前湖迎宾馆隆重召开。本次会议，通过了第一届理...</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="news-main-right" style="display: block;">
        <div class="news-main-top">
            <h3>最新公告</h3>
            <p class="more icon icon-more"><a href="/html/about#ptgg">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="newsContent">
                </ul>
        </div>
        <div class="news-main-top ptop">
            <h3>公司动态</h3>
            <p class="more icon icon-more"><a href="https://www.pujinziben.com/about.html#gsdt">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="news-part">
                <li><a href="https://www.pujinziben.com/news.html?id=103" target="_blank">【普金资本】校企联手 探寻合作新契机！</a><span>2017-10-19</span></li>
                <li><a href="https://www.pujinziben.com/news.html?id=101" target="_blank">【喜报】庆贺普金资本成功当选江西省第二届互联网金融协会副会长单位！</a><span>2017-10-16</span></li>
                <li><a href="https://www.pujinziben.com/news.html?id=98" target="_blank">普金资本与汇付天下、益金所洽谈战略合作</a><span>2017-07-28</span></li>
                <li><a href="https://www.pujinziben.com/news.html?id=96" target="_blank">热烈祝贺普金资本荣膺普惠金融协会常务副会长单位</a><span>2017-07-18</span></li></ul>
        </div>
    </div>
</div>
<div class="index-link">
    <div class="wrap">
        <div class="link-title">
            合作伙伴
        </div>
        <div class="link-list">
            <div class="link-list-box" style="width: 5840px;">
                <ul class="cl" id="linkList" style="width: 2920px;">
                </ul>
                <ul class="cl" id="linkList2" style="width: 2920px;">
                </ul>
            </div>
        </div>
    </div>
</div>

<%@include file="master/foot.jsp" %>

</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/index.js"></script>
<script type="text/javascript" src="<%=path%>/static/resources/front/v01/scripts/about.js"></script>

<script>

    (function ($) {
        $.fn.extend({
            "ppting": function (t) {
                var num = 5; //共多少张要轮播的
                var $this = $(this), i = 0, $pics = $('.ppt'), autoChange = function () {
                    var $currentPic = $pics.find('a:eq(' + (i + 1 === num ? 0 : i + 1) + ')');
                    $currentPic.css({
                        display: 'block'
                    }).siblings('a').css({
                        display: 'none'
                    });
                    $pics.find('.pptNum>span:contains(' + (i + 2 > num ? num - i : i + 2) + ')').attr('class', 'cur normal').siblings('span').attr('class', 'normal');
                    i = i + 1 === num ? 0 : i + 1;
                }, st = setInterval(autoChange, t || 2000);
                $this.hover(function () {
                    clearInterval(st);
                }, function () { st = setInterval(autoChange, t || 2000) });
                $pics.find('.pptNum>span').click(function () {
                    i = parseInt($(this).text(), 10) - 2;
                    autoChange();
                });
            }
        });
    }(jQuery));
    $('.ppt').ppting(2000);
</script>
</html>