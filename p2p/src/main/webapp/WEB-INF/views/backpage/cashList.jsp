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
			url:'<%=path %>/cash/pager_criteria',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox:true">编号</th>
				<th data-options="field:'money',width:100">金额</th>
				<th data-options="field:'cashCustomer',width:80">客户名称</th>
				<th data-options="field:'cashType',width:80">支付类型</th>
				<th data-options="field:'payType',width:100">支付方式</th>
				<th data-options="field:'cashTime',width:140,formatter:formatDate">支付时间</th>
				<th data-options="field:'createTime',width:140,formatter:formatDate">创建时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">添加</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditwin('editWin', 'list', 'editForm')">修改</a>
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
	
	<div id="addWin" class="easyui-window normal_win" data-options="title:'添加流水', closed:true">
		<form id="addForm">
			<table>
				<tr>
					<td>金额</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入金额',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="money"/>
					</td>
				</tr>
				<tr>
					<td>客户名称</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="cashCustomer"/>
					</td>
				</tr>
				<tr>
					<td>收入或支出</td>
					<td>
						<input class="easyui-combobox easyui-validatebox cashtype" data-options="prompt:'请输入收入或支出',
						required:false,
						novalidate:true" name="pid"/>
					</td>
				</tr>
				<tr>
					<td>支付类型</td>
					<td>
						<input class="easyui-combobox easyui-validatebox cashtypeson" data-options="prompt:'请输入支付类型子类',
						required:true,
						novalidate:true" name="cashType"/>
					</td>
				</tr>
				<tr>
					<td>支付方式</td>
					<td>
						<input class="easyui-combobox easyui-validatebox paytype" data-options="prompt:'请输入支付方式',
						required:true,
						novalidate:true" name="payType"/>
					</td>
				</tr>
				<tr>
					<td>支付时间</td>
					<td>
						<input class="easyui-datetimebox easyui-validatebox" data-options="prompt:'请输入支付时间',
						required:true,
						novalidate:true,
						showSeconds:true" name="cashTime"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="save('/cash/save', 'addForm', 'addWin', 'list');">保存</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window normal_win" data-options="title:'编辑流水明细', closed:true">
		<form id="editForm">
			<input type="hidden" name="id" />
			<table>
				<tr>
					<td>金额</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入金额',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="money"/>
					</td>
				</tr>
				<tr>
					<td>客户名称</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="cashCustomer"/>
					</td>
				</tr>
				<tr>
					<td>收入或支出</td>
					<td>
						<input id="pid" class="easyui-combobox easyui-validatebox cashtype" data-options="prompt:'请输入收入或支出',
						required:false,
						novalidate:true" name="pid"/>
					</td>
				</tr>
				<tr>
					<td>支付类型</td>
					<td>
						<input id="cashtypeid" class="easyui-combobox easyui-validatebox cashtypeson" data-options="prompt:'请输入支付类型子类',
						required:true,
						novalidate:true" name="cashType"/>
					</td>
				</tr>
				<tr>
					<td>支付方式</td>
					<td>
						<input id="payid" class="easyui-combobox easyui-validatebox paytypeson" data-options="prompt:'请输入支付方式',
						required:true,
						novalidate:true" name="payType"/>
					</td>
				</tr>
				<tr>
					<td>支付时间</td>
					<td>
						<input class="easyui-datetimebox easyui-validatebox" data-options="prompt:'请输入支付时间',
						required:true,
						novalidate:true,
						showSeconds:true" name="cashTime"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="edit('/cash/update', 'editForm', 'editWin', 'list');">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
	$(function (){
        setPagination("list");

        $('.cashtype').combobox({
			url:contextPath+'/catype/gettype/0',
			valueField:'id',
			textField:'text',
            onSelect:function (record) {
                $('.cashtypeson').combobox({
                    url: contextPath + '/catype/gettype/' + record.id,
                    valueField: 'id',
                    textField: 'text'
                });
            }
		});

	    $('.paytype').combobox({
			url:contextPath+'/patype/gettype',
			valueField:'id',
			textField:'text'
		});
	});

    function openEditwin(winId, listId, formId) {
        var row = $('#'+listId).datagrid("getSelected");
        if(row) {
            row.cashTime = formatDate(row.cashTime);
            $('#'+formId).form("load",row);
            $("#pid").combobox("select",row.pid);
            $("#cashtypeid").combobox("select",row.cashtypeid);
            $("#payid").combobox("select",row.payid);
            openWin(winId);
        }else {
            showInfoAlert("请选择需要修改的数据！")
        }
    }
</script>
</html>