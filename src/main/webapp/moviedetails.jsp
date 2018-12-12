
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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

    <style type="text/css">
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

    <!--点赞-->
    <link type="text/css" rel="stylesheet" href="/static_resources/likes/dianzan/Css/demo.css">

    <!--显示星数-->
    <link href="static_resources/star/star.css" rel="stylesheet">


</head>
<body>
<!--导航栏-->
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.html"><img class="img-circle" src="image/logo.PNG" style="width:55px;height:55px;margin-top: -15px"></a>
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
                <ul class="nav navbar-nav">
                    <li><a href="login.html"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
                    <li><a href="login.html" class="a globalLoginBtn"><span
                            class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>
                    <li><a href="register.html">注册</a></li>
                    <li>
                        <a href="tips_message.html">
                            <span class="badge pull-right">3</span>消息
                        </a>
                    </li>
                    <li>
                        <a style="width: 40px;height: 40px" href="personInfo.html"><img src="/image/test.jpg" class="img-circle img-responsive" style="width: 40px;height: 40px;margin-top: -10px"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!--电影详情介绍-->
<div class="container">
    <h1>${oneMovie.moviename}</h1>
    <!--电影简单介绍页-->
    <div class="row">
        <!--电影海报页-->
        <div class="col-xs-2">
            <img src="image/kenan.png" style="width: 140px;height: 150px">

        </div>
        <!--电影基本信息页-->
        <div class="col-md-6">
            <div>
                <ul class="list-group">
                    <li class="list-group-item" style="border: none">
                        导演: 拉斯·霍尔斯道姆 / 乔·庄斯顿
                    </li>
                    <li class="list-group-item" style="border: none">
                        编剧: 阿什利·鲍威尔 / 汤姆·麦卡锡 / E·T·A·霍夫曼
                    </li>
                    <li class="list-group-item" style="border: none">
                        主演: 麦肯吉·弗依 / 摩根·弗里曼 / 凯拉·奈特莉 / 马修·麦克费登 / 海伦·米伦
                        <a data-toggle="collapse"
                           href="#collapse">更多</a>
                        <div id="collapse" class="panel-collapse collapse">
                            / 艾丽·巴姆博 / 米兰达·哈特 / 欧赫尼奥·德尔维斯 / 杰克·怀特霍尔 / 理查德·E·格兰特 / 谢尔盖·波卢宁 / 欧米德·吉亚李利 / 梅拉·沙尔 / 尼克·穆罕默德 /
                            杰茜·维宁 / 汤姆·斯威特 / 马里安·洛伦西克 / 芙洛·费拉科 / 丽塔-麦克唐纳丹帕 / 查尔斯·斯特里特
                        </div>
                    </li>
                    <li class="list-group-item" style="border: none">
                        类型: 奇幻 / 冒险
                    </li>
                    <li class="list-group-item" style="border: none">
                        制片国家/地区: 美国
                    </li>
                    <li class="list-group-item" style="border: none">
                        语言: 英语
                    </li>
                    <li class="list-group-item" style="border: none">
                        上映日期: 2018-11-02(中国大陆/美国)
                    </li>
                    <li class="list-group-item" style="border: none">
                        片长: 99分钟
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
                        <span style="font-weight: bold;font-size: 15px">7.4</span>
                    </div>
                    <div class="col-sm-5">
                        <div id="star_con" class="star-vote">
                            <span id="add_star" class="add-star"></span>
                            <span id="del_star" class="del-star"></span>
                        </div>
                        24500人评价
                        <script>
                            window.onload = showStar(7.8);

                            //n表示后台获取的星数
                            function showStar(n) {
                                var con_wid = document.getElementById("star_con").offsetWidth;
                                var del_star = document.getElementById("del_star");
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

            <div class="row">
                <ul class="list-group">
                    <li class="list-group-item" style="border: none">
                        <div class="row">
                            <div class="col-md-2">
                                5星
                            </div>
                            <div class="col-md-4" style="margin-left: -20px;height: 20px">
                                <div class="progress">
                                    <div class="progress-bar" style="width: 5%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                5%
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
                                    <div class="progress-bar" style="width: 60%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                60%
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
                                    <div class="progress-bar" style="width: 25%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                25%
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
                                    <div class="progress-bar" style="width: 7%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                7%
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
                                    <div class="progress-bar" style="width: 3%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                3%
                            </div>

                        </div>
                    </li>
                </ul>
            </div>

        </div>

    </div>

    <!--评分项-->
    <div class="row">
        <form method="post">
            <input id="input-21e" name="score" value="0" type="number" class="rating globalLoginBtn" min=0 max=5 step=1
                   data-size="xs">
        </form>
        <script>
            function read() {
                alert($(" input[ name='score' ] ").val());
            }
            jQuery(document).ready(function () {
                $(".rating-kv").rating();
            });
        </script>
    </div>

    <!--剧情简介-->
    <div class="row">
        <div class="col-md-8">
            <h4 style="color: #2f904d">
                xxxxxxx电影剧情简介
            </h4>
            <div>
                克拉拉一直在寻找一把钥匙——这把与众不同的钥匙将可以开启已故母亲装有无价之宝的盒子。在教父德罗塞尔梅耶举办的一次节日聚会上，
                一根金线指引着她找到了这把梦寐以求的钥匙，却在瞬间消失进入一个陌生而神秘的平行世界。在平行世界里，克拉拉结识了士兵菲利普、一群老鼠、
                以及分别掌管雪花王国、鲜花王国、糖果王国的三位国王。克拉拉和菲利普必须勇敢地接受第四位国王——暴君姜母的考验，才能够找回钥匙、并将和平重新带回这个摇摇欲坠的平行世界。
            </div>
        </div>

    </div>

    <!--显示预告片等信息-->
    <br>
    <!--暂时显示3个预告片，更多稍后添加-->
    <div class="row">
        <h4 style="color: #2f904d">
            xxxxxxx电影相关预告片
        </h4>
        <ul class="list-inline">
            <li>
                <div class="box">
                    <img src="/image/test.jpg" class="img-rounded" style="width: 150px;height: 130px">
                    <div class="box-content">
                        <ul class="icon">
                            <li><a href="trailermovie.jsp"><span class="glyphicon glyphicon-play"></span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li>
                <div class="box">
                    <img src="/image/test.jpg" class="img-rounded" style="width: 150px;height: 130px">
                    <div class="box-content">
                        <ul class="icon">
                            <li><a href="trailermovie.jsp"><span class="glyphicon glyphicon-play"></span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
            <li>
                <div class="box">
                    <img src="/image/test.jpg" class="img-rounded" style="width: 150px;height: 130px">
                    <div class="box-content">
                        <ul class="icon">
                            <li><a href="trailermovie.jsp"><span class="glyphicon glyphicon-play"></span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>

    <!--评论显示界面-->
    <div class="row">
        <h4 style="color: #2f904d">
            xxxx电影的短评(共1252条)
        </h4>
        <!--Ajax异步得到-->
        <div class="row">
            <ul class="nav navbar-nav">
                <li><a href="#">热门</a></li>
                <li><a href="#">最新</a></li>
            </ul>
        </div>
        <div class="row">
            <ul class="list-group" style="width: 800px">
                <li class="list-group-item" style="border: none">
                    <!--显示个人信息以及评论时间，点赞数-->
                    <div class="row">
                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>xxxx用户名</span>
                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                        <!--星数展示start-->
                        <div id="userid1" class="star-vote">
                            <span id="add_staruserid1" class="add-star"></span>
                            <span id="del_staruserid1" class="del-star"></span>
                        </div>
                        <!--根据用户的id来生成对应的名字-->
                        <script>
                            window.onload = showStaruserid1(4);

                            //n表示后台获取的星数
                            function showStaruserid1(n) {
                                var con_wid = document.getElementById("userid1").offsetWidth;
                                var del_star = document.getElementById("del_staruserid1");
                                console.log(con_wid);

                                //透明星星移动的像素
                                var del_move = (n * con_wid) / 10;

                                del_star.style.backgroundPosition = -del_move + "px 0px";
                                del_star.style.left = del_move + "px";
                            }
                        </script>
                        <!--星数展示end-->
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
                        一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                        会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                        面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                    </div>

                    <div class="row col-md-offset-10">
                        <a class="btn btn-sm">举报</a>
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseuserId1" class="btn btn-sm">回复</a>
                    </div>
                    <div id="collapseuserId1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <form class="form-horizontal">
                                    <div class="form-group col-md-8">
                                        <input class="form-control" type="text" value="@xxxxx用户名:">
                                    </div>

                                    <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                </form>
                            </div>
                        </div>
                    </div>
                </li>
                <hr>
                <li class="list-group-item" style="border: none">
                    <!--显示个人信息以及评论时间，点赞数-->
                    <div class="row">
                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>xxxx用户名</span>
                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                        <div id="userid2" class="star-vote">
                        <span id="add_staruserid2" class="add-star"></span>
                        <span id="del_staruserid2" class="del-star"></span>
                    </div>
                        <!--根据用户的id来生成对应的名字-->
                        <script>
                            window.onload = showStaruserid2(5);

                            //n表示后台获取的星数
                            function showStaruserid2(n) {
                                var con_wid = document.getElementById("userid2").offsetWidth;
                                var del_star = document.getElementById("del_staruserid2");
                                console.log(con_wid);

                                //透明星星移动的像素
                                var del_move = (n * con_wid) / 10;

                                del_star.style.backgroundPosition = -del_move + "px 0px";
                                del_star.style.left = del_move + "px";
                            }
                        </script> 2018-11-20
                        <div class="praise">
                            <span id="praise2"><img src="/static_resources/likes/dianzan/Images/zan.png"
                                                    id="praise2-img" style="width: 20px;height:20px"/></span>
                            <span id="praise-txt2" style="margin-top: -40px;margin-left: 30px">1455</span>
                            <span id="add-num2"><em>+1</em></span>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                        会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                        面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                    </div>

                    <div class="row col-md-offset-10">
                        <a class="btn btn-sm">举报</a>
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseidx" class="btn btn-sm">回复</a>
                    </div>
                    <div id="collapseidx" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <form class="form-horizontal">
                                    <div class="form-group col-md-8">
                                        <input class="form-control" type="text" value="@xxxxx用户名:">
                                    </div>

                                    <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                </form>
                            </div>
                        </div>

                        </div>

                </li>
                <hr>
                <li class="list-group-item" style="border: none">
                    <!--显示个人信息以及评论时间，点赞数-->
                    <div class="row">
                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>xxxx用户名</span>
                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                        <div id="userid3" class="star-vote">
                        <span id="add_staruserid3" class="add-star"></span>
                        <span id="del_staruserid3" class="del-star"></span>
                    </div>
                        <!--根据用户的id来生成对应的名字-->
                        <script>
                            window.onload = showStaruserid3(4);

                            //n表示后台获取的星数
                            function showStaruserid3(n) {
                                var con_wid = document.getElementById("userid3").offsetWidth;
                                var del_star = document.getElementById("del_staruserid3");
                                console.log(con_wid);

                                //透明星星移动的像素
                                var del_move = (n * con_wid) / 10;

                                del_star.style.backgroundPosition = -del_move + "px 0px";
                                del_star.style.left = del_move + "px";
                            }
                        </script> 2018-11-20
                        <div class="praise">
                            <span id="praise3"><img src="/static_resources/likes/dianzan/Images/zan.png"
                                                    id="praise3-img" style="width: 20px;height:20px"/></span>
                            <span id="praise-txt3" style="margin-top: -40px;margin-left: 30px">1455</span>
                            <span id="add-num3"><em>+1</em></span>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                        会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                        面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                    </div>

                    <div class="row col-md-offset-10">
                        <a class="btn btn-sm">举报</a>
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne" class="btn btn-sm">回复</a>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <form class="form-horizontal">
                                    <div class="form-group col-md-8">
                                        <input class="form-control" type="text" value="@xxxxx用户名:">
                                    </div>

                                    <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                </form>
                            </div>
                            <div class="row">
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>xxxx用户名</span>
                                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                        <br>
                                        <div class="row">
                                            <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                            <a class="btn btn-sm col-md-offset-10">举报</a>
                                            <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                               href="#collapsereplay1">回复</a>
                                        </div>
                                        <div id="collapsereplay1" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="form-group col-md-8">
                                                    <input class="form-control" type="text" value="@xxx用户名:">

                                                </div>
                                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                            </div>

                                        </div>
                                    </li>


                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <hr>
                <li class="list-group-item" style="border: none">
                    <!--显示个人信息以及评论时间，点赞数-->
                    <div class="row">
                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>xxxx用户名</span>
                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                        <div id="userid4" class="star-vote">
                        <span id="add_staruserid4" class="add-star"></span>
                        <span id="del_staruserid4" class="del-star"></span>
                    </div>
                        <!--根据用户的id来生成对应的名字userId到时候全部替换成用户的id-->
                        <script>
                            window.onload = showStaruserid4(4);

                            //n表示后台获取的星数
                            function showStaruserid4(n) {
                                var con_wid = document.getElementById("userid4").offsetWidth;
                                var del_star = document.getElementById("del_staruserid4");
                                console.log(con_wid);

                                //透明星星移动的像素
                                var del_move = (n * con_wid) / 10;

                                del_star.style.backgroundPosition = -del_move + "px 0px";
                                del_star.style.left = del_move + "px";
                            }
                        </script> 2018-11-20
                        <div class="praise">
                            <span id="praise4"><img src="/static_resources/likes/dianzan/Images/zan.png"
                                                    id="praise4-img" style="width: 20px;height:20px"/></span>
                            <span id="praise-txt4" style="margin-top: -40px;margin-left: 30px">1455</span>
                            <span id="add-num4"><em>+1</em></span>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                        会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                        面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                    </div>

                    <div class="row col-md-offset-10">
                        <a class="btn btn-sm">举报</a>
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseuserId4" class="btn btn-sm">回复</a>
                    </div>
                    <div id="collapseuserId4" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <form class="form-horizontal">
                                    <div class="form-group col-md-8">
                                        <input class="form-control" type="text" value="@xxxxx用户名:">
                                    </div>

                                    <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                </form>
                            </div>

                        </div>
                    </div>
                </li>
                <hr>
                <li class="list-group-item" style="border: none">
                    <!--显示个人信息以及评论时间，点赞数-->
                    <div class="row">
                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>xxxx用户名</span>
                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                        <div id="userid5" class="star-vote">
                        <span id="add_staruserid5" class="add-star"></span>
                        <span id="del_staruserid5" class="del-star"></span>
                    </div>
                        <!--根据用户的id来生成对应的名字-->
                        <script>
                            window.onload = showStaruserid5(9);

                            //n表示后台获取的星数
                            function showStaruserid5(n) {
                                var con_wid = document.getElementById("userid5").offsetWidth;
                                var del_star = document.getElementById("del_staruserid5");
                                console.log(con_wid);

                                //透明星星移动的像素
                                var del_move = (n * con_wid) / 10;

                                del_star.style.backgroundPosition = -del_move + "px 0px";
                                del_star.style.left = del_move + "px";
                            }
                        </script> 2018-11-20
                        <div class="praise">
                            <span id="praise5"><img src="/static_resources/likes/dianzan/Images/zan.png"
                                                    id="praise5-img" style="width: 20px;height:20px"/></span>
                            <span id="praise-txt5" style="margin-top: -40px;margin-left: 30px">1455</span>
                            <span id="add-num5"><em>+1</em></span>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                        会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                        面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                    </div>

                    <div class="row col-md-offset-10">
                        <a class="btn btn-sm">举报</a>
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseuserId5" class="btn btn-sm">回复</a>
                    </div>
                    <div id="collapseuserId5" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <form class="form-horizontal">
                                    <div class="form-group col-md-8">
                                        <input class="form-control" type="text" value="@xxxxx用户名:">
                                    </div>

                                    <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                </form>
                            </div>
                            <div class="row">
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>xxxx用户名</span>
                                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                        <br>
                                        <div class="row">
                                            <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                            <a class="btn btn-sm col-md-offset-10">举报</a>
                                            <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                               href="#collapseid1">回复</a>
                                        </div>
                                        <div id="collapseid1" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="form-group col-md-8">
                                                    <input class="form-control" type="text" value="@xxx用户名:">

                                                </div>
                                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                            </div>

                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>xxxx用户名</span>
                                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                        <br>
                                        <div class="row">
                                            <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                            <a class="btn btn-sm col-md-offset-10">举报</a>
                                            <a  class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                href="#collapseid2">回复</a>
                                        </div>
                                        <div id="collapseid2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="form-group col-md-8">
                                                    <input class="form-control" type="text" value="@xxx用户名:">

                                                </div>
                                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                            </div>

                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>xxxx用户名</span>
                                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                        <br>
                                        <div class="row">
                                            <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                            <a class="btn btn-sm col-md-offset-10">举报</a>
                                            <a  class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                href="#collapseid3">回复</a>
                                        </div>
                                        <div id="collapseid3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="form-group col-md-8">
                                                    <input class="form-control" type="text" value="@xxx用户名:">

                                                </div>
                                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                            </div>

                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>xxxx用户名</span>
                                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                        <br>
                                        <div class="row">
                                            <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                            <a class="btn btn-sm col-md-offset-10">举报</a>
                                            <a  class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                href="#collapseid4">回复</a>
                                        </div>
                                        <div id="collapseid4" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="form-group col-md-8">
                                                    <input class="form-control" type="text" value="@xxx用户名:">

                                                </div>
                                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                            </div>

                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>xxxx用户名</span>
                                        &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                        <br>
                                        <div class="row">
                                            <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                            <a class="btn btn-sm col-md-offset-10">举报</a>
                                            <a  class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                href="#collapseid5">回复</a>
                                        </div>
                                        <div id="collapseid5" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="form-group col-md-8">
                                                    <input class="form-control" type="text" value="@xxx用户名:">

                                                </div>
                                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                            </div>

                                        </div>
                                    </li>


                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <hr>
                <%--oneMoive.movieComments!=null && fn:length(oneMoive.movieComments) >0--%>
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
                                                console.log(con_wid);

                                                //透明星星移动的像素
                                                var del_move = (n * con_wid) / 5;

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
                                    <a class="btn btn-sm">举报</a>
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

                                                <input onclick="replyComment('tor${moviecomments.id}','${moviecomments.id}','${moviecomments.userId}',1,1)" class="col-md-offset-2 btn btn-success" type="submit" value="回复">
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
                                                            <a class="btn btn-sm col-md-offset-10">举报</a>
                                                            <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                               href="#s${moviecomments.id}${status.count}">回复</a>
                                                        </div>
                                                        <div id="s${moviecomments.id}${status.count}" class="panel-collapse collapse">
                                                            <div class="panel-body">
                                                                <div class="form-group col-md-8">
                                                                    <input id="s${reply.id}" class="form-control" type="text" placeholder="@${reply.username}:">

                                                                </div>
                                                                <input onclick="replyComment2('s${reply.id}',${moviecomments.id},${reply.id},${reply.userId},1,2)" class="col-md-offset-2 btn btn-success" type="submit" value="回复">
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

        <script>
            <%--对评论的回复的函数--%>
            function replyComment(contentId,commentId,to_userId,userId,type) {
                var content=document.getElementById(contentId).value;
                var commentId=commentId;
                var to_userId=to_userId;
                var userId=userId;
                $.ajax({
                    type:"post",
                    url:"/rmoviereplycommentinsertReplyComment",
                    data:{
                        "movie_replycomment.content":content,
                        "movie_replycomment.comment_id":commentId,
                        "movie_replycomment.to_userId":to_userId,
                        "movie_replycomment.userId":userId,
                        "movie_replycomment.reply_type":type
                    },
                    success:function (data) {
                        alert(data);
                        setTimeout("window.location.reload()",3000);
                    }
                })
            }

            function replyComment2(contentId,commentId,to_id,to_userId,userId,type) {
                var content=document.getElementById(contentId).value;
                var commentId=commentId;
                var to_userId=to_userId;
                var userId=userId;
                var to_id=to_id;
                $.ajax({
                    type:"post",
                    url:"/rmoviereplycommentinsertReplyComment",
                    data:{
                        "movie_replycomment.content":content,
                        "movie_replycomment.comment_id":commentId,
                        "movie_replycomment.to_userId":to_userId,
                        "movie_replycomment.userId":userId,
                        "movie_replycomment.reply_type":type,
                        "movie_replycomment.reply_id":to_id
                    },
                    success:function (data) {
                        alert(data);
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
            <input id="userId" type="hidden" name="movie_comment.userId" value="1">
            <input id="movieId" type="hidden" name="movie_comment.movieId" value="${oneMovie.id}">
            <div class="form-group" style="margin-left:-50px ">
                <textarea id="content" name="movie_comment.content" class="form-control" rows="3"></textarea>
            </div>
            <div class="col-md-offset-11">
                <button onclick="moviecomment()" type="submit" class="btn btn-primary">发布</button>
            </div>
        </div>
    </div>

    <script>
        function moviecomment() {
            var userId=document.getElementById("userId").value;
            var movieId=document.getElementById("movieId").value;
            var content=document.getElementById("content").value;
            $.ajax({
                type:"post",
                url:"/moviecomment_insertComment",
                data:{
                    "movie_comment.userId":userId,
                    "movie_comment.movieId":movieId,
                    "movie_comment.content":content
                },
                success:function () {
                    alert("chengg");
                }
            })

        }
    </script>
    <!--分页界面-->
    <div class="row">
        <div class="inner clearfix">
            <section id="main-content">

                <div class="text-center">
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                        <li>
                            <!--异步传输页数，返回数据得到结果-->
                            <form class="col-sm-3" role="form">
                                <div class="input-group">
                                    <input type="text" class="form-control">
                                    <span onclick="test()" class="input-group-addon">go</span>
                                </div>
                            </form>
                        </li>
                        <li><a style="border: none">共6页</a></li>
                    </ul>
                </div>

            </section>

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