var contextPath = "http://localhost:8080";
var oPage;
function hashChange(){
    var hash =  window.location.pathname;
    /*$('.sub-nav li').removeClass('active');
    $('a[href="#'+hash+'"]').parent('li').addClass('active');*/
    switch(hash){
        case '/logczz/page':
            initrecharge();
            break;
        case 'tuijian':
            initTuijian();
            break;
        case 'ipay':
            initIpay();
            break;
        case '/logtx/page':
            initCash();
            InitBank();
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
        case '/bank/page':
            initMyDebitCard();
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
/*
    $('a[href="#'+hash+'"]').parent('li').addClass('active');
*/
}

function initMyDebitCard() {
        $.post(contextPath + "/bank/select",
            function(data) {
                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];
                    var cardColor = 'bank-card_1';
                    if (i % 2 != 0) {
                        cardColor = 'bank-card_2';
                    }
                    var cards = $("#myDebitCard");
                    // 卡号
                    var cardNo1 = obj.cardno.substr(0, 4);
                    var cardNo2 = obj.cardno.substr(obj.cardno.length - 4, obj.cardno.length - 1);
                    var cardUserName = obj.rname.substr(1, obj.rname.length - 1);
                    var card =
                        $('<div id="card1" class="' + cardColor + '">' +
                            '<div class="bank-top">' +
                            /*'<div class="bank-cardLogo"></div>' +*/
                            '<div class="bank-cardTitle">' + obj.type + '</div>' +
                            '<div class="bank-cardType">储蓄卡</div>' +
                            '</div>' +
                            '<div class="bank-center">' +
                            /*'<div class="bank-empty"></div>' +*/
                            '<div class="bank-cardNumber">' + cardNo1 + ' **** **** ' + cardNo2 + '</div>' +
                            '<div class="bank-userName">*' + cardUserName + '</div>' +
                            '</div>' +
                            '</div>');
                    card.appendTo(cards);
                }
                // 循环完银行卡后显示添加银行卡
                var cards = $("#myDebitCard");
                // 添加银行卡对象
                var card =
                    $('<div id="card3" class="bank-card_3" onclick="addCard();" style="cursor:pointer;">'+
                        '<div class="bank-addCard"><a href="/bank/bindingpage" >添加银行卡</a></div>'+
                        '</div>');
                card.appendTo(cards);
            },
            "json"
        );
}
//绑定银行卡
function bindingcode(){
    var uid = $('#uid').val();
    var realName = $('#realName').val();
    var idno = $('#idno').val();
    var cardno = $('#cardno').val();
    var type = $('#type').val();

    var bankCard={uid:uid,realName:realName,idno:idno,cardno:cardno,type:type};
    $.post(contextPath+'/bank/add',
        bankCard,
        function(data){

        },
    "json"
    );
}
var bankno;//jquery bug
var bankname;
//初始化银行下拉框
function initrecharge() {
    InitBank();
    //充值
    $('#ipay-submit').click(function () {

        var money = $('#ipay-amt').val();
        if (money == '') {
            alert('请输入充值金额');
            return;
        }
        var logCzz = {banktype: bankname, bankcard: bankno, money: money};
        $.post(contextPath + "/logczz/add",
            logCzz,
            function (data) {
                if (data.result === "ok") {
                    alert("充值成功");
                } else {
                    alert("充值失败");
                }

            },
            "json"
        );
    });
    $('.show-ipay-list').click(function () {
        if ($(this).hasClass('active')) {
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left': '120px'}, 500);
        $('.ipay-pay').hide();
        $('.ipay-list').show();
        $('#startDate').datepicker({format: 'yyyy-mm-dd'}).on('changeDate', function () {

        });
        $('#endDate').datepicker({format: 'yyyy-mm-dd'}).on('changeDate', function () {

        });
        if ($('.listData li').size() == 0) {
            //初始化数据查询
            initIpayData();
        }
        //搜索
        $('#ipaySearch').unbind('click').click(function () {
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
    });
}

//充值记录初始化
function initIpayData(startDate,endDate){
    //数据初始化
    var payData = [
        {
            key:'rname',resolve:function(val){
            return val;
        }
        },
        {
            key:'money',resolve:function(val){
            return '<span class="black">'+val+'</span>';
        }
        },
        {
            key:'banktype',resolve:function(val){
            return val;
        }
        },
        {
            key:'date',resolve:function(val){
            return formatDate(val);
        }
        },
        {
            key:'state',resolve:function(val){
            var str ='';
            if(val == '1'){
                str = '<p><span class="icon icon-true">成功</span></p>';
            }else{
                str = '<p><span class="icon icon-wrong">失败</span></p>';
            }
            return str;
        }
        }
    ];
    var startDate = startDate||'';
    var endDate = endDate||'';
    var param={
        startTime:startDate,
        endTime:endDate
    };
    oPage = null;
    oPage = new Page(contextPath+'/logczz/select',param,$('.listData'),$('.paging'),payData,function(){
        $('#invest').show();
    });

}

//提现

function initCash() {
    $.post(contextPath + "/logtx/page");
    $("#cashInput").blur(function () {
        var value = $(this).val();
        if (isMoney(value)) {
            alert('金额格式不正确');
            $('#cash-submit').addClass('disabled').unbind('click');
            return;
        } else if (value < 100) {
            alert('提现金额不能小于100');
            return;
        } else {
            $('#cash-submit').removeClass('disabled').unbind('click').bind('click', function () {
                cashSubmit();
            });
        }
        if (value == 0) {
            $('#refreew').text("0.00").data('fei', fei);
        } else {
            var fei = value * 0.0035;
            $('#refreew').text(fei + "元").data('fei', fei);
            if (fei <= 2) {
                $('#refreew').text("2元").data('fei', fei);
            }
        }
    });
//提现记录
    $('.show-cash-list').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'120px'},500);
        $('.cash-pay').hide();
        $('.cash-list').show();
        $('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
        $('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
        if($('.listData li').size() == 0){
            //初始化数据查询
            initcashData();
        };
        //搜索
        $('#cashSearch').unbind('click').click(function(){
            var startDate = $('#startDate').val();
            var endDate = $('#endDate').val();
            if(startDate == ''){
                utils.toast('开始时间不能为空');
                return;
            }
            if(endDate == ''){
                utils.toast('结束时间不能为空');
                return;
            }
            if(startDate>endDate){
                utils.toast('开始时间不能大于结束时间');
                return;
            }
            initcashData(startDate,endDate);
        });
    });
}


//提现
function cashSubmit(){
    var money = $('#cashInput').val();
	var password = $('#cash-password').val();
    var bankNo = $('#select-bank').data('bankno');
    var fei =  $('#refreew').data('fei');
    if(money == ''){
        alert('金额不能为空');return;
    }
	if(password == ''){
		alert('交易密码不能为空');return;
	}
    if(isMoney(money)){
        alert('金额格式不正确');return;
    }
    var logTx={bankcard:bankNo,banktype:bankname,money:money,proce:fei,password:password};
    $.post(contextPath+"/logtx/add",
        logTx,
        function (data){
            if(data.result === "ok") {
                alert(data.message);
                window.location.href=contextPath + "/logtx/page";
               /* $('#returnHtml').html(data.html.replace('target="_blank"',''));*/
            }
        }
    )


}

function initcashData(startDate,endDate){
    //数据初始化
    var cashData = [
        {
            key:'rname',resolve:function(val){
            return val;
        }
        },
        {
            key:'money',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
        }
        },
        {
            key:'cardno',resolve:function(val){
            return encodeBank(val);
        }
        },
        {
            key:'proce',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
        }
        },
        {
            key:'date',resolve:function(val){
            return formatDate(val);
        }
        },
        {
            key:'state',resolve:function(val){
            var str ='';
            if(val == '2'){
                str = '<p><span class="icon icon-true">已提现</span></p>';
            }else if(val=='1'){
                str = '<p><span class="icon icon-danger">审核中</span></p>';
            }else if(val=='3'){
                str = '<p><span class="icon icon-wrong">取消</span></p>';
            }else if(val=='4'){
                str = '<p><span class="icon icon-danger">转账中</span></p>';
            }else if(val=='5'){
                str = '<p><span class="icon icon-wrong">失败</span></p>';
            }
            return str;
        }
        },
        {
            key:'state',resolve:function(val,record){
            var str ='';
            if(val == '2'){
                str = '<p><span class="black">--</span></p>';
            }else if(val=='1'){
                str = $('<a href="javascript:void(0);" onclick="deleteWithdraw('+record.id+','+record.money+')">取消</a>');
            }else if(val=='3'){
                str = '<p><span class="black">--</span></p>';
            }else if(val=='4'){
                str = '<p><span class="black">--</span></p>';
            }else if(val=='5'){
                str = '<p><span class="black">--</span></p>';
            }
            return str;
        }
        }
    ];
    var startDate = startDate||'';
    var endDate = endDate||'';
    var param={
        startTime:startDate,
        endTime:endDate
    };
    var payPage = new Page(contextPath+'/logtx/select',param,$('.listData'),$('.paging'),cashData,function(){});
}

