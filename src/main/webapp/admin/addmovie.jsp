<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <link href="/static_resources/upload/css/iconfont.css" rel="stylesheet" type="text/css"/>



<form enctype="multipart/form-data" class="form-horizontal" role="form">
    <div class="form-group">
        <label for="moviename" class="col-sm-2 control-label">电影名字</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="moviename"
                   placeholder="请输入电影名字">
        </div>
    </div>
    <div class="form-group">
        <label for="directorname" class="col-sm-2 control-label">导演</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="directorname"
                   placeholder="请输入导演名字，以/分隔">
        </div>
    </div>
    <div class="form-group">
        <label for="writername" class="col-sm-2 control-label">编剧</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="writername"
                   placeholder="请输入编剧名字，以/分隔">
        </div>
    </div>
    <div class="form-group">
        <label for="actorname" class="col-sm-2 control-label">主演</label>
        <div class="col-sm-8">
            <textarea rows="2" class="form-control" id="actorname"
                      placeholder="请输入主演名字，以/分隔"></textarea>
        </div>
    </div>
    <!--这里有个类型的复选框-->
    <!--复选框end-->
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">选择制片地区/国家</label>
        <div class="col-sm-5">
            <select id="name" class="form-control">
                <option>中国</option>
                <option>美国</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>

    </div>

    <!--语言选择-->
    <div class="form-group">
        <label for="language" class="col-sm-2 control-label">选择语言</label>
        <div class="col-sm-5">
            <select id="language" class="form-control">
                <option>英语</option>
                <option>中文</option>
                <option>日语</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>

    </div>
    <!--语言选择end-->

    <!--上映时间-->
    <div class="form-group">
        <label for="time" class="col-sm-2 control-label">上映时间</label>
        <div class="col-sm-5">
            <input type="time" class="form-control" id="time">
        </div>
    </div>
    <!--上映时间end-->

    <!--上映时长-->
    <div class="form-group">
        <label for="length" class="col-sm-2 control-label">时长(分钟)</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="length"
                   placeholder="请输入上映时长（分钟）">
        </div>
    </div>
    <!--上映时长end-->
    <!--剧情简介-->
    <div class="form-group">
        <label for="plot" class="col-sm-2 control-label">剧情简介</label>
        <div class="col-sm-8">
            <textarea rows="2" class="form-control" id="plot"
                      placeholder="剧情简介"></textarea>
        </div>
    </div>
    <!--剧情简介end-->

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
</form>



