var localObj = window.location;
var contextPath = localObj.protocol + "//" + localObj.host;
var oPage;
function hashChange(){
    var hash =  window.location.pathname;
    /*$('.sub-nav li').removeClass('active');
    $('a[href="#'+hash+'"]').parent('li').addClass('active');*/
    switch(hash){
        case 'tuijian':
            initTuijian();
            break;
        case 'ipay':
            initIpay();
            break;
        case 'taste':
            initTaste();
            break;
        case 'fund':
            initFundRecord();
            break;
        case 'invest':
            initInvestManage();
            break;
        case 'claimm':
            initClaimManage();
            break;
        case 'claimb':
            initClaimBuy();
            break;
        case 'loan':
            initLoanManage();
            break;
        case 'safe':
            initSafe();
            break;
        case 'msg':
            initMsgCenters();
            break;
        case 'hetong':
            initHeTong();
            break;
        /*default : initAccount();$('a[href="#account"]').parent('li').addClass('active');
            break;*/
    };

}

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
            key:'sqtime',resolve:function(val){
            return formatDate(val);
        }
        },
        {
            key:'state',resolve:function(val){
            var str ='';
            if(val == '1'){
                str = '<p><span class="">审核中</span></p>';
            }else if(val == '2'){
                str = '<p><span class="icon icon-wrong">审核失败</span></p>';
            }else if(val == '3'){
                str = '<p><span class="">招标中</span></p>';
            }else if(val == '4'){
                str = '<p><span class="icon icon-true">成功</span></p>';
            }

            return str;
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
    oPage = new Page(contextPath+'/jkb/select',param,$('.listData'),$('.paging'),payData,function(){
        $('#invest').show();
    });

}
//页面初始化
function initIpayData2(startDate,endDate,state){
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
            key:'excuse',resolve:function(val){
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
            key:'nprofit',resolve:function(val){
            return '<span class="black">'+val+'%</span>';
        }
        },

        {
            key:'sqtime',resolve:function(val){
            return formatDate(val);
        }
        },
        {
            key:'state',resolve:function(val){
            var str ='';
            if(val == '1'){
                str = '<p><span class="">审核中</span></p>';
            }else if(val == '2'){
                str = '<p><span class="icon icon-wrong">审核失败</span></p>';
            }else if(val == '3'){
                str = '<p><span class="">招标中</span></p>';
            }else if(val == '4'){
                str = '<p><span class="icon icon-true">成功</span></p>';
            }

            return str;
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
    oPage = new Page(contextPath+'/jkb/select',param,$('.listData'),$('.paging'),payData,function(){
        $('#invest').show();
    });

}
//搜索
$('#loanSearch').unbind('click').click(function () {
    var startDate = $('#startDate').val();
    var endDate = $('#endDate').val();
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
    initIpayData(startDate, endDate);
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