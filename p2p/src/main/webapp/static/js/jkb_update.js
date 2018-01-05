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
            $img.attr('src',dataURL);
        }
    }
}
var j=true;
function addElementImg1(obj) {
    if(j){

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
            $img.attr('src',dataURL);
        }
    }
}
var k=true;
function addElementImg2(obj) {
    if(k){

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
            $img.attr('src',dataURL);
        }
    }
}
var l=true;
function addElementImg3(obj) {
    if(l){

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
            $img.attr('src',dataURL);
        }
    }
}
function update(url, formId) {
    $.post(basePath + url,
        $("#" + formId).serialize(),
        function (data) {
            if (data.result === "ok") {
                $("#baid").val(data.code);
                swal(data.code, data.message, "success");
                $("#btn_upate").click();
            } else {
                swal("申请失败！", 请稍后再试, "error");
            }
        },
        'json'
    );
}
