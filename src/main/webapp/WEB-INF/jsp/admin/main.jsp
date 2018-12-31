<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<c:set var="basepath" value="<%=basePath%>"/>
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


    <!--table需要的静态资源-->

    <link href="/static_resources/Admin/label/bootstrap-table.css" rel="stylesheet" media="screen">
    <script src="/static_resources/Admin/label/bootstrap-table.js" type="text/javascript"></script>
    <script src="/static_resources/Admin/label/bootstrap-table-zh-CN.js" charset="UTF-8"
            type="text/javascript"></script>

    <!--提示框需要的资源-->
    <link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
    <script src="/static_resources/toastr/toastr.min.js"></script>


    <!--文件上传-->
    <link href="/static_resources/upload/css/fileinput.min.css" rel="stylesheet">

    <script src="/static_resources/upload/js/fileinput.min.js"></script>

    <script src="/static_resources/upload/js/zh.js"></script>


    <script src="/static_resources/Admin/js/json.js"></script>


    <link rel="icon" href="image/logo.PNG" type="image/x-icon"/>

    <style>
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
    </style>

</head>
<body>



<div id="loading" style="display: block">
    <div class="loading show">

    </div>
</div>

<script>
    window.onload=function(){
        $("#loading").hide();
    }
</script>





<!--侧边导航栏开始-->
<div class="nav col-lg-3" style="min-height: 100%;">
    <div class="nav-top">
        <div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)"><img
                src="/static_resources/Admin/nav/images/mini.png"></div>
    </div>
    <ul>
        <li class="nav-item">
            <a href="javascript:;"><i class="my-icon nav-icon icon_1"></i><span>管理电影</span><i
                    class="my-icon nav-more"></i></a>
            <ul>
                <li id="li_one"><a href="javascript:;"><span>查看电影</span></a></li>
                <li id="li_two"><a href="javascript:;"><span>管理预告片</span></a></li>
                <li id="li_three"><a href="javascript:;"><span>管理图片</span></a></li>
            </ul>
        </li>
        <li class="nav-item" id="li_four">
            <a href="javascript:;"><i class="my-icon nav-icon icon_2"></i><span>用户管理</span><i
                    class="my-icon nav-more"></i></a>
            <%--<ul>--%>
            <%--<li><a href="javascript:;"><span>站内新闻</span></a></li>--%>
            <%--<li><a href="javascript:;"><span>站内公告</span></a></li>--%>
            <%--<li><a href="javascript:;"><span>登录日志</span></a></li>--%>
            <%--</ul>--%>
        </li>
        <li class="nav-mini" id="li_five">
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
<div class="container col-lg-10" style="background-color: white;">

    <%--用户工具按钮--%>
    <div id="toolbar4" class="btn-group">
        <button id="btn_delete" type="button" class="btn btn-default" onclick="deleteUsers()">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>

    <%--预告片工具按钮--%>
    <div id="toolbar2" class="btn-group">
        <button id="btn_add2" type="button" class="btn btn-success" data-toggle="modal"
                data-target="#add_trailer_modal" onclick="getAllMovieName()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_delete2" type="button" class="btn btn-default" onclick="deleteTrailers()">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>

    <%--图片工具按钮--%>
    <div id="toolbar3" class="btn-group">
        <button id="btn_add3" type="button" class="btn btn-success" data-toggle="modal"
                data-target="#add_image_modal" onclick="getAllMovieName2()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_delete3" type="button" class="btn btn-default" onclick="deleteImages()">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>

    <%--电影新增--%>
    <div id="toolbar1" class="btn-group">
        <button id="btn_add1" type="button" class="btn btn-success" data-toggle="modal"
                data-target="#add_movie_modal" onclick="getAddLabel()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_delete1" type="button" class="btn btn-default" onclick="deleteMovies()">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
        <%--标签管理工具--%>

        <div id="toolbar5" class="btn-group">
            <button id="btn_add5" type="button" class="btn btn-success" data-toggle="modal"
                    data-target="#add_label_modal" onclick="getParentLabelName()">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button id="btn_delete5" type="button" class="btn btn-default" onclick="deleteLabels()">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
            </button>
        </div>

    <div id="matter1">
        <div>
            <table style="width: 100%" class="table table-bordered" id="table_movie">
                <caption class="text-center" style="color: #2f904d;font-size: 25px">电影信息表</caption>
            </table>


            <div class="form-horizontal" role="form" id="form_data"

                 style="margin: 20px;">
                <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    修改电影信息
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="edit_moviename" class="col-sm-3 control-label">电影名字</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="edit_moviename"
                                                   name="edit_moviename"
                                                   placeholder="电影名字">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="edit_directorname" class="col-sm-3 control-label">导演</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="edit_directorname" value=""
                                                   id="edit_directorname"
                                                   placeholder="导演">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="edit_actorname" class="col-sm-3 control-label">主演</label>
                                        <div class="col-sm-9">
                                <textarea class="form-control" name="edit_actorname"
                                          id="edit_actorname"
                                          placeholder="主演">

                                </textarea>
                                        </div>
                                    </div>

                                    <!--复选框end-->
                                    <div class="form-group">
                                        <label for="edit_country" class="col-sm-3 control-label">选择制片地区/国家</label>
                                        <div class="col-sm-9">
                                            <select id="edit_country" class="form-control">
                                                <option value="布基纳法索">布基纳法索</option>

                                                <option value="沙特阿拉伯">沙特阿拉伯</option>

                                                <option value="土库曼斯坦">土库曼斯坦</option>

                                                <option value="卡塔尔">卡塔尔</option>

                                                <option value="尼泊尔">尼泊尔</option>

                                                <option value="哈萨克斯坦">哈萨克斯坦</option>

                                                <option value="菲律宾">菲律宾</option>


                                                <option value="中国大陆">中国大陆</option>

                                                <option value="伊朗">伊朗</option>

                                                <option value="哥斯达黎加">哥斯达黎加</option>

                                                <option value="厄立特里亚">厄立特里亚</option>

                                                <option value="古巴">古巴</option>

                                                <option value="多米尼加共和国">多米尼加共和国</option>

                                                <option value="墨西哥">墨西哥</option>

                                                <option value="尼加拉瓜">尼加拉瓜</option>

                                                <option value="巴拿马">巴拿马</option>

                                                <option value="荷属安地列斯群岛">荷属安地列斯群岛</option>

                                                <option value="萨尔瓦多">萨尔瓦多</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="波多黎各">波多黎各</option>

                                                <option value="美属维尔京群岛">美属维尔京群岛</option>

                                                <option value="圣多美和普林西比">圣多美和普林西比</option>

                                                <option value="安圭拉(英)">安圭拉(英)</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="圣文森特和格纳丁斯">圣文森特和格纳丁斯</option>

                                                <option value="荷属安德列斯">荷属安德列斯</option>

                                                <option value="瓜德罗普">瓜德罗普</option>

                                                <option value="洪都拉斯">洪都拉斯</option>

                                                <option value="危地马拉">危地马拉</option>

                                                <option value="格鲁吉亚">格鲁吉亚</option>

                                                <option value="亚美尼亚">亚美尼亚</option>

                                                <option value="阿塞拜疆">阿塞拜疆</option>

                                                <option value="安哥拉">安哥拉</option>

                                                <option value="白俄罗斯">白俄罗斯</option>

                                                <option value="俄罗斯联邦">俄罗斯联邦</option>

                                                <option value="乌克兰">乌克兰</option>

                                                <option value="欧洲其他国家(地区)">欧洲其他国家(地区)</option>

                                                <option value="匈牙利">匈牙利</option>

                                                <option value="冰岛">冰岛</option>

                                                <option value="马耳他">马耳他</option>

                                                <option value="摩纳哥">摩纳哥</option>

                                                <option value="挪威">挪威</option>

                                                <option value="罗马尼亚">罗马尼亚</option>

                                                <option value="利比亚">利比亚</option>

                                                <option value="圣马力诺">圣马力诺</option>

                                                <option value="瑞典">瑞典</option>

                                                <option value="瑞士">瑞士</option>

                                                <option value="爱沙尼亚">爱沙尼亚</option>

                                                <option value="拉脱维亚">拉脱维亚</option>

                                                <option value="立陶宛">立陶宛</option>

                                                <option value="摩尔多瓦">摩尔多瓦</option>

                                                <option value="土耳其">土耳其</option>

                                                <option value="斯洛文尼亚">斯洛文尼亚</option>

                                                <option value="捷克共和国">捷克共和国</option>

                                                <option value="非洲其他国家(地区)">非洲其他国家(地区)</option>

                                                <option value="斯洛伐克">斯洛伐克</option>

                                                <option value="马其顿">马其顿</option>

                                                <option value="波斯尼亚-黑塞哥维那共和">波斯尼亚-黑塞哥维那共和</option>

                                                <option value="梵蒂冈城国">梵蒂冈城国</option>

                                                <option value="荷兰">荷兰</option>

                                                <option value="克罗地亚">克罗地亚</option>

                                                <option value="希腊">希腊</option>

                                                <option value="爱尔兰">爱尔兰</option>

                                                <option value="比利时">比利时</option>

                                                <option value="塞浦路斯">塞浦路斯</option>

                                                <option value="塞卜泰">塞卜泰</option>

                                                <option value="丹麦">丹麦</option>

                                                <option value="英国">英国</option>

                                                <option value="德国">德国</option>

                                                <option value="法国">法国</option>

                                                <option value="意大利">意大利</option>

                                                <option value="卢森堡">卢森堡</option>

                                                <option value="葡萄牙">葡萄牙</option>

                                                <option value="波兰">波兰</option>

                                                <option value="西班牙">西班牙</option>

                                                <option value="阿尔巴尼亚">阿尔巴尼亚</option>

                                                <option value="津巴布韦">津巴布韦</option>

                                                <option value="安道尔">安道尔</option>

                                                <option value="列支敦士登">列支敦士登</option>

                                                <option value="塞黑">塞黑</option>

                                                <option value="奥地利">奥地利</option>

                                                <option value="保加利亚">保加利亚</option>

                                                <option value="芬兰">芬兰</option>

                                                <option value="直布罗陀">直布罗陀</option>

                                                <option value="多米尼克">多米尼克</option>

                                                <option value="百慕大">百慕大</option>

                                                <option value="加拿大">加拿大</option>

                                                <option value="几内亚">几内亚</option>

                                                <option value="美国">美国</option>

                                                <option value="格陵兰">格陵兰</option>

                                                <option value="北美洲其他国家(地区)">北美洲其他国家(地区)</option>

                                                <option value="汤加">汤加</option>

                                                <option value="澳大利亚">澳大利亚</option>

                                                <option value="库克群岛">库克群岛</option>

                                                <option value="瑙鲁">瑙鲁</option>

                                                <option value="新喀里多尼亚">新喀里多尼亚</option>

                                                <option value="瓦努阿图">瓦努阿图</option>

                                                <option value="所罗门群岛">所罗门群岛</option>

                                                <option value="塞拉利昂">塞拉利昂</option>

                                                <option value="萨摩亚">萨摩亚</option>

                                                <option value="图瓦卢">图瓦卢</option>

                                                <option value="密克罗尼西亚联邦">密克罗尼西亚联邦</option>

                                                <option value="马绍尔群岛">马绍尔群岛</option>

                                                <option value="基里巴斯">基里巴斯</option>

                                                <option value="法属玻利尼西亚">法属玻利尼西亚</option>

                                                <option value="新西兰">新西兰</option>

                                                <option value="斐济">斐济</option>

                                                <option value="巴布亚新几内亚">巴布亚新几内亚</option>

                                                <option value="帕劳共和国">帕劳共和国</option>

                                                <option value="喀麦隆">喀麦隆</option>

                                                <option value="留尼汪">留尼汪</option>

                                                <option value="土阿莫土群岛">土阿莫土群岛</option>

                                                <option value="土布艾群岛">土布艾群岛</option>

                                                <option value="社会群岛">社会群岛</option>

                                                <option value="马克萨斯群岛">马克萨斯群岛</option>

                                                <option value="瓦利斯和浮图纳">瓦利斯和浮图纳</option>

                                                <option value="盖比群岛">盖比群岛</option>

                                                <option value="诺福克岛">诺福克岛</option>

                                                <option value="大洋洲其他国家(地区)">大洋洲其他国家(地区)</option>

                                                <option value="智利">智利</option>

                                                <option value="哥伦比亚">哥伦比亚</option>

                                                <option value="加蓬">加蓬</option>

                                                <option value="法属圭亚那">法属圭亚那</option>

                                                <option value="圭亚那">圭亚那</option>

                                                <option value="库腊索岛">库腊索岛</option>

                                                <option value="巴拉圭">巴拉圭</option>

                                                <option value="秘鲁">秘鲁</option>

                                                <option value="苏里南">苏里南</option>

                                                <option value="委内瑞拉">委内瑞拉</option>

                                                <option value="乌拉圭">乌拉圭</option>

                                                <option value="厄瓜多尔">厄瓜多尔</option>

                                                <option value="安提瓜和巴布达">安提瓜和巴布达</option>

                                                <option value="加纳">加纳</option>

                                                <option value="阿鲁巴岛">阿鲁巴岛</option>

                                                <option value="巴哈马">巴哈马</option>

                                                <option value="巴巴多斯">巴巴多斯</option>

                                                <option value="开曼群岛">开曼群岛</option>

                                                <option value="格林纳达">格林纳达</option>

                                                <option value="萨巴">萨巴</option>

                                                <option value="海地">海地</option>

                                                <option value="牙买加">牙买加</option>

                                                <option value="马提尼克">马提尼克</option>

                                                <option value="蒙特塞拉特">蒙特塞拉特</option>

                                                <option value="坦桑尼亚">坦桑尼亚</option>

                                                <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>

                                                <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>

                                                <option value="特克斯和凯科斯群岛">特克斯和凯科斯群岛</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="圣其茨-尼维斯">圣其茨-尼维斯</option>

                                                <option value="圣马丁岛">圣马丁岛</option>

                                                <option value="南美洲其他国家(地区)">南美洲其他国家(地区)</option>

                                                <option value="圣皮埃尔和密克隆">圣皮埃尔和密克隆</option>

                                                <option value="阿根廷">阿根廷</option>

                                                <option value="伯利兹">伯利兹</option>

                                                <option value="马里">马里</option>

                                                <option value="玻利维亚">玻利维亚</option>

                                                <option value="巴西">巴西</option>

                                                <option value="博内尔">博内尔</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="索马里">索马里</option>

                                                <option value="毛里塔尼亚">毛里塔尼亚</option>

                                                <option value="乌干达">乌干达</option>

                                                <option value="乍得">乍得</option>

                                                <option value="马约特岛">马约特岛</option>

                                                <option value="贝宁">贝宁</option>

                                                <option value="科摩罗">科摩罗</option>

                                                <option value="博茨瓦那">博茨瓦那</option>

                                                <option value="塞内加尔">塞内加尔</option>

                                                <option value="斯威士兰">斯威士兰</option>

                                                <option value="几内亚(比绍)">几内亚(比绍)</option>

                                                <option value="民主刚果">民主刚果</option>

                                                <option value="中非共和国">中非共和国</option>

                                                <option value="莱索托">莱索托</option>

                                                <option value="刚果">刚果</option>

                                                <option value="南非">南非</option>

                                                <option value="马达加斯加">马达加斯加</option>

                                                <option value="利比里亚">利比里亚</option>

                                                <option value="突尼斯">突尼斯</option>

                                                <option value="赞比亚">赞比亚</option>

                                                <option value="尼日尔">尼日尔</option>

                                                <option value="西撒哈拉">西撒哈拉</option>

                                                <option value="多哥">多哥</option>

                                                <option value="纳米比亚">纳米比亚</option>

                                                <option value="莫桑比克">莫桑比克</option>

                                                <option value="梅利利亚">梅利利亚</option>

                                                <option value="埃塞俄比亚">埃塞俄比亚</option>

                                                <option value="卢旺达">卢旺达</option>

                                                <option value="摩洛哥">摩洛哥</option>

                                                <option value="马拉维">马拉维</option>

                                                <option value="尼日利亚">尼日利亚</option>

                                                <option value="佛得角">佛得角</option>

                                                <option value="布隆迪">布隆迪</option>

                                                <option value="阿尔及利亚">阿尔及利亚</option>

                                                <option value="吉布提">吉布提</option>

                                                <option value="加那利群岛">加那利群岛</option>

                                                <option value="冈比亚">冈比亚</option>

                                                <option value="赤道几内亚">赤道几内亚</option>

                                                <option value="塞舌尔">塞舌尔</option>

                                                <option value="苏丹">苏丹</option>

                                                <option value="肯尼亚">肯尼亚</option>

                                                <option value="新加坡">新加坡</option>

                                                <option value="韩国">韩国</option>

                                                <option value="叙利亚">叙利亚</option>

                                                <option value="乌兹别克斯坦">乌兹别克斯坦</option>

                                                <option value="巴林">巴林</option>

                                                <option value="日本">日本</option>

                                                <option value="约旦">约旦</option>

                                                <option value="越南">越南</option>

                                                <option value="科特迪瓦">科特迪瓦</option>

                                                <option value="吉尔吉斯斯坦">吉尔吉斯斯坦</option>

                                                <option value="泰国">泰国</option>

                                                <option value="斯里兰卡">斯里兰卡</option>

                                                <option value="阿联酋">阿联酋</option>

                                                <option value="老挝">老挝</option>

                                                <option value="阿富汗">阿富汗</option>

                                                <option value="中国澳门">中国澳门</option>

                                                <option value="塔吉克斯坦">塔吉克斯坦</option>

                                                <option value="朝鲜">朝鲜</option>

                                                <option value="巴勒斯坦">巴勒斯坦</option>

                                                <option value="埃及">埃及</option>

                                                <option value="中国香港">中国香港</option>

                                                <option value="伊拉克">伊拉克</option>

                                                <option value="黎巴嫩">黎巴嫩</option>

                                                <option value="科威特">科威特</option>

                                                <option value="文莱">文莱</option>

                                                <option value="马尔代夫">马尔代夫</option>

                                                <option value="印度尼西亚">印度尼西亚</option>

                                                <option value="以色列">以色列</option>

                                                <option value="蒙古">蒙古</option>

                                                <option value="亚洲其他国家(地区)">亚洲其他国家(地区)</option>

                                                <option value="毛里求斯">毛里求斯</option>

                                                <option value="阿曼">阿曼</option>

                                                <option value="印度">印度</option>

                                                <option value="缅甸">缅甸</option>

                                                <option value="马来西亚">马来西亚</option>

                                                <option value="东帝汶">东帝汶</option>

                                                <option value="也门共和国">也门共和国</option>

                                                <option value="不丹">不丹</option>

                                                <option value="柬埔寨">柬埔寨</option>

                                                <option value="巴基斯坦">巴基斯坦</option>

                                                <option value="孟加拉国">孟加拉国</option>
                                            </select>
                                        </div>

                                    </div>

                                    <%--上映地区--%>
                                    <div class="form-group">
                                        <label for="edit_release_region"
                                               class="col-sm-3 control-label">选择上映地区/国家</label>
                                        <div class="col-sm-9">
                                            <select id="edit_release_region" class="form-control">
                                                <option value="布基纳法索">布基纳法索</option>

                                                <option value="沙特阿拉伯">沙特阿拉伯</option>

                                                <option value="土库曼斯坦">土库曼斯坦</option>

                                                <option value="卡塔尔">卡塔尔</option>

                                                <option value="尼泊尔">尼泊尔</option>

                                                <option value="哈萨克斯坦">哈萨克斯坦</option>

                                                <option value="菲律宾">菲律宾</option>


                                                <option value="中国大陆">中国大陆</option>

                                                <option value="伊朗">伊朗</option>

                                                <option value="哥斯达黎加">哥斯达黎加</option>

                                                <option value="厄立特里亚">厄立特里亚</option>

                                                <option value="古巴">古巴</option>

                                                <option value="多米尼加共和国">多米尼加共和国</option>

                                                <option value="墨西哥">墨西哥</option>

                                                <option value="尼加拉瓜">尼加拉瓜</option>

                                                <option value="巴拿马">巴拿马</option>

                                                <option value="荷属安地列斯群岛">荷属安地列斯群岛</option>

                                                <option value="萨尔瓦多">萨尔瓦多</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="波多黎各">波多黎各</option>

                                                <option value="美属维尔京群岛">美属维尔京群岛</option>

                                                <option value="圣多美和普林西比">圣多美和普林西比</option>

                                                <option value="安圭拉(英)">安圭拉(英)</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="圣文森特和格纳丁斯">圣文森特和格纳丁斯</option>

                                                <option value="荷属安德列斯">荷属安德列斯</option>

                                                <option value="瓜德罗普">瓜德罗普</option>

                                                <option value="洪都拉斯">洪都拉斯</option>

                                                <option value="危地马拉">危地马拉</option>

                                                <option value="格鲁吉亚">格鲁吉亚</option>

                                                <option value="亚美尼亚">亚美尼亚</option>

                                                <option value="阿塞拜疆">阿塞拜疆</option>

                                                <option value="安哥拉">安哥拉</option>

                                                <option value="白俄罗斯">白俄罗斯</option>

                                                <option value="俄罗斯联邦">俄罗斯联邦</option>

                                                <option value="乌克兰">乌克兰</option>

                                                <option value="欧洲其他国家(地区)">欧洲其他国家(地区)</option>

                                                <option value="匈牙利">匈牙利</option>

                                                <option value="冰岛">冰岛</option>

                                                <option value="马耳他">马耳他</option>

                                                <option value="摩纳哥">摩纳哥</option>

                                                <option value="挪威">挪威</option>

                                                <option value="罗马尼亚">罗马尼亚</option>

                                                <option value="利比亚">利比亚</option>

                                                <option value="圣马力诺">圣马力诺</option>

                                                <option value="瑞典">瑞典</option>

                                                <option value="瑞士">瑞士</option>

                                                <option value="爱沙尼亚">爱沙尼亚</option>

                                                <option value="拉脱维亚">拉脱维亚</option>

                                                <option value="立陶宛">立陶宛</option>

                                                <option value="摩尔多瓦">摩尔多瓦</option>

                                                <option value="土耳其">土耳其</option>

                                                <option value="斯洛文尼亚">斯洛文尼亚</option>

                                                <option value="捷克共和国">捷克共和国</option>

                                                <option value="非洲其他国家(地区)">非洲其他国家(地区)</option>

                                                <option value="斯洛伐克">斯洛伐克</option>

                                                <option value="马其顿">马其顿</option>

                                                <option value="波斯尼亚-黑塞哥维那共和">波斯尼亚-黑塞哥维那共和</option>

                                                <option value="梵蒂冈城国">梵蒂冈城国</option>

                                                <option value="荷兰">荷兰</option>

                                                <option value="克罗地亚">克罗地亚</option>

                                                <option value="希腊">希腊</option>

                                                <option value="爱尔兰">爱尔兰</option>

                                                <option value="比利时">比利时</option>

                                                <option value="塞浦路斯">塞浦路斯</option>

                                                <option value="塞卜泰">塞卜泰</option>

                                                <option value="丹麦">丹麦</option>

                                                <option value="英国">英国</option>

                                                <option value="德国">德国</option>

                                                <option value="法国">法国</option>

                                                <option value="意大利">意大利</option>

                                                <option value="卢森堡">卢森堡</option>

                                                <option value="葡萄牙">葡萄牙</option>

                                                <option value="波兰">波兰</option>

                                                <option value="西班牙">西班牙</option>

                                                <option value="阿尔巴尼亚">阿尔巴尼亚</option>

                                                <option value="津巴布韦">津巴布韦</option>

                                                <option value="安道尔">安道尔</option>

                                                <option value="列支敦士登">列支敦士登</option>

                                                <option value="塞黑">塞黑</option>

                                                <option value="奥地利">奥地利</option>

                                                <option value="保加利亚">保加利亚</option>

                                                <option value="芬兰">芬兰</option>

                                                <option value="直布罗陀">直布罗陀</option>

                                                <option value="多米尼克">多米尼克</option>

                                                <option value="百慕大">百慕大</option>

                                                <option value="加拿大">加拿大</option>

                                                <option value="几内亚">几内亚</option>

                                                <option value="美国">美国</option>

                                                <option value="格陵兰">格陵兰</option>

                                                <option value="北美洲其他国家(地区)">北美洲其他国家(地区)</option>

                                                <option value="汤加">汤加</option>

                                                <option value="澳大利亚">澳大利亚</option>

                                                <option value="库克群岛">库克群岛</option>

                                                <option value="瑙鲁">瑙鲁</option>

                                                <option value="新喀里多尼亚">新喀里多尼亚</option>

                                                <option value="瓦努阿图">瓦努阿图</option>

                                                <option value="所罗门群岛">所罗门群岛</option>

                                                <option value="塞拉利昂">塞拉利昂</option>

                                                <option value="萨摩亚">萨摩亚</option>

                                                <option value="图瓦卢">图瓦卢</option>

                                                <option value="密克罗尼西亚联邦">密克罗尼西亚联邦</option>

                                                <option value="马绍尔群岛">马绍尔群岛</option>

                                                <option value="基里巴斯">基里巴斯</option>

                                                <option value="法属玻利尼西亚">法属玻利尼西亚</option>

                                                <option value="新西兰">新西兰</option>

                                                <option value="斐济">斐济</option>

                                                <option value="巴布亚新几内亚">巴布亚新几内亚</option>

                                                <option value="帕劳共和国">帕劳共和国</option>

                                                <option value="喀麦隆">喀麦隆</option>

                                                <option value="留尼汪">留尼汪</option>

                                                <option value="土阿莫土群岛">土阿莫土群岛</option>

                                                <option value="土布艾群岛">土布艾群岛</option>

                                                <option value="社会群岛">社会群岛</option>

                                                <option value="马克萨斯群岛">马克萨斯群岛</option>

                                                <option value="瓦利斯和浮图纳">瓦利斯和浮图纳</option>

                                                <option value="盖比群岛">盖比群岛</option>

                                                <option value="诺福克岛">诺福克岛</option>

                                                <option value="大洋洲其他国家(地区)">大洋洲其他国家(地区)</option>

                                                <option value="智利">智利</option>

                                                <option value="哥伦比亚">哥伦比亚</option>

                                                <option value="加蓬">加蓬</option>

                                                <option value="法属圭亚那">法属圭亚那</option>

                                                <option value="圭亚那">圭亚那</option>

                                                <option value="库腊索岛">库腊索岛</option>

                                                <option value="巴拉圭">巴拉圭</option>

                                                <option value="秘鲁">秘鲁</option>

                                                <option value="苏里南">苏里南</option>

                                                <option value="委内瑞拉">委内瑞拉</option>

                                                <option value="乌拉圭">乌拉圭</option>

                                                <option value="厄瓜多尔">厄瓜多尔</option>

                                                <option value="安提瓜和巴布达">安提瓜和巴布达</option>

                                                <option value="加纳">加纳</option>

                                                <option value="阿鲁巴岛">阿鲁巴岛</option>

                                                <option value="巴哈马">巴哈马</option>

                                                <option value="巴巴多斯">巴巴多斯</option>

                                                <option value="开曼群岛">开曼群岛</option>

                                                <option value="格林纳达">格林纳达</option>

                                                <option value="萨巴">萨巴</option>

                                                <option value="海地">海地</option>

                                                <option value="牙买加">牙买加</option>

                                                <option value="马提尼克">马提尼克</option>

                                                <option value="蒙特塞拉特">蒙特塞拉特</option>

                                                <option value="坦桑尼亚">坦桑尼亚</option>

                                                <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>

                                                <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>

                                                <option value="特克斯和凯科斯群岛">特克斯和凯科斯群岛</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="圣其茨-尼维斯">圣其茨-尼维斯</option>

                                                <option value="圣马丁岛">圣马丁岛</option>

                                                <option value="南美洲其他国家(地区)">南美洲其他国家(地区)</option>

                                                <option value="圣皮埃尔和密克隆">圣皮埃尔和密克隆</option>

                                                <option value="阿根廷">阿根廷</option>

                                                <option value="伯利兹">伯利兹</option>

                                                <option value="马里">马里</option>

                                                <option value="玻利维亚">玻利维亚</option>

                                                <option value="巴西">巴西</option>

                                                <option value="博内尔">博内尔</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="索马里">索马里</option>

                                                <option value="毛里塔尼亚">毛里塔尼亚</option>

                                                <option value="乌干达">乌干达</option>

                                                <option value="乍得">乍得</option>

                                                <option value="马约特岛">马约特岛</option>

                                                <option value="贝宁">贝宁</option>

                                                <option value="科摩罗">科摩罗</option>

                                                <option value="博茨瓦那">博茨瓦那</option>

                                                <option value="塞内加尔">塞内加尔</option>

                                                <option value="斯威士兰">斯威士兰</option>

                                                <option value="几内亚(比绍)">几内亚(比绍)</option>

                                                <option value="民主刚果">民主刚果</option>

                                                <option value="中非共和国">中非共和国</option>

                                                <option value="莱索托">莱索托</option>

                                                <option value="刚果">刚果</option>

                                                <option value="南非">南非</option>

                                                <option value="马达加斯加">马达加斯加</option>

                                                <option value="利比里亚">利比里亚</option>

                                                <option value="突尼斯">突尼斯</option>

                                                <option value="赞比亚">赞比亚</option>

                                                <option value="尼日尔">尼日尔</option>

                                                <option value="西撒哈拉">西撒哈拉</option>

                                                <option value="多哥">多哥</option>

                                                <option value="纳米比亚">纳米比亚</option>

                                                <option value="莫桑比克">莫桑比克</option>

                                                <option value="梅利利亚">梅利利亚</option>

                                                <option value="埃塞俄比亚">埃塞俄比亚</option>

                                                <option value="卢旺达">卢旺达</option>

                                                <option value="摩洛哥">摩洛哥</option>

                                                <option value="马拉维">马拉维</option>

                                                <option value="尼日利亚">尼日利亚</option>

                                                <option value="佛得角">佛得角</option>

                                                <option value="布隆迪">布隆迪</option>

                                                <option value="阿尔及利亚">阿尔及利亚</option>

                                                <option value="吉布提">吉布提</option>

                                                <option value="加那利群岛">加那利群岛</option>

                                                <option value="冈比亚">冈比亚</option>

                                                <option value="赤道几内亚">赤道几内亚</option>

                                                <option value="塞舌尔">塞舌尔</option>

                                                <option value="苏丹">苏丹</option>

                                                <option value="肯尼亚">肯尼亚</option>

                                                <option value="新加坡">新加坡</option>

                                                <option value="韩国">韩国</option>

                                                <option value="叙利亚">叙利亚</option>

                                                <option value="乌兹别克斯坦">乌兹别克斯坦</option>

                                                <option value="巴林">巴林</option>

                                                <option value="日本">日本</option>

                                                <option value="约旦">约旦</option>

                                                <option value="越南">越南</option>

                                                <option value="科特迪瓦">科特迪瓦</option>

                                                <option value="吉尔吉斯斯坦">吉尔吉斯斯坦</option>

                                                <option value="泰国">泰国</option>

                                                <option value="斯里兰卡">斯里兰卡</option>

                                                <option value="阿联酋">阿联酋</option>

                                                <option value="老挝">老挝</option>

                                                <option value="阿富汗">阿富汗</option>

                                                <option value="中国澳门">中国澳门</option>

                                                <option value="塔吉克斯坦">塔吉克斯坦</option>

                                                <option value="朝鲜">朝鲜</option>

                                                <option value="巴勒斯坦">巴勒斯坦</option>

                                                <option value="埃及">埃及</option>

                                                <option value="中国香港">中国香港</option>

                                                <option value="伊拉克">伊拉克</option>

                                                <option value="黎巴嫩">黎巴嫩</option>

                                                <option value="科威特">科威特</option>

                                                <option value="文莱">文莱</option>

                                                <option value="马尔代夫">马尔代夫</option>

                                                <option value="印度尼西亚">印度尼西亚</option>

                                                <option value="以色列">以色列</option>

                                                <option value="蒙古">蒙古</option>

                                                <option value="亚洲其他国家(地区)">亚洲其他国家(地区)</option>

                                                <option value="毛里求斯">毛里求斯</option>

                                                <option value="阿曼">阿曼</option>

                                                <option value="印度">印度</option>

                                                <option value="缅甸">缅甸</option>

                                                <option value="马来西亚">马来西亚</option>

                                                <option value="东帝汶">东帝汶</option>

                                                <option value="也门共和国">也门共和国</option>

                                                <option value="不丹">不丹</option>

                                                <option value="柬埔寨">柬埔寨</option>

                                                <option value="巴基斯坦">巴基斯坦</option>

                                                <option value="孟加拉国">孟加拉国</option>
                                            </select>
                                        </div>

                                    </div>

                                    <!--语言选择-->
                                    <div class="form-group">
                                        <label for="edit_language" class="col-sm-3 control-label">选择语言</label>
                                        <div class="col-sm-9">
                                            <select id="edit_language" class="form-control">
                                                <option>英语</option>
                                                <option>中文</option>
                                                <option>日语</option>
                                                <option>法语</option>
                                                <option>韩语</option>
                                                <option>其他语言</option>
                                            </select>
                                        </div>

                                    </div>
                                    <!--语言选择end-->

                                    <%--分类选择--%>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">分类</label>
                                        <div class="col-sm-9" id="edit_movie_label">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="einlineCheckbox1" value="option1"> 选项 1
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="einlineCheckbox2" value="option2"> 选项 2
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="einlineCheckbox3" value="option3"> 选项 3
                                            </label>
                                        </div>
                                    </div>
                                    <%--分类选择end--%>

                                    <!--上映时间-->
                                    <div class="form-group">
                                        <label for="edit_time" class="col-sm-3 control-label">上映时间</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="edit_time">
                                        </div>
                                    </div>
                                    <!--上映时间end-->

                                    <!--上映时长-->
                                    <div class="form-group">
                                        <label for="edit_length" class="col-sm-3 control-label">时长(分钟)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="edit_length"
                                                   placeholder="请输入上映时长（分钟）">
                                        </div>
                                    </div>
                                    <!--上映时长end-->
                                    <!--剧情简介-->
                                    <div class="form-group">
                                        <label for="edit_plot" class="col-sm-3 control-label">剧情简介</label>
                                        <div class="col-sm-9">
                                   <textarea rows="2" class="form-control" id="edit_plot"
                                             placeholder="剧情简介"></textarea>
                                        </div>
                                    </div>
                                    <!--剧情简介end-->
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <button type="submit" class="btn btn-primary" onclick="edit_movie()">
                                    修改
                                </button>
                                <span id="tip"> </span>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </div>

            <script>
                function getAddLabelToUpdate() {

                    $.ajax({
                        url:"${bathpath}/getLabels",
                        type:'post',
                        dataType:'json',
                        success:function (data) {
                            $("#edit_movie_label").empty();
                            var appendlabel='';
                            var json=data.data;
                            for(var i=0;i<json.length;i++){
                                appendlabel+='<label class="checkbox-inline">'+
                                    '<input type="checkbox" name="checklabel" id="inlineCheckbox'+(i+1)+'" value="'+json[i].id+'">'+json[i].name+
                                    '</label>';
                            }
                            $("#edit_movie_label").append(appendlabel);


                        }
                    })

                }
            </script>


            <div class="form-horizontal" role="form" id="add_movie"

                 style="margin: 20px;">
                <div class="modal fade" id="add_movie_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×
                                </button>
                                <h4 class="modal-title" id="add_movie_head">
                                    添加电影信息
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="add_movie_moviename" class="col-sm-3 control-label">电影名字</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="add_movie_moviename"
                                                   name="add_movie_moviename"
                                                   placeholder="电影名字">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="add_movie_directorname" class="col-sm-3 control-label">导演</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="add_movie_directorname"
                                                   value=""
                                                   id="add_movie_directorname"
                                                   placeholder="导演">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="add_movie_actorname" class="col-sm-3 control-label">主演</label>
                                        <div class="col-sm-9">
                                <textarea class="form-control" name="add_movie_actorname"
                                          id="add_movie_actorname"
                                          placeholder="主演">

                                </textarea>
                                        </div>
                                    </div>

                                    <!--复选框end-->
                                    <div class="form-group">
                                        <label for="add_movie_country" class="col-sm-3 control-label">选择制片地区/国家</label>
                                        <div class="col-sm-9">
                                            <select id="add_movie_country" class="form-control">
                                                <option value="布基纳法索">布基纳法索</option>

                                                <option value="沙特阿拉伯">沙特阿拉伯</option>

                                                <option value="土库曼斯坦">土库曼斯坦</option>

                                                <option value="卡塔尔">卡塔尔</option>

                                                <option value="尼泊尔">尼泊尔</option>

                                                <option value="哈萨克斯坦">哈萨克斯坦</option>

                                                <option value="菲律宾">菲律宾</option>


                                                <option value="中国大陆">中国大陆</option>

                                                <option value="伊朗">伊朗</option>

                                                <option value="哥斯达黎加">哥斯达黎加</option>

                                                <option value="厄立特里亚">厄立特里亚</option>

                                                <option value="古巴">古巴</option>

                                                <option value="多米尼加共和国">多米尼加共和国</option>

                                                <option value="墨西哥">墨西哥</option>

                                                <option value="尼加拉瓜">尼加拉瓜</option>

                                                <option value="巴拿马">巴拿马</option>

                                                <option value="荷属安地列斯群岛">荷属安地列斯群岛</option>

                                                <option value="萨尔瓦多">萨尔瓦多</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="波多黎各">波多黎各</option>

                                                <option value="美属维尔京群岛">美属维尔京群岛</option>

                                                <option value="圣多美和普林西比">圣多美和普林西比</option>

                                                <option value="安圭拉(英)">安圭拉(英)</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="圣文森特和格纳丁斯">圣文森特和格纳丁斯</option>

                                                <option value="荷属安德列斯">荷属安德列斯</option>

                                                <option value="瓜德罗普">瓜德罗普</option>

                                                <option value="洪都拉斯">洪都拉斯</option>

                                                <option value="危地马拉">危地马拉</option>

                                                <option value="格鲁吉亚">格鲁吉亚</option>

                                                <option value="亚美尼亚">亚美尼亚</option>

                                                <option value="阿塞拜疆">阿塞拜疆</option>

                                                <option value="安哥拉">安哥拉</option>

                                                <option value="白俄罗斯">白俄罗斯</option>

                                                <option value="俄罗斯联邦">俄罗斯联邦</option>

                                                <option value="乌克兰">乌克兰</option>

                                                <option value="欧洲其他国家(地区)">欧洲其他国家(地区)</option>

                                                <option value="匈牙利">匈牙利</option>

                                                <option value="冰岛">冰岛</option>

                                                <option value="马耳他">马耳他</option>

                                                <option value="摩纳哥">摩纳哥</option>

                                                <option value="挪威">挪威</option>

                                                <option value="罗马尼亚">罗马尼亚</option>

                                                <option value="利比亚">利比亚</option>

                                                <option value="圣马力诺">圣马力诺</option>

                                                <option value="瑞典">瑞典</option>

                                                <option value="瑞士">瑞士</option>

                                                <option value="爱沙尼亚">爱沙尼亚</option>

                                                <option value="拉脱维亚">拉脱维亚</option>

                                                <option value="立陶宛">立陶宛</option>

                                                <option value="摩尔多瓦">摩尔多瓦</option>

                                                <option value="土耳其">土耳其</option>

                                                <option value="斯洛文尼亚">斯洛文尼亚</option>

                                                <option value="捷克共和国">捷克共和国</option>

                                                <option value="非洲其他国家(地区)">非洲其他国家(地区)</option>

                                                <option value="斯洛伐克">斯洛伐克</option>

                                                <option value="马其顿">马其顿</option>

                                                <option value="波斯尼亚-黑塞哥维那共和">波斯尼亚-黑塞哥维那共和</option>

                                                <option value="梵蒂冈城国">梵蒂冈城国</option>

                                                <option value="荷兰">荷兰</option>

                                                <option value="克罗地亚">克罗地亚</option>

                                                <option value="希腊">希腊</option>

                                                <option value="爱尔兰">爱尔兰</option>

                                                <option value="比利时">比利时</option>

                                                <option value="塞浦路斯">塞浦路斯</option>

                                                <option value="塞卜泰">塞卜泰</option>

                                                <option value="丹麦">丹麦</option>

                                                <option value="英国">英国</option>

                                                <option value="德国">德国</option>

                                                <option value="法国">法国</option>

                                                <option value="意大利">意大利</option>

                                                <option value="卢森堡">卢森堡</option>

                                                <option value="葡萄牙">葡萄牙</option>

                                                <option value="波兰">波兰</option>

                                                <option value="西班牙">西班牙</option>

                                                <option value="阿尔巴尼亚">阿尔巴尼亚</option>

                                                <option value="津巴布韦">津巴布韦</option>

                                                <option value="安道尔">安道尔</option>

                                                <option value="列支敦士登">列支敦士登</option>

                                                <option value="塞黑">塞黑</option>

                                                <option value="奥地利">奥地利</option>

                                                <option value="保加利亚">保加利亚</option>

                                                <option value="芬兰">芬兰</option>

                                                <option value="直布罗陀">直布罗陀</option>

                                                <option value="多米尼克">多米尼克</option>

                                                <option value="百慕大">百慕大</option>

                                                <option value="加拿大">加拿大</option>

                                                <option value="几内亚">几内亚</option>

                                                <option value="美国">美国</option>

                                                <option value="格陵兰">格陵兰</option>

                                                <option value="北美洲其他国家(地区)">北美洲其他国家(地区)</option>

                                                <option value="汤加">汤加</option>

                                                <option value="澳大利亚">澳大利亚</option>

                                                <option value="库克群岛">库克群岛</option>

                                                <option value="瑙鲁">瑙鲁</option>

                                                <option value="新喀里多尼亚">新喀里多尼亚</option>

                                                <option value="瓦努阿图">瓦努阿图</option>

                                                <option value="所罗门群岛">所罗门群岛</option>

                                                <option value="塞拉利昂">塞拉利昂</option>

                                                <option value="萨摩亚">萨摩亚</option>

                                                <option value="图瓦卢">图瓦卢</option>

                                                <option value="密克罗尼西亚联邦">密克罗尼西亚联邦</option>

                                                <option value="马绍尔群岛">马绍尔群岛</option>

                                                <option value="基里巴斯">基里巴斯</option>

                                                <option value="法属玻利尼西亚">法属玻利尼西亚</option>

                                                <option value="新西兰">新西兰</option>

                                                <option value="斐济">斐济</option>

                                                <option value="巴布亚新几内亚">巴布亚新几内亚</option>

                                                <option value="帕劳共和国">帕劳共和国</option>

                                                <option value="喀麦隆">喀麦隆</option>

                                                <option value="留尼汪">留尼汪</option>

                                                <option value="土阿莫土群岛">土阿莫土群岛</option>

                                                <option value="土布艾群岛">土布艾群岛</option>

                                                <option value="社会群岛">社会群岛</option>

                                                <option value="马克萨斯群岛">马克萨斯群岛</option>

                                                <option value="瓦利斯和浮图纳">瓦利斯和浮图纳</option>

                                                <option value="盖比群岛">盖比群岛</option>

                                                <option value="诺福克岛">诺福克岛</option>

                                                <option value="大洋洲其他国家(地区)">大洋洲其他国家(地区)</option>

                                                <option value="智利">智利</option>

                                                <option value="哥伦比亚">哥伦比亚</option>

                                                <option value="加蓬">加蓬</option>

                                                <option value="法属圭亚那">法属圭亚那</option>

                                                <option value="圭亚那">圭亚那</option>

                                                <option value="库腊索岛">库腊索岛</option>

                                                <option value="巴拉圭">巴拉圭</option>

                                                <option value="秘鲁">秘鲁</option>

                                                <option value="苏里南">苏里南</option>

                                                <option value="委内瑞拉">委内瑞拉</option>

                                                <option value="乌拉圭">乌拉圭</option>

                                                <option value="厄瓜多尔">厄瓜多尔</option>

                                                <option value="安提瓜和巴布达">安提瓜和巴布达</option>

                                                <option value="加纳">加纳</option>

                                                <option value="阿鲁巴岛">阿鲁巴岛</option>

                                                <option value="巴哈马">巴哈马</option>

                                                <option value="巴巴多斯">巴巴多斯</option>

                                                <option value="开曼群岛">开曼群岛</option>

                                                <option value="格林纳达">格林纳达</option>

                                                <option value="萨巴">萨巴</option>

                                                <option value="海地">海地</option>

                                                <option value="牙买加">牙买加</option>

                                                <option value="马提尼克">马提尼克</option>

                                                <option value="蒙特塞拉特">蒙特塞拉特</option>

                                                <option value="坦桑尼亚">坦桑尼亚</option>

                                                <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>

                                                <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>

                                                <option value="特克斯和凯科斯群岛">特克斯和凯科斯群岛</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="圣其茨-尼维斯">圣其茨-尼维斯</option>

                                                <option value="圣马丁岛">圣马丁岛</option>

                                                <option value="南美洲其他国家(地区)">南美洲其他国家(地区)</option>

                                                <option value="圣皮埃尔和密克隆">圣皮埃尔和密克隆</option>

                                                <option value="阿根廷">阿根廷</option>

                                                <option value="伯利兹">伯利兹</option>

                                                <option value="马里">马里</option>

                                                <option value="玻利维亚">玻利维亚</option>

                                                <option value="巴西">巴西</option>

                                                <option value="博内尔">博内尔</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="索马里">索马里</option>

                                                <option value="毛里塔尼亚">毛里塔尼亚</option>

                                                <option value="乌干达">乌干达</option>

                                                <option value="乍得">乍得</option>

                                                <option value="马约特岛">马约特岛</option>

                                                <option value="贝宁">贝宁</option>

                                                <option value="科摩罗">科摩罗</option>

                                                <option value="博茨瓦那">博茨瓦那</option>

                                                <option value="塞内加尔">塞内加尔</option>

                                                <option value="斯威士兰">斯威士兰</option>

                                                <option value="几内亚(比绍)">几内亚(比绍)</option>

                                                <option value="民主刚果">民主刚果</option>

                                                <option value="中非共和国">中非共和国</option>

                                                <option value="莱索托">莱索托</option>

                                                <option value="刚果">刚果</option>

                                                <option value="南非">南非</option>

                                                <option value="马达加斯加">马达加斯加</option>

                                                <option value="利比里亚">利比里亚</option>

                                                <option value="突尼斯">突尼斯</option>

                                                <option value="赞比亚">赞比亚</option>

                                                <option value="尼日尔">尼日尔</option>

                                                <option value="西撒哈拉">西撒哈拉</option>

                                                <option value="多哥">多哥</option>

                                                <option value="纳米比亚">纳米比亚</option>

                                                <option value="莫桑比克">莫桑比克</option>

                                                <option value="梅利利亚">梅利利亚</option>

                                                <option value="埃塞俄比亚">埃塞俄比亚</option>

                                                <option value="卢旺达">卢旺达</option>

                                                <option value="摩洛哥">摩洛哥</option>

                                                <option value="马拉维">马拉维</option>

                                                <option value="尼日利亚">尼日利亚</option>

                                                <option value="佛得角">佛得角</option>

                                                <option value="布隆迪">布隆迪</option>

                                                <option value="阿尔及利亚">阿尔及利亚</option>

                                                <option value="吉布提">吉布提</option>

                                                <option value="加那利群岛">加那利群岛</option>

                                                <option value="冈比亚">冈比亚</option>

                                                <option value="赤道几内亚">赤道几内亚</option>

                                                <option value="塞舌尔">塞舌尔</option>

                                                <option value="苏丹">苏丹</option>

                                                <option value="肯尼亚">肯尼亚</option>

                                                <option value="新加坡">新加坡</option>

                                                <option value="韩国">韩国</option>

                                                <option value="叙利亚">叙利亚</option>

                                                <option value="乌兹别克斯坦">乌兹别克斯坦</option>

                                                <option value="巴林">巴林</option>

                                                <option value="日本">日本</option>

                                                <option value="约旦">约旦</option>

                                                <option value="越南">越南</option>

                                                <option value="科特迪瓦">科特迪瓦</option>

                                                <option value="吉尔吉斯斯坦">吉尔吉斯斯坦</option>

                                                <option value="泰国">泰国</option>

                                                <option value="斯里兰卡">斯里兰卡</option>

                                                <option value="阿联酋">阿联酋</option>

                                                <option value="老挝">老挝</option>

                                                <option value="阿富汗">阿富汗</option>

                                                <option value="中国澳门">中国澳门</option>

                                                <option value="塔吉克斯坦">塔吉克斯坦</option>

                                                <option value="朝鲜">朝鲜</option>

                                                <option value="巴勒斯坦">巴勒斯坦</option>

                                                <option value="埃及">埃及</option>

                                                <option value="中国香港">中国香港</option>

                                                <option value="伊拉克">伊拉克</option>

                                                <option value="黎巴嫩">黎巴嫩</option>

                                                <option value="科威特">科威特</option>

                                                <option value="文莱">文莱</option>

                                                <option value="马尔代夫">马尔代夫</option>

                                                <option value="印度尼西亚">印度尼西亚</option>

                                                <option value="以色列">以色列</option>

                                                <option value="蒙古">蒙古</option>

                                                <option value="亚洲其他国家(地区)">亚洲其他国家(地区)</option>

                                                <option value="毛里求斯">毛里求斯</option>

                                                <option value="阿曼">阿曼</option>

                                                <option value="印度">印度</option>

                                                <option value="缅甸">缅甸</option>

                                                <option value="马来西亚">马来西亚</option>

                                                <option value="东帝汶">东帝汶</option>

                                                <option value="也门共和国">也门共和国</option>

                                                <option value="不丹">不丹</option>

                                                <option value="柬埔寨">柬埔寨</option>

                                                <option value="巴基斯坦">巴基斯坦</option>

                                                <option value="孟加拉国">孟加拉国</option>
                                            </select>
                                        </div>

                                    </div>

                                    <%--上映地区--%>
                                    <div class="form-group">
                                        <label for="add_movie_release_region"
                                               class="col-sm-3 control-label">选择上映地区/国家</label>
                                        <div class="col-sm-9">
                                            <select id="add_movie_release_region" class="form-control">
                                                <option value="布基纳法索">布基纳法索</option>

                                                <option value="沙特阿拉伯">沙特阿拉伯</option>

                                                <option value="土库曼斯坦">土库曼斯坦</option>

                                                <option value="卡塔尔">卡塔尔</option>

                                                <option value="尼泊尔">尼泊尔</option>

                                                <option value="哈萨克斯坦">哈萨克斯坦</option>

                                                <option value="菲律宾">菲律宾</option>


                                                <option value="中国大陆">中国大陆</option>

                                                <option value="伊朗">伊朗</option>

                                                <option value="哥斯达黎加">哥斯达黎加</option>

                                                <option value="厄立特里亚">厄立特里亚</option>

                                                <option value="古巴">古巴</option>

                                                <option value="多米尼加共和国">多米尼加共和国</option>

                                                <option value="墨西哥">墨西哥</option>

                                                <option value="尼加拉瓜">尼加拉瓜</option>

                                                <option value="巴拿马">巴拿马</option>

                                                <option value="荷属安地列斯群岛">荷属安地列斯群岛</option>

                                                <option value="萨尔瓦多">萨尔瓦多</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="波多黎各">波多黎各</option>

                                                <option value="美属维尔京群岛">美属维尔京群岛</option>

                                                <option value="圣多美和普林西比">圣多美和普林西比</option>

                                                <option value="安圭拉(英)">安圭拉(英)</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="圣文森特和格纳丁斯">圣文森特和格纳丁斯</option>

                                                <option value="荷属安德列斯">荷属安德列斯</option>

                                                <option value="瓜德罗普">瓜德罗普</option>

                                                <option value="洪都拉斯">洪都拉斯</option>

                                                <option value="危地马拉">危地马拉</option>

                                                <option value="格鲁吉亚">格鲁吉亚</option>

                                                <option value="亚美尼亚">亚美尼亚</option>

                                                <option value="阿塞拜疆">阿塞拜疆</option>

                                                <option value="安哥拉">安哥拉</option>

                                                <option value="白俄罗斯">白俄罗斯</option>

                                                <option value="俄罗斯联邦">俄罗斯联邦</option>

                                                <option value="乌克兰">乌克兰</option>

                                                <option value="欧洲其他国家(地区)">欧洲其他国家(地区)</option>

                                                <option value="匈牙利">匈牙利</option>

                                                <option value="冰岛">冰岛</option>

                                                <option value="马耳他">马耳他</option>

                                                <option value="摩纳哥">摩纳哥</option>

                                                <option value="挪威">挪威</option>

                                                <option value="罗马尼亚">罗马尼亚</option>

                                                <option value="利比亚">利比亚</option>

                                                <option value="圣马力诺">圣马力诺</option>

                                                <option value="瑞典">瑞典</option>

                                                <option value="瑞士">瑞士</option>

                                                <option value="爱沙尼亚">爱沙尼亚</option>

                                                <option value="拉脱维亚">拉脱维亚</option>

                                                <option value="立陶宛">立陶宛</option>

                                                <option value="摩尔多瓦">摩尔多瓦</option>

                                                <option value="土耳其">土耳其</option>

                                                <option value="斯洛文尼亚">斯洛文尼亚</option>

                                                <option value="捷克共和国">捷克共和国</option>

                                                <option value="非洲其他国家(地区)">非洲其他国家(地区)</option>

                                                <option value="斯洛伐克">斯洛伐克</option>

                                                <option value="马其顿">马其顿</option>

                                                <option value="波斯尼亚-黑塞哥维那共和">波斯尼亚-黑塞哥维那共和</option>

                                                <option value="梵蒂冈城国">梵蒂冈城国</option>

                                                <option value="荷兰">荷兰</option>

                                                <option value="克罗地亚">克罗地亚</option>

                                                <option value="希腊">希腊</option>

                                                <option value="爱尔兰">爱尔兰</option>

                                                <option value="比利时">比利时</option>

                                                <option value="塞浦路斯">塞浦路斯</option>

                                                <option value="塞卜泰">塞卜泰</option>

                                                <option value="丹麦">丹麦</option>

                                                <option value="英国">英国</option>

                                                <option value="德国">德国</option>

                                                <option value="法国">法国</option>

                                                <option value="意大利">意大利</option>

                                                <option value="卢森堡">卢森堡</option>

                                                <option value="葡萄牙">葡萄牙</option>

                                                <option value="波兰">波兰</option>

                                                <option value="西班牙">西班牙</option>

                                                <option value="阿尔巴尼亚">阿尔巴尼亚</option>

                                                <option value="津巴布韦">津巴布韦</option>

                                                <option value="安道尔">安道尔</option>

                                                <option value="列支敦士登">列支敦士登</option>

                                                <option value="塞黑">塞黑</option>

                                                <option value="奥地利">奥地利</option>

                                                <option value="保加利亚">保加利亚</option>

                                                <option value="芬兰">芬兰</option>

                                                <option value="直布罗陀">直布罗陀</option>

                                                <option value="多米尼克">多米尼克</option>

                                                <option value="百慕大">百慕大</option>

                                                <option value="加拿大">加拿大</option>

                                                <option value="几内亚">几内亚</option>

                                                <option value="美国">美国</option>

                                                <option value="格陵兰">格陵兰</option>

                                                <option value="北美洲其他国家(地区)">北美洲其他国家(地区)</option>

                                                <option value="汤加">汤加</option>

                                                <option value="澳大利亚">澳大利亚</option>

                                                <option value="库克群岛">库克群岛</option>

                                                <option value="瑙鲁">瑙鲁</option>

                                                <option value="新喀里多尼亚">新喀里多尼亚</option>

                                                <option value="瓦努阿图">瓦努阿图</option>

                                                <option value="所罗门群岛">所罗门群岛</option>

                                                <option value="塞拉利昂">塞拉利昂</option>

                                                <option value="萨摩亚">萨摩亚</option>

                                                <option value="图瓦卢">图瓦卢</option>

                                                <option value="密克罗尼西亚联邦">密克罗尼西亚联邦</option>

                                                <option value="马绍尔群岛">马绍尔群岛</option>

                                                <option value="基里巴斯">基里巴斯</option>

                                                <option value="法属玻利尼西亚">法属玻利尼西亚</option>

                                                <option value="新西兰">新西兰</option>

                                                <option value="斐济">斐济</option>

                                                <option value="巴布亚新几内亚">巴布亚新几内亚</option>

                                                <option value="帕劳共和国">帕劳共和国</option>

                                                <option value="喀麦隆">喀麦隆</option>

                                                <option value="留尼汪">留尼汪</option>

                                                <option value="土阿莫土群岛">土阿莫土群岛</option>

                                                <option value="土布艾群岛">土布艾群岛</option>

                                                <option value="社会群岛">社会群岛</option>

                                                <option value="马克萨斯群岛">马克萨斯群岛</option>

                                                <option value="瓦利斯和浮图纳">瓦利斯和浮图纳</option>

                                                <option value="盖比群岛">盖比群岛</option>

                                                <option value="诺福克岛">诺福克岛</option>

                                                <option value="大洋洲其他国家(地区)">大洋洲其他国家(地区)</option>

                                                <option value="智利">智利</option>

                                                <option value="哥伦比亚">哥伦比亚</option>

                                                <option value="加蓬">加蓬</option>

                                                <option value="法属圭亚那">法属圭亚那</option>

                                                <option value="圭亚那">圭亚那</option>

                                                <option value="库腊索岛">库腊索岛</option>

                                                <option value="巴拉圭">巴拉圭</option>

                                                <option value="秘鲁">秘鲁</option>

                                                <option value="苏里南">苏里南</option>

                                                <option value="委内瑞拉">委内瑞拉</option>

                                                <option value="乌拉圭">乌拉圭</option>

                                                <option value="厄瓜多尔">厄瓜多尔</option>

                                                <option value="安提瓜和巴布达">安提瓜和巴布达</option>

                                                <option value="加纳">加纳</option>

                                                <option value="阿鲁巴岛">阿鲁巴岛</option>

                                                <option value="巴哈马">巴哈马</option>

                                                <option value="巴巴多斯">巴巴多斯</option>

                                                <option value="开曼群岛">开曼群岛</option>

                                                <option value="格林纳达">格林纳达</option>

                                                <option value="萨巴">萨巴</option>

                                                <option value="海地">海地</option>

                                                <option value="牙买加">牙买加</option>

                                                <option value="马提尼克">马提尼克</option>

                                                <option value="蒙特塞拉特">蒙特塞拉特</option>

                                                <option value="坦桑尼亚">坦桑尼亚</option>

                                                <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>

                                                <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>

                                                <option value="特克斯和凯科斯群岛">特克斯和凯科斯群岛</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="圣其茨-尼维斯">圣其茨-尼维斯</option>

                                                <option value="圣马丁岛">圣马丁岛</option>

                                                <option value="南美洲其他国家(地区)">南美洲其他国家(地区)</option>

                                                <option value="圣皮埃尔和密克隆">圣皮埃尔和密克隆</option>

                                                <option value="阿根廷">阿根廷</option>

                                                <option value="伯利兹">伯利兹</option>

                                                <option value="马里">马里</option>

                                                <option value="玻利维亚">玻利维亚</option>

                                                <option value="巴西">巴西</option>

                                                <option value="博内尔">博内尔</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="索马里">索马里</option>

                                                <option value="毛里塔尼亚">毛里塔尼亚</option>

                                                <option value="乌干达">乌干达</option>

                                                <option value="乍得">乍得</option>

                                                <option value="马约特岛">马约特岛</option>

                                                <option value="贝宁">贝宁</option>

                                                <option value="科摩罗">科摩罗</option>

                                                <option value="博茨瓦那">博茨瓦那</option>

                                                <option value="塞内加尔">塞内加尔</option>

                                                <option value="斯威士兰">斯威士兰</option>

                                                <option value="几内亚(比绍)">几内亚(比绍)</option>

                                                <option value="民主刚果">民主刚果</option>

                                                <option value="中非共和国">中非共和国</option>

                                                <option value="莱索托">莱索托</option>

                                                <option value="刚果">刚果</option>

                                                <option value="南非">南非</option>

                                                <option value="马达加斯加">马达加斯加</option>

                                                <option value="利比里亚">利比里亚</option>

                                                <option value="突尼斯">突尼斯</option>

                                                <option value="赞比亚">赞比亚</option>

                                                <option value="尼日尔">尼日尔</option>

                                                <option value="西撒哈拉">西撒哈拉</option>

                                                <option value="多哥">多哥</option>

                                                <option value="纳米比亚">纳米比亚</option>

                                                <option value="莫桑比克">莫桑比克</option>

                                                <option value="梅利利亚">梅利利亚</option>

                                                <option value="埃塞俄比亚">埃塞俄比亚</option>

                                                <option value="卢旺达">卢旺达</option>

                                                <option value="摩洛哥">摩洛哥</option>

                                                <option value="马拉维">马拉维</option>

                                                <option value="尼日利亚">尼日利亚</option>

                                                <option value="佛得角">佛得角</option>

                                                <option value="布隆迪">布隆迪</option>

                                                <option value="阿尔及利亚">阿尔及利亚</option>

                                                <option value="吉布提">吉布提</option>

                                                <option value="加那利群岛">加那利群岛</option>

                                                <option value="冈比亚">冈比亚</option>

                                                <option value="赤道几内亚">赤道几内亚</option>

                                                <option value="塞舌尔">塞舌尔</option>

                                                <option value="苏丹">苏丹</option>

                                                <option value="肯尼亚">肯尼亚</option>

                                                <option value="新加坡">新加坡</option>

                                                <option value="韩国">韩国</option>

                                                <option value="叙利亚">叙利亚</option>

                                                <option value="乌兹别克斯坦">乌兹别克斯坦</option>

                                                <option value="巴林">巴林</option>

                                                <option value="日本">日本</option>

                                                <option value="约旦">约旦</option>

                                                <option value="越南">越南</option>

                                                <option value="科特迪瓦">科特迪瓦</option>

                                                <option value="吉尔吉斯斯坦">吉尔吉斯斯坦</option>

                                                <option value="泰国">泰国</option>

                                                <option value="斯里兰卡">斯里兰卡</option>

                                                <option value="阿联酋">阿联酋</option>

                                                <option value="老挝">老挝</option>

                                                <option value="阿富汗">阿富汗</option>

                                                <option value="中国澳门">中国澳门</option>

                                                <option value="塔吉克斯坦">塔吉克斯坦</option>

                                                <option value="朝鲜">朝鲜</option>

                                                <option value="巴勒斯坦">巴勒斯坦</option>

                                                <option value="埃及">埃及</option>

                                                <option value="中国香港">中国香港</option>

                                                <option value="伊拉克">伊拉克</option>

                                                <option value="黎巴嫩">黎巴嫩</option>

                                                <option value="科威特">科威特</option>

                                                <option value="文莱">文莱</option>

                                                <option value="马尔代夫">马尔代夫</option>

                                                <option value="印度尼西亚">印度尼西亚</option>

                                                <option value="以色列">以色列</option>

                                                <option value="蒙古">蒙古</option>

                                                <option value="亚洲其他国家(地区)">亚洲其他国家(地区)</option>

                                                <option value="毛里求斯">毛里求斯</option>

                                                <option value="阿曼">阿曼</option>

                                                <option value="印度">印度</option>

                                                <option value="缅甸">缅甸</option>

                                                <option value="马来西亚">马来西亚</option>

                                                <option value="东帝汶">东帝汶</option>

                                                <option value="也门共和国">也门共和国</option>

                                                <option value="不丹">不丹</option>

                                                <option value="柬埔寨">柬埔寨</option>

                                                <option value="巴基斯坦">巴基斯坦</option>

                                                <option value="孟加拉国">孟加拉国</option>
                                            </select>
                                        </div>

                                    </div>

                                    <!--语言选择-->
                                    <div class="form-group">
                                        <label for="add_movie_language" class="col-sm-3 control-label">选择语言</label>
                                        <div class="col-sm-9">
                                            <select id="add_movie_language" class="form-control">
                                                <option>英语</option>
                                                <option>中文</option>
                                                <option>日语</option>
                                                <option>法语</option>
                                                <option>韩语</option>
                                                <option>其他语言</option>
                                            </select>
                                        </div>

                                    </div>
                                    <!--语言选择end-->


                                    <%--分类选择--%>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">分类</label>
                                        <div class="col-sm-9" id="add_movie_label">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox1" value="option1"> 选项 1
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox2" value="option2"> 选项 2
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="inlineCheckbox3" value="option3"> 选项 3
                                            </label>
                                        </div>
                                    </div>
                                    <%--分类选择end--%>

                                    <!--上映时间-->
                                    <div class="form-group">
                                        <label for="add_movie_time" class="col-sm-3 control-label">上映时间</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="add_movie_time">
                                        </div>
                                    </div>
                                    <!--上映时间end-->

                                    <!--上映时长-->
                                    <div class="form-group">
                                        <label for="add_movie_length" class="col-sm-3 control-label">时长(分钟)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="add_movie_length"
                                                   placeholder="请输入上映时长（分钟）">
                                        </div>
                                    </div>
                                    <!--上映时长end-->
                                    <!--剧情简介-->
                                    <div class="form-group">
                                        <label for="add_movie_plot" class="col-sm-3 control-label">剧情简介</label>
                                        <div class="col-sm-9">
                                   <textarea rows="2" class="form-control" id="add_movie_plot"
                                             placeholder="剧情简介"></textarea>
                                        </div>
                                    </div>
                                    <!--剧情简介end-->
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <button type="submit" class="btn btn-primary" onclick="add_movie()">
                                    添加
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </div>


            <script>
                function getAddLabel() {

                    $.ajax({
                        url:"${bathpath}/getLabels",
                        type:'post',
                        dataType:'json',
                        success:function (data) {
                            $("#add_movie_label").empty();
                            var appendlabel='';
                            var json=data.data;
                            for(var i=0;i<json.length;i++){
                                appendlabel+='<label class="checkbox-inline">'+
                                             '<input type="checkbox" name="checklabel" id="inlineCheckbox'+(i+1)+'" value="'+json[i].id+'">'+json[i].name+
                                             '</label>';
                            }
                            $("#add_movie_label").append(appendlabel);


                        }
                    })

                }
            </script>


            <div class="form-horizontal" role="form" id="show_movie"

                 style="margin: 20px;">
                <div class="modal fade" id="show_movie_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×
                                </button>
                                <h4 class="modal-title" id="show_movie_detail">
                                    电影详细信息
                                </h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="show_movie_moviename" class="col-sm-3 control-label">电影名字</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="show_movie_moviename"
                                                   name="show_movie_moviename" readonly="readonly"
                                                   placeholder="电影名字">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="show_movie_directorname" class="col-sm-3 control-label">导演</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="show_movie_directorname"
                                                   value=""
                                                   id="show_movie_directorname" readonly="readonly"
                                                   placeholder="导演">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="show_movie_actorname" class="col-sm-3 control-label">主演</label>
                                        <div class="col-sm-9">
                                <textarea class="form-control" name="show_movie_actorname" readonly="readonly"
                                          id="show_movie_actorname"
                                          placeholder="主演">

                                </textarea>
                                        </div>
                                    </div>

                                    <!--复选框end-->
                                    <div class="form-group">
                                        <label for="show_movie_country" class="col-sm-3 control-label">选择制片地区/国家</label>
                                        <div class="col-sm-9">
                                            <select disabled="disabled" id="show_movie_country" class="form-control">
                                                <option value="布基纳法索">布基纳法索</option>

                                                <option value="沙特阿拉伯">沙特阿拉伯</option>

                                                <option value="土库曼斯坦">土库曼斯坦</option>

                                                <option value="卡塔尔">卡塔尔</option>

                                                <option value="尼泊尔">尼泊尔</option>

                                                <option value="哈萨克斯坦">哈萨克斯坦</option>

                                                <option value="菲律宾">菲律宾</option>


                                                <option value="中国大陆">中国大陆</option>

                                                <option value="伊朗">伊朗</option>

                                                <option value="哥斯达黎加">哥斯达黎加</option>

                                                <option value="厄立特里亚">厄立特里亚</option>

                                                <option value="古巴">古巴</option>

                                                <option value="多米尼加共和国">多米尼加共和国</option>

                                                <option value="墨西哥">墨西哥</option>

                                                <option value="尼加拉瓜">尼加拉瓜</option>

                                                <option value="巴拿马">巴拿马</option>

                                                <option value="荷属安地列斯群岛">荷属安地列斯群岛</option>

                                                <option value="萨尔瓦多">萨尔瓦多</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="波多黎各">波多黎各</option>

                                                <option value="美属维尔京群岛">美属维尔京群岛</option>

                                                <option value="圣多美和普林西比">圣多美和普林西比</option>

                                                <option value="安圭拉(英)">安圭拉(英)</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="圣文森特和格纳丁斯">圣文森特和格纳丁斯</option>

                                                <option value="荷属安德列斯">荷属安德列斯</option>

                                                <option value="瓜德罗普">瓜德罗普</option>

                                                <option value="洪都拉斯">洪都拉斯</option>

                                                <option value="危地马拉">危地马拉</option>

                                                <option value="格鲁吉亚">格鲁吉亚</option>

                                                <option value="亚美尼亚">亚美尼亚</option>

                                                <option value="阿塞拜疆">阿塞拜疆</option>

                                                <option value="安哥拉">安哥拉</option>

                                                <option value="白俄罗斯">白俄罗斯</option>

                                                <option value="俄罗斯联邦">俄罗斯联邦</option>

                                                <option value="乌克兰">乌克兰</option>

                                                <option value="欧洲其他国家(地区)">欧洲其他国家(地区)</option>

                                                <option value="匈牙利">匈牙利</option>

                                                <option value="冰岛">冰岛</option>

                                                <option value="马耳他">马耳他</option>

                                                <option value="摩纳哥">摩纳哥</option>

                                                <option value="挪威">挪威</option>

                                                <option value="罗马尼亚">罗马尼亚</option>

                                                <option value="利比亚">利比亚</option>

                                                <option value="圣马力诺">圣马力诺</option>

                                                <option value="瑞典">瑞典</option>

                                                <option value="瑞士">瑞士</option>

                                                <option value="爱沙尼亚">爱沙尼亚</option>

                                                <option value="拉脱维亚">拉脱维亚</option>

                                                <option value="立陶宛">立陶宛</option>

                                                <option value="摩尔多瓦">摩尔多瓦</option>

                                                <option value="土耳其">土耳其</option>

                                                <option value="斯洛文尼亚">斯洛文尼亚</option>

                                                <option value="捷克共和国">捷克共和国</option>

                                                <option value="非洲其他国家(地区)">非洲其他国家(地区)</option>

                                                <option value="斯洛伐克">斯洛伐克</option>

                                                <option value="马其顿">马其顿</option>

                                                <option value="波斯尼亚-黑塞哥维那共和">波斯尼亚-黑塞哥维那共和</option>

                                                <option value="梵蒂冈城国">梵蒂冈城国</option>

                                                <option value="荷兰">荷兰</option>

                                                <option value="克罗地亚">克罗地亚</option>

                                                <option value="希腊">希腊</option>

                                                <option value="爱尔兰">爱尔兰</option>

                                                <option value="比利时">比利时</option>

                                                <option value="塞浦路斯">塞浦路斯</option>

                                                <option value="塞卜泰">塞卜泰</option>

                                                <option value="丹麦">丹麦</option>

                                                <option value="英国">英国</option>

                                                <option value="德国">德国</option>

                                                <option value="法国">法国</option>

                                                <option value="意大利">意大利</option>

                                                <option value="卢森堡">卢森堡</option>

                                                <option value="葡萄牙">葡萄牙</option>

                                                <option value="波兰">波兰</option>

                                                <option value="西班牙">西班牙</option>

                                                <option value="阿尔巴尼亚">阿尔巴尼亚</option>

                                                <option value="津巴布韦">津巴布韦</option>

                                                <option value="安道尔">安道尔</option>

                                                <option value="列支敦士登">列支敦士登</option>

                                                <option value="塞黑">塞黑</option>

                                                <option value="奥地利">奥地利</option>

                                                <option value="保加利亚">保加利亚</option>

                                                <option value="芬兰">芬兰</option>

                                                <option value="直布罗陀">直布罗陀</option>

                                                <option value="多米尼克">多米尼克</option>

                                                <option value="百慕大">百慕大</option>

                                                <option value="加拿大">加拿大</option>

                                                <option value="几内亚">几内亚</option>

                                                <option value="美国">美国</option>

                                                <option value="格陵兰">格陵兰</option>

                                                <option value="北美洲其他国家(地区)">北美洲其他国家(地区)</option>

                                                <option value="汤加">汤加</option>

                                                <option value="澳大利亚">澳大利亚</option>

                                                <option value="库克群岛">库克群岛</option>

                                                <option value="瑙鲁">瑙鲁</option>

                                                <option value="新喀里多尼亚">新喀里多尼亚</option>

                                                <option value="瓦努阿图">瓦努阿图</option>

                                                <option value="所罗门群岛">所罗门群岛</option>

                                                <option value="塞拉利昂">塞拉利昂</option>

                                                <option value="萨摩亚">萨摩亚</option>

                                                <option value="图瓦卢">图瓦卢</option>

                                                <option value="密克罗尼西亚联邦">密克罗尼西亚联邦</option>

                                                <option value="马绍尔群岛">马绍尔群岛</option>

                                                <option value="基里巴斯">基里巴斯</option>

                                                <option value="法属玻利尼西亚">法属玻利尼西亚</option>

                                                <option value="新西兰">新西兰</option>

                                                <option value="斐济">斐济</option>

                                                <option value="巴布亚新几内亚">巴布亚新几内亚</option>

                                                <option value="帕劳共和国">帕劳共和国</option>

                                                <option value="喀麦隆">喀麦隆</option>

                                                <option value="留尼汪">留尼汪</option>

                                                <option value="土阿莫土群岛">土阿莫土群岛</option>

                                                <option value="土布艾群岛">土布艾群岛</option>

                                                <option value="社会群岛">社会群岛</option>

                                                <option value="马克萨斯群岛">马克萨斯群岛</option>

                                                <option value="瓦利斯和浮图纳">瓦利斯和浮图纳</option>

                                                <option value="盖比群岛">盖比群岛</option>

                                                <option value="诺福克岛">诺福克岛</option>

                                                <option value="大洋洲其他国家(地区)">大洋洲其他国家(地区)</option>

                                                <option value="智利">智利</option>

                                                <option value="哥伦比亚">哥伦比亚</option>

                                                <option value="加蓬">加蓬</option>

                                                <option value="法属圭亚那">法属圭亚那</option>

                                                <option value="圭亚那">圭亚那</option>

                                                <option value="库腊索岛">库腊索岛</option>

                                                <option value="巴拉圭">巴拉圭</option>

                                                <option value="秘鲁">秘鲁</option>

                                                <option value="苏里南">苏里南</option>

                                                <option value="委内瑞拉">委内瑞拉</option>

                                                <option value="乌拉圭">乌拉圭</option>

                                                <option value="厄瓜多尔">厄瓜多尔</option>

                                                <option value="安提瓜和巴布达">安提瓜和巴布达</option>

                                                <option value="加纳">加纳</option>

                                                <option value="阿鲁巴岛">阿鲁巴岛</option>

                                                <option value="巴哈马">巴哈马</option>

                                                <option value="巴巴多斯">巴巴多斯</option>

                                                <option value="开曼群岛">开曼群岛</option>

                                                <option value="格林纳达">格林纳达</option>

                                                <option value="萨巴">萨巴</option>

                                                <option value="海地">海地</option>

                                                <option value="牙买加">牙买加</option>

                                                <option value="马提尼克">马提尼克</option>

                                                <option value="蒙特塞拉特">蒙特塞拉特</option>

                                                <option value="坦桑尼亚">坦桑尼亚</option>

                                                <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>

                                                <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>

                                                <option value="特克斯和凯科斯群岛">特克斯和凯科斯群岛</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="圣其茨-尼维斯">圣其茨-尼维斯</option>

                                                <option value="圣马丁岛">圣马丁岛</option>

                                                <option value="南美洲其他国家(地区)">南美洲其他国家(地区)</option>

                                                <option value="圣皮埃尔和密克隆">圣皮埃尔和密克隆</option>

                                                <option value="阿根廷">阿根廷</option>

                                                <option value="伯利兹">伯利兹</option>

                                                <option value="马里">马里</option>

                                                <option value="玻利维亚">玻利维亚</option>

                                                <option value="巴西">巴西</option>

                                                <option value="博内尔">博内尔</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="索马里">索马里</option>

                                                <option value="毛里塔尼亚">毛里塔尼亚</option>

                                                <option value="乌干达">乌干达</option>

                                                <option value="乍得">乍得</option>

                                                <option value="马约特岛">马约特岛</option>

                                                <option value="贝宁">贝宁</option>

                                                <option value="科摩罗">科摩罗</option>

                                                <option value="博茨瓦那">博茨瓦那</option>

                                                <option value="塞内加尔">塞内加尔</option>

                                                <option value="斯威士兰">斯威士兰</option>

                                                <option value="几内亚(比绍)">几内亚(比绍)</option>

                                                <option value="民主刚果">民主刚果</option>

                                                <option value="中非共和国">中非共和国</option>

                                                <option value="莱索托">莱索托</option>

                                                <option value="刚果">刚果</option>

                                                <option value="南非">南非</option>

                                                <option value="马达加斯加">马达加斯加</option>

                                                <option value="利比里亚">利比里亚</option>

                                                <option value="突尼斯">突尼斯</option>

                                                <option value="赞比亚">赞比亚</option>

                                                <option value="尼日尔">尼日尔</option>

                                                <option value="西撒哈拉">西撒哈拉</option>

                                                <option value="多哥">多哥</option>

                                                <option value="纳米比亚">纳米比亚</option>

                                                <option value="莫桑比克">莫桑比克</option>

                                                <option value="梅利利亚">梅利利亚</option>

                                                <option value="埃塞俄比亚">埃塞俄比亚</option>

                                                <option value="卢旺达">卢旺达</option>

                                                <option value="摩洛哥">摩洛哥</option>

                                                <option value="马拉维">马拉维</option>

                                                <option value="尼日利亚">尼日利亚</option>

                                                <option value="佛得角">佛得角</option>

                                                <option value="布隆迪">布隆迪</option>

                                                <option value="阿尔及利亚">阿尔及利亚</option>

                                                <option value="吉布提">吉布提</option>

                                                <option value="加那利群岛">加那利群岛</option>

                                                <option value="冈比亚">冈比亚</option>

                                                <option value="赤道几内亚">赤道几内亚</option>

                                                <option value="塞舌尔">塞舌尔</option>

                                                <option value="苏丹">苏丹</option>

                                                <option value="肯尼亚">肯尼亚</option>

                                                <option value="新加坡">新加坡</option>

                                                <option value="韩国">韩国</option>

                                                <option value="叙利亚">叙利亚</option>

                                                <option value="乌兹别克斯坦">乌兹别克斯坦</option>

                                                <option value="巴林">巴林</option>

                                                <option value="日本">日本</option>

                                                <option value="约旦">约旦</option>

                                                <option value="越南">越南</option>

                                                <option value="科特迪瓦">科特迪瓦</option>

                                                <option value="吉尔吉斯斯坦">吉尔吉斯斯坦</option>

                                                <option value="泰国">泰国</option>

                                                <option value="斯里兰卡">斯里兰卡</option>

                                                <option value="阿联酋">阿联酋</option>

                                                <option value="老挝">老挝</option>

                                                <option value="阿富汗">阿富汗</option>

                                                <option value="中国澳门">中国澳门</option>

                                                <option value="塔吉克斯坦">塔吉克斯坦</option>

                                                <option value="朝鲜">朝鲜</option>

                                                <option value="巴勒斯坦">巴勒斯坦</option>

                                                <option value="埃及">埃及</option>

                                                <option value="中国香港">中国香港</option>

                                                <option value="伊拉克">伊拉克</option>

                                                <option value="黎巴嫩">黎巴嫩</option>

                                                <option value="科威特">科威特</option>

                                                <option value="文莱">文莱</option>

                                                <option value="马尔代夫">马尔代夫</option>

                                                <option value="印度尼西亚">印度尼西亚</option>

                                                <option value="以色列">以色列</option>

                                                <option value="蒙古">蒙古</option>

                                                <option value="亚洲其他国家(地区)">亚洲其他国家(地区)</option>

                                                <option value="毛里求斯">毛里求斯</option>

                                                <option value="阿曼">阿曼</option>

                                                <option value="印度">印度</option>

                                                <option value="缅甸">缅甸</option>

                                                <option value="马来西亚">马来西亚</option>

                                                <option value="东帝汶">东帝汶</option>

                                                <option value="也门共和国">也门共和国</option>

                                                <option value="不丹">不丹</option>

                                                <option value="柬埔寨">柬埔寨</option>

                                                <option value="巴基斯坦">巴基斯坦</option>

                                                <option value="孟加拉国">孟加拉国</option>
                                            </select>
                                        </div>

                                    </div>

                                    <%--上映地区--%>
                                    <div class="form-group">
                                        <label for="show_movie_release_region"
                                               class="col-sm-3 control-label">选择上映地区/国家</label>
                                        <div class="col-sm-9">
                                            <select disabled="disabled" id="show_movie_release_region"
                                                    class="form-control">
                                                <option value="布基纳法索">布基纳法索</option>

                                                <option value="沙特阿拉伯">沙特阿拉伯</option>

                                                <option value="土库曼斯坦">土库曼斯坦</option>

                                                <option value="卡塔尔">卡塔尔</option>

                                                <option value="尼泊尔">尼泊尔</option>

                                                <option value="哈萨克斯坦">哈萨克斯坦</option>

                                                <option value="菲律宾">菲律宾</option>


                                                <option value="中国大陆">中国大陆</option>

                                                <option value="伊朗">伊朗</option>

                                                <option value="哥斯达黎加">哥斯达黎加</option>

                                                <option value="厄立特里亚">厄立特里亚</option>

                                                <option value="古巴">古巴</option>

                                                <option value="多米尼加共和国">多米尼加共和国</option>

                                                <option value="墨西哥">墨西哥</option>

                                                <option value="尼加拉瓜">尼加拉瓜</option>

                                                <option value="巴拿马">巴拿马</option>

                                                <option value="荷属安地列斯群岛">荷属安地列斯群岛</option>

                                                <option value="萨尔瓦多">萨尔瓦多</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="波多黎各">波多黎各</option>

                                                <option value="美属维尔京群岛">美属维尔京群岛</option>

                                                <option value="圣多美和普林西比">圣多美和普林西比</option>

                                                <option value="安圭拉(英)">安圭拉(英)</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="圣文森特和格纳丁斯">圣文森特和格纳丁斯</option>

                                                <option value="荷属安德列斯">荷属安德列斯</option>

                                                <option value="瓜德罗普">瓜德罗普</option>

                                                <option value="洪都拉斯">洪都拉斯</option>

                                                <option value="危地马拉">危地马拉</option>

                                                <option value="格鲁吉亚">格鲁吉亚</option>

                                                <option value="亚美尼亚">亚美尼亚</option>

                                                <option value="阿塞拜疆">阿塞拜疆</option>

                                                <option value="安哥拉">安哥拉</option>

                                                <option value="白俄罗斯">白俄罗斯</option>

                                                <option value="俄罗斯联邦">俄罗斯联邦</option>

                                                <option value="乌克兰">乌克兰</option>

                                                <option value="欧洲其他国家(地区)">欧洲其他国家(地区)</option>

                                                <option value="匈牙利">匈牙利</option>

                                                <option value="冰岛">冰岛</option>

                                                <option value="马耳他">马耳他</option>

                                                <option value="摩纳哥">摩纳哥</option>

                                                <option value="挪威">挪威</option>

                                                <option value="罗马尼亚">罗马尼亚</option>

                                                <option value="利比亚">利比亚</option>

                                                <option value="圣马力诺">圣马力诺</option>

                                                <option value="瑞典">瑞典</option>

                                                <option value="瑞士">瑞士</option>

                                                <option value="爱沙尼亚">爱沙尼亚</option>

                                                <option value="拉脱维亚">拉脱维亚</option>

                                                <option value="立陶宛">立陶宛</option>

                                                <option value="摩尔多瓦">摩尔多瓦</option>

                                                <option value="土耳其">土耳其</option>

                                                <option value="斯洛文尼亚">斯洛文尼亚</option>

                                                <option value="捷克共和国">捷克共和国</option>

                                                <option value="非洲其他国家(地区)">非洲其他国家(地区)</option>

                                                <option value="斯洛伐克">斯洛伐克</option>

                                                <option value="马其顿">马其顿</option>

                                                <option value="波斯尼亚-黑塞哥维那共和">波斯尼亚-黑塞哥维那共和</option>

                                                <option value="梵蒂冈城国">梵蒂冈城国</option>

                                                <option value="荷兰">荷兰</option>

                                                <option value="克罗地亚">克罗地亚</option>

                                                <option value="希腊">希腊</option>

                                                <option value="爱尔兰">爱尔兰</option>

                                                <option value="比利时">比利时</option>

                                                <option value="塞浦路斯">塞浦路斯</option>

                                                <option value="塞卜泰">塞卜泰</option>

                                                <option value="丹麦">丹麦</option>

                                                <option value="英国">英国</option>

                                                <option value="德国">德国</option>

                                                <option value="法国">法国</option>

                                                <option value="意大利">意大利</option>

                                                <option value="卢森堡">卢森堡</option>

                                                <option value="葡萄牙">葡萄牙</option>

                                                <option value="波兰">波兰</option>

                                                <option value="西班牙">西班牙</option>

                                                <option value="阿尔巴尼亚">阿尔巴尼亚</option>

                                                <option value="津巴布韦">津巴布韦</option>

                                                <option value="安道尔">安道尔</option>

                                                <option value="列支敦士登">列支敦士登</option>

                                                <option value="塞黑">塞黑</option>

                                                <option value="奥地利">奥地利</option>

                                                <option value="保加利亚">保加利亚</option>

                                                <option value="芬兰">芬兰</option>

                                                <option value="直布罗陀">直布罗陀</option>

                                                <option value="多米尼克">多米尼克</option>

                                                <option value="百慕大">百慕大</option>

                                                <option value="加拿大">加拿大</option>

                                                <option value="几内亚">几内亚</option>

                                                <option value="美国">美国</option>

                                                <option value="格陵兰">格陵兰</option>

                                                <option value="北美洲其他国家(地区)">北美洲其他国家(地区)</option>

                                                <option value="汤加">汤加</option>

                                                <option value="澳大利亚">澳大利亚</option>

                                                <option value="库克群岛">库克群岛</option>

                                                <option value="瑙鲁">瑙鲁</option>

                                                <option value="新喀里多尼亚">新喀里多尼亚</option>

                                                <option value="瓦努阿图">瓦努阿图</option>

                                                <option value="所罗门群岛">所罗门群岛</option>

                                                <option value="塞拉利昂">塞拉利昂</option>

                                                <option value="萨摩亚">萨摩亚</option>

                                                <option value="图瓦卢">图瓦卢</option>

                                                <option value="密克罗尼西亚联邦">密克罗尼西亚联邦</option>

                                                <option value="马绍尔群岛">马绍尔群岛</option>

                                                <option value="基里巴斯">基里巴斯</option>

                                                <option value="法属玻利尼西亚">法属玻利尼西亚</option>

                                                <option value="新西兰">新西兰</option>

                                                <option value="斐济">斐济</option>

                                                <option value="巴布亚新几内亚">巴布亚新几内亚</option>

                                                <option value="帕劳共和国">帕劳共和国</option>

                                                <option value="喀麦隆">喀麦隆</option>

                                                <option value="留尼汪">留尼汪</option>

                                                <option value="土阿莫土群岛">土阿莫土群岛</option>

                                                <option value="土布艾群岛">土布艾群岛</option>

                                                <option value="社会群岛">社会群岛</option>

                                                <option value="马克萨斯群岛">马克萨斯群岛</option>

                                                <option value="瓦利斯和浮图纳">瓦利斯和浮图纳</option>

                                                <option value="盖比群岛">盖比群岛</option>

                                                <option value="诺福克岛">诺福克岛</option>

                                                <option value="大洋洲其他国家(地区)">大洋洲其他国家(地区)</option>

                                                <option value="智利">智利</option>

                                                <option value="哥伦比亚">哥伦比亚</option>

                                                <option value="加蓬">加蓬</option>

                                                <option value="法属圭亚那">法属圭亚那</option>

                                                <option value="圭亚那">圭亚那</option>

                                                <option value="库腊索岛">库腊索岛</option>

                                                <option value="巴拉圭">巴拉圭</option>

                                                <option value="秘鲁">秘鲁</option>

                                                <option value="苏里南">苏里南</option>

                                                <option value="委内瑞拉">委内瑞拉</option>

                                                <option value="乌拉圭">乌拉圭</option>

                                                <option value="厄瓜多尔">厄瓜多尔</option>

                                                <option value="安提瓜和巴布达">安提瓜和巴布达</option>

                                                <option value="加纳">加纳</option>

                                                <option value="阿鲁巴岛">阿鲁巴岛</option>

                                                <option value="巴哈马">巴哈马</option>

                                                <option value="巴巴多斯">巴巴多斯</option>

                                                <option value="开曼群岛">开曼群岛</option>

                                                <option value="格林纳达">格林纳达</option>

                                                <option value="萨巴">萨巴</option>

                                                <option value="海地">海地</option>

                                                <option value="牙买加">牙买加</option>

                                                <option value="马提尼克">马提尼克</option>

                                                <option value="蒙特塞拉特">蒙特塞拉特</option>

                                                <option value="坦桑尼亚">坦桑尼亚</option>

                                                <option value="圣文森特和格林纳丁斯">圣文森特和格林纳丁斯</option>

                                                <option value="特立尼达和多巴哥">特立尼达和多巴哥</option>

                                                <option value="特克斯和凯科斯群岛">特克斯和凯科斯群岛</option>

                                                <option value="英属维尔京群岛">英属维尔京群岛</option>

                                                <option value="圣其茨-尼维斯">圣其茨-尼维斯</option>

                                                <option value="圣马丁岛">圣马丁岛</option>

                                                <option value="南美洲其他国家(地区)">南美洲其他国家(地区)</option>

                                                <option value="圣皮埃尔和密克隆">圣皮埃尔和密克隆</option>

                                                <option value="阿根廷">阿根廷</option>

                                                <option value="伯利兹">伯利兹</option>

                                                <option value="马里">马里</option>

                                                <option value="玻利维亚">玻利维亚</option>

                                                <option value="巴西">巴西</option>

                                                <option value="博内尔">博内尔</option>

                                                <option value="圣卢西亚">圣卢西亚</option>

                                                <option value="索马里">索马里</option>

                                                <option value="毛里塔尼亚">毛里塔尼亚</option>

                                                <option value="乌干达">乌干达</option>

                                                <option value="乍得">乍得</option>

                                                <option value="马约特岛">马约特岛</option>

                                                <option value="贝宁">贝宁</option>

                                                <option value="科摩罗">科摩罗</option>

                                                <option value="博茨瓦那">博茨瓦那</option>

                                                <option value="塞内加尔">塞内加尔</option>

                                                <option value="斯威士兰">斯威士兰</option>

                                                <option value="几内亚(比绍)">几内亚(比绍)</option>

                                                <option value="民主刚果">民主刚果</option>

                                                <option value="中非共和国">中非共和国</option>

                                                <option value="莱索托">莱索托</option>

                                                <option value="刚果">刚果</option>

                                                <option value="南非">南非</option>

                                                <option value="马达加斯加">马达加斯加</option>

                                                <option value="利比里亚">利比里亚</option>

                                                <option value="突尼斯">突尼斯</option>

                                                <option value="赞比亚">赞比亚</option>

                                                <option value="尼日尔">尼日尔</option>

                                                <option value="西撒哈拉">西撒哈拉</option>

                                                <option value="多哥">多哥</option>

                                                <option value="纳米比亚">纳米比亚</option>

                                                <option value="莫桑比克">莫桑比克</option>

                                                <option value="梅利利亚">梅利利亚</option>

                                                <option value="埃塞俄比亚">埃塞俄比亚</option>

                                                <option value="卢旺达">卢旺达</option>

                                                <option value="摩洛哥">摩洛哥</option>

                                                <option value="马拉维">马拉维</option>

                                                <option value="尼日利亚">尼日利亚</option>

                                                <option value="佛得角">佛得角</option>

                                                <option value="布隆迪">布隆迪</option>

                                                <option value="阿尔及利亚">阿尔及利亚</option>

                                                <option value="吉布提">吉布提</option>

                                                <option value="加那利群岛">加那利群岛</option>

                                                <option value="冈比亚">冈比亚</option>

                                                <option value="赤道几内亚">赤道几内亚</option>

                                                <option value="塞舌尔">塞舌尔</option>

                                                <option value="苏丹">苏丹</option>

                                                <option value="肯尼亚">肯尼亚</option>

                                                <option value="新加坡">新加坡</option>

                                                <option value="韩国">韩国</option>

                                                <option value="叙利亚">叙利亚</option>

                                                <option value="乌兹别克斯坦">乌兹别克斯坦</option>

                                                <option value="巴林">巴林</option>

                                                <option value="日本">日本</option>

                                                <option value="约旦">约旦</option>

                                                <option value="越南">越南</option>

                                                <option value="科特迪瓦">科特迪瓦</option>

                                                <option value="吉尔吉斯斯坦">吉尔吉斯斯坦</option>

                                                <option value="泰国">泰国</option>

                                                <option value="斯里兰卡">斯里兰卡</option>

                                                <option value="阿联酋">阿联酋</option>

                                                <option value="老挝">老挝</option>

                                                <option value="阿富汗">阿富汗</option>

                                                <option value="中国澳门">中国澳门</option>

                                                <option value="塔吉克斯坦">塔吉克斯坦</option>

                                                <option value="朝鲜">朝鲜</option>

                                                <option value="巴勒斯坦">巴勒斯坦</option>

                                                <option value="埃及">埃及</option>

                                                <option value="中国香港">中国香港</option>

                                                <option value="伊拉克">伊拉克</option>

                                                <option value="黎巴嫩">黎巴嫩</option>

                                                <option value="科威特">科威特</option>

                                                <option value="文莱">文莱</option>

                                                <option value="马尔代夫">马尔代夫</option>

                                                <option value="印度尼西亚">印度尼西亚</option>

                                                <option value="以色列">以色列</option>

                                                <option value="蒙古">蒙古</option>

                                                <option value="亚洲其他国家(地区)">亚洲其他国家(地区)</option>

                                                <option value="毛里求斯">毛里求斯</option>

                                                <option value="阿曼">阿曼</option>

                                                <option value="印度">印度</option>

                                                <option value="缅甸">缅甸</option>

                                                <option value="马来西亚">马来西亚</option>

                                                <option value="东帝汶">东帝汶</option>

                                                <option value="也门共和国">也门共和国</option>

                                                <option value="不丹">不丹</option>

                                                <option value="柬埔寨">柬埔寨</option>

                                                <option value="巴基斯坦">巴基斯坦</option>

                                                <option value="孟加拉国">孟加拉国</option>
                                            </select>
                                        </div>

                                    </div>

                                    <!--语言选择-->
                                    <div class="form-group">
                                        <label for="show_movie_language" class="col-sm-3 control-label">选择语言</label>
                                        <div class="col-sm-9">
                                            <select disabled="disabled" id="show_movie_language" class="form-control">
                                                <option>英语</option>
                                                <option>中文</option>
                                                <option>日语</option>
                                                <option>法语</option>
                                                <option>韩语</option>
                                                <option>其他语言</option>
                                            </select>
                                        </div>

                                    </div>
                                    <!--语言选择end-->

                                    <!--上映时间-->
                                    <div class="form-group">
                                        <label for="show_movie_time" class="col-sm-3 control-label">上映时间</label>
                                        <div class="col-sm-9">
                                            <input disabled="disabled" type="date" class="form-control"
                                                   id="show_movie_time">
                                        </div>
                                    </div>
                                    <!--上映时间end-->

                                    <!--上映时长-->
                                    <div class="form-group">
                                        <label for="show_movie_length" class="col-sm-3 control-label">时长(分钟)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="show_movie_length"
                                                   readonly="readonly" placeholder="请输入上映时长（分钟）">
                                        </div>
                                    </div>
                                    <!--上映时长end-->
                                    <!--剧情简介-->
                                    <div class="form-group">
                                        <label for="show_movie_plot" class="col-sm-3 control-label">剧情简介</label>
                                        <div class="col-sm-9">
                                   <textarea rows="2" class="form-control" id="show_movie_plot" readonly="readonly"
                                             placeholder="剧情简介"></textarea>
                                        </div>
                                    </div>
                                    <!--剧情简介end-->
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </div>

            <!--弹出框-->

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
                            <input type="hidden" id="id1"/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="deletemovieinfo()" class="btn btn-success" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <script>
                function delcfm1(id) {
                    $('#id1').val(id);//给会话中的隐藏属性URL赋值
                    $('#delcfmModel1').modal();
                }
                function deletemovieinfo() {
                    var id = $.trim($("#id1").val());//获取会话中的隐藏属性URL
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

                    $.ajax({
                        type: "get",
                        url: "${basepath}/movie_deleteMovie",
                        async: true,
                        data: {
                            id: id
                        },
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").show(); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").hide();
                            if (flag == 1) {
                                toastr.success('删除成功');
                            } else {

                                toastr.error('删除失败');
                            }
                            setTimeout("window.location.reload()", 3000);

                        }
                    })
                }
            </script>

        </div>
        <!--增加电影之后，查看上传的电影信息，修改，删除，查找-->
        <script>

            var movieId;



            function changeDateFormat1(cellval) {
                var dateVal = cellval + "";
                if (cellval != null) {
                    var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

                    var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                    return date.getFullYear() + "-" + month + "-" + currentDate;
                }
            }

            // 得到要编辑的信息
            function get_edit_info(id) {
                movieId = id;
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
                if (!id) {
                    alert('Error！');
                    return false;
                }

                $.ajax(
                    {
                        url: "movie_getMovieToUpdate",//后台请求接口地址
                        data: {"id": id},
                        type: "post",

                        beforeSend: function () {
                            $("#loading").show();
                            return true;
                        },
                        success: function (data) {

                            if (data != 2) {

                                // 解析json数据
                                var data = data;

                                var data_obj = eval("(" + data + ")");

                                // 赋值
                                $("#edit_moviename").val(data_obj.moviename);

                                $("#edit_directorname").val(data_obj.director);
                                $("#edit_actorname").val(data_obj.actor);
                                $("#edit_country").val(data_obj.region);
                                $("#edit_language").val(data_obj.language);
                                $("#edit_time").val(changeDateFormat1(data_obj.release_time));
                                $("#edit_length").val(data_obj.length);
                                $("#edit_plot").val(data_obj.plot_introduction);
                                $("#edit_release_region").val(data_obj.release_region);
                                var labelmapping=data_obj.labelmappings;
                                $("#act").val("edit");

                                $.ajax({
                                    url:"${bathpath}/getLabels",
                                    type:'post',
                                    dataType:'json',
                                    success:function (data) {
                                        $("#loading").hide();
                                        $("#edit_movie_label").empty();
                                        var appendlabel='';
                                        var json=data.data;
                                        var tempids=[];
                                        for(var j=0;j<labelmapping.length;j++){
                                            tempids[j]=labelmapping[j].labelId;
                                        }
                                        for(var i=0;i<json.length;i++){
                                            if($.inArray(json[i].id,tempids)>=0){
                                                appendlabel+='<label class="checkbox-inline">'+
                                                    '<input type="checkbox" checked name="checklabelupdate" id="inlineCheckbox'+(i+1)+'" value="'+json[i].id+'">'+json[i].name+
                                                    '</label>';
                                            }else{
                                                appendlabel+='<label class="checkbox-inline">'+
                                                    '<input type="checkbox" name="checklabelupdate" id="inlineCheckbox'+(i+1)+'" value="'+json[i].id+'">'+json[i].name+
                                                    '</label>';
                                            }

                                        }
                                        $("#edit_movie_label").append(appendlabel);


                                    }
                                })

                            } else {
                                toastr.error('获取失败');
                            }

                        },
                    });




                return false;
            }

            //得到要显示的信息
            function get_show_info(id) {

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
                if (!id) {
                    alert('Error！');
                    return false;
                }
                $.ajax(
                    {
                        url: "movie_getMovieToUpdate",//后台请求接口地址
                        data: {"id": id},
                        type: "post",
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").show(); //在后台返回success之前显示loading图标
                        },
                        success: function (data) {
                            $("#loading").hide();
                            if (data != 2) {

                                // 解析json数据
                                var data = data;

                                var data_obj = eval("(" + data + ")");

                                // 赋值
                                $("#show_movie_moviename").val(data_obj.moviename);

                                $("#show_movie_directorname").val(data_obj.director);
                                $("#show_movie_actorname").val(data_obj.actor);
                                $("#show_movie_country").val(data_obj.region);
                                $("#show_movie_language").val(data_obj.language);
                                $("#show_movie_time").val(changeDateFormat1(data_obj.release_time));
                                $("#show_movie_length").val(data_obj.length);
                                $("#show_movie_plot").val(data_obj.plot_introduction);
                                $("#show_movie_release_region").val(data_obj.release_region);
                                $("#act").val("edit");


                            } else {
                                toastr.error('获取失败');
                            }

                        },
                    });

                return false;
            }

            //提交修改信息
            function edit_movie() {

                var moviename = $.trim($("#edit_moviename").val());//获取修改之后的值
                var directorname = $.trim($("#edit_directorname").val());
                var actor = $.trim($("#edit_actorname").val());
                var country = $.trim($("#edit_country").val());//制片地区
                var language = $.trim($("#edit_language").val());
                var date = $.trim($("#edit_time").val());
                var length = $.trim($("#edit_length").val());
                var plot = $.trim($("#edit_plot").val());
                var release_region = $.trim($("#edit_release_region").val());//上映地区/国家

                var temp=document.getElementsByName("checklabelupdate");

                var labelids=[];
                for(var i=0;i<temp.length;i++){
                    if(temp[i].checked){

                        labelids.push(temp[i].value);
                    }
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


                $.ajax({
                    type: "post",
                    url: "${basepath}/movie_updateMovie",
                    async: true,
                    traditional: true,
                    data: {
                        "movie.id": movieId,
                        "movie.moviename": moviename,
                        "movie.plot_introduction": plot,
                        "movie.length": length,
                        "movie.director": directorname,
                        "movie.actor": actor,
                        "movie.language": language,
                        "movie.region": country,
                        "movie.release_time": date,
                        "movie.release_region": release_region,
                        "labelids":labelids
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success: function (flag) {
                        $("#loading").hide();
                        if (flag == 1) {
                            toastr.success('修改成功');

                        } else {
                            toastr.error('修改失败');
                        }
                        $('#addUserModal').modal('hide');
                        setTimeout("window.location.reload()", 3000);

                    }
                })

            }


            //提交添加信息
            function add_movie() {

                var moviename = $.trim($("#add_movie_moviename").val());//获取修改之后的值
                var directorname = $.trim($("#add_movie_directorname").val());
                var actor = $.trim($("#add_movie_actorname").val());
                var country = $.trim($("#add_movie_country").val());//制片地区
                var language = $.trim($("#add_movie_language").val());
                var date = $.trim($("#add_movie_time").val());
                var length = $.trim($("#add_movie_length").val());
                var plot = $.trim($("#add_movie_plot").val());
                var release_region = $.trim($("#add_movie_release_region").val());//上映地区/国家
                var temp=document.getElementsByName("checklabel");

                var labelids=[];
                for(var i=0;i<temp.length;i++){
                    if(temp[i].checked){

                        labelids.push(temp[i].value);
                    }
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

                $.ajax({
                    type: "post",
                    url: "${basepath}/movie_addMovie",
                    async: true,
                    traditional: true,
                    data: {
                        "movie.moviename": moviename,
                        "movie.plot_introduction": plot,
                        "movie.length": length,
                        "movie.director": directorname,
                        "movie.actor": actor,
                        "movie.language": language,
                        "movie.region": country,
                        "movie.release_time": date,
                        "movie.release_region": release_region,
                        "labelids":labelids

                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success: function (flag) {
                        $("#loading").hide();
                        if (flag == 1) {
                            toastr.success('添加成功');

                        } else {
                            toastr.error('添加失败');
                        }
                        $('#add_movie_modal').modal('hide');
                        setTimeout("window.location.reload()", 3000);

                    }
                })

//                var opt = {
//                    url: "getMovieTable.action",
//                    silent: true,
////                    query:{
////                        type:1,
////                        level:2
////                    }
//                };
//
//                $("#reportTableDiv").bootstrapTable('refresh', opt);
            }


        </script>


        <div id="reportTableDiv">
            <table id="reportTable"></table>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#reportTable').bootstrapTable({
                    url: 'getMovieTable.action', // 请求后台的URL（*）
                    dataType: "json",
                    pagination: true, //前端处理分页
                    singleSelect: false,//是否只能单选
                    search: true, //显示搜索框，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    toolbar: '#toolbar1', //工具按钮用哪个容器
                    striped: true, //是否显示行间隔色
                    cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pageNumber: 1, //初始化加载第10页，默认第一页
                    pageSize: 5, //每页的记录行数（*）
                    pageList: [5, 10, 50, 100], //可供选择的每页的行数（*）
                    strictSearch: true,//设置为 true启用 全匹配搜索，false为模糊搜索
                    showColumns: true, //显示内容列下拉框
                    showRefresh: true, //显示刷新按钮
                    minimumCountColumns: 2, //当列数小于此值时，将隐藏内容列下拉框
                    clickToSelect: true, //设置true， 将在点击某行时，自动勾选rediobox 和 checkbox
                    height: 450, //表格高度，如果没有设置height属性，表格自动根据记录条数决定表格高度#}
                    uniqueId: "id", //每一行的唯一标识，一般为主键列
                    showToggle: true, //是否显示详细视图和列表视图的切换按钮
                    cardView: false, //是否显示详细视图
                    //detailView: true, //是否显示父子表，设置为 true 可以显示详细页面模式,在每行最前边显示+号#}
                    sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                    columns: [
                        {
                            checkbox: true
                        },
                        //定义表头,这个表头必须定义,下边field后边跟的字段名字必须与后端传递的字段名字相同.如:id、name、price
                        //跟后端的字段名id  name price是完全一样的


                        {
                            field: 'moviename',
                            title: '电影名',
                            align: 'center'
                        }, {
                            field: 'release_time',
                            title: '上映时间',
                            align: 'center',
                            formatter: function (value, row, index) {
                                return changeDateFormat1(value)
                            }

                        },
                        {
                            title: "预告片",
                            field: 'trailer',
                            align: 'center'
                        },
                        {
                            title: '图片',
                            field: 'image',
                            align: 'center',
                        },
                        {
                            title: '操作',
                            field: 'id',
                            align: 'center',
                            formatter: function (value, row, index) {
                                var e = '<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_info(' + row.id + ') "data-target="#addUserModal">编辑 </button> ';  //row.id为每行的id
                                var d = '<a class="btn btn-info"  href="/movie_getMovieById?id=' + row.id + '">查看</a>';
                                var c = '<button class="btn btn-danger" onClick="delcfm1(' + row.id + ')">删除</button>';
                                return e + d + c;
                            }
                        }
                    ],
                });
            });
            //转换日期格式(时间戳转换为datetime格式)
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
        </script>

        <%--批量删除的模态框--%>
        <div class="modal fade" id="deleteMoviesModal">
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
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="deleteMoviesDo()" class="btn btn-success" data-dismiss="modal">确定</a>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <script>
            function deleteMovies() {
                // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                var rows = $("#reportTable").bootstrapTable('getSelections');
                console.log(rows);
                if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
                    toastr.warning('请先选择要删除的记录!');
                    return;
                }
                $("#deleteMoviesModal").modal();

            }

            function deleteMoviesDo() {

                // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                var rows = $("#reportTable").bootstrapTable('getSelections');
                console.log(rows);

                var arrays = new Array();// 声明一个数组
                $(rows).each(function () {// 通过获得别选中的来进行遍历
                    arrays.push(this.id);// cid为获得到的整条数据中的一列
                });
                var ids = arrays; // 获得要删除的id//.join(',')
                console.log(ids);



                $.ajax({
                    type: "get",
                    url: "${basepath}/movie_deleteMovies",//后台删除的地址
                    async: true,
                    traditional : true,//需要加入这句代码才能正确的将数组正确的传到后台，要不然传的是Null
                    data: {
                        ids: ids
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success: function (flag) {
                        $("#loading").hide();
                        if (flag == 1) {
                            toastr.success('删除成功');
                        } else {

                            toastr.error('删除失败');
                        }
                        setTimeout("window.location.reload()", 3000);

                    }
                })

            }
        </script>
    </div>

    <div id="matter2" style="display: none">

        <%--初始化表格--%>

        <table class="table table-bordered" id="table_user">
            <caption class="text-center" style="color: #2f904d;font-size: 25px">预告片信息表</caption>

        </table>

        <div id="trailerTableDiv">
            <table id="trailerTable">
            </table>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#trailerTable').bootstrapTable({
                    url: '${basepath}/getAllTrailerTable', // 请求后台的URL（*）
                    dataType: "json",
                    pagination: true, //前端处理分页
                    singleSelect: false,//是否只能单选
                    search: true, //显示搜索框，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    toolbar: '#toolbar2', //工具按钮用哪个容器
                    striped: true, //是否显示行间隔色
                    cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pageNumber: 1, //初始化加载第10页，默认第一页
                    pageSize: 5, //每页的记录行数（*）
                    pageList: [5, 10, 20, 50], //可供选择的每页的行数（*）
                    strictSearch: true,//设置为 true启用 全匹配搜索，false为模糊搜索
                    showColumns: true, //显示内容列下拉框
                    showRefresh: true, //显示刷新按钮
                    minimumCountColumns: 2, //当列数小于此值时，将隐藏内容列下拉框
                    clickToSelect: true, //设置true， 将在点击某行时，自动勾选rediobox 和 checkbox
                    height: 450, //表格高度，如果没有设置height属性，表格自动根据记录条数决定表格高度#}
                    uniqueId: "id", //每一行的唯一标识，一般为主键列
                    showToggle: true, //是否显示详细视图和列表视图的切换按钮
                    cardView: false, //是否显示详细视图
                    //detailView: true, //是否显示父子表，设置为 true 可以显示详细页面模式,在每行最前边显示+号#}
                    sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                    columns: [
                        {
                            checkbox: true
                        },
                        //定义表头,这个表头必须定义,下边field后边跟的字段名字必须与后端传递的字段名字相同.如:id、name、price
                        //跟后端的字段名id  name price是完全一样的


                        {
                            field: 'trailername',
                            title: '预告片名',
                            align: 'center'
                        },

                        {
                            field: 'moviename',
                            title: '所属电影',
                            align: 'center'
                        },

                        {
                            field: 'time',
                            title: '上传时间',
                            align: 'center',
                            formatter: function (value, row, index) {

                                return changeDateFormat1(value);
                            }
                        },

                        {
                            title: '操作',
                            field: 'id',
                            align: 'center',
                            formatter: function (value, row, index) {
                                var d = '<a class="btn btn-info" href="trailergetTrailer?id=' + row.id + '">查看</a>';
                                var c = '<button class="btn btn-danger" onClick="deleteTrailer(' + row.id + ')">删除</button>';
                                return d + c;


                            }
                        }
                    ],
                });
            });
            //转换日期格式(时间戳转换为datetime格式)
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
        </script>

        <%--删除模态框--%>

        <div class="modal fade" id="deleteTrailerModal">
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
                        <input type="hidden" id="TrailerId"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="deleteTrailerDo()" class="btn btn-success" data-dismiss="modal">确定</a>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


            <%--批量删除的模态框--%>
            <div class="modal fade" id="deleteTrailersModal">
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
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="deleteTrailersDo()" class="btn btn-success" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>


        <%--新增预告片模态框--%>
        <div class="modal fade" id="add_trailer_modal" tabindex="-1" role="dialog" aria-labelledby="add_trailer_modal"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="add_trailer">
                            新增预告片
                        </h4>
                    </div>
                    <div id="add_trailer_info">
                        <!--复选框end-->
                        <div class="form-horizontal" role="form">

                            <div class="form-group">
                                <label for="moviename" class="col-sm-3 control-label">所属电影</label>
                                <div class="col-sm-9">
                                    <select id="moviename" class="form-control">
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="trailername" class="col-sm-3 control-label">预告片名字</label>
                                <div class="col-sm-9">

                                    <input id="trailername" class="form-control" type="text" name="name" placeholder="请输入预告片的名字">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="file-1" class="col-sm-3 control-label">选择文件</label>
                                <div class="col-sm-9">
                                    <input id="file-1" type="file" name="upload">
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <%--<button type="button" onclick="add_trailer()" data-dismiss="modal" class="btn btn-success">--%>
                            <%--<i class="glyphicon glyphicon-check">添加</i>--%>
                            <%--</button>--%>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

        <script>

            fodderType1 = function () {
                return $("#moviename").val();
            };
            function getAllMovieName() {
                $("#moviename").empty();

                $("#file-1").fileinput({
                    language: 'zh',//语言设置
                    uploadUrl: '/upload',//上传地址
                    showPreview: true,//显示预览区域
                    showCaption: false,//显示文件简介
                    showUpload: true,//显示上传按钮
                    enctype: 'multipart/form-data',
                    maxFileSize: 9999999,
                    previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                    uploadAsync: true,//默认异步上传
                    allowedFileExtensions: ['mp4','avi','rmvb'],


                    uploadExtraData: function (previewId, index) {  //传递参数
                        var obj = {};
                        obj.movieId = fodderType1();
                        obj.name=$("#trailername").val();
                        console.log(obj);
                        return obj;
                    }

                }).on("fileuploaded", function (event, data, previewId, index) {
                    if (data.response == 1) {
                        toastr.success('上传成功');

                    } else {
                        toastr.error('上传失败');
                    }
                    setTimeout("window.location.reload()", 3000);

                });


                $.ajax({
                    type: 'post',
                    url: '${basepath}/getAllMovieName',
                    dataType: 'json',
                    success: function (data) {
                        var json = data.data;
                        for (var i = 0; i < json.length; i++) {
                            $("#moviename").append("<option value='" + json[i].id + "'>" + json[i].moviename + "</option>");
                        }
                    }
                })
            }
        </script>

            <script>
                function deleteTrailers() {
                    var rows = $("#trailerTable").bootstrapTable('getSelections');
                    console.log(rows);
                    if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
                        toastr.warning("请先选择要删除的记录!");
                        return;
                    }
                    $("#deleteTrailersModal").modal();

                }

                function deleteTrailersDo() {
                    // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                    var rows = $("#trailerTable").bootstrapTable('getSelections');
                    console.log(rows);

                    var arrays = new Array();// 声明一个数组
                    $(rows).each(function () {// 通过获得别选中的来进行遍历
                        arrays.push(this.id);// cid为获得到的整条数据中的一列
                    });
                    var ids = arrays; // 获得要删除的id//.join(',')
                    console.log(ids);



                    $.ajax({
                        type: "get",
                        url: "${basepath}/trailerdeleteTrailers",//后台删除的地址
                        async: true,
                        traditional : true,//需要加入这句代码才能正确的将数组正确的传到后台，要不然传的是Null
                        data: {
                            ids: ids
                        },
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").show(); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").hide();
                            if (flag == 1) {
                                toastr.success('删除成功');
                            } else {

                                toastr.error('删除失败');
                            }
                            setTimeout("window.location.reload()", 3000);

                        }
                    })

                }
            </script>


        <script>
            function deleteTrailer(id) {
                $('#TrailerId').val(id);//给会话中的隐藏属性URL赋值
                $('#deleteTrailerModal').modal();
            }
            function deleteTrailerDo() {
                var id = $.trim($("#TrailerId").val());//获取会话中的隐藏属性URL
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

                $.ajax({
                    type: "get",
                    url: "${basepath}/trailerdeleteTrailer",
                    async: true,
                    data: {
                        id: id
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success: function (flag) {
                        $("#loading").hide();
                        if (flag == 1) {
                            toastr.success('删除成功');
                        } else {

                            toastr.error('删除失败');
                        }
                        setTimeout("window.location.reload()", 3000);

                    }
                })
            }
        </script>


    </div>

    <div id="matter3" style="display: none">
        <%--<jsp:include page="label.jsp"></jsp:include>--%>

        <table class="table table-bordered" id="table_image">
            <caption class="text-center" style="color: #2f904d;font-size: 25px">图片信息表</caption>

        </table>

        <div id="imageTableDiv">
            <table id="imageTable">
            </table>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#imageTable').bootstrapTable({
                    url: '${basepath}/getAllImageTable', // 请求后台的URL（*）
                    dataType: "json",
                    pagination: true, //前端处理分页
                    singleSelect: false,//是否只能单选
                    search: true, //显示搜索框，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    toolbar: '#toolbar3', //工具按钮用哪个容器
                    striped: true, //是否显示行间隔色
                    cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pageNumber: 1, //初始化加载第10页，默认第一页
                    pageSize: 5, //每页的记录行数（*）
                    pageList: [5, 10, 20, 50], //可供选择的每页的行数（*）
                    strictSearch: true,//设置为 true启用 全匹配搜索，false为模糊搜索
                    showColumns: true, //显示内容列下拉框
                    showRefresh: true, //显示刷新按钮
                    minimumCountColumns: 2, //当列数小于此值时，将隐藏内容列下拉框
                    clickToSelect: true, //设置true， 将在点击某行时，自动勾选rediobox 和 checkbox
                    height: 450, //表格高度，如果没有设置height属性，表格自动根据记录条数决定表格高度#}
                    uniqueId: "id", //每一行的唯一标识，一般为主键列
                    showToggle: true, //是否显示详细视图和列表视图的切换按钮
                    cardView: false, //是否显示详细视图
                    //detailView: true, //是否显示父子表，设置为 true 可以显示详细页面模式,在每行最前边显示+号#}
                    sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                    columns: [
                        {
                            checkbox: true
                        },
                        //定义表头,这个表头必须定义,下边field后边跟的字段名字必须与后端传递的字段名字相同.如:id、name、price
                        //跟后端的字段名id  name price是完全一样的


                        {
                            field: 'name',
                            title: '图片片名',
                            align: 'center'
                        },

                        {
                            field: 'moviename',
                            title: '所属电影',
                            align: 'center'
                        },


                        {
                            title: '操作',
                            field: 'imagename',
                            align: 'center',
                            formatter: function (value, row, index) {
                                var d = '<a class="btn btn-info" href="/image//' + value + '">查看</a>';
                                var c = '<button class="btn btn-danger" onClick="deleteImage(' + row.id + ')">删除</button>';
                                return d + c;


                            }
                        }
                    ],
                });
            });

        </script>

        <%--删除模态框--%>

        <div class="modal fade" id="deleteImageModal">
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
                        <input type="hidden" id="imageId"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="deleteImageDo()" class="btn btn-danger" data-dismiss="modal">确定</a>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <%--新增图片模态框--%>
        <div class="modal fade" id="add_image_modal" tabindex="-1" role="dialog" aria-labelledby="add_image_modal"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="add_image">
                            新增图片信息
                        </h4>
                    </div>
                    <div id="add_image_info">

                        <!--复选框end-->

                        <div class="form-horizontal" role="form">

                            <div class="form-group">
                                <label for="movienameimage" class="col-sm-3 control-label">所属电影</label>
                                <div class="col-sm-9">
                                    <select id="movienameimage" class="form-control">
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="trailername" class="col-sm-3 control-label">图片名字</label>
                                <div class="col-sm-9">

                                    <input id="imagename" class="form-control" type="text" name="name" placeholder="请输入图片的名字">

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="file-2" class="col-sm-3 control-label">选择文件</label>
                                <div class="col-sm-9">
                                    <input id="file-2" type="file" name="upload">
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <%--<button type="button" onclick="add_trailer()" data-dismiss="modal" class="btn btn-success">--%>
                            <%--<i class="glyphicon glyphicon-check">添加</i>--%>
                            <%--</button>--%>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
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

            fodderType = function () {
                return $("#movienameimage").val();
            };
            function getAllMovieName2() {
                $("#movienameimage").empty();

                $("#file-2").fileinput({
                    language: 'zh',//语言设置
                    uploadUrl: "/imageupload",//上传地址
                    showPreview: true,//显示预览区域
                    showCaption: false,//显示文件简介
                    showUpload: true,//显示上传按钮
                    enctype: 'multipart/form-data',
                    maxFileSize: 9999999,
                    previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                    uploadAsync: true,//默认异步上传

                    uploadExtraData: function (previewId, index) {  //传递参数
                        var obj = {};
                        obj.movieId = fodderType();
                        obj.name=$("#imagename").val();
                        console.log(obj);
                        return obj;
                    }

                }).on("fileuploaded", function (event, data, previewId, index) {
                    if (data.response == 1) {
                        toastr.success('上传成功');

                    } else {
                        toastr.error('上传失败');
                    }
                    setTimeout("window.location.reload()", 3000);

                });


                $.ajax({
                    type: 'post',
                    url: '${basepath}/getAllMovieName',
                    dataType: 'json',
                    success: function (data) {
                        var json = data.data;
                        for (var i = 0; i < json.length; i++) {
                            $("#movienameimage").append("<option value='" + json[i].id + "'>" + json[i].moviename + "</option>");
                        }
                    }
                })
            }
        </script>


        <script>
            function deleteImage(id) {
                $('#imageId').val(id);//给会话中的隐藏属性URL赋值
                $('#deleteImageModal').modal();
            }
            function deleteImageDo() {
                var id = $.trim($("#imageId").val());//获取会话中的隐藏属性URL
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

                $.ajax({
                    type: "get",
                    url: "${basepath}/image_deleteImage",
                    async: true,
                    data: {
                        id: id
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success: function (flag) {
                        $("#loading").hide();
                        if (flag == 1) {
                            toastr.success('删除成功');
                        } else {

                            toastr.error('删除失败');
                        }
                        setTimeout("window.location.reload()", 3000);

                    }
                })
            }
        </script>


            <%--批量删除的模态框--%>
            <div class="modal fade" id="deleteImagesModal">
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
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="deleteImagesDo()" class="btn btn-success" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>
            <%--批量删除图片--%>
            <script>
                function deleteImages() {
                    // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                    var rows = $("#imageTable").bootstrapTable('getSelections');
                    console.log(rows);
                    if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
                        toastr.warning("请先选择要删除的记录!");
                        return;
                    }
                    $("#deleteImagesModal").modal();

                }

                function deleteImagesDo() {
                    // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                    var rows = $("#imageTable").bootstrapTable('getSelections');
                    console.log(rows);

                    var arrays = new Array();// 声明一个数组
                    $(rows).each(function () {// 通过获得别选中的来进行遍历
                        arrays.push(this.id);// cid为获得到的整条数据中的一列
                    });
                    var ids = arrays; // 获得要删除的id//.join(',')
                    console.log(ids);

                    $.ajax({
                        type: "get",
                        url: "${basepath}/image_deleteImages",//后台删除的地址
                        async: true,
                        traditional : true,//需要加入这句代码才能正确的将数组正确的传到后台，要不然传的是Null
                        data: {
                            ids: ids
                        },
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").show(); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").hide();
                            if (flag == 1) {
                                toastr.success('删除成功');
                            } else {

                                toastr.error('删除失败');
                            }
                            setTimeout("window.location.reload()", 3000);

                        }
                    })

                }
            </script>


    </div>

    <div id="matter4" style="display: none">
        <div>
            <table class="table table-bordered" id="table_user">
                <caption class="text-center" style="color: #2f904d;font-size: 25px">用户信息表</caption>


            </table>

            <div id="userTableDiv">
                <table id="userTable"></table>
            </div>



            <!-- 模态框（Modal） -->
            <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="width: 400px">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                ×
                            </button>
                            <h4 class="modal-title" id="myModalLabel3">
                                请输入禁言天数
                            </h4>
                        </div>
                        <form id="form_data3">
                            <div class="modal-body">
                                禁言天数: <input class="form-control" type="text" id="days" name="days"/>
                                <input type="hidden" id="id" value="" name="id"/><!---禁言用户的id-->
                                禁言原因: <input class="form-control" type="text" id="reason" name="reason"/>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <button type="button" onclick="add_info()" data-dismiss="modal" class="btn btn-primary">
                                    禁言
                                </button>
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <script>
                //绑定模态框展示的方法 
                $("#myModal3").modal("hide");
                function Values(id) {
                    $("#id").val(id);
                }
            </script>
              
            <%--模糊框--%>
            <div class="modal fade" id="delcfmModel3">
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
                            <input type="hidden" id="url3"/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="urlSubmit1()" class="btn btn-danger" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <%--解禁模态框--%>
            <div class="modal fade" id="deleteForbidden">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content message_align">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">×</span></button>
                            <h4 class="modal-title">提示信息</h4>
                        </div>
                        <div class="modal-body">
                            <p>您确认要解禁吗？</p>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="id3"/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="submitDelForbidden()" class="btn btn-success" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <script type="text/javascript">

                $(function () {
                    $('#userTable').bootstrapTable({
                        url: 'getAllUserToTable.action', // 请求后台的URL（*）
                        dataType: "json",
                        pagination: true, //前端处理分页
                        singleSelect: false,//是否只能单选
                        search: true, //显示搜索框，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                        toolbar: '#toolbar4', //工具按钮用哪个容器
                        striped: true, //是否显示行间隔色
                        cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                        pageNumber: 1, //初始化加载第10页，默认第一页
                        pageSize: 5, //每页的记录行数（*）
                        pageList: [5, 10, 20, 50], //可供选择的每页的行数（*）
                        strictSearch: true,//设置为 true启用 全匹配搜索，false为模糊搜索
                        showColumns: true, //显示内容列下拉框
                        showRefresh: true, //显示刷新按钮
                        minimumCountColumns: 2, //当列数小于此值时，将隐藏内容列下拉框
                        clickToSelect: true, //设置true， 将在点击某行时，自动勾选rediobox 和 checkbox
                        height: 450, //表格高度，如果没有设置height属性，表格自动根据记录条数决定表格高度#}
                        uniqueId: "id", //每一行的唯一标识，一般为主键列
                        showToggle: true, //是否显示详细视图和列表视图的切换按钮
                        cardView: false, //是否显示详细视图
                        //detailView: true, //是否显示父子表，设置为 true 可以显示详细页面模式,在每行最前边显示+号#}
                        sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                        columns: [
                            {
                                checkbox: true
                            },
                            //定义表头,这个表头必须定义,下边field后边跟的字段名字必须与后端传递的字段名字相同.如:id、name、price
                            //跟后端的字段名id  name price是完全一样的


                            {
                                field: 'username',
                                title: '昵称',
                                align: 'center'
                            },

                            {
                                field: 'phone',
                                title: '手机号',
                                align: 'center'
                            },

                            {
                                field: 'password',
                                title: '密码',
                                align: 'center'
                            },

                            {
                                field: 'endtime',
                                title: '状态',
                                align: 'center',
                                formatter: function (value, row, index) {
                                    if (value == null) {
                                        return "正常";
                                    }
                                    return "禁言结束：" + changeDateFormat(value);
                                }
                            }, {
                                field: 'last_login',
                                title: '上次登录时间',
                                align: 'center',
                                formatter: function (value, row, index) {
                                    return changeDateFormat(value)
                                }

                            }, {
                                title: '操作',
                                field: 'endtime',
                                align: 'center',
                                formatter: function (value, row, index) {
                                    var e = '<button class="btn btn-warning" data-toggle="modal" data-target="#myModal3" onclick="Values(' + row.id + ')">禁言 </button> ';  //row.id为每行的id
                                    var d = '<button class="btn btn-info" onclick="deleteForbidden(' + row.id + ')">解禁</button>';
                                    var c = '<button class="btn btn-danger" onClick="delcfm3(' + row.id + ')">删除</button>';
                                    if (value == null) {
                                        return e + c;
                                    } else {
                                        return d + c;
                                    }

                                }
                            }
                        ],
                    });
                });
                //转换日期格式(时间戳转换为datetime格式)
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
            </script>
            <script>
                function delcfm3(url) {
                    $('#url3').val(url);//给会话中的隐藏属性URL赋值
                    $('#delcfmModel3').modal();
                }
                function urlSubmit1() {
                    var id = $.trim($("#url3").val());//获取会话中的隐藏属性URL
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

                    $.ajax({
                        type: "get",
                        url: "${basepath}/manageruserdeleteUser",
                        async: true,
                        data: {
                            id: id
                        },
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").show(); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").hide();
                            if (flag == 1) {
                                toastr.success('删除成功');
                            } else {

                                toastr.error('删除失败');
                            }
                            setTimeout("window.location.reload()", 3000);

                        }
                    })
                }
            </script>

            <script>
                function deleteForbidden(id) {
                    $('#id3').val(id);//给会话中的隐藏属性URL赋值
                    $('#deleteForbidden').modal();
                }
                function submitDelForbidden() {
                    var id = $.trim($("#id3").val());//获取会话中的隐藏属性URL
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

                    $.ajax({
                        type: "get",
                        url: "${basepath}/manageruserdeleteForbidden",
                        async: true,
                        data: {
                            id: id
                        },
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").show(); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").hide();
                            if (flag == 1) {
                                toastr.success('解禁成功');
                            } else {

                                toastr.error('解禁失败');
                            }
                            setTimeout("window.location.reload()", 3000);

                        }
                    })
                }
            </script>
            <script>

                // update表单
                function update_info(id) {
                    var id = id;
                    //复杂一点的json的另一种形式
                    var value2 = {"user_id": "123456", "username": "coolcooldool"};


                    // $('input[name=username]').removeAttr("readonly");//去除input元素的readonly属性
                    var obj2 = eval(value2);


                    // 赋值
                    $("#user_id").val(obj2.user_id);
                    $("#user_name").val(obj2.username);
                    $("#act").val("edit");

                    // 将input元素设置为readonly
                    $('#user_id').attr("readonly", "readonly")

                }


                // 添加入库操作
                function add_info() {

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
                    var form_data = $("#form_data3").serialize();


                    $.ajax({
                        type: "get",
                        url: "${basepath}/manageruserinsertForbidden",
                        async: true,
                        data: form_data,
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").show(); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {

                            $("#loading").hide();
                            if (flag == 1) {
                                toastr.success('禁言成功');
                            } else {

                                toastr.error('禁言失败');
                            }
                            setTimeout("window.location.reload()", 3000);

                        }
                    })

                }


            </script>


            <%--批量删除的模态框--%>
            <div class="modal fade" id="deleteUsersModal">
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
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="deleteUsersDo()" class="btn btn-success" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>
            <script>
                // 批量删除按钮事件
                function deleteUsers() {
                    // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                    var rows = $("#userTable").bootstrapTable('getSelections');
                    console.log(rows);
                    if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
                        toastr.warning("请先选择要删除的记录!");
                        return;
                    }
                    $("#deleteUsersModal").modal();

                }

                function deleteUsersDo() {
                    // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                    var rows = $("#userTable").bootstrapTable('getSelections');
                    console.log(rows);

                    var arrays = new Array();// 声明一个数组
                    $(rows).each(function () {// 通过获得别选中的来进行遍历
                        arrays.push(this.id);// cid为获得到的整条数据中的一列
                    });
                    var ids = arrays; // 获得要删除的id//.join(',')
                    console.log(ids);


                    $.ajax({
                        type: "get",
                        url: "${basepath}/manageruserdeleteUsers",
                        async: true,
                        traditional : true,//需要加入这句代码才能正确的将数组正确的传到后台，要不然传的是Null
                        data: {
                            ids: ids
                        },
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").show(); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").hide();
                            if (flag == 1) {
                                toastr.success('删除成功');
                            } else {

                                toastr.error('删除失败');
                            }
                            setTimeout("window.location.reload()", 3000);

                        }
                    })

                }
            </script>
        </div>
    </div>
    <div id="matter5" style="display: none">


        <table class="table table-bordered" id="table_label">
            <caption class="text-center" style="color: #2f904d;font-size: 25px">分类信息表</caption>

        </table>

        <div id="labelTableDiv">
            <table id="labelTable">
            </table>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#labelTable').bootstrapTable({
                    url: '${basepath}/getAllLabelTable', // 请求后台的URL（*）
                    dataType: "json",
                    pagination: true, //前端处理分页
                    singleSelect: false,//是否只能单选
                    search: true, //显示搜索框，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    toolbar: '#toolbar5', //工具按钮用哪个容器
                    striped: true, //是否显示行间隔色
                    cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pageNumber: 1, //初始化加载第10页，默认第一页
                    pageSize: 5, //每页的记录行数（*）
                    pageList: [5, 10, 20, 50], //可供选择的每页的行数（*）
                    strictSearch: true,//设置为 true启用 全匹配搜索，false为模糊搜索
                    showColumns: true, //显示内容列下拉框
                    showRefresh: true, //显示刷新按钮
                    minimumCountColumns: 2, //当列数小于此值时，将隐藏内容列下拉框
                    clickToSelect: true, //设置true， 将在点击某行时，自动勾选rediobox 和 checkbox
                    height: 450, //表格高度，如果没有设置height属性，表格自动根据记录条数决定表格高度#}
                    uniqueId: "id", //每一行的唯一标识，一般为主键列
                    showToggle: true, //是否显示详细视图和列表视图的切换按钮
                    cardView: false, //是否显示详细视图
                    //detailView: true, //是否显示父子表，设置为 true 可以显示详细页面模式,在每行最前边显示+号#}
                    sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                    columns: [
                        {
                            checkbox: true
                        },
                        //定义表头,这个表头必须定义,下边field后边跟的字段名字必须与后端传递的字段名字相同.如:id、name、price
                        //跟后端的字段名id  name price是完全一样的


                        {
                            field: 'name',
                            title: '标签名',
                            align: 'center'
                        },

                        {
                            field: 'parent',
                            title: '上级标签',
                            align: 'center'
                        },

                        // {
                        //     field: 'time',
                        //     title: '上传时间',
                        //     align: 'center',
                        //     formatter: function (value, row, index) {
                        //
                        //         return changeDateFormat1(value);
                        //     }
                        // },

                        {
                            title: '操作',
                            field: 'id',
                            align: 'center',
                            formatter: function (value, row, index) {
                                var d= '<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_label(' + row.id + ') "data-target="#edit_label_modal">编辑 </button> ';
                                var c = '<button class="btn btn-danger" onClick="deleteLabel(' + row.id + ')">删除</button>';
                                return d + c;


                            }
                        }
                    ],
                });
            });
        </script>



        <%--批量删除的模态框--%>
        <div class="modal fade" id="deleteLabelsModal">
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
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="deleteLabelsDo()" class="btn btn-success" data-dismiss="modal">确定</a>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

        <%--批量删除事件--%>
        <script>
            function deleteLabels() {
                // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                var rows = $("#labelTable").bootstrapTable('getSelections');
                console.log(rows);
                if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
                    toastr.warning("请先选择要删除的记录!");
                    return;
                }
                $("#deleteLabelsModal").modal();

            }

            function deleteLabelsDo() {
                // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
                var rows = $("#labelTable").bootstrapTable('getSelections');
                console.log(rows);

                var arrays = new Array();// 声明一个数组
                $(rows).each(function () {// 通过获得别选中的来进行遍历
                    arrays.push(this.id);// cid为获得到的整条数据中的一列
                });
                var ids = arrays; // 获得要删除的id//.join(',')
                console.log(ids);

                $.ajax({
                    type: "get",
                    url: "",//后台删除的地址
                    async: true,
                    traditional : true,//需要加入这句代码才能正确的将数组正确的传到后台，要不然传的是Null
                    data: {
                        ids: ids
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success: function (flag) {
                        $("#loading").hide();
                        if (flag == 1) {
                            toastr.success('删除成功');
                        } else {

                            toastr.error('删除失败');
                        }
                        setTimeout("window.location.reload()", 3000);

                    }
                })

            }
        </script>

        <%--删除模态框--%>

        <div class="modal fade" id="deleteLabelModal">
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
                        <input type="hidden" id="LabelId"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="deleteLabelDo()" class="btn btn-success" data-dismiss="modal">确定</a>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <%--新增分类模态框--%>
        <div class="modal fade" id="add_label_modal" tabindex="-1" role="dialog" aria-labelledby="add_label_modal"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 400px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="add_label_title">
                            添加分类
                        </h4>
                    </div>
                    <div id="add_label_div">
                        <label for="parentname" class="col-sm-3 control-label">所属分类</label>
                        <div class="col-sm-9">
                            <select id="parentname" class="form-control">
                                <option>sdfasd</option>
                                <option>sdfasd</option>
                                <option>sd士大夫d</option>
                            </select>

                        </div>
                        <br>
                        <br>
                        <br>
                        <label for="label" class="col-sm-3 control-label">分类名字</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" id="label" name="label"/>
                        </div>

                        <br>
                        <br>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="button" onclick="add_label()" data-dismiss="modal" class="btn btn-primary">
                                添加
                            </button>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <script>

            function add_label() {
                var name=$("#label").val();
                var parentId=$("#parentname").val();


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

                $.ajax({
                    type:'post',
                    url:'${basepath}/addLable',//后台的url地址
                    data:{
                        "label.name":name,
                        "label.parentId":parentId
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success: function (flag) {
                        $("#loading").hide();
                        if (flag == 1) {
                            toastr.success('添加成功');
                        } else {

                            toastr.error('添加失败');
                        }
                        setTimeout("window.location.reload()", 3000);

                    }
                })
            }

            function getParentLabelName() {

                $("#parentname").empty();
                $.ajax({
                    type: 'post',
                    url: '${basepath}/getLabelName',//后台获取名字的url，格式参照获取电影名的格式,只获取parentId为0的分类，大分类
                    dataType: 'json',
                    success: function (data) {
                        var json = data.data;
                        for (var i = 0; i < json.length; i++) {
                            $("#parentname").append("<option value='" + json[i].id + "'>" + json[i].name + "</option>");
                        }
                    }
                })
            }
        </script>

        <%--编辑分类模态框--%>
        <div class="modal fade" id="edit_label_modal" tabindex="-1" role="dialog" aria-labelledby="add_label_modal"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 400px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="edit_label_title">
                            编辑分类
                        </h4>
                    </div>
                    <div id="edit_label_div">
                        <label for="parentname" class="col-sm-3 control-label">所属分类</label>
                        <div class="col-sm-9">
                            <select id="parentnames" class="form-control">
                                <option>sdfasd</option>
                                <option>sdfasd</option>
                                <option>sd士大夫d</option>
                            </select>

                        </div>
                        <br>
                        <br>
                        <br>
                        <label for="label" class="col-sm-3 control-label">分类名字</label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" id="lables" name="label"/>
                        </div>

                        <br>
                        <br>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="button" onclick="edit_label()" data-dismiss="modal" class="btn btn-primary">
                                提交
                            </button>
                        </div>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

<script>
    var Labelid;
    // 得到要编辑的信息
    function get_edit_label(id) {

        Labelid = id;
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
        if (!id) {
            alert('Error！');
            return false;
        }
        $("#parentnames").empty();
        $.ajax(
            {
                url: "ToUpdateLabel",//后台请求接口地址
                data: {"id": id},
                type: "post",
                beforeSend: function () {
                    // $("#tip").html("<span style='color:blue'>正在处理...</span>");
                    return true;
                },
                success: function (data) {
                    if (data != 2) {

                        // 解析json数据
                        var data = data;
                        console.log(data);
                        var data_obj = eval("(" + data + ")");
                        // 赋值
                        $("#lables").val(data_obj.name);
                        //$("#parentnames").val(data_obj.parentId);

                    } else {
                        toastr.error('获取失败');
                    }

                },
            })

        $.ajax({
            type: 'post',
            url: '${basepath}/getLabelName',//后台获取名字的url，格式参照获取电影名的格式,只获取parentId为0的分类，大分类
            dataType: 'json',
            success: function (data) {
                var json = data.data;
                for (var i = 0; i < json.length; i++) {
                    $("#parentnames").append("<option value='" + json[i].id + "'>" + json[i].name + "</option>");
                }
            }
        })
    }
    function edit_label() {
        var name=$("#lables").val();
        var parentId=$("#parentnames").val();


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

        $.ajax({
            type:'post',
            url:'${basepath}/UpdateLabel',//后台的url地址
            data:{
                "label.id":Labelid,
                "label.name":name,
                "label.parentId":parentId

            },
            beforeSend: function (XMLHttpRequest) {
                $("#loading").show(); //在后台返回success之前显示loading图标
            },
            success: function (flag) {
                $("#loading").hide();
                if (flag == 1) {
                    toastr.success('修改成功');
                } else {

                    toastr.error('修改失败');
                }
                setTimeout("window.location.reload()", 3000);

            }
        })
    }


</script>

        <script>
            function deleteLabel(id) {
                $('#LabelId').val(id);//给会话中的隐藏属性URL赋值
                $('#deleteLabelModal').modal();
            }
            function deleteLabelDo() {
                var id = $.trim($("#LabelId").val());//获取会话中的隐藏属性URL
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

                $.ajax({
                    type: "get",
                    url: "deleteLabel",//删除的地址
                    async: true,
                    data: {
                        "id": id
                    },
                    beforeSend: function (XMLHttpRequest) {
                        $("#loading").show(); //在后台返回success之前显示loading图标
                    },
                    success: function (flag) {
                        $("#loading").hide();
                        if (flag == 1) {
                            toastr.success('删除成功');
                        } else {

                            toastr.error('删除失败');
                        }
                        setTimeout("window.location.reload()", 3000);

                    }
                })
            }
        </script>

    </div>


</div>

<!--右侧展示内容end-->


<!--切换div-->
<script>
    $(document).ready(function () {
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