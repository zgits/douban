<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息展示界面</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <!--<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">-->
    <link rel="stylesheet" type="text/css" href="static_resources/font-awesome/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="static_resources/checkbox/css/build.css">
    <link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
    <script src="/static_resources/toastr/toastr.min.js"></script>

    <link rel="stylesheet" href="/static_resources/dist/sidebar-menu.css">

    <script src="/static_resources/cookie/jquery.cookie.min.js"></script>
    <style type="text/css">
        .main-sidebar {
            position: absolute;
            top: 52px;
            left: 0px;
            min-height: 100%;
            width: 230px;
            z-index: 810;
            background-color: #222d32;
        }

        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }
    </style>


</head>
<!--个人信息页面-->
<body>
<!---导航栏-->
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp"><img class="img-circle" src="image/logo.PNG"
                                                         style="width:55px;height:55px;margin-top: -15px"></a>
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
        if($.cookie("id")!='-1'){
            appendhtml+='<li><a href="login.jsp" onclick="login_out()"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>';
            appendhtml+='<li>'+
                '<a href=getMessage?id='+id+'>'+
                '<span class="badge pull-right"><div id="count"/></span>消息'+
                '</a>'+
                '</li>';
            appendhtml+='<li>'+
                '<a style="width: 40px;height: 40px" href="userMessage?id='+id+'"><img src="/image/test.jpg"'+
                'class="img-circle img-responsive"'+
                'style="width: 40px;height: 40px;margin-top: -10px"></a>'+
                '</li>';
        }else{
            appendhtml+='<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>'+
                '<li><a href="register.jsp">注册</a></li>';
        }
        $("#navuser").append(appendhtml);


    })

    function login_out() {
        $.cookie("id",-1);
        $.cookie("token",-1);
    }
</script>

<!--展示个人信息界面-->

<!--<div class="row col-md-12"-->
<!--style="margin-top:-20px;backgroImagemage: url('/static_resources/login-register/images/3.jpg');background-size: 100%">-->

<!--<img srImagemage/test.jpg" class="img-circle img-responsive" style="height: 150px;width: 150px">-->
<!--</div>-->
<div class="container">
    <div class="col-md-offset-2">

        <div class="row" id="info">
            <div style="margin-top: 50px;margin-left: 100px;">
                <div>
                    <img src="/image/test.jpg" class="img-circle img-responsive" style="width: 100px;height:100px">
                </div>
                <div style="margin-top: -50px;margin-left: 100px;">
                    <!--选择异步方式更改头像，，-->
                    <a href="javascript:;" class="file">选择头像
                        <input type="file" name="" id="">
                    </a>
                </div>
                <br>
                <div class="row">
                    <p>
                        <span style="font-size: 15px;font-family: '等线 Light';font-weight: bold">昵称：</span>xxxxxx<br>
                        <br>
                        <br>
                        <span style="font-size: 15px;font-family: '等线 Light';font-weight: bold">邮箱：</span>xxxxx@xxx.com<br>
                        <br>
                        <br>
                        <span style="font-size: 15px;font-family: '等线 Light';font-weight: bold">个人介绍：</span>这个家伙很懒，什么都没有留下
                    </p>
                </div>
            </div>
        </div>

