<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <%@include file="../master/header.jsp" %>
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
			url:'<%=path %>/jkb/jkb_list',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'baid',width:80,checkbox:true">编号</th>
        <th data-options="field:'cpname',width:150">铲平名称</th>
        <th data-options="field:'rname',width:150">真实姓名</th>
        <th data-options="field:'money',width:150">申请金额</th>
        <th data-options="field:'bzname',width:150">标种</th>
        <th data-options="field:'term',width:150">借款期限</th>
        <th data-options="field:'nprofit',width:150">年化收益</th>
        <th data-options="field:'state',width:135,formatter:formatValidNUm">未审核</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">查看详情</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm')">修改</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="exportExcel('/cash/export', 'searchForm')">导出Excel</a>
    <div>
        <form id="searchForm">
            <input class="easyui-numberbox easyui-validatebox" data-options="prompt:'请输入最大金额',
						required:false,
						novalidate:true,
						precision:2" name="money"/>
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入客户名称',
						required:false,
						novalidate:true" name="cashCustomer"/>
            <input class="easyui-datetimebox" name="cashTime"
                   data-options="prompt:'请选择最大支付时间',required:false,novalidate:true,showSeconds:true"/>
            <input class="easyui-datetimebox" name="createTime"
                   data-options="prompt:'请选择最大创建时间',required:false,novalidate:true,showSeconds:true"/>
            <br />
            <input class="easyui-combobox easyui-validatebox cashTypeParent" data-options="prompt:'请选择收支分类',
						required:false,
						novalidate:true" name="pid"/>
            <input class="easyui-combobox easyui-validatebox cashType" data-options="prompt:'请选择收支子分类',
						required:false,
						novalidate:true" name="cashType"/>
            <input class="easyui-combobox easyui-validatebox payType" data-options="prompt:'请选择支付方式',
						required:false,
						novalidate:true" name="payType"/>

            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>
</div>




</body>
<%@include file="../master/footer.jsp" %>

<script>
    $(function() {
        setPagination("list");
    });
</script>

</html>