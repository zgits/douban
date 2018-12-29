//打开字滑入效果
window.onload = function(){
	$(".connect p").eq(0).animate({"left":"0%"}, 600);
	$(".connect p").eq(1).animate({"left":"0%"}, 400);
};
//jquery.validate表单验证
$(document).ready(function(){
	//登陆表单验证
	$("#loginForm").validate({
		rules:{
            username:{
                required:true,
                minlength:3,
                maxlength:32,
            },
			password:{
				required:true,
				minlength:3, 
				maxlength:32,

			},
		},
		//错误信息提示
		messages:{
            username:{
                required:"请输入用户名",
                minlength:"用户名至少为3个字符",
                maxlength:"用户名至多为32个字符",
            },
			// username:{
			// 	required:"必须填写用户名",
			// 	minlength:"用户名至少为3个字符",
			// 	maxlength:"用户名至多为32个字符",
			// 	remote: "用户名已存在",
			// },
			password:{
				required:"必须填写密码",
				minlength:"密码至少为3个字符",
				maxlength:"密码至多为32个字符",
			},
		},

        submitHandler:function () {
            var e = document.getElementById("result2").innerHTML;
            if (e == "true") {
                $.ajax({
                    url:'login_login',
                    type:"post",
                    data:{
                        "username":$("#username").val(),
                        "password":$("#password").val()
                    },
                    success:function (data) {

                        if(data.length!=1){
                            var data_obj=$.parseJSON(data);
                            var json=data_obj.data[0];
                            $.cookie('id', json.id);
                            $.cookie('token', json.token);
                            window.location.href='getMoving';
                        }
                        if(data==0){
                        	$.cookie('id',0);
                            window.location.href='bgmain';
                        } else if(data==2){
                            toastr.error("用户名或密码错误");
                        }else if(data==3){
                            toastr.warning("用户名不存在");
                        }
                    }

                })

            } else {
                toastr.warning("请先验证");

            }
        },
        invalidHandler: function(form, validator) {  //不通过回调
            return false;
        }


	});
	//注册表单验证
	$("#registerForm").validate({
		rules:{
			username:{
				required:true,//必填
				minlength:3, //最少6个字符
				maxlength:32,//最多20个字符
				remote:{
					url:"login_checkUsername",//用户名重复检查，别跨域调用，填写检查所用的用户名是否重复的地址
					type:"post",
					data:{
						username:function () {
							return $("#username").val();
                        },

					}
				},
			},
			password:{
				required:true,
				minlength:3, 
				maxlength:32,
			},
			confirm_password:{
				required:true,
				minlength:3,
				equalTo:'.password'
			},
			code:{
				required:true,
			},
			phone:{
				required:true,
				phone:true,//自定义的规则
				digits:true,//整数
                remote:{
                    url:"login_checkPhone",//用户名重复检查，别跨域调用，填写检查所用的用户名是否重复的地址
                    type:"post",
                    data:{
                        phone:function () {
                            return $("#phone").val();
                        },

                    }
                },
			}
		},
		//错误信息提示
		messages:{
			username:{
				required:"必须填写用户名",
				minlength:"用户名至少为3个字符",
				maxlength:"用户名至多为32个字符",
				remote: "用户名已存在",
			},
			password:{
				required:"必须填写密码",
				minlength:"密码至少为3个字符",
				maxlength:"密码至多为32个字符",
			},
			confirm_password:{
				required: "请再次输入密码",
				minlength: "确认密码不能少于3个字符",
				equalTo: "两次输入密码不一致",//与另一个元素相同
			},
			code:{
                required:"必须填写验证码",
			},
			phone:{
				required:"请输入手机号码",
				digits:"请输入正确的手机号码",
                remote: "手机号已注册",
			},
		
		},

        submitHandler:function () {
            $.ajax({
                url:'login_register',
                type:"post",
                data:{
                    "username":$("#username").val(),
                    "password":$("#password").val(),
                    "phone":$("#phone").val(),
                },
                success:function (data) {
                    if(data==3){
                        toastr.success("注册成功");
                        setTimeout("window.location.href='login.jsp';",3000);
                    }else{
                        toastr.warning("注册失败");
                    }
                }
            })
        },
        invalidHandler: function(form, validator) {  //不通过回调
            return false;
        }
    });

	// 添加自定义验证规则
	jQuery.validator.addMethod("phone", function(value, element) {
		var length = value.length;
		var phone_number = /^1[34578]\d{9}$/;
		return this.optional(element) || (length == 11 && phone_number.test(value));
	}, "手机号码格式错误");
});
