<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/27
  Time: 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>全部借款</title>
    <%@include file="../master/easyui/header.jsp"%>
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
			url:'<%=path %>/borrowApply/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'baid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:100">真实姓名</th>
        <th data-options="field:'money',width:100">申请金额</th>
        <th data-options="field:'lxname',width:100">类型名称</th>
        <th data-options="field:'cpname',width:100">产品名称</th>
        <th data-options="field:'time',width:150,formatter:formatDate">审核时间</th>
        <th data-options="field:'state',width:100,formatter:formatterState">审核状态</th>
        <th data-options="field:'bzname',width:100">标种名称</th>
        <th data-options="field:'term',width:100">借款期限</th>
        <th data-options="field:'deadline',width:150,formatter:formatDate">截止时间</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <div>
        <shiro:hasPermission name="brorrowApply:page">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="openEditWin('editWin', 'list', 'editForm')">借款详情</a>
        </shiro:hasPermission>
        <form id="searchForm">
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入最大借款金额',
						required:false,
						novalidate:true" name="money"/>
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入借款期限',
						required:false,
						novalidate:true" name="term"/>
            <input class="easyui-combobox easyui-validatebox bzid" data-options="prompt:'请选择标种',
						required:false,
						novalidate:true" name="bzid"/>
            <input class="easyui-datetimebox" data-options="prompt:'请选择最大截止时间',
						required:false,
						novalidate:true,showSeconds:true" name="deadline" />
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>

    <div id="editWin" class="easyui-window large_win" data-options="title:'查看借款详情', closed:true">
        <form id="editForm">
            <table>
                <tr>
                    <td>法人身份证：</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <img src="<%=path %>/static/upload/${fpic}" style="width: 400px;height: 80px;"/>
                    </td>
                </tr>
                <tr>
                    <td>营业执照副本：</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <img src="<%=path %>/static/upload/${ypic}" style="width: 400px;height: 80px;"/>
                    </td>
                </tr>
                <tr>
                    <td>企业银行账户:</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <img src="<%=path %>/static/upload/${qbic}" style="width: 400px;height: 80px;"/>
                    </td>
                </tr>
                <tr>
                    <td>其他资料:</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <img src="<%=path %>/static/upload/${tpic}" style="width: 400px;height: 80px;"/>
                    </td>
                </tr>
                <tr>
                    <td>资金用途:</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <input class="easyui-textbox easyui-validatebox" name="mpurpose" style="width: 400px;height: 32px;">
                    </td>
                </tr>
                <tr>
                    <td>还款来源:</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <input class="easyui-textbox easyui-validatebox" name="hksource" style="width: 400px;height: 32px;">
                    </td>
                </tr>
                <tr>
                    <td>年化收益:</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <input class="easyui-textbox easyui-validatebox" name="nprofit" style="width: 400px;height: 32px;">
                    </td>
                </tr>
                <tr>
                    <td>收益方式:</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <input class="easyui-textbox easyui-validatebox" name="way" style="width: 400px;height: 32px;">
                    </td>
                </tr>
                <tr>
                    <td>借款人介绍：</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <input class="easyui-textbox" data-options="multiline:true" name="suggest" style="width:400px;height:150px;">
                    </td>
                </tr>
                <tr>
                    <td>项目描述：</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <input class="easyui-textbox" data-options="multiline:true" name="xmdescrip" style="width:400px;height:150px;">
                    </td>
                </tr>

                <tr>
                    <td>保障措施：</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <input class="easyui-textbox" data-options="multiline:true" name="guarantee" style="width:400px;height:150px;">
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>

</body>
<%@include file="../master/easyui/footer.jsp"%>
<script>
    $(function () {
        setPagination("list");
    });
    $(".bzid").combobox(
        {
            url:contextPath +'/borrowApply/all',
            valueField:"id",
            valueText:"text"
        }
    )
    //（1表示为审核，2表示已审核,3表示为招标中，4表示为成功借款与正在还款，5还款成功）
    function formatterState(value,row,index){
        if(row.state==1){
            return "未审核"
        }else if(row.state==2){
            return "已审核"
        }else if(row.state==3){
            return "招标中"
        }else if(row.state==4){
            return "成功借款"
        }else{
            return "还款成功"
        }
    }
    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row); // 考虑时间字符串
            openWin(winId);
        } else {
            showInfoAlert("请选择需要查看的数据");
        }
    }
</script>
</html>
