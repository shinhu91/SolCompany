<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/resources/css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#f4efef">
	<div class="login-page">
		<div class="form">
			<h3>인사 관리</h3>
			<form action="/reg.sh" method="post" class="login-form">
				<input type="text" placeholder="이름" name="name" /> <input
					type="text" placeholder="아이디" name="id" /> <input type="text"
					placeholder="비밀번호" name="password" /> <input type="text"
					placeholder="비밀번호 확인" name="password2" /> <input type="text"
					placeholder="생년월일" name="birth" /> <input type="text"
					placeholder="직급" name="rank" /> <input type="text"
					placeholder="년차" name="years" />
				<button>create</button>
				<p class="message">
					Already registered? <a href="/index.jsp">Sign In</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>