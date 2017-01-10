<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>select 태그 사용</title>
</head>
<body>
<%-- <tf:select name="buy" table="책상" chair="의자"></tf:select> --%>
<table border="1" height="210" width="250">
<form action="buy.do" method="post">
<tr><td colspan="2" height="30" align="center"><font color="blue">물품 주문</font></td></tr>
<tr><td height="30" align="center" width="100">작성자</td><td  width="150"><input type="text" name="writer"></td></tr>
<tr><td height="30" align="center" >직  급</td><td align="center"><tf:select name="rank" 부장="부장" 과장="과장" 사원="사원"></tf:select></td></tr>
<tr><td height="30" align="center" >주문물품</td><td align="center"><tf:select name="buy" 책상="책상" 의자="의자"></tf:select></td></tr>
<tr><td height="30" align="center" >수량</td><td align="center"><tf:select name="count" one="1" two="2" three="3" ></tf:select></td></tr>
<tr><td height="30" align="center" >이유</td><td align="center"><tf:select name="reason" 신규주문="신규주문" 기존물품마모="기존물품마모"></tf:select></td></tr>
<tr><td height="30" align="center" >구입/판매</td><td align="center"><tf:select name="state" 구입="구입" 판매="판매"></tf:select></td></tr>
</table>
<table width="250">
<tr><td><input type="submit" value="신청하기"></td></tr>
</table>
</form>




</body>
</html>