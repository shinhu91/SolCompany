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
		<c:when test="${loginOk == null }">
			<script type="text/javascript">
				alert("아이디와 비밀번호를 확인하세요");
				document.location.href = "/index.jsp"
			</script>
		</c:when>
		<c:when test="${loginOk !=null}">
			<c:if test="${Srank == '부장' }">
				<script type="text/javascript">
					document.location.href = "/list.do"
				</script>
			</c:if>
		</c:when>
	</c:choose>



</body>
</html>