var localObj = window.location;
var contextPath = localObj.protocol + "//" + localObj.host;
var oPage;
$(function(){
    initIpayData();

    $('#invest-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $('#invest-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $("#invest-manage-Link").bind("click",function(){
        $(".sub-a-nav a").removeClass("active");
        $(this).addClass("active");
        $(".em-line").css("left",'0px');
        $("#payment").hide();
        $("#invest").show();
    });
    $("#invest-detail-Link").bind("click",function(){
        $(".sub-a-nav a").removeClass("active");
        $(this).addClass("active");
        $(".em-line").css("left",'120px');
        $("#payment").hide();
        $("#invest").show();
    });
    $("#invest-s1").bind("click",function(){
        var startDate = $('#invest-startDate').val();
        var endDate = $('#invest-endDate').val();
        initIpayData(startDate,endDate,null);
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
    });
    $("#invest-s2").bind("click",function(){
        var startDate = $('#invest-startDate').val();
        var endDate = $('#invest-endDate').val();
        $("#state").val(3);
        initIpayData(startDate,endDate,$("#state").val());
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
    });
})

//页面初始化
function initIpayData(startDate,endDate,state){
    //数据初始化
    var payData = [
        {
            key:'cpname',resolve:function(val){
                return val;
            }
        },
        {
            key:'lxname',resolve:function(val){
                return val;
            }
        },
        {
            key:'nprofit',resolve:function(val){
                return '<span class="black">'+val+'%</span>';
            }
        },
        {
            key:'term',resolve:function(val){
                return val;
            }
        },
        {
            key:'way',resolve:function(val){
                return val;
            }
        },
        {
            key:'money',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
            }
        },
        {
            key:'time',resolve:function(val){
                return formatDate(val);
            }
        }
    ];
    var startDate = startDate||'';
    var endDate = endDate||'';
    var state = state||'';
    var param={
        startTime:startDate,
        endTime:endDate,
        state:state
    };
    oPage = null;
    oPage = new Page(contextPath+'/tzb/select',param,$('.listData'),$('.paging'),payData,function(){
        $('#invest').show();
    });

}
//搜索
$('#investSearch').unbind('click').click(function () {
    var startDate = $('#invest-startDate').val();
    var endDate = $('#invest-endDate').val();
    var state = $("#state").val();
    if (startDate == '') {
        alert('开始时间不能为空');
        return;
    }
    if (endDate == '') {
        alert('结束时间不能为空');
        return;
    }
    if (startDate > endDate) {
        alert('开始时间不能大于结束时间');
        return;
    }
    initIpayData(startDate, endDate,state);
});
//时间格式化
function formatDate(value) {
    if (value == undefined || value == null || value == '') {
        return "";
    } else {
        var date = new Date(value); // 获取js的Date对象
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();
        var hour = date.getHours().toString();
        var minutes = date.getMinutes().toString();
        var seconds = date.getSeconds().toString();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        if (hour < 10) {
            hour = "0" + hour;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
    }
}