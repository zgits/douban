<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--删除用户的时候注意异步传输的id的获取-->
<script>location.href="getUsers";</script>
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
                <th>正常</th>
                <th>${users.last_login}</th>
                <th>
                    <button class="btn btn-warning" data-toggle="modal" data-target="#myModal">禁言</button>
                    <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                    <button class="btn btn-danger" onClick="delcfm1()">删除</button>
                </th>
            </tr>
        </c:forEach>
        <tr>
            <th id="">xxxx</th>
            <th>xxxx@xxx.com</th>
            <th>xxxx</th>
            <th>sdfsdf</th>
            <th>正常</th>
            <th>2018-5-9 17:32:45</th>
            <th>
                <button class="btn btn-warning" data-toggle="modal" data-target="#myModal">禁言</button>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <button class="btn btn-danger" onClick="delcfm1()">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>xxxx@xxx.com</th>
            <th>xxxx</th>
            <th>sdfsdf</th>
            <th>正常</th>
            <th>2018-5-9 17:32:45</th>
            <th>
                <button class="btn btn-warning" data-toggle="modal" data-target="#myModal">禁言</button>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <button class="btn btn-danger" onClick="delcfm1()">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>xxxx@xxx.com</th>
            <th>xxxx</th>
            <th>sdfsdf</th>
            <th>禁言30天</th>
            <th>2018-5-9 17:32:45</th>
            <th>
                <button class="btn btn-info">解禁</button>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <button class="btn btn-danger" onClick="delcfm1()">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>xxxx@xxx.com</th>
            <th>xxxx</th>
            <th>sdfsdf</th>
            <th>禁言30天</th>
            <th>2018-5-9 17:32:45</th>
            <th>
                <button class="btn btn-info">解禁</button>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <button class="btn btn-danger" onClick="delcfm1()">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>xxxx@xxx.com</th>
            <th>xxxx</th>
            <th>sdfsdf</th>
            <th>禁言30天</th>
            <th>2018-5-9 17:32:45</th>
            <th>
                <button class="btn btn-info">解禁</button>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <button class="btn btn-danger" onClick="delcfm1()">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>xxxx@xxx.com</th>
            <th>xxxx</th>
            <th>sdfsdf</th>
            <th>禁言30天</th>
            <th>2018-5-9 17:32:45</th>
            <th>
                <button class="btn btn-info">解禁</button>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <button class="btn btn-danger" onClick="delcfm1()">删除</button>
            </th>
        </tr>
        </tbody>
    </table>

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
                        <input type="hidden" id="id" value="id" name="id"/><!---禁言用户的id-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" onclick="add_info()" class="btn btn-primary">
                            禁言
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

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
                    <a onclick="urlSubmit1()" class="btn btn-success" data-dismiss="modal">确定</a>
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
            var url = $.trim($("#url").val());//获取会话中的隐藏属性URL
            window.location.href = url;
        }
    </script>
    <!--弹出框-->
    <!--样例地址-->
    <!--https://www.cnblogs.com/shenzikun1314/p/6852928.html-->
    <%--<script src="/static_resources/Admin/dialog/js/showBo.js"></script>--%>
    <%--<script>--%>
    <%--//注册删除按钮的事件--%>
    <%--$("#btn_delete").click(function () {--%>
    <%--//取表格的选中行数据--%>
    <%--//    var arrselections = $("#tb_departments").bootstrapTable('getSelections');--%>
    <%--//    if (arrselections.length <= 0) {--%>
    <%--//    toastr.warning('请选择有效数据');--%>
    <%--//    return;--%>
    <%--//    }--%>

    <%--Ewin.confirm({message: "您确定删除该用户吗？"}).on(function (e) {--%>
    <%--alert(a);--%>
    <%--if (!e) {--%>
    <%--return;--%>
    <%--}--%>
    <%--$.ajax({--%>
    <%--type: "post",--%>
    <%--url: "/api/DepartmentApi/Delete",//提交的接口地址--%>
    <%--data: {"id": "1"},//要提交的数据--%>
    <%--success: function (data, status) {--%>
    <%--if (status == "success") {--%>
    <%--toastr.success('提交数据成功');--%>
    <%--$("#table_user").bootstrapTable('refresh');--%>
    <%--}--%>
    <%--},--%>
    <%--error: function () {--%>
    <%--toastr.error('Error');--%>
    <%--},--%>
    <%--complete: function () {--%>

    <%--}--%>

    <%--});--%>
    <%--});--%>
    <%--});--%>
    <%--</script>--%>
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
            var form_data = $("#form_data").serialize();
            alert(form_data);

        }
    </script>
</div>