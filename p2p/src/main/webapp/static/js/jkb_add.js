var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;

function F_Open_dialog(){
    document.getElementById("fpic").click();
}
function F_Open_dialog1(){
    document.getElementById("ypic").click();
}
function F_Open_dialog2(){
    document.getElementById("qpic").click();
}
function F_Open_dialog3(){
    document.getElementById("tpic").click();
}
var i=true;
function addElementImg(obj) {
    if(i){
        var ul = document.getElementById(obj);
        var img = document.createElement("img");
        img.setAttribute("id", "newImg");
        img.setAttribute("style", "width:113px;height:50px");
        img.setAttribute("class", "small_img");
        img.src = "";
        ul.appendChild(img);
        i=false;
        var input = document.getElementById("fpic");
        var $img = $('#newImg');
        input.addEventListener('change',readFile,false);
        function readFile(){
            var file=this.files[0];
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $("#addpshow").show();
            $img.attr('src',dataURL);
        }
    }
}
var j=true;
function addElementImg1(obj) {
    if(j){
        var ul = document.getElementById(obj);
        var img = document.createElement("img");
        img.setAttribute("id", "newImg1");
        img.setAttribute("style", "width:113px;height:50px");
        img.src = "";
        ul.appendChild(img);
        j=false;
        var input = document.getElementById("ypic");
        var $img = $('#newImg1');
        input.addEventListener('change',readFile,false);
        function readFile(){
            var file=this.files[0];
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $("#addpshow1").show();
            $img.attr('src',dataURL);
        }
    }
}
var k=true;
function addElementImg2(obj) {
    if(k){
        var ul = document.getElementById(obj);
        var img = document.createElement("img");
        img.setAttribute("id", "newImg2");
        img.setAttribute("style", "width:113px;height:50px");
        img.src = "";
        ul.appendChild(img);
        k=false;
        var input = document.getElementById("qpic");
        var $img = $('#newImg2');
        input.addEventListener('change',readFile,false);
        function readFile(){
            var file=this.files[0];
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $("#addpshow2").show();
            $img.attr('src',dataURL);
        }
    }
}
var l=true;
function addElementImg3(obj) {
    if(l){
        var ul = document.getElementById(obj);
        var img = document.createElement("img");
        img.setAttribute("id", "newImg3");
        img.setAttribute("style", "width:113px;height:50px");
        img.src = "";
        ul.appendChild(img);
        l=false;
        var input = document.getElementById("tpic");
        var $img = $('#newImg3');
        input.addEventListener('change',readFile,false);
        function readFile(){
            var file=this.files[0];
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $("#addpshow3").show();
            $img.attr('src',dataURL);
        }
    }
}
$(function(){
    $(".sub-nav li").bind("click",function(){
        $(".sub-nav li").removeClass("active");
        $(this).addClass("active");

    });
    $(".xialakuang").mouseover(function (){
        $(".xialakuang .sub-nav").show();
    }).mouseout(function (){
        $(".xialakuang .sub-nav").hide();
    });
    $(".no").mouseover(function (){
        $("#qrCodeDiv").show();
    }).mouseout(function (){
        $("#qrCodeDiv").hide();
    });
    $("#qrCodeDiv").mouseover(function (){
        $("#qrCodeDiv").show();
    }).mouseout(function (){
        $("#qrCodeDiv").hide();
    });
})
function save(url, formId) {
    $.post(basePath + url,
        $("#" + formId).serialize(),
        function (data) {
            if (data.result === "ok") {
                $("#bdid").val(data.code);
                swal(data.code, data.message, "success");
                $("#btn_upate").click();
            } else {
                swal("申请失败！", 请稍后再试, "error");
            }
        },
        'json'
    );
}