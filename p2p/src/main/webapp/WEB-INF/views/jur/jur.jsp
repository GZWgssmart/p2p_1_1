<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/22
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>导入权限</title>
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
			url:'<%=path %>/jur/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'jid',width:80,checkbox:true">编号</th>
        <th data-options="field:'jurl',width:100">权限url</th>
        <th data-options="field:'content',width:150">权限描述</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <form id="file_form" method="post" action="/jur/import" enctype="multipart/form-data">
        <input type="file" name="file" id="file">
        <input type="submit" value="导入数据" id="lead">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm')">修改</a>
    </form>
    <div>
        <form id="searchForm">
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入权限url',
						required:false,
						novalidate:true" name="jurl"/>
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入权限描述',
						required:false,
						novalidate:true" name="content"/>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>

    <div id="editWin" class="easyui-window normal_win" data-options="title:'编辑权限', closed:true">
        <form id="editForm">
            <input type="hidden" name="jid" />
            <table>
                <tr>
                    <td>权限url</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入权限url',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="jurl"/>
                    </td>
                </tr>
                <tr>
                    <td>权限描述</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入权限描述',
                               required:true,
                               validType:['length[2,20]'],
                        novalidate:true" name="content"/>
                    </td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" onclick="edit('/jur/update', 'editForm', 'editWin', 'list');">确认</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
<%@include file="../master/footer.jsp"%>
<script type="text/javascript" src="<%=path%>/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.form.js"></script>
<script>
    $(function(){
        setPagination("list");
    });
    function getFileType(filePath) {
        var startIndex = filePath.lastIndexOf(".");
        if(startIndex != -1)
            return filePath.substring(startIndex + 1, filePath.length).toLowerCase();
        else return "";
    }
    $("#lead").on('click', function() {
        var filepath = $("#file").val();
        if (filepath != "") {
            var fileType = getFileType(filepath)
            if ("xls" == fileType || "xlsx" == fileType) {
                var file = $("#file").val();
                $('#file_form').ajaxSubmit({
                    type: 'post', // 提交方式 get/post
                    url: '/jur/import', // 需要提交的 url
                    data: {
                        'file':file
                    },
                    dataType:'json',
                    success:function (data) {
                        showResponse(data);
                    }
//                    $(this).resetForm(); // 提交后重置表单
                });
                return false; // 阻止表单自动提交事件
            }else {
                $("#file").val("");
                showInfoAlert("请选择Excel表格文件");
            }
        } else {
            showInfoAlert("请选择需要导入的文件");
        }
        return false; // 阻止表单自动提交事件
    });
    function showResponse(data){
        alert("ok");
        if(data.result === "ok"){
            window.location.href = contextPath + "/jur/page";
        } else {
            showInfoAlert(data.message);
        }
    }
    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row); // 考虑时间字符串
            $("#jurl").combobox("select", row.cashTypeId);
            $("#content").combobox("select", row.payTypeId);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    }

</script>
</html>
