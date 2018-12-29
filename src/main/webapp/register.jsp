<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<c:set var="basepath" value="<%=basePath%>" />
<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>注册页面</title>

<%--<!-- 新 Bootstrap 核心 CSS 文件 -->--%>
<%--<link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/static_resources/bootstrap/jquery/jquery.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="/static_resources/login-register/css/style.css">


<link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
<script src="/static_resources/toastr/toastr.min.js"></script>


<body>

<div class="register-container" style="width: 340px">
    <h1>欢迎注册</h1>

    <div class="connect">
        <p>doubansshshow</p>
    </div>

    <form id="registerForm">

        <div>
            <input type="text" name="phone" id="phone" class="phone" placeholder="手机号码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="password" id="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="password" id="confirm_password" name="confirm_password" class="confirm_password" placeholder="确认密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="text" id="username" name="username" class="username" placeholder="设置用户名" autocomplete="off"/>
        </div>
        <div>
            <input type="text" id="code" name="code" class="code" placeholder="请输入验证码" autocomplete="off"/>
            <div id="test">
            </div>
            <!--验证码js在/login-register/js/common.js下，可以去掉，如果不行的话-->

                <a style="width:270px;height:40px;margin-top: 5px" class="btn btn-success" id="moBtn" href="javascript:;" onclick="sendMsgCode()">获取验证码</a>
                <a style="width:270px;margin-top: 5px;display:none" class="btn" disabled="disabled" id="secondShow" href="javascript:;"></a>



            <script>
                var countdown=30;  // 时长 s
                // 获取验证码按钮点击事件
                function sendMsgCode() {
                    //异步验证验证码
                    var varcode= $("#code"); // 这里获取输入的注册码
                    var  tipsmsg=  $("#msg")  // 提示框对象
                    var s="<label id='code-error' class='error' for='code'>验证码错误</label>"
                    $.ajax({
                        url: "后台验证地址",
                        async:false, // 关闭异步

                        success:function (data){ 用回调函数检查服务器返回的结果
                            if (data=="0"){  未通过//返回的结果自己更改，以及判断条件
                                document.getElementById("test").innerHTML += s;
                                return false;
                            }else{ //通过
                                tipsmsg.html('成功');
                                return true;
                            }

                        }
                    });
                    //end
                    $("#secondShow").css('display','inline-block');
                    $("#secondShow").css('background-color','#5cb85c');
                    $("#secondShow").css('color','#fff');
                    $("#secondShow").css('border-color','#4cae4c');
                    $("#secondShow").css('height','40px');
                    $("#moBtn").css('display','none');
                    $("#secondShow").html('重新发送('+countdown+'s)');
                    var timer = setInterval(function () {
                        if (countdown == 0) {
                            clearInterval(timer);
                            $("#secondShow").css('display','none');
                            $("#moBtn").css('display','inline-block');
                            $("#moBtn").css('border-color','#4cae4c');
                            $("#moBtn").css('width','270px');
                            $("#moBtn").css('height','40px');
                            countdown = 30;
                            console.log(countdown);
                        }
                        $("#secondShow").html('重新发送('+(countdown-1)+'s)');
                        countdown--;
                    }, 1000);
                };
            </script>
        </div>

        <button id="submit" type="submit" class="buttontest">注册</button>
    </form>
    <a href="login.jsp">
        <button type="button" class="register-tis buttontest2">已有账号？登录</button>
    </a>


    <script>

        var messageOpts = {
            "closeButton": true,//是否显示关闭按钮
            "debug": false,//是否使用debug模式
            "positionClass": "toast-top-right",//弹出窗的位置
            "onclick": null,
            "showDuration": "3000",//显示的动画时间
            "hideDuration": "1000",//消失的动画时间
            "timeOut": "3000",//展现时间
            "extendedTimeOut": "1000",//加长展示时间
            "showEasing": "swing",//显示时的动画缓冲方式
            "hideEasing": "linear",//消失时的动画缓冲方式
            "showMethod": "fadeIn",//显示时的动画方式
            "hideMethod": "fadeOut" //消失时的动画方式
        };
        toastr.options = messageOpts;

        function register() {
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
        }

    </script>

</div>

