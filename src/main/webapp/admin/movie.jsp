<%@ page contentType="text/html;charset=UTF-8" language="java" %>




    <link href="/static_resources/Admin/label/bootstrap-table.css" rel="stylesheet" media="screen">
    <script src="/static_resources/Admin/label/bootstrap-table.js" type="text/javascript"></script>
    <script src="/static_resources/Admin/label/bootstrap-table-zh-CN.js" charset="UTF-8" type="text/javascript"></script>


<div >
    <table style="width: 100%" class="table table-bordered" id="table_user">
        <caption class="text-center" style="color: #2f904d;font-size: 25px">电影信息表</caption>
        <thead>
        <tr>
            <th>电影名</th>
            <th>添加时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>xxxx</th>
            <th>2018-8-8</th>
            <th>
                <button class="btn btn-warning">编辑</button>
                <button class="btn btn-info">查看</button>
                <button class="btn btn-danger">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>2018-8-8</th>
            <th>
                <button class="btn btn-warning">编辑</button>
                <button class="btn btn-info">查看</button>
                <button class="btn btn-danger">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>2018-8-8</th>
            <th>
                <button class="btn btn-warning">编辑</button>
                <button class="btn btn-info">查看</button>
                <button class="btn btn-danger">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>2018-8-8</th>
            <th>
                <button class="btn btn-warning">编辑</button>
                <button class="btn btn-info">查看</button>
                <button class="btn btn-danger">删除</button>
            </th>
        </tr>
        <tr>
            <th>xxxx</th>
            <th>2018-8-8</th>
            <th>
                <button class="btn btn-warning">编辑</button>
                <button class="btn btn-info">查看</button>
                <button class="btn btn-danger">删除</button>
            </th>
        </tr>
        </tbody>
    </table>

    <div class="">
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
<!--增加电影之后，查看上传的电影信息，修改，删除，查找-->
