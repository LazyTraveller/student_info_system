<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>添加图书</title>
</head>
<body>
<h1>添加图书</h1>
<hr>
<table>
    <form:form commandName="book" method="POST"
               action="${cx}/book/add" >
        <tr>
            <td>图书名称:</td>
            <td><form:input path="bookname"/></td>
        </tr>
        <tr>
            <td>价格:</td>
            <td><form:input path="price"/></td>
        </tr>
        <tr>
            <td>作者:</td>
            <td><form:input path="author"/></td>
        </tr>
        <tr>
            <td>类别:</td>
            <td><form:select path="category">
                <option value="1" selected>文学</option>
                <option value="2">计算机</option>
                <option value="3">天文</option>
                <option value="4">户外探险</option>
            </form:select>
        </tr>
        <tr>
            <td>出版社:</td>
            <td><form:input path="press" /></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="添加"></td>
        </tr>
    </form:form>
</table>
<hr>
</body>
</html>