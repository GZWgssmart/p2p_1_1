<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path %>/static/p2p/public.css">
    <link rel="stylesheet" href="<%=path %>/static/p2p/index.css">
    <link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon">
    <link rel="stylesheet" href="<%=path%>/static/css/index.css"/>
</head>


<body>
<!--[if lt IE 8]>
<div class="show-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
<![endif]-->
<!-- top -->
<div class="top" id="top">
    <!-- top -->
    <div class="wrap">
        <div class="top-left icon icon-phone">
            <span>客服热线：</span>400-606-2079 <span>（8:30～17:30）</span>
        </div>
        <div class="top-right cl">
            <ul class="top-list">
                <li class="first"><a href="javascript:;" class="">退出</a></li>
                <li><a href="https://www.pujinziben.com/account.html#tuijian" class="icon icon-inv">邀请有礼</a></li>
                <li><a href="https://www.pujinziben.com/about.html#gdbj">关于我们</a></li>
                <li><a href="https://www.pujinziben.com/help.html">帮助中心</a></li>
                <li><a href="https://www.pujinziben.com/account.html#ipay" class="pay">充值</a></li>
                <li id="userName"><a href="https://www.pujinziben.com/account.html" class="user">18174099445</a></li>
                <li class="no"><a href="javascript:;" class="icon icon-app" id="app">APP下载</a></li>
            </ul>
            <div id="qrCodeDiv" style="display: none;">
                <div class="CodeDiv">
                    <img src="<%=path %>/static/p2p/qrCode_ios.png">
                    <p>IOS下载</p>
                </div>
                <div class="CodeDiv">
                    <img src="<%=path %>/static/p2p/qrCode_android.png">
                    <p>Android下载</p>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- nav -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><img src="<%=path %>/static/p2p/logo.png" alt="普金资本"></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="https://www.pujinziben.com/account.html">我的账户</a></li>
                <li><a href="https://www.pujinziben.com/about.html">信息披露 </a></li>
                <li><a href="https://www.pujinziben.com/safety.html">安全保障</a></li>
                <li class="xialakuang">
                    <a href="https://www.pujinziben.com/investlist.html">投资理财</a>
                    <div class="sub-nav">
                        <a href="https://www.pujinziben.com/investlist.html#006">恒金保</a>
                        <a href="https://www.pujinziben.com/investlist.html#004">普金保</a>
                        <a href="https://www.pujinziben.com/investlist.html#003">多金宝</a>
                        <a href="https://www.pujinziben.com/investlist.html#005">新手标</a>
                        <a href="https://www.pujinziben.com/creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="https://www.pujinziben.com/">首页</a></li>
            </ul>
        </div>
    </div>
