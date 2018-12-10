<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--删除用户的时候注意异步传输的id的获取-->

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

<link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
<script src="/static_resources/toastr/toastr.min.js"></script>

<body >


<div>
    <table class="table table-bordered" id="table_user">
        <caption class="text-center" style="color: #2f904d;font-size: 25px">用户信息表</caption>
        <thead>
        <tr>
            <th>昵称</th>
            <th>邮箱</th>
            <th>密码</th>
            <th>个人介绍</th>
            <th>状态</th>
            <th>上次登录时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageBean.lists}" var="users">
            <tr>
                <th id="">${users.username}</th>
                <th>${users.email}</th>
                <th>${users.password}</th>
                <th>${users.person_profile}</th>
                <th>
                    <c:choose>
                        <c:when test="${!empty users.endTime}">
                            禁言结束日期${users.endTime}
                        </c:when>
                        <c:otherwise>
                            正常
                        </c:otherwise>
                    </c:choose>
                </th>
                <th>${users.last_login}</th>
                <th>
                    <c:choose>
                        <c:when test="${!empty users.endTime}">
                            <button class="btn btn-info" onclick="deleteForbidden('${users.id}')">解禁</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-warning" data-toggle="modal" data-target="#myModal"
                                    onclick="Values('${users.id}')">禁言
                            </button>
                        </c:otherwise>
                    </c:choose>
                        <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                    <button class="btn btn-danger" onClick="delcfm1('${users.id}')">删除</button>
                </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div id="loading" class="col-md-offset-5" style="position: absolute; z-index: 100;"></div>

    <div>
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

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 400px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        请输入禁言天数
                    </h4>
                </div>
                <form id="form_data">
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
        $("#myModal").modal("hide");
        function Values(id) {
            $("#id").val(id);
        }
    </script>
      
    <%--模糊框--%>
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
                    <input type="hidden" id="url"/>
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
                    <input type="hidden" id="id1"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a onclick="submitDelForbidden()" class="btn btn-success" data-dismiss="modal">确定</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <script>
        function delcfm1(url) {
            $('#url').val(url);//给会话中的隐藏属性URL赋值
            $('#delcfmModel1').modal();
        }
        function urlSubmit1() {
            var id = $.trim($("#url").val());//获取会话中的隐藏属性URL
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
                url: "127.0.0.1:8090/deleteUser",
                async: true,
                data: {
                    id:id
                },
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").html("<img src='/image/loading1.gif' />"); //在后台返回success之前显示loading图标
                },
                success: function (flag) {
                    $("#loading").empty();
                    if (flag == 1) {
                        toastr.success('删除成功');
                    } else {

                        toastr.error('删除失败');
                    }
                    setTimeout("window.location.reload()",3000);

                }
            })
        }
    </script>

    <script>
        function deleteForbidden(id) {
            $('#id1').val(id);//给会话中的隐藏属性URL赋值
            $('#deleteForbidden').modal();
        }
        function submitDelForbidden() {
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
                url: "127.0.0.1:8090/deleteForbidden",
                async: true,
                data: {
                    id:id
                },
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").html("<img src='/image/loading1.gif' />"); //在后台返回success之前显示loading图标
                },
                success: function (flag) {
                    $("#loading").empty();
                    if (flag == 1) {
                        toastr.success('解禁成功');
                    } else {

                        toastr.error('解禁失败');
                    }
                    setTimeout("window.location.reload()",3000);

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
            // alert(obj2);

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
            var form_data = $("#form_data").serialize();

            $.ajax({
                type: "get",
                url: "127.0.0.1:8090/insertForbidden",
                async: true,
                data: form_data,
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").html("<img src='/image/loading1.gif' />"); //在后台返回success之前显示loading图标
                },
                success: function (flag) {
                    $("#loading").empty();
                    if (flag == 1) {
                        toastr.success('禁言成功');
                    } else {

                        toastr.error('禁言失败');
                    }
                    setTimeout("window.location.reload()",3000);

                }
            })

        }


    </script>
</div>
</body>