$(function(){

    $(".img1").mouseover(function (){
        $("#a1").show();
    }).mouseout(function (){
        $("#a1").hide();
    });
    $(".img2").mouseover(function (){
        $("#a2").show();
    }).mouseout(function (){
        $("#a2").hide();
    });
    $(".nomargin").mouseover(function (){
        $("#a3").show();
    }).mouseout(function (){
        $("#a3").hide();
    });
    $(".img4").mouseover(function (){
        $("#a4").show();
    }).mouseout(function (){
        $("#a4").hide();
    });
    //全部投资
    $('#pushAll').click(function(){
        $("#amount").val($("#kymoney").val());
        reckon();
    })
})
//标的相关文件
function getFile(obj) {
    if ($(obj).hasClass('active')) {
        return;
    }
    ;

    $('.em-line').animate({'left': '160px'}, 500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    if ($('.files-box').children('li').size() > 0) {
        $('#files').show();
        return;
    };
}
//标的详情
function getDetail(obj){
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'40px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#project').show();
}
//还款计划
function getPlan(obj){
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'280px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
//        var listData = [
//            {
//                key:'repayPeriod',resolve:function(val,record){
//                return val;
//            }
//            },
//            {
//                key:'repayDate',resolve:function(val){
//                return val;
//            }
//            },
//            {
//                key:'realRepayDate',resolve:function(val){
//                if(val == null){
//                    return '无';
//                }else{
//                    return val;
//                }
//            }
//            },
//            {
//                key:'hasPI',resolve:function(val){
//                return val;
//            }
//            },
//            {
//                key:'stillPI',resolve:function(val){
//                return val;
//            }
//            },
//            {
//                key:'hasFI',resolve:function(val){
//                return val;
//            }
//            },
//            {
//                key:'lateFI',resolve:function(val){
//                return val;
//            }
//            },
//            {
//                key:'repayStatus',resolve:function(val){
//                if(val == '1'){
//                    return '未偿还';
//                }else{
//                    return '已偿还';
//                }
//            }
//            }
//        ];
//        var param = {
//            borrowId:proTypeId
//        }
//        utils.ajax({
//            url:'front/repaymentPlan.do',
//            data:JSON.stringify(param),
//            success:function(data){
//                if(data.error=='0'){
//                    $('#plan .listData').empty();
//                    var oData = data.repayList;
//                    utils.initListData(listData,oData,$('#plan .listData'));
//                    $('#plan').show();
//                }else{
//                    utils.alert(data.msg);
//                }
//            }
//        })
    $('#plan').show();
}
//投资记录
function getInvest(obj) {
    if ($(obj).hasClass('active')) {
        return;
    }
    if ($("#state").val() == 4) {
        $('.em-line').animate({'left': '400px'}, 500);
    } else {
        $('.em-line').animate({'left': '280px'}, 500);
    }
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#invest').show();
}
//查看风险提示
function dangger(obj){
    if($(obj).hasClass('active')){
        return;
    };
    if($("#state").val() == 4){
        $('.em-line').animate({'left':'520px'},500);
    }else{
        $('.em-line').animate({'left':'400px'},500);
    }

    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#tips').show();
}
//大图预览
function showBigImg(index){
    document.getElementById(index).style.display ='block';
    document.getElementById('fade').style.display='block'
}
function closeBigImg(index){
    document.getElementById(index).style.display ='none';
    document.getElementById('fade').style.display='none'
}
//计算收益
function reckon() {
    var amount = $("#amount"); //获取投资金额
    var apr = $("#nprofit").val()/100; //获取年利率
    var mons = $("#term"); //获取投资期限
    var type = $("#sid").val(); //获取投资方式
    var principal = parseFloat(amount.val()); //返回一个金额浮点数
    var interest = apr/12;//每月利率
    var payments = parseInt(mons.val()); //投资期限
    if(!isNaN(amount.val()) && amount.val() !=''){
        if (type==7) {
            var mon = 0;

            if (parseInt(payments) == 1) {
                $("#reckon").html((principal * interest * payments).toFixed(2));
            } else {
                $("#reckon").html((principal * interest * payments).toFixed(2));
            }


        } else if (type == 10) {
            $("#reckon").html((principal * interest * payments).toFixed(2));
        } else if (type == 8) {

            var monthRate = interest;
            var tempAmount = 0.00, tempInterestAmount = 0.00, tempAmountAndInterest = 0.00, totalInterest = 0.00,
                totalAmount = 0.00;
            interestAmount = 0.00;
            var index = 1;
            interestAmount = GetInterest(principal, payments, apr.val());
            while (index <= payments) {
                tempAmount = Number(principal * monthRate * Math.pow(1 + monthRate, index - 1) / (Math.pow(1 + monthRate, payments) - 1));
                tempAmountAndInterest = Number(principal * monthRate * Math.pow(1 + monthRate, payments) / (Math.pow(1 + monthRate, payments) - 1));
                tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
                if (index == payments) {
                    tempAmount = Number(principal) - Number(totalAmount);
                    tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
                }
                totalInterest += Number(tempInterestAmount);
                totalAmount += Number(tempAmount);
                interestAmount = ((Number(totalInterest) * 100) / 100); //总利息
                $("#reckon").html(interestAmount);
            }
        }
    }else{
        $('#reckon').text('0.00');
        $('#increase').text('0.00');
    }

}