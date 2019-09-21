<template:user_backend htmlTitle="添加学生信息" bodyTitle="添加学生信息">
    <form method="POST" action="${cx}/student/create"
          enctype="multipart/form-data">
        姓名<br/>
        <input type="text" name="name" value="请输入姓名"><br/><br/>
        电话号码<br/>
        <input type="text" name="cellphone" value="请输入电话号码"><br/><br/>
        性别<br/>
        <select  name="sex">
                <option value="男">男</option>
                <option value="女">女</option>
                <option value="不公开">不公开</option>

        </select>
        <br/><br/>
        家庭地址<br/>
        <textarea name="address" rows="5" cols="30">请输入家庭地址
            </textarea><br/><br/>

        <label class="control-label">文件上传</label>
        <input  id="file-select" type="file" name="file"
               class="form-control file" />
        <div id="errorBlock"></div>
        <input type="submit" value="提交"/>
    </form>

    <%--使用fileinput组件--%>



<script>
    //设置页面对应的菜单选项
    var ItemId ="Item1_1";
    <!-- 文件上传组件属性设置 -->
    $('#file-select').fileinput({
        language : 'zh', //中文
        uploadUrl : '${cx}/student/uploadAttachement', //上传路径
        'elErrorContainer' : '#errorBlock',
        showUpload : false, //是否显示上传文本框里的上传按钮
        showRemove : false, //是否显示上传文本框里的移除按钮
        dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
        maxFileCount : 3, //表示允许同时上传的最大文件个数
        enctype : 'multipart/form-data',
        allowedFileTypes : [ 'image','doc' ],//配置允许文件上传的类型
        allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
        allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ]//控制被预览的所有mime类型
    });
</script>
</template:user_backend>
