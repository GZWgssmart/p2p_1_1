<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- nav -->
<div class="nav">
    <div class="wrap cl">
        <div class="logo"><img src="<%=path %>/static/p2p/logo.png" alt="普金资本"></div>
        <div class="nav-bar">
            <ul>
                <li class="icon icon-acc"><a href="account.html">我的账户</a></li>
                <li><a href="about.html">信息披露 </a></li>
                <li><a href="safety.html">安全保障</a></li>
                <li class="xialakuang">
                    <a href="<%=path %>/detail/page">投资理财</a>
                    <div class="sub-nav">
                        <a href="<%=path %>#005">恒金保</a>
                        <a href="<%=path %>#004">普金保</a>
                        <a href="<%=path %>#003">多金宝</a>
                        <a href="<%=path %>#006">新手标</a>
                        <a href="creditorlist.html">债权转让</a>
                        <p class="left"></p>
                        <p class="right"></p>
                    </div>
                </li>
                <li><a href="">首页</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".xialakuang").mouseover(function (){
            $(".sub-nav").show();
        }).mouseout(function (){
            $(".sub-nav").hide();
        });
    })
</script>
</html>
