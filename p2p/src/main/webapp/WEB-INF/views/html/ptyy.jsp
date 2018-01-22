<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>
	<title>普金资本平台</title>
</head>


<div class="about-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="active" id="sssj">实时数据</a>
		<a href="javascript:void(0);" id="yybg">运营报告</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="about-content" id="sssjDiv">

	<div class="btnDiv">平台数据总览</div>
	<div class="sjList sjList-1">
		<div class="item">
			<div class="item-icon icon-dealNumber"></div>
			<div class="itemText">总用户数（人）</div>
			<div class="itemSJ" id="dealNumber"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-repayAmount"></div>
			<div class="itemText">月用户数（人）</div>
			<div class="itemSJ" id="repayAmount"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-unRepayAmount"></div>
			<div class="itemText">总投资人数（人）</div>
			<div class="itemSJ" id="unRepayAmount"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-unRepayNumber"></div>
			<div class="itemText">月投资人数（人）</div>
			<div class="itemSJ" id="unRepayNumber"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-hasInteres"></div>
			<div class="itemText">总贷款人数（人）</div>
			<div class="itemSJ" id="hasInterest"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-compensatoryMoney"></div>
			<div class="itemText">月贷款人数（人）</div>
			<div class="itemSJ" id="compensatoryMoney"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-compensatoryNumber"></div>
			<div class="itemText">总贷款笔数（笔）</div>
			<div class="itemSJ" id="compensatoryNumber"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-overdueMoney"></div>
			<div class="itemText">月贷款笔数（笔）</div>
			<div class="itemSJ" id="overdueMoney"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-overdueNumber"></div>
			<div class="itemText">总交易金额（元）</div>
			<div class="itemSJ" id="overdueNumber"></div>
		</div>
		<div class="item">
			<div class="item-icon icon-overtimeNumber"></div>
			<div class="itemText">月交易金额（元）</div>
			<div class="itemSJ" id="overtimeNumber"></div>
		</div>

	</div>


</div>
<div class="about-content" id="yybgDiv">
	<div class="tableDiv">

	</div>
</div>
