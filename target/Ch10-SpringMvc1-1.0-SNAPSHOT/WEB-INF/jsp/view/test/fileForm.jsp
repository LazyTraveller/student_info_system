<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>表单文件</title>
</head>
<body>
	<h1>添加图书</h1>
	<hr>
	<table>

		<form method="post" action="${cx}/file/fileForm" enctype="multipart/form-data">
			<tr>
				<td>图书名称:</td>
				<td><input type="text" name="bookname" value="围城"></td>
			</tr>
			<tr>
				<td>价格:</td>
				<td><input type="text" name="price" value="30.50"></td>
			</tr>
			<tr>
				<td>作者:</td>
				<td><input type="text" name="author" value="钱钟书"></td>
			</tr>
			<tr>
				<td>类别:</td>
				<td><select name="category">
						<option value="1" select="selected">文学</option>
						<option value="2">计算机</option>
						<option value="3">天文</option>
						<option value="4">户外探险</option>
				</select>
			</tr>
			<tr>
				<td>出版社:</td>
				<td><input type="text" name="press" value="人民文学出版社"></td>
			</tr>
			<tr>
				<td>图片1:</td>
				<td><input  type="file" name="file" multiple />
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="添加图书"></td>
			</tr>
		</form>
	</table>
	<hr>
</body>
</html>