<!--&lt;!&ndash;底部版权信息&ndash;&gt;-->
<!--<div style="font:12px Tahoma;color: white; margin:0px auto; text-align:center;">-->
    <!--<div style="background-color: #0f0f0f">-->
        <!--<hr/>-->
        <!--Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;-->
        <!--xxx小组 ALL RIGHT RESERVED<br/>-->
        <!--联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>-->

    <!--</div>-->
<!--</div>-->
</body>
<script src="static_resources/login-register/js/common.js"></script>
<!--背景轮播-->
<script src="static_resources/login-register/js/supersized.3.2.7.min.js"></script>
<script src="static_resources/login-register/js/supersized-init.js"></script>
<!--数据验证-->
<script src="static_resources/login-register/js/jquery.validate.min.js?var1.14.0"></script>
</html>




<!--<!DOCTYPE html>-->
<!--<html lang="zh-CN">-->
<!--<meta charset="UTF-8">-->
<!--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<!--<title>注册页面</title>-->

<!--&lt;!&ndash; 新 Bootstrap 核心 CSS 文件 &ndash;&gt;-->
<!--<link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">-->

<!--&lt;!&ndash; jQuery文件。务必在bootstrap.min.js 之前引入 &ndash;&gt;-->
<!--<script src="/static_resources/bootstrap/jquery/jquery.min.js" type="text/javascript"></script>-->

<!--&lt;!&ndash; 最新的 Bootstrap 核心 JavaScript 文件 &ndash;&gt;-->
<!--<script src="/static_resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
<!--<link rel="stylesheet" href="/static_resources/login-register/css/style.css">-->
<!--<body>-->

<!--<div class="register-container">-->
    <!--<h1>欢迎注册</h1>-->

    <!--<div class="connect">-->
        <!--<p>doubansshshow</p>-->
    <!--</div>-->

    <!--<form action="" method="post" id="registerForm">-->
        <!--<div>-->
            <!--<input id="email" type="email" name="email" class="email" placeholder="邮箱地址" oncontextmenu="return false"-->
                   <!--onpaste="return false"/>-->
        <!--</div>-->
        <!--<div>-->
            <!--<input id="password" type="password" name="password" class="password" placeholder="密码"-->
                   <!--oncontextmenu="return false" onpaste="return false"/>-->
        <!--</div>-->
        <!--<div>-->
            <!--<input id="confirm_password" type="password" name="confirm_password" class="confirm_password"-->
                   <!--placeholder="确认密码" oncontextmenu="return false" onpaste="return false"/>-->
        <!--</div>-->
        <!--<div>-->
            <!--<input id="username" type="text" name="username" class="username" placeholder="设置用户名" autocomplete="off"/>-->
        <!--</div>-->
        <!--<div>-->
            <!--<input type="text" id="code" name="code" class="code" placeholder="请输入验证码" autocomplete="off"/>-->
            <!--<div id="test">-->
            <!--</div>-->
            <!--&lt;!&ndash;验证码js在/login-register/js/common.js下，可以去掉，如果不行的话&ndash;&gt;-->

            <!--<a style="width:270px;height:40px;margin-top: 5px" class="btn btn-success" id="moBtn" href="javascript:;"-->
               <!--onclick="sendMsgCode()">获取验证码</a>-->
            <!--<a style="width:270px;margin-top: 5px;display:none" class="btn" disabled="disabled" id="secondShow"-->
               <!--href="javascript:;"></a>-->


            <!--<script>-->
                <!--var countdown = 30;  // 时长 s-->
                <!--// 获取验证码按钮点击事件-->
                <!--function sendMsgCode() {-->
                    <!--//异步验证验证码-->
                    <!--var varcode = $("#code"); // 这里获取输入的注册码-->
                    <!--var tipsmsg = $("#msg")  // 提示框对象-->
                    <!--var s = "<label id='code-error' class='error' for='code'>验证码错误</label>"-->
                    <!--$.ajax({-->
                        <!--url: "后台验证地址",-->
                        <!--async: false, // 关闭异步-->

                        <!--success: function (data) {-->
                            <!--用回调函数检查服务器返回的结果-->
                            <!--if (data == "0") {-->
                                <!--未通过//返回的结果自己更改，以及判断条件-->
                                <!--document.getElementById("test").innerHTML += s;-->
                                <!--return false;-->
                            <!--} else { //通过-->
                                <!--tipsmsg.html('成功');-->
                                <!--return true;-->
                            <!--}-->

                        <!--}-->
                    <!--});-->
                    <!--//end-->
                    <!--$("#secondShow").css('display', 'inline-block');-->
                    <!--$("#secondShow").css('background-color', '#5cb85c');-->
                    <!--$("#secondShow").css('color', '#fff');-->
                    <!--$("#secondShow").css('border-color', '#4cae4c');-->
                    <!--$("#secondShow").css('height', '40px');-->
                    <!--$("#moBtn").css('display', 'none');-->
                    <!--$("#secondShow").html('重新发送(' + countdown + 's)');-->
                    <!--var timer = setInterval(function () {-->
                        <!--if (countdown == 0) {-->
                            <!--clearInterval(timer);-->
                            <!--$("#secondShow").css('display', 'none');-->
                            <!--$("#moBtn").css('display', 'inline-block');-->
                            <!--$("#moBtn").css('border-color', '#4cae4c');-->
                            <!--$("#moBtn").css('width', '270px');-->
                            <!--$("#moBtn").css('height', '40px');-->
                            <!--countdown = 30;-->
                            <!--console.log(countdown);-->
                        <!--}-->
                        <!--$("#secondShow").html('重新发送(' + (countdown - 1) + 's)');-->
                        <!--countdown&#45;&#45;;-->
                    <!--}, 1000);-->
                <!--};-->
            <!--</script>-->
        <!--</div>-->

        <!--<button id="submit" type="button" onclick="register()">注册</button>-->
    <!--</form>-->
    <!--<a href="login.jsp">-->
        <!--<button type="button" class="register-tis">已有账号？登录</button>-->
    <!--</a>-->

