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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>主页</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <!--显示星数-->
    <link href="static_resources/star/star.css" rel="stylesheet">

    <style>
        #wapper{
            position: relative;   /*重要！保证footer是相对于wapper位置绝对*/
            height: auto;          /* 保证页面能撑开浏览器高度时显示正常*/
            min-height: 100%  /* IE6不支持，IE6要单独配置*/
        }
        #footer{
            position: absolute;  bottombottom: 0; /* 关键 */
            left:0; /* IE下一定要记得 */
            height: 60px;         /* footer的高度一定要是固定值*/
        }
        #main-content{
            padding-bottom: 60px; /*重要！给footer预留的空间*/
        }
    </style>

</head>
<body>
<!--logo,导航栏，搜索栏，个人信息栏，---慕课---->
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp"><img class="img-circle" src="image/logo.PNG"
                                                          style="width:55px;height:55px;margin-top: -15px"></a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">电影</a></li>
                <li><a href="#">音乐</a></li>
                <li><a href="#">视频</a></li>
            </ul>
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
                    <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>
                    <li><a href="register.html">注册</a></li>
                    <li>
                        <a href="tips_message.html">
                            <span class="badge pull-right">3</span>消息
                        </a>
                    </li>
                    <li>
                        <a style="width: 40px;height: 40px" href="personInfo.html"><img src="/image/test.jpg"
                                                                                        class="img-circle img-responsive"
                                                                                        style="width: 40px;height: 40px;margin-top: -10px"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!--热点内容-->
<div class="container">

