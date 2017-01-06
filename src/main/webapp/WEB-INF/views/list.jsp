<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" height="30" width="250" align="center">
<tr><td height="30" align="center" width="100">작성자</td>
<td align="center" width="100">물품</td>
<td align="center" width="50">수량</td>
</tr>
</table>

<c:forEach var="result" items="${result}">
<table border="1" height="30" width="250" align="center">
<a href="read.do?idx=${result.idx}">
<tr><td height="30" align="center" width="100">${result.writer}</td>
<td align="center" width="100">${result.buy}</td>
<td align="center" width="50">${result.count}</td>
</tr>
</a>

</c:forEach>
</table>

</body>
</html>