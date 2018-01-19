/**
 * shulin.wu@pjzb.com
 * date 11/26
 */
var phone;
var localObj = window.location;
var basePath = localObj.protocol + "//" + localObj.host;
$(function(){
	/*
	utils.ajax({
        url:'front/regIpayPersonal.do',
        data:{},
        dataType:'json',
        success: function(data){
        	if(data.error == '0' && data.idNo!='' && data.idNo!='null'){
        		$('#Name').val(data.realName).attr('disabled',true);
        		$('#idCard').val(data.idNo).attr('disabled',true);
        	}
//        	$('#phone').val(data.mobilePhone).attr('disabled',true);
        	phone = data.mobilePhone;
        	$('.regist-box').show();
        }
    });

	$('#getMsgCode').click(function(){
		utils.getSmsCode($(this),$('#phone').val(),'huifuRegist');
	});*/
	$('.btn').click(function(){
		submit();
	})
});

function submit(){
	var Name = $('#Name').val();
	var idCard = $('#idCard').val();
	var Age = $('#Age').val();
	var Marriage = $('#Marriage').val();
	var bschool = $('#School').val();
    var Address = $('#Address').val();
    var Job = $('#Job').val();;
    var eduBack = $('#eduBack').val();
	if(Name==''){
		showError('请输入真实姓名',$('#Name'));
		return;
	};
	if(idCard==''){
		showError('请输入身份证号',$('#idCard'));
		return;
	};
	if(!utils.isIdCard(idCard)){
		showError('请输入正确的身份证号',$('#idCard'));
		return;
	};
	if(Age==''){
		showError('请输入手机号码',$('#phone'));
		return;
	};
	if(School==''){
		showError('请输入毕业院校',$('#School'));
		return;
	};
	if(Address==''){
        showError('请输入居住地址',$('#Address'));
        return;
    };
    if(Job==''){
        showError('请输入当前职业',$('#Job'));
        return;
    };
	$('.btn').addClass('disabled').text('认证中...').unbind('click');
	$.post(
        basePath + '/rzvip/save',
        $("#form1").serialize(),
        function(data){
        	// utils.alert("身份认证已提交，请等待审核！");
        	if(data.result === 'ok'){
                window.location.href=basePath + '/user/user_safe';
        	}
		},
		"json"
    );
}
//错误提示
function showError(msg,obj){
	$('.error-msg').text(msg).addClass('show');
	obj.parent('.from').addClass('error');
	obj.focus(function(){
		obj.parent('.from').removeClass('error');
		$('.error-msg').removeClass('show');
	});
}