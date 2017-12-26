<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>账户总览</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>

    <link rel="stylesheet" href="<%=path%>/static/css/pagination.css"/>
    <!-- 提示框 -->
    <script src="<%=path %>/static/js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="<%=path %>/static/css/sweetalert.css">
</head>
<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body>

    <!-- begin -->
    <div class="account-right" style="width: 100%;height: 951px;">

        <div class="account-right-nav">
            <div class="sub-a-nav">
                <a class="active" href="javascript:void(0);">资金记录</a>
            </div>
            <em></em>
        </div>
        <div class="account-content">
            <div class="fund-param-list">
                <p>交易类型：</p>
                <ul class="cl">
                    <li id="type4"><a href="<%=path %>/log_money/mylog_money">全部</a></li>
                    <li id="type0"><a href="javascript:void(0);" onclick="Search_type(0)">充值</a></li>
                    <li id="type1"><a href="javascript:void(0);" onclick="Search_type(1)">提现</a></li>
                    <li id="type2"><a href="javascript:void(0);" onclick="Search_type(2)">回款</a></li>
                    <li id="type3"><a href="javascript:void(0);" onclick="Search_type(3)">系统金额</a></li>
                </ul>
            </div>
            <div class="account-form cl">
                <p class="text long">交易时间：</p>
                <input type="date" class="date icon icon-date" id="startDate" placeholder="请选择最大交易时间">
                <!-- <input type="text" placeholder="请输入关键字搜索" class="search icon icon-search" /> -->
                <button class="search" id="fundSearch" type="button">搜索</button>
            </div>
            <div class="account-list">
                <ul class="fund-list-box list-box">
                    <li class="title">
                        <div class="children0">交易时间</div>
                        <div class="children1">交易类型</div>
                        <div class="children2">收入</div>
                        <div class="children3">支出</div>
                        <div class="children4">操作</div>
                    </li>
                </ul>
                <c:if test="${logMoneyList == ''}">
                    <ul class="fund-list-box listData"><li class="none" style="line-height: 60px;">没有符合条件的内容！</li></ul>
                </c:if>
                <ul id="Searchresult" class="fund-list-box listData">
                </ul>
                <ul id="Pagination" class="paging" style="width: 220px; margin: 30px auto 0px;">

                </ul>
                <div id="hiddenresult" style="display:none;">
                    <c:if test="${logMoneyList != ''}">
                        <ul class="fund-list-box listData">
                            <c:forEach items="${logMoneyList}" var="d">
                                <li class="show">
                                    <div class="children0" >
                                        <fmt:formatDate value="${d.date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    </div>
                                    <c:if test="${d.type == 0}">
                                        <div class="children1"><span class="black">充值</span></div>
                                    </c:if>
                                    <c:if test="${d.type == 1}">
                                        <div class="children1"><span class="black">提现</span></div>
                                    </c:if>
                                    <c:if test="${d.type == 2}">
                                        <div class="children1"><span class="black">回款</span></div>
                                    </c:if>
                                    <c:if test="${d.type == 3}">
                                        <div class="children1"><span class="black">系统金额</span></div>
                                    </c:if>

                                    <div class="children2">${d.in}</div>
                                    <div class="children3">${d.out}</div>
                                    <div class="children4"><p><span class="icon icon-true">成功</span></p></div>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- end -->
<form name="paginationoptions" style="display: none">
    <input id="typecss" value="${type}">
    <p><label for="items_per_page">每页显示的列表数：</label><input type="text" value="10" name="items_per_page" id="items_per_page" class="numeric"/></p>
    <p><label for="num_display_entries">分页链接显示数：</label><input type="text" value="10" name="num_display_entries" id="num_display_entries" class="numeric"/></p>
    <p><label>起始与结束点的数目：</label><input type="text" value="2" name="num_edge_entries" id="num_edge_entries" class="numeric"/></p>
    <p><label for="prev_text">“上一页”标签：</label><input type="text" value="上一页" name="prev_text" id="prev_text"/></p>
    <p><label for="next_text">“下一页”标签：</label><input type="text" value="下一页" name="next_text" id="next_text"/></p>
    <input type="button" id="setoptions" value="设置选项" />
</form>

</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.pagination.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/page.js"></script>
<script>
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
    function Search_type(i){
        var time = $("#startDate").val();
        if(time != ""){
            window.location.href = "/log_money/search/"+i+"/"+time;
        }else{
            window.location.href = "/log_money/search/"+i+"/null";
        }

    }
    $(function(){
        $("#fundSearch").bind("click",function(){
            var time = $("#startDate").val();
            var type = $("#typecss").val();
            if(time != ""){
                window.location.href = "/log_money/search/"+type+"/"+time;
            }else{
                swal("请选择最大交易时间", "", "error");
                return;
            }
        });
        $("#type"+$("#typecss").val()).addClass("active");
        $(".cl li").bind("click",function(){
            $(".cl li").removeClass("active");
            $(this).addClass("active");
        });

        $(".luckyLink").mouseover(function (){
            $(".luckyDetails").show();
        }).mouseout(function (){
            $(".luckyDetails").hide();
        });

    })
</script>
</html>
