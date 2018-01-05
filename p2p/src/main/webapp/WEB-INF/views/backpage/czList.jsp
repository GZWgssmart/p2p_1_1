<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<%@include file="../master/easyui/header.jsp" %>
</head>
<body>
	<table id="list" class="easyui-datagrid"
		data-options="
			toolbar:'#tb',
			rownumbers:true,
			border:false,
			singleSelect:true,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/logczz/select',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox:true">编号</th>
				<th data-options="field:'rname',width:100">账户名</th>
				<th data-options="field:'phone',width:100">手机号码</th>
				<th data-options="field:'money',width:80">提现金额</th>
				<th data-options="field:'bankcard',width:180">充值账号</th>
				<th data-options="field:'banktype',width:80">银行类型</th>
				<th data-options="field:'date',width:180,formatter:formatDate">提现时间</th>
				<th data-options="field:'state',width:90,formatter:getCzStatus">状态</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="derivationExcle('/cash/export', 'searchForm');">导出Excle</a>
		<div>
			<form id="searchForm">
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入搜索条件',
						required:false,
						novalidate:true" name="money"/>
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入搜索条件',
						required:false,
						novalidate:true" name="cashCustomer"/>
				<input class="easyui-combobox easyui-validatebox cashtype" data-options="prompt:'请输入收入或支出',
						required:false,
						validType:['length[2,20]'],
						novalidate:true" name="pid"/>
				<input class="easyui-combobox easyui-validatebox cashtypeson" data-options="prompt:'请输入收入或支出子分类',
						required:false,
						validType:['length[2,20]'],
						novalidate:true" name="cashType"/>
				<input class="easyui-combobox easyui-validatebox paytype" data-options="prompt:'请输入支付方式',
						required:false,
						validType:['length[2,20]'],
						novalidate:true" name="payType"/>
				<input class="easyui-datetimebox easyui-validatebox "data-options="prompt:'请选择最大支付时间',
						required:false,
						novalidate:true,
						showSeconds:true" name="cashTime"/>
				<input class="easyui-datetimebox easyui-validatebox " data-options="prompt:'请选择最大创建时间',
						required:false,
						novalidate:true,
						showSeconds:true" name="createTime"/>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
			</form>
		</div>
	</div>

	
</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
	$(function (){
        setPagination("list");


    });
</script>
</html>