var path = "http://"+window.location.host+"/upload/";

$(function (){

    $.post('/notice/indexno',
        function(data) {
        if(data != undefined){
            var newsContent = $('#newsContent');
            var topNewContent = $('#news-list');
            for(var i = 0;i<data.length;i++){
                var obj = data[i];
                var newsLi = $('<li><a href="/notice/nopage?nid='+obj.nid+'" target="_blank">'+obj.title+'</a><span>'+obj.date.substring(0,10)+'</span></li>');
                var topNews = $('<li><span>最新公告：&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="/notice/nopage?nid='+obj.nid+'" target="_blank">'+obj.title+'</a></li>');
                newsLi.appendTo(newsContent);
                topNews.appendTo(topNewContent);
            }
            noticeSlide(topNewContent);
        }

    },
        "json"
    );

    $.post("/friend/selectlist",
        function(data) {
            if(data != undefined) {
                //友情链接
                var linkListContent = $('#linkList');
                for(var i=0;i<data.length;i++){
                    var lineobjs = data[i];
                    var linkLi = $('<li><a target="view_frame" href="'+lineobjs.furl+'" title="'+lineobjs.rname+'"><img src="'+path+''+lineobjs.fpic+'" alt="'+lineobjs.rname+'"></a></li>');
                    linkLi.appendTo(linkListContent);
                }
                //友情链接滚动
                var oLinklist = linkListContent.find('li').size();
                var oLinkBox = $('.link-list-box');
                linkListContent.css('width',oLinklist*292+'px');
                oLinkBox.css('width',oLinklist*292*2+'px');
                var linkList2 = $('#linkList2').html(linkListContent.html()).css('width',oLinklist*292+'px');
                var oLinkTime = window.setInterval(start,100);
                oLinkBox[0].onmouseover = function(){
                    window.clearInterval(oLinkTime);
                }
                oLinkBox[0].onmouseout = function(){
                    oLinkTime = setInterval(start,40);
                }
            }
        },
    "json"
    );

});

function start(){
    if ($('#linkList2')[0].offsetWidth - $('.link-list')[0].scrollLeft <= 0){
        $('.link-list')[0].scrollLeft -= $('#linkList')[0].offsetWidth;
    }else{
        $('.link-list')[0].scrollLeft++;
    }
}

//公告轮播
function noticeSlide(obj){
    var ul=obj,noTime;
    ul.css({height:obj.find('li').size()*48+'px',top:'0px'});
    //开始轮播
    oTimer=setTimeout(start, 3000);
    var i=1;
    function start() {
        i++;
        if(i>=obj.find('li').size()){
            ul.css('top', '0px');
            i=0;
        };
        ul.stop().animate({
                top:-48*i},
            200, function() {
            });
        oTimer=setTimeout(start, 3000);
    }
    ul.hover(function(){
        clearTimeout(oTimer)
    }, function(){
        oTimer=setTimeout(start, 3000);
    });
}
