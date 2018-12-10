<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员主页面</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <%--<link href="/static_resources/font-awesome/css/font-awesome.css" rel="stylesheet">--%>

    <link href="/static_resources/Admin/nav/css/nav.css" rel="stylesheet">

    <link href="/static_resources/Admin/nav/fonts/iconfont.css" rel="stylesheet">

    <script src="/static_resources/Admin/nav/js/nav.js"></script>


</head>
<body style="">

<!--侧边导航栏开始-->
<div  class="nav col-lg-3" style="min-height: 100%;">
    <div class="nav-top">
        <div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)"><img src="/static_resources/Admin/nav/images/mini.png" ></div>
    </div>
    <ul>
        <li class="nav-item">
            <a href="javascript:;"><i class="my-icon nav-icon icon_1"></i><span>管理电影</span><i class="my-icon nav-more"></i></a>
            <ul>
                <li id="li_one"><a href="javascript:;"><span >查看电影</span></a></li>
                <li id="li_two"><a href="javascript:;"><span >添加电影</span></a></li>
                <li id="li_five"><a href="javascript:;"><span >上传电影媒体信息</span></a></li>
            </ul>
        </li>
        <li class="nav-item" id="li_three">
            <a href="javascript:;"><i class="my-icon nav-icon icon_2"></i><span>用户管理</span><i class="my-icon nav-more"></i></a>
            <%--<ul>--%>
                <%--<li><a href="javascript:;"><span>站内新闻</span></a></li>--%>
                <%--<li><a href="javascript:;"><span>站内公告</span></a></li>--%>
                <%--<li><a href="javascript:;"><span>登录日志</span></a></li>--%>
            <%--</ul>--%>
        </li>
        <li class="nav-mini" id="li_four">
            <a href="javascript:;"><i class="my-icon nav-icon icon_3"></i><span>标签管理</span></a>
            <%--<ul>--%>
                <%--<li><a href="javascript:;"><span>订单列表</span></a></li>--%>
                <%--<li><a href="javascript:;"><span>打个酱油</span></a></li>--%>
                <%--<li><a href="javascript:;"><span>也打酱油</span></a></li>--%>
            <%--</ul>--%>
        </li>
    </ul>
</div>
<!--侧边导航栏结束-->
<!--右侧展示内容-->
<div class="container col-lg-10" style="background-color: white;height: 650px;">
    <%--<div id="matter1">--%>
        <%--<jsp:include page="movie.jsp"></jsp:include>--%>
    <%--</div>--%>
    <%--<div id="matter2" style="display: none">--%>
        <%--<jsp:include page="addmovie.jsp"></jsp:include>--%>
    <%--</div>--%>
    <%--<div id="matter3" style="display: none">--%>
        <%--<jsp:include page="user.jsp"></jsp:include>--%>
    <%--</div>--%>
    <%--<div id="matter4" style="display: none">--%>
        <%--<jsp:include page="label.jsp"></jsp:include>--%>
    <%--</div>--%>
    <%--<div id="matter5" style="display: none">--%>
        <%--<jsp:include page="upload.jsp"></jsp:include>--%>
    <%--</div>--%>
        <iframe src="127.0.0.1:8090/findAll" frameborder='0' scrolling="no" class="container col-lg-12 " style="height:100%;margin:0px;float:left;">    //右栏原始页面
        </iframe>
</div>
<!--右侧展示内容end-->

<script type="text/javascript">
    $(function () {
        $("#li_one").click(function(){
            $("iframe").attr("src", "movie.jsp");
        });
        $("#li_two").click(function(){

            $("iframe").attr("src", "addmovie.jsp");
        });
        $("#li_three").click(function(){

            $("iframe").attr("src", "127.0.0.1:8090/findAll");
        });
        $("#li_four").click(function(){

            $("iframe").attr("src", "label.jsp");
        });
        $("#li_five").click(function(){

            $("iframe").attr("src", "upload.jsp");
        });
    });
</script>


<script>
    $(document).ready(function() {
        var temp = "none";

        $("#li_one").click(function () {
            openMatter(1);
        });
        $("#li_two").click(function () {
            openMatter(2);
        });
        $("#li_three").click(function () {
            openMatter(3);
        });
        $("#li_four").click(function () {
            openMatter(4);
        });
        $("#li_five").click(function () {
            openMatter(5);
        });
        function openMatter(obj) {
            for (var i = 1; i < 6; i++) {
                if (i == obj) {
                    temp = "block";
                } else {
                    temp = "none";
                }
                document.getElementById("matter" + i).style.display = temp;

            }
        }
    });
</script>
</body>
</html>