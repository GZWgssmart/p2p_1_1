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
			url:'<%=path %>/home/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'hid',checkbox:true">编号</th>
        <th data-options="field:'pic1',width:100,formatter:pic1Img">轮播图一</th>
        <th data-options="field:'pic2',width:100,formatter:pic2Img">轮播图二</th>
        <th data-options="field:'pic3',width:100,formatter:pic3Img">轮播图三</th>
        <th data-options="field:'l1',width:100">链接一</th>
        <th data-options="field:'l2',width:100">链接二</th>
        <th data-options="field:'l3',width:100">链接三</th>
        <th data-options="field:'phone',width:100">电话</th>
        <th data-options="field:'ewm',width:100,formatter:ewmimg">二维码</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">添加</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditHomeWin('editWin', 'list', 'editForm')">修改</a>
    <div>
        <form id="searchForm">
            <input class="easyui-datetimebox" name="createTime"
                   data-options="prompt:'请选择最大创建时间',required:false,novalidate:true,showSeconds:true"/>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>
</div>

<div id="addWin" style="width:900px;height:550px;" class="easyui-window normal_win" data-options="title:'新增首页信息', closed:true">
    <form id="addForm">
        <table>
            <tr>
                <td style="width:9%;">轮播图一</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="img1" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImg1').click();">
                    </div>
                    <input type="file"  onchange="previewImage1(this)" name="file1" style="display: none;" id="previewImg1"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">轮播图二</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="img2" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImg2').click();">
                    </div>
                    <input type="file"  onchange="previewImage2(this)" name="file2" style="display: none;" id="previewImg2"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">轮播图三</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="img3" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImg3').click();">
                    </div>
                    <input type="file"  onchange="previewImage3(this)" name="file3" style="display: none;" id="previewImg3"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">二维码</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="img4" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImg4').click();">
                    </div>
                    <input type="file"  onchange="previewImage4(this)" name="file4" style="display: none;" id="previewImg4"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接一</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l1"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接二</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l2"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接三</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l3"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">电话</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入联系电话',
							required:true,novalidate:true" name="phone"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a class="easyui-linkbutton" onclick="savehome('addForm','addWin','list','/home/save');">  确   认 </a>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </form>
</div>


<div id="editWin" style="width:900px;height:550px;" class="easyui-window normal_win" data-options="title:'修改首页信息', closed:true">
    <form id="editForm">
        <table>
            <input type="hidden" name="hid"/>
            <tr>
                <td style="width:9%;">轮播图一</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="imgs1" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImgs1').click();">
                    </div>
                    <input type="file"  onchange="previewImages1(this)" name="file1" style="display: none;" id="previewImgs1"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">轮播图二</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="imgs2" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImgs2').click();">
                    </div>
                    <input type="file"  onchange="previewImages2(this)" name="file2" style="display: none;" id="previewImgs2"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">轮播图三</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="imgs3" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImgs3').click();">
                    </div>
                    <input type="file"  onchange="previewImages3(this)" name="file3" style="display: none;" id="previewImgs3"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">二维码</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="imgs4" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImgs4').click();">
                    </div>
                    <input type="file"  onchange="previewImages4(this)" name="file4" style="display: none;" id="previewImgs4"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接一</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l1"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接二</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l2"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接三</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l3"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">电话</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入联系电话',
							required:true,novalidate:true" name="phone"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a class="easyui-linkbutton" onclick="savehome('editForm','editWin','list','/home/update');">  确   认 </a>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
<%@include file="../master/easyui/footer.jsp" %>
<script type="text/javascript" src="<%=path%>/static/js/dynamic_media_home.js"/>
<script>
    $(function() {
        setPagination("list");
    });
</script>
</html>