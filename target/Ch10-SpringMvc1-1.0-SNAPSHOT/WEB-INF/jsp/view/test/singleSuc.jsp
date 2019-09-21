<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>

<body>
    <h1>Spring MVC控制器操作成功！</h1>
    <br>
    <h2>上传文件信息如下</h2>
    <hr>
    文件名: ${file.originalFilename}
    <br> 文件大小:${file.size}
    <br>文件类型:${file.contentType}
    <br>
</body>
</html>