<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2018/12/17
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>



</head>
<body>



<template:user_backend htmlTitle="添加新票据" bodyTitle="添加新票据">
    <div class="col-md-11">
        <div class="panel panel-success">
            <div class="panel-heading"
                 style="background-color:#0b7285;color: white">
                <span class="glyphicon glyphicon-book"></span> 添加学生信息
            </div>
            <div class="panel-body">
                <form action="${cx}/student/create"  method="POST" enctype="multipart/form-data">
                    <fieldset>
                        <div class="form-group ">
                            <label class="control-label">姓名</label>
                            <input type="text" style="width: 340px;"
                                   class="form-control" placeholder="学生姓名"
                                   value="请输入姓名"
                                   name="name"/>
                        </div>
                        <div class="form-group ">
                            <label class="control-label">电话号码</label>
                            <input type="text" style="width: 240px;"
                                   class="form-control" placeholder="电话号码"
                                   value="请输入电话号码" name="cellphone"/>
                        </div>

                        <div class="form-group ">
                            <label class="control-label">性别</label>
                            <select class="form-control" name="sex"
                                    style="width: 240px;">
                                <option value="男">男</option>
                                <option value="女">女</option>
                                <option value="不公开">不公开</option>
                            </select>
                        </div>
                        <div class="form-group ">
                            <label class="control-label">家庭地址</label>
                            <textarea  class="form-control" name="address" rows="6" cols="28">
                                请输入详细的家庭地址，具体到区
                        </textarea>
                        </div>

                        <div class="form-group">
                            <div class="fileUpload">
                                <label class="control-label">附件</label>
                                <input type="file" name="file" value=""  multiple="multiple"/>
                            </div><br/><br/>
                            <button id="addFile" type="button" class="btn btn-success" > 继续添加</button>
                        </div>
                        <p class="col-lg-4 col-lg-offset-4">
                            <button class="btn btn-default">重置</button>
                            <button class="btn"  style="background-color:#0b7285;color: white">添加学生信息</button>
                        </p>
                    </fieldset>
                </form>
            </div>

        </div>
    </div>
    <script>
        //设置页面对应的菜单选项
        var ItemId = "Item1_1";

        $(document).ready(function () {
            //添加文件控件
            $("#addFile").click(function () {
                $(".fileUpload:last").clone().insertBefore($("#addFile"));
                return false;
            });
        });

    </script>
</template:user_backend>

<
<script>

</script>
</body>
</html>
