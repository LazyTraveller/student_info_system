<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>文件上传</title>
</head>
<body>
    <h1>单个文件上传</h1>
    <hr>
    <form method="POST" action="${cx}/file/saveMulFile" enctype="multipart/form-data">
        选择要上传的文件: <br />
        上传文件1：<input type="file" name="files"> <br />
        上传文件2：<input type="file" name="files"> <br />
        <input type="submit" value="提交">
    </form>

    <hr>
</body>
</html>