<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--删除用户的时候注意异步传输的id的获取-->
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
        <tr>
            <th id="">xxxx</th>
            <th>xxxx@xxx.com</th>
            <th>xxxx</th>
            <th>sdfsdf</th>
            <th>正常</th>
            <th>2018-5-9 17:32:45</th>
            <th>
                <button class="btn btn-warning">禁言</button>
                <button class="btn btn-danger" onclick="Showbo.Msg.confirm('您确定删除该用户吗？')">删除</button>
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
                <button class="btn btn-warning">禁言</button>
                <button class="btn btn-danger">删除</button>
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
                <button class="btn btn-danger">删除</button>
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
                <button class="btn btn-danger">删除</button>
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
                <button class="btn btn-danger">删除</button>
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
                <button class="btn btn-danger" id="btn_delete">删除</button>
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

    <!--弹出框-->
    <!--样例地址-->
    <!--https://www.cnblogs.com/shenzikun1314/p/6852928.html-->
    <script src="/static_resources/Admin/dialog/js/showBo.js"></script>
    <script>
        //注册删除按钮的事件
        $("#btn_delete").click(function () {
            //取表格的选中行数据
//    var arrselections = $("#tb_departments").bootstrapTable('getSelections');
//    if (arrselections.length <= 0) {
//    toastr.warning('请选择有效数据');
//    return;
//    }

            Ewin.confirm({message: "您确定删除该用户吗？"}).on(function (e) {
                alert(a);
                if (!e) {
                    return;
                }
                $.ajax({
                    type: "post",
                    url: "/api/DepartmentApi/Delete",//提交的接口地址
                    data: {"id": "1"},//要提交的数据
                    success: function (data, status) {
                        if (status == "success") {
                            toastr.success('提交数据成功');
                            $("#table_user").bootstrapTable('refresh');
                        }
                    },
                    error: function () {
                        toastr.error('Error');
                    },
                    complete: function () {

                    }

                });
            });
        });
    </script>
</div>