</div>
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
                <li>
                    <span>平台公告&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    <a href="https://www.pujinziben.com/news.html?id=186&amp;flag=1" target="_blank">关于多金宝项目正常还款的公告 </a>
                </li>
                <li>
                    <span>平台公告&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    <a href="https://www.pujinziben.com/news.html?id=185&amp;flag=1" target="_blank">关于多金宝项目正常还款的公告</a>
                </li>
                <li>
                    <span>新标预告&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    <a href="https://www.pujinziben.com/news.html?id=184&amp;flag=1" target="_blank">2017年12月4日新标预告</a>
                </li>
                <li>
                    <span>新标预告&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                    <a href="https://www.pujinziben.com/news.html?id=183&amp;flag=1" target="_blank">2017年12月2日新标预告</a>
                </li>
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
            <p class="more icon icon-more"><a href="https://www.pujinziben.com/about.html#ptgg">更多</a></p>
        </div>
        <div class="news-main-content">
            <ul class="news-main-list" id="newsContent">
                <li><a href="https://www.pujinziben.com/news.html?id=186&amp;flag=1" target="_blank">关于多金宝项目正常还款的公告 </a><span>2017-12-18</span></li>
                <li><a href="https://www.pujinziben.com/news.html?id=185&amp;flag=1" target="_blank">关于多金宝项目正常还款的公告</a><span>2017-12-08</span></li>
                <li><a href="https://www.pujinziben.com/news.html?id=184&amp;flag=1" target="_blank">2017年12月4日新标预告</a><span>2017-12-04</span></li>
                <li><a href="https://www.pujinziben.com/news.html?id=183&amp;flag=1" target="_blank">2017年12月2日新标预告</a><span>2017-12-01</span></li></ul>
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
                    <li><a target="view_frame" href="http://www.gzctgroup.cn/" title="赣州城投集团"><img src="<%=path %>/static/p2p/201612290824108901.jpg" alt="赣州城投集团"></a></li>
                    <li><a target="view_frame" href="http://www.heimadc.com/" title="黑马地产"><img src="<%=path %>/static/p2p/201612290824295248.jpg" alt="黑马地产"></a></li>
                    <li><a target="view_frame" href="http://www.chinapnr.com/" title="汇付天下"><img src="<%=path %>/static/p2p/201612290824515414.jpg" alt="汇付天下"></a></li>
                    <li><a target="view_frame" href="https://www.fadada.com/" title="法大大"><img src="<%=path %>/static/p2p/201612290825022265.jpg" alt="法大大"></a></li>
                    <li><a target="view_frame" href="http://www.evergrande.com/" title="恒大集团"><img src="<%=path %>/static/p2p/201612290825216736.jpg" alt="恒大集团"></a></li>
                    <li><a target="view_frame" href="http://www.erongtu.com/" title="融途网"><img src="<%=path %>/static/p2p/201612290825402257.jpg" alt="融途网"></a></li>
                    <li><a target="view_frame" href="http://www.jxifa.org.cn/" title="江西省互联网金融协会"><img src="<%=path %>/static/p2p/201704121159104962.png" alt="江西省互联网金融协会"></a></li>
                    <li><a target="view_frame" href="http://www.cgfae.cn/" title="江西赣南金融资产交易中心"><img src="<%=path %>/static/p2p/201704141712019679.png" alt="江西赣南金融资产交易中心"></a></li>
                    <li><a target="view_frame" href="http://www.chinacsfl.cn/" title="中国供应链金融服务联盟"><img src="<%=path %>/static/p2p/201704141714413995.png" alt="中国供应链金融服务联盟"></a></li>
                    <li><a target="view_frame" href="http://www.wdzj.com/" title="网贷之家"><img src="<%=path %>/static/p2p/201704141714599412.png" alt="网贷之家"></a></li>
                </ul>
                <ul class="cl" id="linkList2" style="width: 2920px;">
                    <li><a target="view_frame" href="http://www.gzctgroup.cn/" title="赣州城投集团"><img src="<%=path %>/static/p2p/201612290824108901.jpg" alt="赣州城投集团"></a></li>
                    <li><a target="view_frame" href="http://www.heimadc.com/" title="黑马地产"><img src="<%=path %>/static/p2p/201612290824295248.jpg" alt="黑马地产"></a></li>
                    <li><a target="view_frame" href="http://www.chinapnr.com/" title="汇付天下"><img src="<%=path %>/static/p2p/201612290824515414.jpg" alt="汇付天下"></a></li>
                    <li><a target="view_frame" href="https://www.fadada.com/" title="法大大"><img src="<%=path %>/static/p2p/201612290825022265.jpg" alt="法大大"></a></li>
                    <li><a target="view_frame" href="http://www.evergrande.com/" title="恒大集团"><img src="<%=path %>/static/p2p/201612290825216736.jpg" alt="恒大集团"></a></li>
                    <li><a target="view_frame" href="http://www.erongtu.com/" title="融途网"><img src="<%=path %>/static/p2p/201612290825402257.jpg" alt="融途网"></a></li>
                    <li><a target="view_frame" href="http://www.jxifa.org.cn/" title="江西省互联网金融协会"><img src="<%=path %>/static/p2p/201704121159104962.png" alt="江西省互联网金融协会"></a></li>
                    <li><a target="view_frame" href="http://www.cgfae.cn/" title="江西赣南金融资产交易中心"><img src="<%=path %>/static/p2p/201704141712019679.png" alt="江西赣南金融资产交易中心"></a></li>
                    <li><a target="view_frame" href="http://www.chinacsfl.cn/" title="中国供应链金融服务联盟"><img src="<%=path %>/static/p2p/201704141714413995.png" alt="中国供应链金融服务联盟"></a></li>
                    <li><a target="view_frame" href="http://www.wdzj.com/" title="网贷之家"><img src="<%=path %>/static/p2p/201704141714599412.png" alt="网贷之家"></a></li></ul>
            </div>
        </div>
    </div>
