<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>申请借款-普金资本—安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>
</head>

<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body style="width: 100%;height: 1600px">

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
<!-- head -->
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
<!-- head end -->

<div class="regist-content"style="height: 100%">
    <div class="cash-pay" style="display: block;">
        <p class="tips-title">
            <b>温馨提示：</b>凡是在普金资本充值未投标的用户，15天以内提现收取本金0.5%的提现服务费，15天以后提现免服务费。禁止信用卡套现！<br>
            a）提现手续费由汇付收取，固定费用2元。<br>
            b）请输入您要提现的金额，我们将在1至3个工作日(国家节假日除外)之内将钱转入您网站上填写的银行账号。<br>
            c）每笔提现金额至少为100元以上。
        </p>
        <div class="pay-from">

            <div class="label cl">
                <label class="long">真实姓名：</label><p class="text" id="realName">${user.rname }</p>
                <span></span>
            </div>
            <div class="label cl">
                <label class="long">申请金额：</label><input type="text" id="money" placeholder="请输入申请金额">
                <span></span>
            </div>
            <div class="label cl">
                <label class="long">产品名称：</label><input type="text" id="cpname" placeholder="请输入产品名称">
                <span></span>
            </div>
            <div class="label cl label-msg">
                <label class="long">借款标种：</label>
                <select  id="bzid" style="width: 300px;height: 40px">
                    <option value="">请选择标种</option>
                    <c:forEach items="${bzList}" var="d">
                        <option value="${d.bzid}">${d.bzname}</option>
                    </c:forEach>
                </select>
                <span></span>
            </div>
            <div class="label cl label-msg">
                <label class="long">借款类型：</label>
                <select  id="type" style="width: 300px;height: 40px">
                    <option value="">请选择借款类型</option>
                    <c:forEach items="${jklxList}" var="d">
                        <option value="${d.lxid}">${d.lxname}</option>
                    </c:forEach>
                </select>
                <span></span>
            </div>
            <div class="label cl">
                <label class="long">借款期限：</label><input type="number" id="term" placeholder="请输入借款期限">
                <span></span>
            </div>
            <div class="label cl" style="display: none" id="addpshow">
                <label class="long"></label>
                <span id="addp"></span>
            </div>
            <div class="label cl">
                <label class="long">法人身份证：</label>
                <input type="file" id="upload" style="display:none" name="upload" onclick="addElementImg('addp')">
                <input type="text" placeholder="选择法人身份证图片" readonly="readonly" onclick="F_Open_dialog()">
            </div>
            <div class="label cl" style="display: none" id="addpshow1">
                <label class="long"></label>
                <span id="addp1"></span>
            </div>
            <div class="label cl">
                <label class="long">营业执照副本:</label>
                <input type="file" id="upload1" style="display:none" name="upload1" onclick="addElementImg1('addp1')">
                <input type="text" placeholder="选择营业执照副本" readonly="readonly" onclick="F_Open_dialog1()">
            </div>
            <div class="label cl" style="display: none" id="addpshow2">
                <label class="long"></label>
                <span id="addp2"></span>
            </div>
            <div class="label cl">
                <label class="long">企业银行账号:</label>
                <input type="file" id="upload2" style="display:none" name="upload2" onclick="addElementImg2('addp2')">
                <input type="text" placeholder="选择企业银行账号" readonly="readonly" onclick="F_Open_dialog2()">
            </div>
            <div class="label cl" style="display: none" id="addpshow3">
                <label class="long"></label>
                <span id="addp3"></span>
            </div>
            <div class="label cl">
                <label class="long">其他资料：</label>
                <input type="file" id="upload3" style="display:none" name="upload3" onclick="addElementImg3('addp3')">
                <input type="text" placeholder="选择其他资料" readonly="readonly" onclick="F_Open_dialog3()">
            </div>
            <div class="label cl">
                <label class="long">资金用途：</label><input type="text" id="mpurpose" placeholder="请输入资金用途">
            </div>
            <div class="label cl">
                <label class="long">还款来源：</label><input type="text" id="hksource" placeholder="请输入还款来源">
            </div>
            <div class="label cl">
                <label class="long">年化收益：</label><input type="number" id="nprofit" placeholder="请输入年化收益">
            </div>
            <div class="label cl label-msg">
                <label class="long">收益方式：</label>
                <select  id="way" style="width: 300px;height: 40px">
                    <option value="按月付息，到期还本">按月付息，到期还本</option>
                    <option value="等额本金">等额本金</option>
                    <option value="到期一次性还本付息">到期一次性还本付息</option>
                </select>
                <span></span>
            </div>
            <div class="label cl">
                <label class="long">借款人介绍：</label>
                <textarea id="suggest" placeholder="&nbsp;&nbsp;&nbsp;请输入借款人介绍" style="width: 570px;height: 50px;"></textarea>
            </div>
            <br/><br/>
            <div class="label cl">
                <label class="long">项目描述：</label>
                <textarea id="xmdescrip" placeholder="&nbsp;&nbsp;&nbsp;请输入项目描述" style="width: 570px;height: 50px;"></textarea>
            </div>
            <br/><br/>
            <div class="label cl">
                <label class="long">保障措施：</label>
                <textarea id="guarantee" placeholder="&nbsp;&nbsp;&nbsp;请输入保障措施" style="width: 570px;height: 50px;"></textarea>
            </div>
            <br/><br/><br/>
            <div class="label cl">
                <button type="button" class="btn long error" id="cash-submit" onclick="return bindingcode();">立即绑定</button>
            </div>
        </div>
        <div id="returnHtml"></div>
    </div>
</div>


<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jkb_add.js"></script>

</body>
</html>