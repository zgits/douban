<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<c:set var="basepath" value="<%=basePath%>" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>电影详情页</title>


    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js" type="text/javascript"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


    <link href="/static_resources/pinglun/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="/static_resources/pinglun/js/star-rating.js" type="text/javascript"></script>

    <script src="/static_resources/cookie/jquery.cookie.min.js"></script>

    <style type="text/css">

        .loading {
            width: 50px;
            height: 50px;
            position: fixed;
            top: 50%;
            left: 50%;
            margin-top: -25px;
            margin-left: -25px;
            z-index: 9999;
        }
        #loading {
            margin-top: 10px;
        }
        .demo {
            padding: 2em 0;
        }

        .box {
            text-align: center;
            overflow: hidden;
            position: relative;
        }

        .box:before {
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

        .box:hover:before {
            width: 100%;
            left: 0;
            opacity: 0.5;
        }

        .box img {
            width: 100%;
            height: auto;
        }

        .box .box-content {
            width: 100%;
            padding: 14px 18px;
            color: #fff;
            position: absolute;
            top: 38%;
            left: 0;
        }

        .box .title {
            font-size: 25px;
            font-weight: 600;
            line-height: 30px;
            text-transform: uppercase;
            margin: 0;
            opacity: 0;
            transition: all 0.5s ease 0s;
        }

        .box .post {
            font-size: 15px;
            text-transform: capitalize;
            opacity: 0;
            transition: all 0.5s ease 0s;
        }

        .box:hover .title,
        .box:hover .post {
            opacity: 1;
            transition-delay: 0.7s;
        }

        .box .icon {
            padding: 0;
            margin: 0;
            list-style: none;
            margin-top: 15px;
        }

        .box .icon li {
            display: inline-block;
        }

        .box .icon li a {
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

        .box:hover .icon li a {
            opacity: 1;
            transform: translateY(0px);
            transition-delay: 0.5s;
        }

        .box:hover .icon li:last-child a {
            transition-delay: 0.8s;
        }

        @media only screen and (max-width: 990px) {
            .box {
                margin-bottom: 30px;
            }
        }

    </style>

    <link rel="icon" href="image/logo.PNG" type="image/x-icon"/>

    <!--点赞-->
    <link type="text/css" rel="stylesheet" href="/static_resources/likes/dianzan/Css/demo.css">

    <!--显示星数-->
    <link href="static_resources/star/star.css" rel="stylesheet">

    <link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
    <script src="/static_resources/toastr/toastr.min.js"></script>

    <script src="/static_resources/cookie/jquery.cookie.min.js"></script>


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
<!--电影详情介绍-->
<div class="container">
    <h1>${oneMovie.moviename}</h1>
    <!--电影简单介绍页-->
    <div class="row">
        <!--电影海报页-->
        <div class="col-xs-2">
            <img src="${oneMovie.images[0].path}" style="width: 140px;height: 150px">

        </div>
        <input id="hiddenmovieId" type="hidden" value="${oneMovie.id}">
        <!--电影基本信息页-->
        <div class="col-md-6">
            <div>
                <ul class="list-group">
                    <li class="list-group-item" style="border: none">
                        导演: ${oneMovie.director}
                    </li>
                    <%--<li class="list-group-item" style="border: none">--%>
                        <%--编剧: 阿什利·鲍威尔 / 汤姆·麦卡锡 / E·T·A·霍夫曼--%>
                    <%--</li>--%>
                    <c:choose>
                        <c:when test="${fn:length(fn:split(oneMovie.actor,'/' ))<=5}">
                        <li class="list-group-item" style="border: none">
                        主演: <c:forEach items="${fn:split(oneMovie.actor,'/' )}" var="actor">
                            ${actor}/
                    </c:forEach>
                        <a data-toggle="collapse"
                           href="#collapse"></a>
                        </c:when>
                        <c:otherwise>
                            <li class="list-group-item" style="border: none">
                            主演: <c:forEach items="${fn:split(oneMovie.actor,'/' )}" var="actor" begin="0" end="4">
                            ${actor}/
                        </c:forEach>
                            <a data-toggle="collapse"
                               href="#collapse">更多</a>
                            <div id="collapse" class="panel-collapse collapse">
                               <c:forEach items="${fn:split(oneMovie.actor,'/' )}" var="actor" begin="5" >
                                    ${actor}/
                               </c:forEach>
                                <%--/ 艾丽·巴姆博 / 米兰达·哈特 / 欧赫尼奥·德尔维斯 / 杰克·怀特霍尔 / 理查德·E·格兰特 / 谢尔盖·波卢宁 / 欧米德·吉亚李利 / 梅拉·沙尔 / 尼克·穆罕默德 /&ndash;%&gt;--%>
                                <%--杰茜·维宁 / 汤姆·斯威特 / 马里安·洛伦西克 / 芙洛·费拉科 / 丽塔-麦克唐纳丹帕 / 查尔斯·斯特里特--%>
                            </div>
                            </li>
                    </c:otherwise>
                    </c:choose>
                    <li class="list-group-item" style="border: none">
                        类型: <c:forEach items="${labels}" var="label">
                        ${label.labelName}/
                    </c:forEach>
                    </li>
                    <li class="list-group-item" style="border: none">
                        制片国家/地区: ${oneMovie.region}
                    </li>
                    <li class="list-group-item" style="border: none">
                        语言: ${oneMovie.language}
                    </li>
                    <li class="list-group-item" style="border: none">
                        上映日期: <fmt:formatDate value="${oneMovie.release_time}" pattern="yyyy-MM-dd"/>(${oneMovie.release_region}/美国)
                    </li>
                    <li class="list-group-item" style="border: none">
                        片长:${oneMovie.length}分钟
                    </li>
                </ul>
            </div>
        </div>
        <!--评分列表-->


        <div class="col-md-4">
            <div>
                <div class="row">
                    评分
                </div>
                <div class="row">


                    <div class="col-sm-2">
                        <span style="font-weight: bold;font-size: 15px">${oneMovie.filmscore}</span>
                    </div>
                    <div class="col-sm-5">
                        <div id="star_con_movie${oneMovie.id}" class="star-vote">
                            <span id="add_star_movie${oneMovie.id}" class="add-star"></span>
                            <span id="del_star_movie${oneMovie.id}" class="del-star"></span>
                        </div>
                        ${Counts}人评价
                        <script>
                            window.onload = showStar(${oneMovie.filmscore});

                            //n表示后台获取的星数
                            function showStar(n) {
                                var con_wid = document.getElementById("star_con_movie${oneMovie.id}").offsetWidth;
                                var del_star = document.getElementById("del_star_movie${oneMovie.id}");
                                console.log(con_wid);

                                //透明星星移动的像素
                                var del_move = (n * con_wid) / 10;

                                del_star.style.backgroundPosition = -del_move + "px 0px";
                                del_star.style.left = del_move + "px";
                            }
                        </script>
                    </div>
                </div>
            </div>

            <%--有问题--%>
            <div class="row">
                <ul class="list-group">
                    <li class="list-group-item" style="border: none">
                        <div class="row">
                            <div class="col-md-2">
                                5星
                            </div>
                            <div class="col-md-4" style="margin-left: -20px;height: 20px">
                                <div class="progress">
                                    <c:set var="num" value="${0}"/>
                                    <c:set var="count" value="${0}"/>
                                    <c:forEach items="${scores}" var="score">
                                        <c:set var="count" value="${count+1}"/>
                                        <c:if test="${8<score&&score<=10}">
                                            <c:set var="num" value="${num+1}"/>
                                        </c:if>
                                    </c:forEach>
                                    <fmt:formatNumber value="${num/count}" var="result" pattern="#.0"/>
                                    <div class="progress-bar" style="width:${result*100}%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                ${result*100}%
                            </div>

                        </div>

                    </li>
                    <li class="list-group-item" style="border: none">
                        <div class="row">
                            <div class="col-md-2">
                                4星
                            </div>
                            <div class="col-md-4" style="margin-left: -20px;height: 20px">
                                <div class="progress">
                                    <c:set var="num" value="${0}"/>
                                    <c:set var="count" value="${0}"/>
                                    <c:forEach items="${scores}" var="score">
                                        <c:set var="count" value="${count+1}"/>
                                        <c:if test="${6<score&&score<=8}">
                                            <c:set var="num" value="${num+1}"/>
                                        </c:if>
                                    </c:forEach>
                                    <fmt:formatNumber value="${num/count}" var="result" pattern="#.0"/>
                                    <div class="progress-bar" style="width: ${result*100}%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                ${result*100}%
                            </div>

                        </div>
                    </li>
                    <li class="list-group-item" style="border: none">
                        <div class="row">
                            <div class="col-md-2">
                                3星
                            </div>
                            <div class="col-md-4" style="margin-left: -20px;height: 20px">
                                <div class="progress">
                                    <c:set var="num" value="${0}"/>
                                    <c:set var="count" value="${0}"/>
                                    <c:forEach items="${scores}" var="score">
                                        <c:set var="count" value="${count+1}"/>
                                        <c:if test="${4<score&&score<=6}">
                                            <c:set var="num" value="${num+1}"/>
                                        </c:if>
                                    </c:forEach>
                                    <fmt:formatNumber value="${num/count}" var="result" pattern="#.0" />

                                    <div class="progress-bar" style="width: ${result*100}%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                ${result*100}%
                            </div>

                        </div>
                    </li>
                    <li class="list-group-item" style="border: none">
                        <div class="row">
                            <div class="col-md-2">
                                2星
                            </div>
                            <div class="col-md-4" style="margin-left: -20px;height: 20px">
                                <div class="progress">
                                    <c:set var="num" value="${0}"/>
                                    <c:set var="count" value="${0}"/>
                                    <c:forEach items="${scores}" var="score">
                                        <c:set var="count" value="${count+1}"/>
                                        <c:if test="${2<score&&score<=4}">
                                            <c:set var="num" value="${num+1}"/>
                                        </c:if>
                                    </c:forEach>
                                    <fmt:formatNumber value="${num/count}" var="result" pattern="#.0"/>

                                    <div class="progress-bar" style="width: ${result*100}%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                ${result*100}%
                            </div>

                        </div>
                    </li>
                    <li class="list-group-item" style="border: none">
                        <div class="row">
                            <div class="col-md-2">
                                1星
                            </div>
                            <div class="col-md-4" style="margin-left: -20px;height: 20px">
                                <div class="progress">
                                    <c:set var="num" value="${0}"/>
                                    <c:set var="count" value="${0}"/>
                                    <c:forEach items="${scores}" var="score">
                                        <c:set var="count" value="${count+1}"/>
                                        <c:if test="${0<score&&score<=2}">
                                            <c:set var="num" value="${num+1}"/>
                                        </c:if>
                                    </c:forEach>
                                    <fmt:formatNumber value="${num/count}" var="result" maxFractionDigits="2" />

                                    <div class="progress-bar" style="width: ${result*100}%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                ${result*100}%
                            </div>

                        </div>
                    </li>
                </ul>
            </div>
            <%--有问题--%>

        </div>

    </div>

    <!--评分项-->
    <div class="row">
        <div id="div_input_score" hidden>
            <input id="input-21e" name="score" value="0" type="number" class="rating globalLoginBtn" min=0 max=5 step=1 data-size="xs">
        </div>
        <script>
            jQuery(document).ready(function () {
                $.ajax({
                    url:"moviecomment_alreadyRated",
                    type:"post",
                    data:{
                        "userId":$.cookie("id"),
                        "movieId":${oneMovie.id}
                    },
                    success:function (data) {
                        if(data==1){
                            $("#div_input_score").show();
                            $(".rating-kv").rating();
                        }
                    }
                })

            });
        </script>
    </div>

    <!--剧情简介-->
    <div class="row">
        <div class="col-md-8">
            <h4 style="color: #2f904d">
                ${oneMovie.moviename}电影剧情简介
            </h4>
            <div>
               ${oneMovie.plot_introduction }
            </div>
        </div>

    </div>

    <!--显示预告片等信息-->
    <br>
    <!--暂时显示3个预告片，更多稍后添加-->
    <div class="row">
        <h4 style="color: #2f904d">
            ${oneMovie.moviename}电影相关预告片
        </h4>
        <ul class="list-inline">
            <c:forEach items="${oneMovie.images}" var="image" begin="0" end="2">
            <li>
                <div class="box">
                    <img src="${image.path}" class="img-rounded" style="width: 150px;height: 130px">
                    <div class="box-content">
                        <ul class="icon">
                            <li><a href="trailermovie.jsp"><span class="glyphicon glyphicon-play"></span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>

    <!--评论显示界面-->
    <div class="row">
        <h4 style="color: #2f904d">
            ${oneMovie.moviename}电影的短评(共<span id="countcomments">${fn:length(oneMovie.movieComments)}</span>条)
        </h4>
        <!--Ajax异步得到-->
        <div class="row">
            <ul class="nav navbar-nav">
                <li><a href="#">热门</a></li>
                <li><a href="#">最新</a></li>
            </ul>
        </div>
        <div class="row" id="showcomment">
            <ul class="list-group" style="width: 800px">

                <c:choose>
                    <c:when test="${empty oneMoive.movieComments}">
                        <c:forEach items="${oneMovie.movieComments}" var="moviecomments" varStatus="status">
                            <li class="list-group-item" style="border: none">
                                <!--显示个人信息以及评论时间，点赞数-->
                                <div class="row">
                                    <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>${moviecomments.username}</span>
                                    &nbsp;&nbsp;<fmt:formatDate value="${moviecomments.time}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>


                                    <c:if test="${not empty moviecomments.score}">
                                        <!--星数展示start-->
                                        <div id="${moviecomments.id}" class="star-vote">
                                            <span id="add_staruser${status.count}" class="add-star"></span>
                                            <span id="del_staruser${status.count}" class="del-star"></span>
                                        </div>
                                        <!--根据用户的id来生成对应的名字-->
                                        <script>
                                            window.onload = showStar${moviecomments.id}(${moviecomments.score});

                                            //n表示后台获取的星数
                                            function showStar${moviecomments.id}(n) {
                                                var con_wid = document.getElementById("${moviecomments.id}").offsetWidth;
                                                var del_star = document.getElementById("del_staruser${status.count}");
                                                console.log(con_wid+del_star);

                                                //透明星星移动的像素
                                                var del_move = (n * con_wid) / 10;

                                                del_star.style.backgroundPosition = -del_move + "px 0px";
                                                del_star.style.left = del_move + "px";
                                            }
                                        </script>
                                        <!--星数展示end-->
                                    </c:if>

                                    <!--点赞start-->
                                    <div class="praise">
                            <span id="praise1"><img src="/static_resources/likes/dianzan/Images/zan.png"
                                                    id="praise1-img" style="width: 20px;height:20px"/></span>
                                        <span id="praise-txt1" style="margin-top: -40px;margin-left: 30px">1455</span>
                                        <span id="add-num1"><em>+1</em></span>
                                    </div>
                                    <!--点赞end-->
                                </div>
                                <br>
                                <div class="row">
                                        ${moviecomments.content}
                                </div>

                                <div class="row col-md-offset-10">
                                    <c:choose>
                                        <c:when test="${moviecomments.userId eq cookie['id'].value || cookie['id'].value==0}">
                                            <a class="btn btn-sm" onclick="deletecomment(${moviecomments.id})">删除</a>

                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-sm">举报</a>
                                        </c:otherwise>
                                    </c:choose>

                                    <a data-toggle="collapse" data-parent="#accordion"
                                       href="#r${moviecomments.id}" class="btn btn-sm">回复</a>
                                </div>
                                <div id="r${moviecomments.id}" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-horizontal">
                                                <div class="form-group col-md-8">
                                                    <input id="tor${moviecomments.id}" class="form-control" type="text" placeholder="@${moviecomments.username}:">
                                                </div>

                                                <input onclick="replyComment(tor${moviecomments.id},'${moviecomments.id}','${moviecomments.userId}',${cookie['id'].value},1)" class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <ul class="list-group">
                                                <c:forEach items="${moviecomments.movieReplycomments}" var="reply" varStatus="status">
                                                    <li class="list-group-item">
                                                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <span>${reply.username}</span>
                                                        &nbsp;&nbsp;<fmt:formatDate value="${reply.time}" pattern="yyyy-MM-dd:HH:mm:ss"></fmt:formatDate>

                                                        <br>
                                                        <div class="row">
                                                            <span class="col-md-offset-1">回复@${reply.to_userIdusername}:${reply.content}</span>

                                                            <c:choose>
                                                                <c:when test="${reply.userId eq cookie['id'].value || cookie['id'].value==0}">
                                                                    <a class="btn btn-sm col-md-offset-10" onclick="deletecomment2(${reply.id})">删除</a>

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a class="btn btn-sm col-md-offset-10">举报</a>
                                                                </c:otherwise>
                                                            </c:choose>

                                                            <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                               href="#div${moviecomments.id}${status.count}">回复</a>
                                                        </div>
                                                        <div id="div${moviecomments.id}${status.count}" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div class="form-group col-md-8">
                                                                    <input id="s${reply.id}" class="form-control" type="text" placeholder="@${reply.username}:">

                                                                </div>
                                                                <input onclick="replyComment2(s${reply.id},${moviecomments.id},${reply.id},${reply.userId},${cookie['id'].value},2)" class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                                            </div>

                                                        </div>
                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <hr>
                        </c:forEach>

                    </c:when>
                    <c:otherwise>
                        暂无评论信息
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

        <div class="modal fade" id="delcfmModel1">
            <div class="modal-dialog modal-sm">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                        <h4 class="modal-title">提示信息</h4>
                    </div>
                    <div class="modal-body">
                        <p>您确认要删除吗？</p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="replyid"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="deletereply()" class="btn btn-info" data-dismiss="modal">确定</a>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

        <div class="modal fade" id="delcfmModel2">
            <div class="modal-dialog modal-sm">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                        <h4 class="modal-title">提示信息</h4>
                    </div>
                    <div class="modal-body">
                        <p>您确认要删除吗？</p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="commentId"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="deletemoviecomment()" class="btn btn-info" data-dismiss="modal">确定</a>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>


        <div id="loading" style="display: block">
            <div class="loading show">
                <img src='/image/loading1.gif' />
            </div>
        </div>
        <script>
            <%--对评论的回复的函数--%>

            function deletecomment(id) {
                $('#commentId').val(id);
                $('#delcfmModel2').modal();
            }
            function deletecomment2(replyid) {
                $('#replyid').val(replyid);//给会话中的隐藏属性URL赋值
                $('#delcfmModel1').modal();
            }
            window.onload=function(){
                $("#loading").hide();
            }
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
            function replyComment(contentId,commentId,to_userId,userId,type) {
                var content=$(contentId).val();
                var commentId=commentId;
                var to_userId=to_userId;
                var userId=userId;
                $(contentId).val("");
                if(content==""){
                    toastr.warning("输入不能为空");
                    return;
                }
                $.ajax({
                    type:"post",
                    url:"${basepath}/rmoviereplycommentinsertReplyComment",
                    data:{
                        "movie_replycomment.content":content,
                        "movie_replycomment.comment_id":commentId,
                        "movie_replycomment.to_userId":to_userId,
                        "movie_replycomment.userId":userId,
                        "movie_replycomment.reply_type":type,
                        "token":$.cookie("token")
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success:function (data) {
                        $("#loading").hide();
                        if(data==1){
                            toastr.success('回复成功');
                        }else if(data==2){
                            toastr.error("回复失败");
                        }else if(data==3){
                            toastr.warning("请先登录");
                            setTimeout("window.location='login.jsp'",2000);
                        }
                        setTimeout("window.location.reload()",3000);
                    }
                })
            }

            function replyComment2(contentId,commentId,to_id,to_userId,userId,type) {
                var content=$(contentId).val();
                var commentId=commentId;
                var to_userId=to_userId;
                var userId=userId;
                var to_id=to_id;
                $(contentId).val("");

                if(content==""){
                    toastr.warning("输入不能为空");
                    return;
                }
                $.ajax({
                    type:"post",
                    url:"${basepath}/rmoviereplycommentinsertReplyComment",
                    data:{
                        "movie_replycomment.content":content,
                        "movie_replycomment.comment_id":commentId,
                        "movie_replycomment.to_userId":to_userId,
                        "movie_replycomment.userId":userId,
                        "movie_replycomment.reply_type":type,
                        "movie_replycomment.reply_id":to_id,
                        "token":$.cookie("token")
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success:function (data) {
                        $("#loading").hide();
                        if(data==1){
                            toastr.success('回复成功');
                        }else if(data==2){
                            toastr.error("回复失败");
                        }else if(data==3){
                            toastr.warning("请先登录");
                            setTimeout("window.location='login.jsp'",2000);
                        }
                        setTimeout("window.location.reload()",3000);
                    }
                })
            }

            function deletemoviecomment() {
                var id = $.trim($("#commentId").val());
                $.ajax({
                    url:"${basepath}/moviecomment_delete",
                    type:"post",
                    data:{
                        "id":id
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success:function (data) {
                        $("#loading").hide();
                        if(data==1){
                            toastr.success('删除成功');
                        }else{
                            toastr.error("删除失败");
                        }
                        setTimeout("window.location.reload()",3000);
                    }
                })
            }

            function deletereply() {
                var id = $.trim($("#replyid").val());
                $.ajax({
                    url:"${basepath}/rmoviereplycommentdeleteReplyComment",
                    type:"post",
                    data:{
                        "id":id
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success:function (data) {
                        $("#loading").hide();
                        if(data==1){
                            toastr.success('删除成功');
                        }else{
                            toastr.error("删除失败");
                        }
                        setTimeout("window.location.reload()",3000);
                    }
                })
            }

        </script>
        <script>
            /*
             * 动态点赞
             * 此效果包含css3，部分浏览器不兼容（如：IE10以下的版本）
             */
            $(function () {
                $("#praise1").click(function () {
                    var praise_img = $("#praise1-img");
                    var text_box = $("#add-num1");
                    var praise_txt = $("#praise-txt1");
                    var num = parseInt(praise_txt.text());
                    if (praise_img.attr("src") == ("/static_resources/likes/dianzan/Images/yizan.png")) {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/zan.png' id='praise1-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.removeClass("hover");
                        text_box.show().html("<em class='add-animation'>-1</em>");
                        $(".add-animation").removeClass("hover");
                        num -= 1;
                        praise_txt.text(num)
                    } else {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/yizan.png' id='praise1-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.addClass("hover");
                        text_box.show().html("<em class='add-animation'>+1</em>");
                        $(".add-animation").addClass("hover");
                        num += 1;
                        praise_txt.text(num)
                    }
                });
                $("#praise2").click(function () {
                    var praise_img = $("#praise2-img");
                    var text_box = $("#add-num2");
                    var praise_txt = $("#praise-txt2");
                    var num = parseInt(praise_txt.text());
                    if (praise_img.attr("src") == ("/static_resources/likes/dianzan/Images/yizan.png")) {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/zan.png' id='praise2-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.removeClass("hover");
                        text_box.show().html("<em class='add-animation'>-1</em>");
                        $(".add-animation").removeClass("hover");
                        num -= 1;
                        praise_txt.text(num)
                    } else {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/yizan.png' id='praise2-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.addClass("hover");
                        text_box.show().html("<em class='add-animation'>+1</em>");
                        $(".add-animation").addClass("hover");
                        num += 1;
                        praise_txt.text(num)
                    }
                });
                $("#praise3").click(function () {
                    var praise_img = $("#praise3-img");
                    var text_box = $("#add-num3");
                    var praise_txt = $("#praise-txt3");
                    var num = parseInt(praise_txt.text());
                    if (praise_img.attr("src") == ("/static_resources/likes/dianzan/Images/yizan.png")) {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/zan.png' id='praise3-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.removeClass("hover");
                        text_box.show().html("<em class='add-animation'>-1</em>");
                        $(".add-animation").removeClass("hover");
                        num -= 1;
                        praise_txt.text(num)
                    } else {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/yizan.png' id='praise3-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.addClass("hover");
                        text_box.show().html("<em class='add-animation'>+1</em>");
                        $(".add-animation").addClass("hover");
                        num += 1;
                        praise_txt.text(num)
                    }
                });
                $("#praise4").click(function () {
                    var praise_img = $("#praise4-img");
                    var text_box = $("#add-num4");
                    var praise_txt = $("#praise-txt4");
                    var num = parseInt(praise_txt.text());
                    if (praise_img.attr("src") == ("/static_resources/likes/dianzan/Images/yizan.png")) {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/zan.png' id='praise4-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.removeClass("hover");
                        text_box.show().html("<em class='add-animation'>-1</em>");
                        $(".add-animation").removeClass("hover");
                        num -= 1;
                        praise_txt.text(num)
                    } else {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/yizan.png' id='praise4-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.addClass("hover");
                        text_box.show().html("<em class='add-animation'>+1</em>");
                        $(".add-animation").addClass("hover");
                        num += 1;
                        praise_txt.text(num)
                    }
                });
                $("#praise5").click(function () {
                    var praise_img = $("#praise5-img");
                    var text_box = $("#add-num5");
                    var praise_txt = $("#praise-txt5");
                    var num = parseInt(praise_txt.text());
                    if (praise_img.attr("src") == ("/static_resources/likes/dianzan/Images/yizan.png")) {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/zan.png' id='praise5-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.removeClass("hover");
                        text_box.show().html("<em class='add-animation'>-1</em>");
                        $(".add-animation").removeClass("hover");
                        num -= 1;
                        praise_txt.text(num)
                    } else {
                        $(this).html("<img src='/static_resources/likes/dianzan/Images/yizan.png' id='praise5-img' class='animation' style='width: 20px;height:20px'/>");
                        praise_txt.addClass("hover");
                        text_box.show().html("<em class='add-animation'>+1</em>");
                        $(".add-animation").addClass("hover");
                        num += 1;
                        praise_txt.text(num)
                    }
                });
            })
        </script>
    </div>

    <!--自己评论界面-->
    <div class="row ">
        <div role="form col-md-8">

            <%--登录后可以获取id--%>
            <input id="userId" type="hidden" name="movie_comment.userId" value="${cookie['id'].value}">
            <input id="movieId" type="hidden" name="movie_comment.movieId" value="${oneMovie.id}">
            <div class="form-group" style="width: 800px ">
                <textarea id="content" name="movie_comment.content" class="form-control" rows="3"></textarea>
            </div>
            <div class="col-md-offset-8">
                <button onclick="moviecomment()" type="submit" class="btn btn-primary">发布</button>
            </div>
        </div>
    </div>

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
        function moviecomment() {

            var filmscore=null;
            var userId=document.getElementById("userId").value;
            var movieId=document.getElementById("movieId").value;
            var content=document.getElementById("content").value;
            $.ajax({
                url:"moviecomment_alreadyRated",
                type:"post",
                data:{
                    "userId":$.cookie("id"),
                    "movieId":$("#hiddenmovieId").val(),
                },
                success:function (data) {
                    if(data==1){
                        alert("ssdfasdf");
                        filmscore=$("#input-21e").val();
                        filmscore=filmscore*2;
                    }
                }
            })
            alert(filmscore);
            if(filmscore!=null){
                if(content==""||filmscore==0){
                    toastr.warning("评论或评分不能为空");
                    return;
                }
                $.ajax({
                    type:"post",
                    url:"${basepath}/moviecomment_insertComment",
                    data:{
                        "movie_comment.userId":userId,
                        "movie_comment.movieId":movieId,
                        "movie_comment.content":content,
                        "token":$.cookie("token"),
                        "movie_comment.score":filmscore
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success:function (data) {
                        $("#loading").hide();
                        if(data==1){
                            toastr.success('评论成功');
                        }else if(data==2){
                            toastr.error("评论失败");
                        }else if(data==3){
                            toastr.warning("请先登录");
                            setTimeout("window.location='login.jsp'",2000);
                        }
                        $("#content").val("");
                        setTimeout("window.location.reload()",3000);
                    }
                })
            }else if(filmscore==null){
                if(content==""){
                    toastr.warning("评论不能为空");
                    return;
                }

                $.ajax({
                    type:"post",
                    url:"${basepath}/moviecomment_insertComment",
                    data:{
                        "movie_comment.userId":userId,
                        "movie_comment.movieId":movieId,
                        "movie_comment.content":content,
                        "token":$.cookie("token")
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success:function (data) {
                        $("#loading").hide();
                        if(data==1){
                            toastr.success('评论成功');
                        }else if(data==2){
                            toastr.error("评论失败");
                        }else if(data==3){
                            toastr.warning("请先登录");
                            setTimeout("window.location='login.jsp'",2000);
                        }
                        $("#content").val("");
                        setTimeout("window.location.reload()",3000);
                    }
                })
            }



        }
    </script>
    <!--分页界面-->
    <div class="row">
        <div class="inner clearfix">
            <section id="main-content">

            </section>

        </div>
    </div>
    <script>


        var totalpagenow=0;

        $(document).ready(function(){
            var id=${oneMovie.id};
            $("#main-content").empty();

            $.ajax({
                type:'post',
                url:'${basepath}/getMovieCommentsBypage',
                data:{
                    "currPage":1,
                    "movieId":id
                },
                success:function (data) {
                    var obj=JSON.parse(data);
                    var appendpage="";
                    console.log(obj);
                    var totalPage=obj.totalPage;
                    var currPage=obj.currPage;
                    totalpagenow=obj.totalPage;
                    console.log(totalPage);
                    console.log(currPage);
                    console.log(obj.totalCount);

                    $("#countcomments").empty();
                    $("#countcomments").text(obj.totalCount);


                    if(totalPage>0){
                        appendpage+='<div class="text-center">'+
                            '<ul class="pagination">'+
                            '<li id="first" value="1" onclick="topage(first)"><a style="cursor: pointer">&laquo;</a></li>'+
                            '<li id="front" value="1" onclick="topage(front)"><a style="cursor: pointer">上一页</a></li>';
                        if(totalPage<=5){
                            for(var i=1;i<=totalPage;i++){
                                if(i==1){
                                    appendpage+= '<li id="page'+i+'" class="active" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';
                                }else{
                                    appendpage+= '<li id="page'+i+'" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';

                                }
                            }
                        }else{
                            for(var i=1;i<=5;i++){
                                if(i==1){
                                    appendpage+= '<li id="page'+i+'" class="active" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';
                                }else{
                                    appendpage+= '<li id="page'+i+'" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';

                                }
                            }
                        }
                        appendpage+='<li id="next" value="2" onclick="topage(next)"><a style="cursor: pointer">下一页</a></li>'+
                            '<li id="last" value="'+obj.totalPage+'"><a onclick="topage(last)" style="cursor: pointer">&raquo;</a></li>'+
                            '<li>'+
                            '<div class="col-sm-3" role="form">'+
                            '<div class="input-group">'+
                            '<input id="page" type="text" class="form-control">'+
                            '<span onclick="topage(page)" class="input-group-addon">go</span>'+
                            '</div>'+
                            '</div>'+
                            '</li>'+
                            '<li><a style="border: none">共'+obj.totalPage+'页</a></li>'+
                            '</ul>'+
                            '</div>';
                        $("#main-content").append(appendpage);
                    }


                }
            });


        })

        function changeDateFormat(cellval) {
            var dateVal = cellval + "";
            if (cellval != null) {
                var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

                var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
            }
        }

        function topage(id) {
            var page=$(id).val();
            if(page>totalpagenow){
                page=totalpagenow;
            }
            $.ajax({
                type:'post',
                url:'${basepath}/getMovieCommentsBypage',
                data:{
                    "currPage":page,
                    "movieId":${oneMovie.id}
                },
                success:function (data) {
                    var obj=JSON.parse(data);

                    console.log(obj);

                    var totalPage=obj.totalPage;

                    totalpagenow=obj.totalPage;


                    var currPage=obj.currPage;


                    $("#showcomment").empty();

                    $("#main-content").empty();

                    var comments=obj.lists;


                    var appendhtml="";//要添加的显示内容

                    var appendpage="";//分页的更改


                    appendhtml+='<ul class="list-group" style="width: 800px">';

                    for(var i=0;i<comments.length;i++){
                        appendhtml+=' <li class="list-group-item" style="border: none">'+
                            '<div class="row">'+
                            '<img class="img-circle" src="${basepath}/image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;'+
                            '<span>'+comments[i].username+'</span>'+
                            '&nbsp;&nbsp;'+changeDateFormat(comments[i].time);
                            if(typeof(comments[i].score)!="undefined"){
                            appendhtml+='<div id='+comments[i].id+' class="star-vote">'+
                                        '<span id=add_staruser'+i+' class="add-star"></span>'+
                                        '<span id=del_staruser'+i+' class="del-star"></span>'+
                                        '</div>';



                            }
                        appendhtml+='</div>'+
                                    '<br>'+
                                    '<div class="row">'+
                                    '&nbsp;&nbsp;'+
                                    comments[i].content+
                                    '</div>';
                        if(comments[i].userId==$.cookie("id") || ${cookie['id'].value}==0) {
                            appendhtml+='<div class="row col-md-offset-10">'+
                                '<a class="btn btn-sm" onclick="deletecomment('+comments[i].id+')">删除</a>'+
                                '<a data-toggle="collapse" data-parent="#accordion"'+
                                'href="#r'+comments[i].id+'" class="btn btn-sm">回复</a>'+
                                '</div>';
                        }
                        else {
                            appendhtml+='<div class="row col-md-offset-10">'+

                                '<a class="btn btn-sm">举报</a>'+
                                '<a data-toggle="collapse" data-parent="#accordion"'+
                                'href="#r'+comments[i].id+'" class="btn btn-sm">回复</a>'+
                                '</div>';
                        }
                        appendhtml+='<div id="r'+comments[i].id+'" class="panel-collapse collapse">'+
                            '<div class="panel-body">'+
                            '<div class="row">'+
                            '<div class="form-horizontal">'+
                            '<div class="form-group col-md-8">'+
                            '<input id="tor'+comments[i].id+'" class="form-control" type="text" placeholder="@'+comments[i].username+':">'+
                            '</div>'+
                            '<input type="submit" class="col-md-offset-2 btn btn-success" onclick="replyComment(tor'+comments[i].id+','+comments[i].id+','+comments[i].userId+','+$.cookie("id")+',1)" value="回复">'+
                            '</div>'+
                            '</div>'+
                            '<div class="row">'+
                            '<ul class="list-group">';

                        var replycomments=comments[i].movieReplycomments;
                        console.log(replycomments);

                        for(var j=0;j<replycomments.length;j++){
                            appendhtml+= '<li class="list-group-item">'+
                                        '<img class="img-circle" src="${basepath}/image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;'+
                                        '<span>'+replycomments[j].username+'</span>'+
                                        '&nbsp;&nbsp;'+changeDateFormat(replycomments[j].time)+
                                        '<br>'+
                                        '<div class="row">'+
                                        '<span class="col-md-offset-1">回复@'+replycomments[j].to_userIdusername+':'+replycomments[j].content+'</span>';
                            if(replycomments[j].userId==$.cookie("id") || ${cookie['id'].value}==0){
                                appendhtml+='<div class="row col-md-offset-10">'+
                                    '<a class="btn btn-sm" onclick="deletecomment2('+replycomments[j].id+')">删除</a>'+
                                    '<a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"'+
                                    'href="#div'+comments[i].id+j+'">回复</a>'+
                                    '</div>';
                            }else{
                                appendhtml+='<div class="row col-md-offset-10">'+
                                    '<a class="btn btn-sm">举报</a>'+
                                    '<a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"'+
                                    'href="#div'+comments[i].id+j+'">回复</a>'+
                                    '</div>';
                            }
                            appendhtml+='</div>'+
                                '<div id="div'+comments[i].id+j+'" class="panel-collapse collapse">'+
                                '<div class="panel-body">'+
                                '<div class="form-group col-md-8">'+
                                '<input id="s'+replycomments[j].id+'" class="form-control" type="text" placeholder="@'+replycomments[j].username+':">'+
                                '</div>'+
                                '<input onclick="replyComment2(s'+replycomments[j].id+','+comments[i].id+','+replycomments[j].id+','+replycomments[j].userId+','+$.cookie("id")+',2)" class="col-md-offset-2 btn btn-success" type="submit" value="回复">'+
                                '</div>'+
                                '</div>'+
                                '</li>';

                        }

                        appendhtml+='</ul></div> </div> </div> </li> <hr>';


                    }

                    if(totalPage>0){
                        var front=currPage-1;
                        if(front<=0){
                            front=1;
                        }
                        var next=currPage+1;
                        if(next>totalPage){
                            next=totalPage;
                        }
                        appendpage+='<div class="text-center">'+
                            '<ul class="pagination">'+
                            '<li id="first" value="1" onclick="topage(first)"><a style="cursor: pointer">&laquo;</a></li>'+
                            '<li id="front" value="'+front+'" onclick="topage(front)"><a style="cursor: pointer">上一页</a></li>';

                        if(totalPage<=5){
                            for(var i=1;i<=totalPage;i++){
                                if(i==currPage){
                                    appendpage+= '<li id="page'+i+'" class="active" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';
                                }else{
                                    appendpage+= '<li id="page'+i+'" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';

                                }
                            }
                        }
                        else{
                            if(totalPage-currPage>=5){
                                for(var i=currPage;i<=currPage+4;i++){
                                    if(i==currPage){
                                        appendpage+= '<li id="page'+i+'" class="active" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';
                                    }else{
                                        appendpage+= '<li id="page'+i+'" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';

                                    }
                                }
                            }
                            else{
                                for(var i=totalPage-4;i<=totalPage;i++){
                                    if(i==currPage){
                                        appendpage+= '<li id="page'+i+'" class="active" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';
                                    }else{
                                        appendpage+= '<li id="page'+i+'" value="'+i+'" onclick="topage(page'+i+')"><a style="cursor: pointer">'+i+'</a></li>';

                                    }
                                }
                            }

                        }
                        appendpage+='<li id="next" value="'+next+'" onclick="topage(next)"><a style="cursor: pointer">下一页</a></li>'+
                            '<li id="last" value="'+totalPage+'"><a onclick="topage(last)" style="cursor: pointer">&raquo;</a></li>'+
                            '<li>'+
                            '<div class="col-sm-3" role="form">'+
                            '<div class="input-group">'+
                            '<input id="page" type="text" class="form-control">'+
                            '<span onclick="topage(page)" class="input-group-addon" style="cursor: pointer">go</span>'+
                            '</div>'+
                            '</div>'+
                            '</li>'+
                            '<li><a style="border: none">共'+totalPage+'页</a></li>'+
                            '</ul>'+
                            '</div>';


                    }


                    $("#showcomment").append(appendhtml);
                    $("#main-content").append(appendpage);
                    $("#countcomments").empty();
                    $("#countcomments").text(obj.totalCount);

                    for(var i=0;i<comments.length;i++){
                        if(typeof(comments[i].score)!="undefined"){
                            showStar(comments[i].id,"del_staruser"+i,comments[i].score);
                        }

                    }

                }
            });
        }


        //n表示后台获取的星数
        function showStar(divid,del_star_id,n) {
            console.log(divid);
            console.log(del_star_id);

            var con_wid = document.getElementById(divid).offsetWidth;
            var del_star = document.getElementById(del_star_id);
            console.log(con_wid);

            //透明星星移动的像素
            var del_move = (n * con_wid) / 10;

            del_star.style.backgroundPosition = -del_move + "px 0px";
            del_star.style.left = del_move + "px";
        }

    </script>

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