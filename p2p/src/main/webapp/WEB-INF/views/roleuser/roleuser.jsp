<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/27
  Time: 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>、
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>用户角色</title>
    <%@include file="../master/header.jsp"%>
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
			url:'<%=path %>/roleUser/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'ruid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:100">角色名称</th>
        <th data-options="field:'huname',width:150">后台用户名</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <div>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin')">新增</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm')">修改</a>
        <form id="searchForm">
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色名',
						required:false,
						novalidate:true" name="role"/>
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入后台用户名称',
						required:false,
						novalidate:true" name="content"/>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>

    <div id="addWin" class="easyui-window normal_win" data-options="title:'新增用户角色', closed:true">
        <form id="addForm" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>角色名称:</td>
                    <td>
                        <input class="easyui-combobox easyui-validatebox rname" data-options="prompt:'请选择角色',
						required:true,
						novalidate:true" name="rname"/>
                    </td>
                </tr>
                <tr>
                    <td>后台用户:</td>
                    <td>
                        <input class="easyui-combobox easyui-validatebox huname" data-options="prompt:'请选择后台用户',
                               required:true,
                        novalidate:true" name="huname"/>
                    </td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" onclick="save('/roleUser/save', 'addForm', 'addWin', 'list');">确认</a></td>
                </tr>
            </table>
        </form>
    </div>

    <div id="editWin" class="easyui-window normal_win" data-options="title:'编辑用户角色', closed:true">
        <form id="editForm">
            <input type="hidden" name="rid" />
            <table>
                <tr>
                    <td>角色名称:</td>
                    <td>
                        <input class="easyui-combobox easyui-validatebox rname" data-options="prompt:'请输入角色名称',
						required:true,
						novalidate:true" name="rname"/>
                    </td>
                </tr>
                <tr>
                    <td>后台用户:</td>
                    <td>
                        <input class="easyui-combobox easyui-validatebox huname" data-options="prompt:'请输入角色描述',
                               required:true,
                        novalidate:true" name="huname"/>
                    </td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" onclick="edit('/roleUser/update', 'editForm', 'editWin', 'list');">确认</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
<%@include file="../master/footer.jsp"%>
<script>
    $(function () {
        setPagination("list");
        $(".rname").combobox(
            {
                url:'/role/all',
                valueField:'id',
                textField:'text',
            }
        )
        $(".huname").combobox(
            {
                url:'/huser/all',
                valueField:'id',
                textField:'text',
            }
        )

    });
    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row); // 考虑时间字符串
            $("#rname").combobox("select", row.rname);
            $("#huname").combobox("select", row.huname);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    }

</script>
</html>