</div>
<!--各个标签的简单情况-->
<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <h2>电影</h2>
            <!--针对电影的标签-->
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="ranking_list.html">排行榜</a></li>
                <li><a href="trailer.html">预告片</a></li>
                <!--<li><a href="#">影评</a></li>-->
                <li><a href="sort.html">分类</a></li>
            </ul>
        </div>
        <div class="col-md-7">
            <ul class="nav nav-tabs">
                <li>
                    <a class="btn btn-default btn-lg">正在热映</a>
                </li>
                <li>
                    <a href="ranking_list.html">更多</a>
                </li>
            </ul>
            <ul class="list-inline">
                <!--设置详情介绍居中未设置，-->
                <li>
                    <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                    <div class="caption">
                        <h6>毒液：致命守护.</h6>
                        <div class="text-center">
                            <div id="star_con" class="star-vote">
                                <span id="add_star" class="add-star"></span>
                                <span id="del_star" class="del-star"></span>
                            </div>
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
                            &nbsp;7.6
                        </div>
                        <p>
                            <%--默认的id为1，后期更改--%>
                            <a href="${basepath}/movie_getMovie?id=1" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
                <li>
                    <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                    <div class="caption">
                        <h6>毒液：致命守护.</h6>
                        <div class="text-center">
                            <div id="star_con_movieid4" class="star-vote">
                                <span id="add_star_movieid4" class="add-star"></span>
                                <span id="del_star_movieid4" class="del-star"></span>
                            </div>
                            <script>
                                window.onload = showStar_movieid4(7.8);

                                //n表示后台获取的星数
                                function showStar_movieid4(n) {
                                    var con_wid = document.getElementById("star_con_movieid4").offsetWidth;
                                    var del_star = document.getElementById("del_star_movieid4");
                                    console.log(con_wid);

                                    //透明星星移动的像素
                                    var del_move = (n * con_wid) / 10;

                                    del_star.style.backgroundPosition = -del_move + "px 0px";
                                    del_star.style.left = del_move + "px";
                                }
                            </script>&nbsp;7.6
                        </div>
                        <p>
                            <a href="${basepath}/movie_getMovie?id=1" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
                <li>
                    <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                    <div class="caption">
                        <h6>毒液：致命守护.</h6>
                        <div class="text-center">
                            <div id="star_con_movieid5" class="star-vote">
                                <span id="add_star_movieid5" class="add-star"></span>
                                <span id="del_star_movieid5" class="del-star"></span>
                            </div>
                            <script>
                                window.onload = showStar_movieid5(7.8);

                                //n表示后台获取的星数
                                function showStar_movieid5(n) {
                                    var con_wid = document.getElementById("star_con_movieid5").offsetWidth;
                                    var del_star = document.getElementById("del_star_movieid5");
                                    console.log(con_wid);

                                    //透明星星移动的像素
                                    var del_move = (n * con_wid) / 10;

                                    del_star.style.backgroundPosition = -del_move + "px 0px";
                                    del_star.style.left = del_move + "px";
                                }
                            </script>&nbsp;7.6
                        </div>
                        <p>
                            <a href="${basepath}/movie_getMovie?id=1" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
                <li>
                    <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                    <div class="caption">
                        <h6>毒液：致命守护.</h6>
                        <div class="text-center">
                            <div id="star_con_movieid6" class="star-vote">
                                <span id="add_star_movieid6" class="add-star"></span>
                                <span id="del_star_movieid6" class="del-star"></span>
                            </div>
                            <script>
                                window.onload = showStar_movieid6(7.8);

                                //n表示后台获取的星数
                                function showStar_movieid6(n) {
                                    var con_wid = document.getElementById("star_con_movieid6").offsetWidth;
                                    var del_star = document.getElementById("del_star_movieid6");
                                    console.log(con_wid);

                                    //透明星星移动的像素
                                    var del_move = (n * con_wid) / 10;

                                    del_star.style.backgroundPosition = -del_move + "px 0px";
                                    del_star.style.left = del_move + "px";
                                }
                            </script>&nbsp;7.6
                        </div>
                        <p>
                            <a href="${basepath}/movie_getMovie?id=1" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
                <li>
                    <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                    <div class="caption">
                        <h6>柯南：零的执行者</h6>
                        <div class="text-center">
                            <div id="star_con_movieid8" class="star-vote">
                                <span id="add_star_movieid8" class="add-star"></span>
                                <span id="del_star_movieid8" class="del-star"></span>
                            </div>
                            <script>
                                window.onload = showStar_movieid8(7.8);

                                //n表示后台获取的星数
                                function showStar_movieid8(n) {
                                    var con_wid = document.getElementById("star_con_movieid8").offsetWidth;
                                    var del_star = document.getElementById("del_star_movieid8");
                                    console.log(con_wid);

                                    //透明星星移动的像素
                                    var del_move = (n * con_wid) / 10;

                                    del_star.style.backgroundPosition = -del_move + "px 0px";
                                    del_star.style.left = del_move + "px";
                                }
                            </script>&nbsp;7.6
                        </div>
                        <p>
                            <a href="${basepath}/movie_getMovie?id=1" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
                <li>
                    <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                    <div class="caption">
                        <h6>柯南：零的执行者</h6>
                        <div class="text-center">
                            <div id="star_con_movieid3" class="star-vote">
                                <span id="add_star_movieid3" class="add-star"></span>
                                <span id="del_star_movieid3" class="del-star"></span>
                            </div>
                            <script>
                                window.onload = showStar_movieid3(7.8);

                                //n表示后台获取的星数
                                function showStar_movieid3(n) {
                                    var con_wid = document.getElementById("star_con_movieid3").offsetWidth;
                                    var del_star = document.getElementById("del_star_movieid3");
                                    console.log(con_wid);

                                    //透明星星移动的像素
                                    var del_move = (n * con_wid) / 10;

                                    del_star.style.backgroundPosition = -del_move + "px 0px";
                                    del_star.style.left = del_move + "px";
                                }
                            </script>&nbsp;7.6
                        </div>
                        <p>
                            <a href="${basepath}/movie_getMovie?id=1" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
                <li>
                    <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                    <div class="caption">
                        <h6>柯南：零的执行者</h6>
                        <h6 class="text-center">
                            <div id="star_con_movieid1" class="star-vote">
                                <span id="add_star_movieid1" class="add-star"></span>
                                <span id="del_star_movieid1" class="del-star"></span>
                            </div>
                            <script>
                                window.onload = showStar_movieid1(7.8);

                                //n表示后台获取的星数
                                function showStar_movieid1(n) {
                                    var con_wid = document.getElementById("star_con_movieid1").offsetWidth;
                                    var del_star = document.getElementById("del_star_movieid1");
                                    console.log(con_wid);

                                    //透明星星移动的像素
                                    var del_move = (n * con_wid) / 10;

                                    del_star.style.backgroundPosition = -del_move + "px 0px";
                                    del_star.style.left = del_move + "px";
                                }
                            </script>&nbsp;7.6
                        </h6>
                        <p>
                            <a href="${basepath}/movie_getMovie?id=1" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
                <li>
                    <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                    <div class="caption">
                        <h6>柯南：零的执行者</h6>
                        <div class="text-center">
                            <div id="star_con_movieid2" class="star-vote">
                                <span id="add_star_movieid2" class="add-star"></span>
                                <span id="del_star_movieid2" class="del-star"></span>
                            </div>
                            <script>
                                window.onload = showStar_movieid2(7.8);

                                //n表示后台获取的星数
                                function showStar_movieid2(n) {
                                    var con_wid = document.getElementById("star_con_movieid2").offsetWidth;
                                    var del_star = document.getElementById("del_star_movieid2");
                                    console.log(con_wid);

                                    //透明星星移动的像素
                                    var del_move = (n * con_wid) / 10;

                                    del_star.style.backgroundPosition = -del_move + "px 0px";
                                    del_star.style.left = del_move + "px";
                                }
                            </script>&nbsp;7.6
                        </div>
                        <p>
                            <a href="${basepath}/movie_getMovie?id=1" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
            </ul>


        </div>
        <div class="col-md-3">
            <div class="row">
                <!--<div class="col-md-10">
                    <h6>分类(<a  href="#">更多</a>)</h6>
                    <div class="">
                        <ul class="nav nav-pills">
                            <li><a href="#">爱情</a></li>
                            <li><a href="#">喜剧</a></li>
                            <li><a href="#">剧情</a></li>
                            <li><a href="#">动画</a></li>
                            <li><a href="#">科幻</a></li>
                            <li><a href="#">动作</a></li>
                            <li><a href="#">经典</a></li>
                            <li><a href="#">悬疑</a></li>
                            <li><a href="#">犯罪</a></li>
                            <li><a href="#">青春</a></li>
                            <li><a href="#">惊悚</a></li>
                            <li><a href="#">文艺</a></li>
                            <li><a href="#">搞笑</a></li>
                            <li><a href="#">励志</a></li>
                            <li><a href="#">纪录片</a></li>
                            <li><a href="#">战争</a></li>
                            <li><a href="#">恐怖</a></li>
                        </ul>
                    </div>
                </div>-->
                <div class="col-md-10">
                    近期热门(<a href="ranking_list.html">更多</a>)
                    <ul class="nav nav-pills nav-stacked">
                        <li>
                            <a href="#">1.网络谜踪</a>
                        </li>
                        <li>
                            <a href="#">2.网络谜踪</a>
                        </li>
                        <li>
                            <a href="#">3.网络谜踪</a>
                        </li>
                        <li>
                            <a href="#">4.网络谜踪</a>
                        </li>
                        <li>
                            <a href="#">5.网络谜踪</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <!--底部版权信息-->
</div>

<div style="height: 120px">

</div>
<div style="font:12px Tahoma;color: white;text-align:center;">
    <div style="background-color: #0f0f0f">
        <hr/>
        Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;
        xxx小组 ALL RIGHT RESERVED<br/>
        联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/>

    </div>
</div>
</body>
</html>