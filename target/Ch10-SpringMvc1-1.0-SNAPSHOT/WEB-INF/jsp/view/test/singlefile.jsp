<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>文件上传</title>
</head>
<body>
    <h1>单个文件上传</h1>
    <hr>
    <form method="post" action="${cx}/file/saveOneFile"
          enctype="multipart/form-data">
        选择文件:<input type="file" name="file" multiple />
        <p>
            <input type="submit" value="上传">
    </form>
    <hr>
</body>
</html>