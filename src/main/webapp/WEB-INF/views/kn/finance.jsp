<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/test2.css">
</head>
<body>

<table  class="type09"><tr><td>

<table width="440" height="200">
<tr><td>
<c:forEach var="resultmoney" items="${resultmoney}">
<table border="1" width="220" height="200">
<tr><td align="center">현금자산</td></tr>
<tr><td align="center">총계 : ${resultmoney.money}</td><tr>
<tr><td align="center">자산 : ${resultmoney.asset}</td><tr>
<tr><td align="center">부채 : -${resultmoney.borrow}</td><tr>
</c:forEach>
</table></td>
<td><c:forEach var="resultbuy" items="${resultbuy}">
<table border="1" width="220" height="200">
<tr><td height="33%" align="center">실물자산</td></tr>
<tr><td height="33%" align="center">책상 : ${resultbuy.desk} &nbsp;&nbsp;&nbsp;평가액 : ${resultbuy.desk*10000}</td></tr>
<tr><td height="33%" align="center">의자 : ${resultbuy.chair} &nbsp;&nbsp;&nbsp;평가액 : ${resultbuy.desk*5000}</td></tr>
</c:forEach>
</table></td><tr>
</table>
<table border="1" align="center">
<%-- <tr><td width="405" height="50" align="center">총계 : ${money}(현금) + ${goods}(자산) = ${totalmoney}(원)</td></tr> --%>
<tr><td width="445" height="50" align="center">
총계 : <fmt:formatNumber value="${money}" pattern="#,000원"/>(현금)
 + <fmt:formatNumber value="${goods}" pattern="#,000원"/>(자산) 
 = <font color="red"><fmt:formatNumber value="${totalmoney}" pattern="#,000원"/></font>(원)</td></tr>
</table>

</td></tr></table>
<%-- <fmt:formatNumber value="${totalmoney}" pattern="#,000원"/> --%>
<!-- 현금자산<br> -->
<%-- <c:forEach var="resultmoney" items="${resultmoney}"> --%>
<%-- 총계 : ${resultmoney.money} <br> --%>
<%-- 자산 : ${resultmoney.asset} <br> --%>
<%-- 부채 : -${resultmoney.borrow} <br> --%>
<%-- </c:forEach> --%>
<!-- <br><br> -->
<!-- 실물자산<br> -->
<%-- <c:forEach var="resultbuy" items="${resultbuy}"> --%>
<%-- 책상 : ${resultbuy.desk} &nbsp;&nbsp;&nbsp;평가액 : ${resultbuy.desk*10000}<br> --%>
<%-- 의자 : ${resultbuy.chair} &nbsp;&nbsp;&nbsp;평가액 : ${resultbuy.desk*5000}<br> --%>
<%-- </c:forEach> --%>
<!-- <br><br> -->
<%-- 총계 : ${money} + ${goods} = ${totalmoney} --%>

</body>
</html>