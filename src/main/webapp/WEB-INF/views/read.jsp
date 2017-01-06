<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="confirm.do" method="post">
<table border="1" height="180" width="250">
<c:forEach var="result" items="${result}">
<input type="hidden" name="idx" value="${idx}">
<tr><td colspan="2" height="30" align="center"><font color="blue">신청 내역</font></td></tr>
<tr><td height="30" align="center" width="100">작성자</td><td  width="150" align="center">${writer}</td></tr>
<tr><td height="30" align="center" >직  급</td><td align="center">${rank}</td></tr>
<tr><td height="30" align="center" >주문물품</td><td align="center">${buy}</td></tr>
<tr><td height="30" align="center" >수량</td><td align="center">${count}</td></tr>
<tr><td height="30" align="center" >이유</td><td align="center">${reason}</td></tr>
</table>
</c:forEach>
<input type="submit" value="승인">
</form>

</body>
</html>