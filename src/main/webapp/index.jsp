<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/resources/css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/register.sh">회원가입</a>
	<a href="/login.sh">로그인</a>
	<a href="/findId.sh">아이디 찾기</a>
	<a href="/findPw.sh">비밀번호 찾기</a>
	<a href="/myInfo.sh">내 정보 보기</a>
	<a href="/editInfo.sh">내 정보 수정</a>

	<div class="login-page">
		<div class="form">
			<form class="register-form">
				<input type="text" placeholder="name" /> <input type="password"
					placeholder="password" /> <input type="text"
					placeholder="email address" />
				<button>create</button>
				<p class="message">
					Already registered? <a href="#">Sign In</a>
				</p>
			</form>
			<form class="login-form">
				<input type="text" placeholder="username" /> <input type="password"
					placeholder="password" />
				<button>login</button>
				<p class="message">
					Not registered? <a href="#">Create an account</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>