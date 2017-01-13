<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${Sid == null }">
	<form action="/log.sh">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</c:when>
<c:when test="${Srank == '부장' }">
<script type="text/javascript">
document.location.href="/list.do"
</script>
</c:when>
</c:choose>



</body>
</html>