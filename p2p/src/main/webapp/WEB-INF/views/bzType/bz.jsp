<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>标种</title>
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
			pageNo:1,
			pageSize:10,
			url:'<%=path %>/bz/pager',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'bzid',width:80,checkbox:true">编号</th>
        <th data-options="field:'bzname',width:100">标种名称</th>
        <th data-options="field:'state',width:100">标种状态</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">添加</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm')">修改</a>
</div>

<div id="addWin" class="easyui-window normal_win" data-options="title:'添加标种', closed:true">
    <form id="addForm">
        <table>
            <tr>
                <td>标种名称</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入标种名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="bzname"/>
                </td>
            </tr>
            <tr>
                <td>状态</td>
                <td>
                    <input class="easyui-combobox easyui-validatebox state" data-options="prompt:'请选择状态',
						required:true,
						novalidate:true" name="state"/>
                </td>
            </tr>
            <tr>
                <td><a class="easyui-linkbutton" onclick="save('/bz/save', 'addForm', 'addWin', 'list');">确认</a></td>
            </tr>
        </table>
    </form>
</div>

<div id="editWin" class="easyui-window normal_win" data-options="title:'编辑标种', closed:true">
    <form id="editForm">
        <input type="hidden" name="bzid" id="bzid"/>
        <table>
            <tr>
                <td>标种名称</td>
                <td>
                    <input id="bzname" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入标种名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="bzname"/>
                </td>
            </tr>
            <tr>
                <td>状态</td>
                <td>
                    <input id="state" class="easyui-combobox easyui-validatebox state" data-options="prompt:'请选择状态',
						required:true,
						novalidate:true" name="state"/>
                </td>
            </tr>
            <tr>
                <td><a class="easyui-linkbutton" onclick="edit('/bz/update', 'editForm', 'editWin', 'list');">确认</a></td>
            </tr>
        </table>
    </form>
</div>

</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>


    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row);
            $('#bzname').textbox("setValue",row.bzname);
            $("#state").combobox("select", row.state);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    }

</script>

</html>