<!-- 历史消息-->
        <div class="row" id="history">
            <div class="row">
                <div class="row">
                    <div class="col-md-6">
                        <input type="button" value="全选" class="btn" id="selectAll">
                        <input type="button" value="反选" class="btn" id="reverse">
                    </div>
                    <div class="col-md-5">
                        <a href="#" onclick="deleteMessage()">
                            &nbsp;&nbsp;&nbsp;删除<span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <!--注意里面的id，checkbox每个需要不同-->
                <ul class="list-group" id="owners">
                    <c:forEach items="${pagebeans.lists}" var="pagebean" >
                    <li class="list-group-item">
                        <div class="checkbox checkbox-success">
                            <input id="${pagebean.userId}" class="styled" name="message" value="${pagebean.id}" type="checkbox">
                            <label for="${pagebean.userId}">
                                来自${pagebean.sender}的信息:${pagebean.message}
                                <br>
                                <span style="color: rgb(91, 81, 191); font-size: 14px;">${pagebean.time}</span>
                            </label>
                        </div>

                    </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="row">
                <div class="inner clearfix">
                    <section id="main-content">

                        <div class="text-center">
                            <ul class="pagination">
                                <li><a href="userMessage?id=1&&currpage=1">&laquo;</a></li>
                                <c:forEach var="count" begin="1" end="${pagebeans.totalPage}">
                                    <li><a href="userMessage?id=1&&currpage=${count}">${count}</a></li>
                                </c:forEach>

                                <li><a href="userMessage?id=1&&currpage=${pagebeans.totalPage}">&raquo;</a></li>
                                <li>
                                    <!--异步传输页数，返回数据得到结果-->
                                    <form class="col-sm-3" role="form">
                                        <div class="input-group">
                                            <input type="text" class="form-control">
                                            <span onclick="test()" class="input-group-addon">go</span>
                                        </div>
                                    </form>
                                </li>
                                <li><a style="border: none">共${pagebeans.totalPage}页</a></li>
                            </ul>
                        </div>

                    </section>

                </div>
            </div>
        </div>
<!--/历史消息-->

        <div class="row" id="set_up" style="margin-top: 50px">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="username"
                               value="原来的昵称">
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="email"
                               value="原来的邮箱">
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="confirm_code" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="confirm_code">
                    </div>
                    <div class="col-md-2">
                        <a class="btn btn-success" id="moBtn" href="javascript:;" onclick="sendMsgCode()">获取验证码</a>
                        <a class="btn" disabled="disabled" id="secondShow" href="javascript:;"></a>
                    </div>
                </div>
                <script>
                    var countdown=30;  // 时长 s
                    // 获取验证码按钮点击事件
                    function sendMsgCode() {
                        $("#secondShow").css('display','block');
                        $("#moBtn").css('display','none');
                        $("#secondShow").html('重新发送('+countdown+'s)');
                        var timer = setInterval(function () {
                            if (countdown == 0) {
                                clearInterval(timer);
                                $("#secondShow").css('display','none');
                                $("#moBtn").css('display','block');
                                countdown = 30;
                                console.log(countdown);
                            }
                            $("#secondShow").html('重新发送('+(countdown-1)+'s)');
                            countdown--;
                        }, 1000);
                    };
                </script>
                <br>
                <div class="form-group">
                    <label for="person_profile" class="col-sm-2 control-label">个人介绍</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="person_profile"
                               value="原来的个人介绍">
                    </div>
                </div>

                <button style="margin-top: 5px;margin-left: 200px" type="submit" class="btn btn-info">修改</button>
            </form>
        </div>

        <div class="row" id="update_pwd" style="margin-top: 50px">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">原密码</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" id="password" value="">
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="pwd" class="col-sm-2 control-label">新密码</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" id="pwd" name="pwd">
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="confirm_pwd" class="col-sm-2 control-label">确认新密码</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" id="confirm_pwd" name="confirm_pwd">
                    </div>
                </div>
                <button type="submit" style="margin-top: 5px;margin-left: 200px" class="btn btn btn-info">修改</button>
            </form>
        </div>
    </div>
    <div class="main-sidebar">
        <section class="sidebar">
            <ul class="sidebar-menu">
                <li class="header">操作</li>
                <li class="treeview">
                    <a id="info_p">
                        <i class="fa fa-address-card-o"></i> <span style="font-size: 15px;">个人信息</span>
                    </a>
                </li>
                <!--<li class="treeview">-->
                <!--<a id="history_p">-->
                <!--<i class="fa fa-files-o"></i>-->
                <!--<span style="font-size: 25px;">历史记录</span>-->
                <!--</a>-->
                <!--</li>-->
                <li>
                    <a id="set_up_p">
                        <i class="fa fa-cogs"></i>
                        <span style="font-size: 15px;">个人设置</span>
                    </a>
                </li>
                <li>
                    <a id="update_pwd_p">
                        <i class="fa fa-th"></i> <span style="font-size: 15px;">修改密码</span>
                    </a>
                </li>
                <li>
                    <a id="history_p">
                        <i class="fa fa-history"></i> <span style="font-size: 15px;">历史消息</span>
                    </a>
                </li>
            </ul>
        </section>
    </div>