<!--</div>-->
<!--&lt;!&ndash;&lt;!&ndash;底部版权信息&ndash;&gt;&ndash;&gt;-->
<!--&lt;!&ndash;<div style="font:12px Tahoma;color: white; margin:0px auto; text-align:center;">&ndash;&gt;-->
<!--&lt;!&ndash;<div style="background-color: #0f0f0f">&ndash;&gt;-->
<!--&lt;!&ndash;<hr/>&ndash;&gt;-->
<!--&lt;!&ndash;Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;&ndash;&gt;-->
<!--&lt;!&ndash;xxx小组 ALL RIGHT RESERVED<br/>&ndash;&gt;-->
<!--&lt;!&ndash;联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>&ndash;&gt;-->

<!--&lt;!&ndash;</div>&ndash;&gt;-->
<!--&lt;!&ndash;</div>&ndash;&gt;-->
<!--</body>-->
<!--<script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>-->
<!--<script src="static_resources/login-register/js/common.js"></script>-->
<!--&lt;!&ndash;背景轮播&ndash;&gt;-->
<!--<script src="static_resources/login-register/js/supersized.3.2.7.min.js"></script>-->
<!--<script src="static_resources/login-register/js/supersized-init.js"></script>-->
<!--&lt;!&ndash;数据验证&ndash;&gt;-->
<!--<script src="static_resources/login-register/js/jquery.validate.min.js?var1.14.0"></script>-->
<!--<script>-->
    <!--function register() {-->
        <!--var email = $("#email").val(),-->
            <!--password = $("#password").val(),-->
            <!--confirmpassword = $("#confirm_password").val(),-->
            <!--username = $("#username").val(),-->
            <!--flag = true;-->
        <!--if (password != confirmpassword) {-->
            <!--alert("两次密码不一致");-->
            <!--return false;-->
        <!--}-->
        <!--if (flag = true) {-->
            <!--$.ajax({-->
                <!--url: "http://localhost:8080/user_register",-->
                <!--type: 'GET',-->
                <!--async: false,-->
                <!--data: {"email": email, "password": password, "username": username},-->
                <!--success: function (data) {-->
                    <!--if (data.flag == "-1") {-->
                        <!--alert("注册成功");-->
                        <!--window.location.href = "http://localhost:8080/user_loginhtml";-->
                    <!--} else if (data.flag == "1") {-->
                        <!--alert("邮箱已被注册")-->
                    <!--}-->
                <!--},-->
                <!--dataType: "json"-->
            <!--});-->
        <!--}-->
    <!--}-->
<!--</script>-->
<!--</html>-->