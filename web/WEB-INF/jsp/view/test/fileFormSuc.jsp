<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>文件上传成功</title>
</head>

<body>
	<h1>文件上传成功！</h1>
	<br>
	<h2>图书信息如下</h2>
	<hr>
	图书名称: ${book.bookname }
	<br> 图书价格:${book.price }
	<br> 出版社:${book.press }
	<br> 类别:${book.category}
	<br> 图片:
显示图片方式1：<p>
<img width="200" src="${cx}/${picUrl}"/>
<p>
	<br>
</body>
</html>