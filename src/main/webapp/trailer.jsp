<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>预告片页面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <script src="/static_resources/cookie/jquery.cookie.min.js"></script>

    <link rel="icon" href="image/logo.PNG" type="image/x-icon"/>

    <style type="text/css">
        .demo{padding: 2em 0;}
        .box{
            text-align: center;
            overflow: hidden;
            position: relative;
        }
        .box:before{
            content: "";
            width: 0;
            height: 100%;
            background: #000;
            padding: 14px 18px;
            position: absolute;
            top: 0;
            left: 50%;
            opacity: 0;
            transition: all 500ms cubic-bezier(0.47, 0, 0.745, 0.715) 0s;
        }
        .box:hover:before{
            width: 100%;
            left: 0;
            opacity: 0.5;
        }
        .box img{
            width: 100%;
            height: auto;
        }
        .box .box-content{
            width: 100%;
            padding: 14px 18px;
            color: #fff;
            position: absolute;
            top: 38%;
            left: 0;
        }
        .box .title{
            font-size: 25px;
            font-weight: 600;
            line-height: 30px;
            text-transform: uppercase;
            margin: 0;
            opacity: 0;
            transition: all 0.5s ease 0s;
        }
        .box .post{
            font-size: 15px;
            text-transform: capitalize;
            opacity: 0;
            transition: all 0.5s ease 0s;
        }
        .box:hover .title,
        .box:hover .post{
            opacity: 1;
            transition-delay: 0.7s;
        }
        .box .icon{
            padding: 0;
            margin: 0;
            list-style: none;
            margin-top: 15px;
        }
        .box .icon li{
            display: inline-block;
        }
        .box .icon li a{
            display: block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            border-radius: 50%;
            background: #337ab7;
            font-size: 20px;
            font-weight: 700;
            color: #fff;
            margin-right: 5px;
            opacity: 0;
            transform: translateY(50px);
            transition: all 0.5s ease 0s;
        }
        .box:hover .icon li a{
            opacity: 1;
            transform: translateY(0px);
            transition-delay: 0.5s;
        }
        .box:hover .icon li:last-child a{
            transition-delay: 0.8s;
        }
        @media only screen and (max-width:990px){
            .box{ margin-bottom: 30px; }
        }
    </style>
</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="getMoving"><img class="img-circle" src="image/logo.PNG" style="width:55px;height:55px;margin-top: -15px"></a>
        </div>
        <div>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input class="form-control" type="text" placeholder="毒液">
                </div>
                <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                <!--<input type="submit" value="图片">-->
            </form>
            <!--<a href="" class="btn btn-primary btn-sm navbar-btn navbar-right">联系我们</a>-->
            <div class="profile navbar-right">
                <ul class="nav navbar-nav" id="navuser">
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
                    <li><a href="login.jsp" class="a globalLoginBtn"><span
                            class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>
                    <li><a href="register.jsp">注册</a></li>
                    <li>
                        <a href="tips_message.jsp">
                            <span class="badge pull-right">3</span>消息
                        </a>
                    </li>
                    <li>
                        <a style="width: 40px;height: 40px" href="personInfo.jsp"><img src="/image/test.jpg" class="img-circle img-responsive" style="width: 40px;height: 40px;margin-top: -10px"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<script>
    $(document).ready(function () {
        $("#navuser").empty();
        var appendhtml="";
        var id=$.cookie("id");
        if($.cookie("id")!=0){
            if($.cookie("id")!=-1&&$.cookie("id")!=undefined){
                appendhtml+='<li><a href="login.jsp" onclick="login_out()"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>';
                appendhtml+='<li>'+
                    '<a href=getMessage?id='+id+'>'+
                    '<span class="badge pull-right"><div id="count"/></span>消息'+
                    '</a>'+
                    '</li>';
                appendhtml+='<li>'+
                    '<a style="width: 40px;height: 40px" href=userMessage?id='+id+'><img src="/image/test.jpg"'+
                    'class="img-circle img-responsive"'+
                    'style="width: 40px;height: 40px;margin-top: -10px"></a>'+
                    '</li>';
                $.ajax({
                    type:"get",
                    url:"getCountMessage",
                    async: true,
                    data:{
                        id:id
                    },
                    success:function (flag) {
                        if (flag!=null){
                            $("#count").append(flag);
                        }

                    }

                })
            }
            else{
                appendhtml+='<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>'+
                    '<li><a href="register.jsp">注册</a></li>';
            }
        }
        $("#navuser").append(appendhtml);


    })

    function login_out() {
        $.cookie("id",-1);
        $.cookie("token",-1);
    }
