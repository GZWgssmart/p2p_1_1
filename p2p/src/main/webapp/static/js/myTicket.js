var localObj = window.location;
var contextPath = localObj.protocol + "//" + localObj.host;
var oPage;
$(function(){
    dtasteData();
    //代金券按钮
    $('#dLink').click(function(){
        if($(this).hasClass('active')){
            return;
        };
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'0'},500);
        dtasteData();
    });
    //加息券按钮
    $('#jLink').click(function(){
        if($(this).hasClass('active')){
            return;
        };
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'120px'},500);
        jtasteData();
    });
    //现金券按钮
    $('#xLink').click(function(){
        if($(this).hasClass('active')){
            return;
        };
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'240px'},500);
        xtasteData();
    });
    //体验金按钮
    var tBox = $('#ttaste');
    $('#tLink').click(function(){
        if($(this).hasClass('active')){
            return;
        };
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'360px'},500);
        ttasteData(data);
    });
})

//代金券
function dtasteData(){
    $('#xtaste').hide();$('#ttaste').hide();$('#jtaste').hide();$('#dtaste').show();
    //未使用
    var dtasteData1 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var msg1='',msg2='',msg3="";
            var dtastHtml = '<div class="bg-nouse"><div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a href="investlist.html" class="taste-btn">立即使用</a>'+
                '</div></div>'
            return dtastHtml;
        }
        }
    ]
    //已使用
    var dtasteData2 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var msg1='',msg2='',msg3="";
            var dtastHtml = '<div class="bg-nouse"><div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a href="investlist.html" class="taste-btn">立即使用</a>'+
                '</div></div>'
            return dtastHtml;
        }
        }
    ]
    //已过期
    var dtasteData3 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var msg1='',msg2='',msg3="";
            var dtastHtml = '<div class="bg-nouse"><div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a href="investlist.html" class="taste-btn">立即使用</a>'+
                '</div></div>'
            return dtastHtml;
        }
        }
    ]

    var params = {
        couponType:"" ,//代金券， 3 加息券， 2 现金券
        useType: "",// 未使用， 2已使用， 3已过期
    };
    var dtastePage = new Page(contextPath + '/uticket/select',params,$('.dtaste-listData1 .nouse'),$('.dtaste-listData1 .paging'),dtasteData1,function(){});
    $('#Dunused').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 1 ,//代金券， 3 加息券， 2 现金券
            useType: 1,// 未使用， 2已使用， 3已过期
        };
        $('.dtaste-listData1').show().siblings('div.dtaste-listData').hide();

        dtastePage = new Page('/uticket/select',params,$('.dtaste-listData1 .nouse'),$('.dtaste-listData1 .paging'),dtasteData1,function(){});
    });

    $('#Dused').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 1 ,//代金券， 3 加息券， 2 现金券
            useType: 2,// 未使用， 2已使用， 3已过期
        };
        $('.dtaste-listData2').show().siblings('div.dtaste-listData').hide();

        dtastePage = new Page('/uticket/select',params,$('.dtaste-listData2 .use'),$('.dtaste-listData2 .paging'),dtasteData2,function(){});
    });
    $('#Dexpired').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 1 ,//代金券， 3 加息券， 2 现金券
            useType: 3,// 未使用， 2已使用， 3已过期
        };
        $('.dtaste-listData3').show().siblings('div.dtaste-listData').hide();
        dtastePage = new Page('/uticket/select',params,$('.dtaste-listData3 .overdue'),$('.dtaste-listData3 .paging'),dtasteData3,function(){});
    });
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