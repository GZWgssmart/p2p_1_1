<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
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
			url:'<%=path %>/jkb/jkb_list',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'baid',width:80,checkbox:true">编号</th>
        <th data-options="field:'cpname',width:140">产品名称</th>
        <th data-options="field:'rname',width:140">真实姓名</th>
        <th data-options="field:'money',width:140">申请金额（元）</th>
        <th data-options="field:'bzname',width:120">标种</th>
        <th data-options="field:'lxname',width:120">类型</th>
        <th data-options="field:'term',width:110">借款期限（个月）</th>
        <th data-options="field:'nprofit',width:110">年化收益（%）</th>
        <th data-options="field:'state',width:90,formatter:formatValidNUm">未审核</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="openLookWin('lookWin', 'list', 'lookForm')">查看详情</a>
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

<div id="lookWin" class="easyui-window normal_win" data-options="title:'查看详细资料', closed:true" style="width: 800px;height:500px">
    <form id="lookForm">
        <input type="hidden" name="baid" id="baid"/>
        <table>
            <tr height="40px">
                <td width="100px">产品名称：</td>
                <td width="260px">
                    <input id="cpname" readonly="readonly"/>
                </td>
                <td width="100px">申请金额：</td>
                <td width="260px">
                    <input id="money" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">真实姓名：</td>
                <td width="260px">
                    <input id="rname" readonly="readonly"/>
                </td>
                <td width="100px">借款标种：</td>
                <td width="260px">
                    <input id="bzname" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">借款类型：</td>
                <td width="260px">
                    <input id="lxname" readonly="readonly"/>
                </td>
                <td width="100px">借款期限：</td>
                <td width="260px">
                    <input id="term" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">资金用途：</td>
                <td width="260px">
                    <input id="mpurpose" readonly="readonly"/>
                </td>
                <td width="100px">还款来源：</td>
                <td width="260px">
                    <input id="hksource" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">年化收益：</td>
                <td width="260px">
                    <input id="nprofit" readonly="readonly"/>
                </td>
                <td width="100px">收益方式：</td>
                <td width="260px">
                    <input id="way" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">借款人介绍：</td>
                <td width="260px">
                    <textarea id="suggest" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">项目描述：</td>
                <td width="260px">
                    <textarea id="xmdescrip" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">保障措施：</td>
                <td width="260px">
                    <textarea id="guarantee" readonly="readonly"/>
                </td>
            </tr>
            <tr>
                <td colspan="4"><a class="easyui-linkbutton" onclick="edit('/cash/update', 'editForm', 'editWin', 'list');">确认</a></td>
            </tr>
        </table>
    </form>
</div>




</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
    $(function() {
        setPagination("list");
    });

    function openLookWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            row.cashTime = formatDate(row.cashTime);
            $("#" + formId).form("load", row); // 考虑时间字符串
            $("#cpname").val(row.cpname);$("#money").val(row.money+"元");$("#rname").val(row.rname);
            $("#bzname").val(row.bzname);$("#baid").val(row.baid);$("#lxname").val(row.lxname);
            $("#term").val(row.term+"个月");$("#mpurpose").val(row.mpurpose);$("#hksource").val(row.hksource);
            $("#nprofit").val(row.nprofit+"%");$("#way").val(row.way);$("#suggest").val(row.suggest);
            $("#xmdescrip").val(row.xmdescrip);$("#guarantee").val(row.guarantee);
            $("#cpname").val(row.cpname);
            $("#cpname").val(row.cpname);
            $("#cpname").val(row.cpname);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要查看的数据");
        }
    }
</script>

</html>