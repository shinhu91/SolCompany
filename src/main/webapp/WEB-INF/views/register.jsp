<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<form action="/reg.sh" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="password" required></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="text" name="password2" required></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" required></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="가입"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>