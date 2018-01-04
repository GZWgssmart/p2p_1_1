<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
                <li><a href="about.html#gdbj">关于我们</a></li>
                <li><a href="help.html">帮助中心</a></li>
                <li><a href="https://www.pujinziben.com/account.html#ipay" class="pay">充值</a></li>
                <li><a href="account.html" class="user">${user.uname}</a></li>
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
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    $(function(){

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
    })
</script>
</body>
</html>
