<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<style>
	.asd{
		margin-bottom: 10px;
		text-align: left;
		font-size: 16px;
	}
</style>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>普金资本-后台管理</title>
	<%@include file="../master/easyui/header.jsp" %>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height: 60px;">
	<div id="logo"><img src="<%=path %>/static/images/logo.png" /></div>
	<div id="wel_msg">欢迎您：${huser.phone}&nbsp;&nbsp;
		<a href="<%=path %>/huser/down">安全退出</a>
	</div>
	<p class="clear"></p>
</div>

<div data-options="region:'sou\th',split:true" style="height: 50px;">Copyright&copy;WGS</div>
<div data-options="region:'west',split:true" title="主菜单" style="width: 250px;">
	<div class="easyui-accordion">
		<div title="用户管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/logtx/backtxsh"
					   class="site-navi-tab">个人基本信息管理</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/test/testca"
					   class="site-navi-tab">用户基本信息管理</a></li>
				<shiro:hasPermission name="recommend:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/recommend/page"
						   class="site-navi-tab">推荐人管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="option:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/option/page"
						   class="site-navi-tab">用户反馈</a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<div title="资金管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/userMoney/page"
					   class="site-navi-tab">用户资金管理</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/tzb/htzb"
					   class="site-navi-tab">用户投资管理</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/bank/huserpage"
					   class="site-navi-tab">银行卡管理</a></li>
				<shiro:hasPermission name="logczz:backcz">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/logczz/backcz"
						   class="site-navi-tab">充值记录</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="ticket:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/ticket/page"
						   class="site-navi-tab">优惠券管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="uticket:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/uticket/page"
						   class="site-navi-tab">用户领券管理</a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<div title="借贷管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<shiro:hasPermission name="borrowApply:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/borrowApply/page"
						   class="site-navi-tab">全部借款</a></li>
				</shiro:hasPermission>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/borrowApply/hhkb_list"
					   class="site-navi-tab">全部还款</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/hkb/hhkb_state"
					   class="site-navi-tab">逾期借款</a></li>
				<shiro:hasPermission name="sway:sway">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/sway/sway"
						   class="site-navi-tab">还款方式</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="bz:bz">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/bz/bz"
						   class="site-navi-tab">标种类型</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="jklx:jklx">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/jklx/jklx"
						   class="site-navi-tab">借款类型</a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<div title="宣传管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/dynamic/page"
					   class="site-navi-tab">公司动态</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/media/page"
					   class="site-navi-tab">媒体报道</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/home/page"
					   class="site-navi-tab">首页信息管理</a></li>
				<shiro:hasPermission name="dxModel:dxModel">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/dxModel/dxModel"
						   class="site-navi-tab">短信模板管理</a></li>
				</shiro:hasPermission>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/notice/page"
					   class="site-navi-tab">公告管理</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/friend/page"
					   class="site-navi-tab">合作伙伴</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>"
					   class="site-navi-tab">友情链接</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/letter/page"
					   class="site-navi-tab">站内信管理</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>"
					   class="site-navi-tab">轮播图管理</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>"
					   class="site-navi-tab">活动管理</a></li>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>"
					   class="site-navi-tab">运营数据管理</a></li>
			</ul>
		</div>

		<div title="审核管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<shiro:hasPermission name="jkb:jkb_listPage">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/jkb/jkb_listPage"
						   class="site-navi-tab">借款审核</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="logtx:backtxsh">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/logtx/backtxsh"
						   class="site-navi-tab">提现审核</a></li>
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>"
						   class="site-navi-tab">用户认证审核</a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<shiro:hasRole name="超级管理员">
			<div title="管理员管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
				<ul>
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/logger/logger_page"
						   class="site-navi-tab">管理员列表</a></li>
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/logger/logger_page"
						   class="site-navi-tab">员工列表</a></li>
				</ul>
			</div>
		</shiro:hasRole>

		<shiro:hasAnyRoles name="超级管理员,普通管理员">
			<div title="权限管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
				<ul>
					<shiro:hasPermission name="jur:page">
						<li class="asd"><a href="javascript:void(0);" src="<%=path%>/jur/page"
							   class="site-navi-tab">权限列表</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="role:page">
						<li class="asd"><a href="javascript:void(0);" src="<%=path%>/role/page"
							   class="site-navi-tab">角色列表</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="roleUser:page">
						<li class="asd"><a href="javascript:void(0);" src="<%=path%>/roleUser/page"
							   class="site-navi-tab">用户角色</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
		</shiro:hasAnyRoles>
	</div>
</div>
<div id="tabs" class="easyui-tabs" data-options="region:'center'">
	<div title="主页" style="padding: 10px">
		<div class="easyui-panel my-panel" title="系统状态">
			系统状态
		</div>
		<div class="easyui-panel my-panel" title="待办任务">
			待办任务
		</div>
	</div>
</div>

<div id="mm" class="easyui-menu">
	<div id="mm-tabupdate">刷新</div>
	<div class="menu-sep"></div>
	<div id="mm-tabclose">关闭</div>
	<div id="mm-tabcloseother">关闭其他</div>
	<div id="mm-tabcloseall">关闭全部</div>
</div>

</body>
<%@include file="../master/easyui/footer.jsp" %>
</html>