//取消提现
function deleteWithdraw(id,sum){
    if(!window.confirm("确定要取消提现记录")){
        return;
    }
    var param={id:id};
    $.post(
        contextPath +'/logtx/cancl',
        {
            id:id,money:sum
        },
        function(data){
            if(data.result =='ok'){
                alert(data.message);
                //初始化数据查询
                initcashData();
            }else{
                alert(data.message);
            }
        },
        'json'
    );
}

function InitBank() {
    $.post(contextPath + "/bank/select",
        function (data) {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('<li data-name="' + data[i].type + '" data-bankno="' + data[i].cardno + '"><a href="javascript:;">' + data[i].type + '&nbsp;&nbsp;|&nbsp;&nbsp;' + encodeBank(data[i].cardno) + '</a></li>')
                        .click(function () {
                            bankno = $(this).attr('data-bankno');//jquery bug
                            bankname = $(this).data('name');

                            $('#select-bank').val(bankname + '  |  ' + encodeBank(bankno)).data('bankno',bankno);
                            $('.select-box').slideUp(200);
                        })
                        .appendTo($('.select-box'));
                }
                ;

                //默认值
                $("#select-bank").val(data[0].type + '  |  ' + encodeBank(data[0].cardno))
                    .data('bankno', data[0].cardno)
                    .click(function () {
                        $('.select-box').slideToggle(200);
                    });
                bankno = data[0].cardno;//jquery bug
                bankname = data[0].type;
            }
        },
        "json"
    );
}
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
//格式化银行卡
function encodeBank(bank){
    var bank = bank+'';
    return bank.substring(0,4)+' ******** '+bank.substring(bank.length-4,bank.length);
}

