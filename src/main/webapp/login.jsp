
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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="UTF-8">
<title>登录页面</title>

<link rel="stylesheet" href="/static_resources/login-register/css/style.css">
<link rel="stylesheet" href="/static_resources/confirm/css/jquery.slider.css"/>

<script type="text/javascript" src="/static_resources/confirm/js/jquery.min.js"></script>
<script type="text/javascript" src="/static_resources/confirm/js/jquery.slider.min.js"></script>

<link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
<script src="/static_resources/toastr/toastr.min.js"></script>

<script src="/static_resources/cookie/jquery.cookie.min.js"></script>

<link rel="icon" href="image/logo.PNG" type="image/x-icon"/>


<style>

</style>
<body>

<div class="login-container">
    <h1>登录</h1>

    <div class="connect">
        <p>doubansshshow</p>
    </div>
    <form id="loginForm">
        <div>
            <input type="text" id="username" name="username" class="username" placeholder="用户名" autocomplete="off"/>
        </div>
        <div>
            <input type="password" id="password" name="password" class="password" placeholder="密码"
                   oncontextmenu="return false" onpaste="return false"/>
        </div>

        <div class="container" style="margin-top: 10px;">
            <div>
                <div id="slider2" class="slider"></div>
                <span style="display: none" id="result2">false</span>
            </div>
        </div>
        <button id="submit" type="submit" class="buttontest">登录</button>
    </form>

    <script>
        var messageOpts = {
            "closeButton": true,//是否显示关闭按钮
            "debug": false,//是否使用debug模式
            "positionClass": "toast-top-right",//弹出窗的位置
            "onclick": null,
            "showDuration": "3000",//显示的动画时间
            "hideDuration": "1000",//消失的动画时间
            "timeOut": "300000000",//展现时间
            "extendedTimeOut": "1000",//加长展示时间
            "showEasing": "swing",//显示时的动画缓冲方式
            "hideEasing": "linear",//消失时的动画缓冲方式
            "showMethod": "fadeIn",//显示时的动画方式
            "hideMethod": "fadeOut" //消失时的动画方式
        };
        toastr.options = messageOpts;

    </script>
    <script>

        $("#slider2").slider({
            width: 300, // width
            height: 40, // height
            sliderBg: "rgb(134, 134, 131)", // 滑块背景颜色
            color: "#fff", // 文字颜色
            fontSize: 14, // 文字大小
            bgColor: "#33CC00", // 背景颜色
            textMsg: "按住滑块，拖拽验证", // 提示文字
            successMsg: "验证通过", // 验证成功提示文字
            successColor: "red", // 滑块验证成功提示文字颜色
            time: 400, // 返回时间
            callback: function (result) { // 回调函数，true(成功),false(失败)
                $("#result2").text(result);
            }
        });

    </script>


    <a href="register.jsp">
        <button type="button" class="register-tis buttontest2">还没有账号？立即注册</button>
    </a>

</div>
<!--验证start-->

<!--验证模块end-->
<script src="/static_resources/login-register/js/common.js"></script>
<!--轮播背景图-->
<script src="/static_resources/login-register/js/supersized.3.2.7.min.js"></script>
<script src="/static_resources/login-register/js/supersized-init.js"></script>
<!---->
<script src="/static_resources/login-register/js/jquery.validate.min.js?var1.14.0"></script>
<!--<script>-->
    <!--function login() {-->
        <!--var email = $("#email").val(),-->
            <!--password = $("#password").val(),-->
            <!--flag = true;-->
        <!--if (flag = true) {-->
            <!--$.ajax({-->
                <!--url: "http://localhost:8090/user_login",-->
                <!--type: 'GET',-->
                <!--async: false,-->
                <!--data: {"email": email, "password": password},-->
                <!--success: function (data) {-->
                    <!--console.log(data);-->
                    <!--if (data.username != "" && data.username != undefined) {-->
                        <!--alert("登录成功！")-->
                        <!--if (data.username == "admin") {-->
                            <!--window.location.href = "http://localhost:8090/user_bgmainjsp";-->
                        <!--} else {-->
                            <!--sessionStorage.setItem("username",data.username);-->
                            <!--window.location.href = "http://localhost:8090/user_mainjsp";-->
                        <!--}-->
                    <!--}else {-->
                        <!--alert("密码错误");-->
                    <!--}-->
                <!--},-->
                <!--dataType: "json"-->
            <!--});-->
        <!--}-->
    <!--}-->
<!--</script>-->
<!--底部版权信息-->
<!--<div style="font:12px Tahoma;color: white; margin:0px auto; text-align:center;">-->
<!--<div style="background-color: #0f0f0f">-->
<!--<hr/>-->
<!--Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;-->
<!--xxx小组 ALL RIGHT RESERVED<br/>-->
<!--联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>-->

<!--</div>-->
<!--</div>-->
</body>
</html>