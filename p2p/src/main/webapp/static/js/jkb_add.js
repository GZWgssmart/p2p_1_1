function F_Open_dialog(){
    document.getElementById("upload").click();
}
function F_Open_dialog1(){
    document.getElementById("upload1").click();
}
function F_Open_dialog2(){
    document.getElementById("upload2").click();
}
function F_Open_dialog3(){
    document.getElementById("upload3").click();
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
        var input = document.getElementById("upload");
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
        var input = document.getElementById("upload1");
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
        var input = document.getElementById("upload2");
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
        var input = document.getElementById("upload3");
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