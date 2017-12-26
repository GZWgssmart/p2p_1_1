var contextPath = "http://localhost:8080";
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
        case 'cash':
            initCash();
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
    $.post(contextPath + "/bank/select",
        function (data) {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('<li data-name="' + data[i].type + '" data-bankno="' + data[i].cardno + '"><a href="javascript:;">' + data[i].type + '&nbsp;&nbsp;|&nbsp;&nbsp;' + data[i].cardno + '</a></li>')
                        .click(function () {
                            bankno = $(this).attr('data-bankno');//jquery bug
                            bankname = $(this).data('name');
                            $('#select-bank')
                                .val(bankname + '  |  ' + bankno)
                                .data('bankno', bankno);
                            $('.select-box').slideUp(200);
                        })
                        .appendTo($('.select-box'));
                }
                ;
                /* var withdrawPhone=data.bindingPhone;
                 $('#withdrawPhone').text(withdrawPhone.substr(0, 3) + '****' + withdrawPhone.substr(7));*/
                //默认值
                $("#select-bank").val(data[0].type + '  |  ' + data[0].cardno)
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
                utils.toast('开始时间不能为空');
                return;
            }
            if (endDate == '') {
                utils.toast('结束时间不能为空');
                return;
            }
            if (startDate > endDate) {
                utils.toast('开始时间不能大于结束时间');
                return;
            }
            initIpayData(startDate, endDate);
        });
    });

}