</script>
<!--最受关注电影预告片-->
<div id="myCarousel" class="carousel slide  col-md-8 col-md-offset-2">
        <!-- 轮播（Carousel）指标 -->
        <h2>最受欢迎预告片</h2>
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
            <c:forEach items="${trailers}" var="trailer" begin="0" end="0">
                <img src="${trailer.images[0].path}"  alt="First slide">
                <div class="carousel-caption">
                    <h1>
                        <a href="trailergetTrailer?id=${trailer.id}">
                            <span class="glyphicon glyphicon-play"></span>
                        </a>
                    </h1>
                </div>
            </c:forEach>
            </div>
            <c:forEach items="${trailers}" var="trailer" begin="1" end="2">
            <div class="item">
                <img src="${trailer.images[0].path}"  alt="Second slide">
                <div class="carousel-caption">
                    <h1>
                        <a href="trailergetTrailer?id=${trailer.id}">
                            <span class="glyphicon glyphicon-play"></span>
                        </a>
                    </h1>
                </div>
            </div>
            </c:forEach>

        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

<!--即将上映，影院热映，最新上传，热门的预告片-->
<div class="container">
    <!--即将上映-->
    <div class="row">
        <div class="col-md-9 col-md-offset-1">
            <h2 style="margin-left: 30px;">即将上映</h2>
            <ul class="list-inline">

                    <c:set var="today">
                        <fmt:formatDate type="date" value="<%=new Date()%>"/>
                    </c:set>
            <c:forEach items="${trailers}" var="trailer" begin="0" end="7">
                <c:choose>
                <c:when test="${trailer.release_time>today}">
                <li style="margin-left: 30px;">
                    <!--此处的图片应为对应预告片的图片-->
                    <div class="box">
                        <img src="${trailer.images[0].path}" class="img-rounded" style="width: 150px;height: 130px">
                        <div class="box-content">
                            <ul class="icon">
                                <li><a href="trailergetTrailer?id=1"><span class="glyphicon glyphicon-play" ></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="caption">
                        <a href="trailermovie.jsp">${trailer.name}</a>
                        <p class="text-primary"><fmt:formatDate value="${trailer.release_time}" pattern="yyyy-MM-dd"/>上映</p>
                    </div>
                </li>
                </c:when>
                </c:choose>
                </c:forEach>
            </ul>
        </div>

    </div>
    <!--影院热映-->
    <div class="row">
        <div class="col-md-9 col-md-offset-1">
            <h2 style="margin-left: 30px;">影院热映</h2>
            <ul class="list-inline">
                <c:forEach items="${trailers}" var="trailer" begin="0" end="7">
                    <c:choose>
                        <c:when test="${today>=trailer.release_time}">
                <li style="margin-left: 30px;">
                    <!--此处的图片应为对应预告片的图片-->
                    <div class="box">
                        <img src="${trailer.images[0].path}" class="img-rounded" style="width: 150px;height: 130px">
                        <div class="box-content">
                            <ul class="icon">
                                <li><a href="trailermovie.jsp"><span class="glyphicon glyphicon-play" ></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="caption">
                        <a href="#">${trailer.name}</a>
                        <p class="text-primary">已上映</p>
                    </div>
                </li>
                    </c:when>
                    </c:choose>
                </c:forEach>


            </ul>

        </div>


    </div>
    <!--最新上传-->
    <div class="row">
        <div class="col-md-9 col-md-offset-1">
            <h2 style="margin-left: 30px;">最新上传</h2>
            <ul class="list-inline">

                <c:forEach items="${trailers}" var="trailer">
                    <fmt:parseDate value="${today}" var="tod" pattern="yyyy-MM-dd"/>
                    <fmt:parseDate value="${trailer.time}" var="time" pattern="yyyy-MM-dd"/>
                    <fmt:formatNumber value="${(tod.getTime()-time.getTime())/1000/60/60/24}" pattern="#0" var="date"/>
                <c:choose >
                <c:when test="${date<=30&&date>=0}">
                <li style="margin-left: 30px;">
                    <!--此处的图片应为对应预告片的图片-->
                    <div class="box">
                        <img src="${trailer.images[0].path}" class="img-rounded" style="width: 150px;height: 130px">
                        <div class="box-content">
                            <ul class="icon">
                                <li><a href="trailermovie.jsp"><span class="glyphicon glyphicon-play" ></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="caption">
                        <a href="#">${trailer.name}</a>
                        <p class="text-primary"><fmt:formatDate value="${trailer.time}" pattern="yyyy-MM-dd"/> 上传</p>
                    </div>
                </li>
                </c:when>
                </c:choose>
                </c:forEach>


            </ul>

        </div>


    </div>
</div>
<!--底部版权信息-->
<!--底部版权信息-->
<div style="font:12px Tahoma;color: white;text-align:center;">
    <div style="background-color: #0f0f0f">
        <hr/>
        Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;
        xxx小组 ALL RIGHT RESERVED<br/>
        联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>

    </div>
</div>
</body>
</html>