</div>

<div class="modal fade" id="delcfmModel">
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
                <input type="hidden" id="deletetodel"/>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button onclick="opreatedelete()" class="btn btn-info" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
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
    $("#selectAll").click(function () {
        $("#owners input:checkbox").each(function () {
            $(this).prop('checked', true);//

        });
    });

    $("#unSelect").click(function () {
        $("#owners input:checkbox").removeAttr("checked");
    });

    $("#reverse").click(function () {
        $("#owners input:checkbox").each(function () {
            this.checked = !this.checked;
        });
    });

    function deleteMessage(){

        $("#delcfmModel").modal();
    }
    function opreatedelete(){
        list=document.getElementsByName("message");
        var check_val=[];
        for(i in list){
            if(list[i].checked){
                check_val.push(list[i].value);
            }
        }
        $.ajax({
                type: "post",
                url: "${basepath}/deleteMessage",//后台删除的地址
                async: true,
                traditional : true,//需要加入这句代码才能正确的将数组正确的传到后台，要不然传的是Null
                data: {
                    ids: check_val
                },
                success:function (flag) {
                    if(flag==1){
                        toastr.success('删除成功');
                    }else{
                        toastr.error("删除失败");
                    }
                    setTimeout("window.location.reload()",1000);
                }
            }
        )

        //window.location.href="getMessage?id=1"
    }
</script>
<script src="/static_resources/dist/sidebar-menu.js"></script>


<script src="/static_resources/login-register/js/common.js"></script>
<script src="/static_resources/login-register/js/jquery.validate.min.js?var1.14.0"></script>

<script>
    $.sidebarMenu($('.sidebar-menu'))
</script>


<!--全选，单选-->
<script>
    $("#selectAll").click(function () {
        $("#owners input:checkbox").each(function () {
            $(this).prop('checked', true);//

        });
    });

    $("#unSelect").click(function () {
        $("#owners input:checkbox").removeAttr("checked");
    });

    $("#reverse").click(function () {
        $("#owners input:checkbox").each(function () {
            this.checked = !this.checked;
        });
    });

</script>
<!--隐藏效果-->
<script>
    $(document).ready(function () {
        $("#update_pwd").hide();
        $("#history").hide();
        $("#set_up").hide();
        $("#info").fadeIn();
        $("#info_p").click(function () {
            $("#update_pwd").hide();
            $("#history").hide();
            $("#set_up").hide();
            $("#info").fadeIn();

        });
        $("#history_p").click(function () {
            $("#update_pwd").hide();
            $("#history").fadeIn();
            $("#set_up").hide();
            $("#info").hide();


        });
        $("#update_pwd_p").click(function () {
            $("#update_pwd").fadeIn();
            $("#history").hide();
            $("#set_up").hide();
            $("#info").hide();
        });
        $("#set_up_p").click(function () {
            $("#update_pwd").hide();
            $("#history").hide();
            $("#set_up").fadeIn();
            $("#info").hide();
        });
    }
    );
</script>

<!--版权栏-->
<!--底部版权信息-->
<div class="navbar-fixed-bottom" style="font:12px Tahoma;color: white;text-align:center;">
    <div style="background-color: #0f0f0f">
        <hr/>
        Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;
        xxx小组 ALL RIGHT RESERVED<br/>
        联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>

    </div>
</div>

</body>
</html>