</div>
<div id="ajaxFooter">


    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="tencent://message/?uin=3036302675&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
            <li><a href="javascript:;" class="sidebar-wx"></a></li>
            <li><a href="https://www.pujinziben.com/calculator.html" class="sidebar-cl"></a></li>
            <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
            <li><a href="#top" class="sidebar-top"></a></li>
        </ul>
    </div>
    <!-- concat -->
    <div class="index-concat">
        <div class="wrap cl">
            <div class="index-concat-left">
                <img src="<%=path %>/static/p2p/index_erweima.png" alt="扫码关注普金资本">
            </div>
            <div class="index-concat-phone">
                <p>财富热线</p>
                <h3>400-606-2079</h3>
            </div>
            <div class="index-concat-channel">
                <p class="about_cel_text">
                    <a target="_blank" href="http://weibo.com/pujinziben" class="about_wb"></a>
                    <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                    </a>
                    <a target="_blank" href="tencent://message/?uin=2311960484&amp;Site=&amp;Menu=yes" class="about_qq"></a>
                    <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                    </a>
                </p>
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl">
                <a href="javascript:;" class="title">友情链接</a>
                <a target="_blank" href="http://www.p2peye.com/">网贷天眼</a>
                <a target="_blank" href="http://www.wdtianxia.com/">网贷天下</a>
                <a target="_blank" href="http://bank.pingan.com/">中国平安银行</a>
                <a target="_blank" href="http://www.ccb.com/cn/home/indexv3.html">中国建设银行</a>
                <a target="_blank" href="http://www.wangdaidongfang.com/">网贷东方</a>
                <a target="_blank" href="http://www.p2p001.com/">第一网贷</a>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank" class="beian">赣ICP备16004010号</a>
                <a href="http://new.cnzz.com/v1/login.php?siteid=1260871948" target="_blank">  <img src="<%=path %>/static/p2p/CNZZ.png" alt=""></a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=36070202000195" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian"><img src="<%=path %>/static/p2p/beian.png" style="float:left;">赣公网安备 36070202000195号</a>
            </p>
            <div class="footer-list" style="width:650px;text-align:center">
                <a id="___szfw_logo___" href="https://credit.szfw.org/CX05252017016185201512.html" target="_blank">
                    <img src="<%=path %>/static/p2p/foot2.png" border="0">
                </a>
                <a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com" target="_blank">
                    <img src="<%=path %>/static/p2p/ft_link_02.png" alt="">
                </a>
                <a href="http://si.trustutn.org/info?sn=685170725000594426611&amp;certType=4" target="_blank">
                    <img width="110px" height="40px" src="<%=path %>/static/p2p/p2p_bottom_large_img.jpg" alt="">
                </a>
                <a href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business" target="_blank">
                    <img src="<%=path %>/static/p2p/ft_link_04.png" alt="">
                </a>
                <a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343">
                    <img width="112px" height="34px" src="<%=path %>/static/p2p/foot1.png">
                </a>
            </div>
        </div>
    </div>
    <div class="popup wechart-box">
        <p class="title left">关注普金资本微信公众号</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <img class="wechart" src="<%=path %>/static/p2p/wechart.jpg">
        </div>
    </div>
</div>


</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function(){
        $(".xialakuang").mouseover(function (){
            $(".sub-nav").show();
        }).mouseout(function (){
            $(".sub-nav").hide();
        });
        $(".no").mouseover(function (){
            $("#qrCodeDiv").show();
        }).mouseout(function (){
            $("#qrCodeDiv").hide();
        });
        $("#qrCodeDiv").mouseover(function (){
            $("#qrCodeDiv").show();
        }).mouseout(function (){
            $("#qrCodeDiv").hide();
        });
    });
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