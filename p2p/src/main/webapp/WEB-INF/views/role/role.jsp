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
    <title>角色添加</title>
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
			url:'<%=path %>/role/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'rid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:100">角色名称</th>
        <th data-options="field:'content',width:150">角色描述</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <div>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin')">新增</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm')">修改</a>
        <form id="searchForm">
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色名称',
						required:false,
						novalidate:true" name="role"/>
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色描述',
						required:false,
						novalidate:true" name="content"/>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>

    <div id="addWin" class="easyui-window normal_win" data-options="title:'新增角色权限', closed:true">
        <form id="addForm" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>角色名称:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="rname"/>
                    </td>
                </tr>
                <tr>
                    <td>角色描述:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色描述',
                               required:true,
                               validType:['length[2,20]'],
                        novalidate:true" name="content"/>
                    </td>
                </tr>
                <tr>
                    <td>权限选择:</td>
                    <td>
                        <input id="jids" class="easyui-combobox easyui-validatebox jids" name="jids" data-options="prompt:'请选择角色权限',
                            required:true,
                            novalidate:true">
                    </td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" onclick="save('/role/save', 'addForm', 'addWin', 'list');">确认</a></td>
                </tr>
            </table>
        </form>
    </div>

    <div id="editWin" class="easyui-window normal_win" data-options="title:'编辑角色', closed:true">
        <form id="editForm">
            <input type="hidden" name="rid" />
            <table>
                <tr>
                    <td>角色名称:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="rname"/>
                    </td>
                </tr>
                <tr>
                    <td>角色描述:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色描述',
                               required:true,
                               validType:['length[2,20]'],
                        novalidate:true" name="content"/>
                    </td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" onclick="edit('/role/update', 'editForm', 'editWin', 'list');">确认</a></td>
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
        $(".jids").combobox(
            {
                url:'/jur/all/',
                method:'post',
                valueField:'id',
                textField:'text',
                multiple:true,
                panelHeight:'auto'
            }
        );

    });
    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row); // 考虑时间字符串
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    }
</script>
</html>
