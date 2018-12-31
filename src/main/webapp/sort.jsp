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
    <title>分类页面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="static_resources/backgroud/css/crowd.css">

    <script src="/static_resources/cookie/jquery.cookie.min.js"></script>

    <link rel="icon" href="image/logo.PNG" type="image/x-icon"/>


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
                        <a style="width: 40px;height: 40px" href="personInfo.jsp"><img src="/image/test.jpg"
                                                                                       class="img-circle img-responsive"
                                                                                       style="width: 40px;height: 40px;margin-top: -10px"></a>
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

<!--分类标签-->
<div class="container">
    <!--设置样式-->
    <div class="col-md-8" id="sort">

        <ul class="list-inline">
            <li>
                <button class="btn btn-primary btn-md active" style="border: none">全部类型</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">剧情</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">喜剧</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">动作</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">爱情</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">科幻</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">动画</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">悬疑</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">惊悚</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">恐怖</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">犯罪</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">同性</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">音乐</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">歌舞</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">传记</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">历史</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">战争</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">西部</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">奇幻</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">冒险</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">灾难</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">武侠</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">情色</button>
            </li>
        </ul>
        <ul class="list-inline">
            <li>
                <button class="btn btn-primary btn-md active" style="border: none">全部地区</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">中国大陆</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">美国</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">香港</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">台湾</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">日本</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">韩国</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">英国</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">法国</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">德国</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">意大利</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">西班牙</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">印度</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">泰国</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">俄罗斯</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">伊朗</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">加拿大</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">澳大利亚</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">爱尔兰</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">瑞典</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">巴西</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">丹麦</button>
            </li>
        </ul>
        <ul class="list-inline">
            <li>
                <button class="btn btn-primary btn-md active" style="border: none">全部年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">2018</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">2017</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">2010年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">2000年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">90年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">80年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">70年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">60年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">更早</button>
            </li>
        </ul>
        <ul class="list-inline">
            <li>
                <button class="btn btn-primary btn-md active" style="border: none">全部特色</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">经典</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">青春</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">文艺</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">搞笑</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">励志</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">魔幻</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">感人</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">女性</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">黑帮</button>
            </li>
        </ul>
    </div>
</div>

<div class="container">
    <div class="col-md-8" style="background-color: #2f904d">

    </div>

</div>
<!--展示分类内容标签-->
<div class="container">
    <div class="col-md-8" style="margin-top: 20px">
        <ul class="list-inline">
            <li style="width: 142px;height: 200px">
                <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>
                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>
                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>

                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>


                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>


                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>

                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>柯南：零的执行者&nbsp;&nbsp;7.6</h6>
                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>柯南：零的执行者&nbsp;&nbsp;7.6</h6>

                </div>
            </li>
        </ul>

    </div>
</div>
<!--分页-->
<div class="container">
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

<!--底部版权栏-->
<div style="font:12px Tahoma;color: white;text-align:center;">
    <div style="background-color: #0f0f0f">
        <hr/>
        Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;
        xxx小组 ALL RIGHT RESERVED<br/>
        联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>

    </div>
</div>

<!--底部版权信息-->
</body>
</html>
<script>

    var tags=[];
    $(document).ready(function () {
        $("#sort").empty();
        $.ajax({
            url:"getAllLabelsToShow",
            type:"post",
            success:function (data) {
                var level1=[];
                var level2=[];
                var appendthml="";
                var data=JSON.parse(data);
                for(var i=0;i<data.length;i++){
                    if(data[i].level==1){
                        level1.push(data[i]);
                        tags.push(data[i])
                    }
                    if(data[i].level==2){
                        level2.push(data[i]);
                    }
                }
                for(var i=0;i<level1.length;i++){
                    var id=level1[i].id;
                    var level=level1[i].level;
                    var name=level1[i].name;
                    var parentId=level1[i].parentId;
                    appendthml+='<ul id="'+level1[i].id+'" class="list-inline">'+
                                '<li>'+
                                '<button onclick="getResult('+level1[i].id+')" class="btn btn-primary btn-md active" style="border: none">'+level1[i].name+'</button>'+
                                '</li>';
                    for(var j=0;j<level2.length;j++){
                        if(level2[j].parentId==level1[i].id){
                            var id=level2[j].id;
                            var level=level2[j].level;
                            var name=level2[j].name;
                            var parentId=level2[j].parentId;
                            appendthml+='<li>'+
                                        '<button onclick="getResult('+id+','+level+',\''+name+'\','+parentId+')" class="btn btn-default btn-md" style="border: none">'+level2[j].name+'</button>'+
                                        '</li>';
                        }
                    }
                    appendthml+='</ul>';
                }
                $("#sort").append(appendthml);

            }
        })
    })
    
    
    function getResult(id) {


        console.log(id);

//        var tagstemp=tags;
//        console.log(tagstemp);
//        var obj={
//            "id":id,
//            "level":level,
//            "name":name,
//            "parentId":parentId
//        }
//        tagstemp.push(obj);
//        $.ajax({
//            dataType: "json",
//            url:"movie_getMoviesByLabel",
//            data:{
//                "labels":JSON.stringify(tagstemp)
//            },
//            type:"post",
//            traditional : true,
//            success:function (data) {
//                console.log(data);
//            }
//        })

    }




</script>

