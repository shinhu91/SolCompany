<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/test2.css">
</head>
<body>

  

<table class="type09" border="1" width="600">
    <thead>
    <tr>
        <th scope="cols" width="25%" align="center">이름</th>
        <th scope="cols" width="25%" align="center">기본급</th>
         <th scope="cols" width="25%" align="center">연차수당</th>
        <th scope="cols" width="25%" align="center">직책수당</th>
    </tr>
    </thead>




<!-- <table border="1" width="600"> -->
<!-- <tr><td width="25%" align="center">이름</td><td width="25%" align="center">기본급</td><td width="25%" align="center">연차수당</td><td width="25%" align="center">직책수당</td></tr> -->
<!-- </table> -->



   <tbody border="1" width="600" height="100">
    <c:forEach var="result" items="${result}"  varStatus="status">
    <tr>
        <th scope="row" width="25%"  align="right">${status.count}.${result.name}&nbsp;&nbsp;</th>
        <td width="25%"  align="right">2000000&nbsp;&nbsp;</td>
        <td width="25%"  align="right">${result.years*100000}&nbsp;&nbsp;</td>
        <td width="25%"  align="right"><c:if test="${result.rank == '부장'}">500000&nbsp;&nbsp;</c:if>
<c:if test="${result.rank == '과장'}">300000&nbsp;&nbsp;</c:if>
<c:if test="${result.rank == '사원'}">100000&nbsp;&nbsp;</c:if></td>
    </tr></c:forEach>
    
    </tbody>
<!-- </table> -->




<!-- <table border="1" width="600" height="100"> -->
<%-- <c:forEach var="result" items="${result}"  varStatus="status"> --%>
<%-- <tr><td width="25%"  align="right">${status.count}.${result.name}&nbsp;&nbsp;</td> --%>
<!-- <td width="25%"  align="right">2000000&nbsp;&nbsp;</td> -->
<%-- <td width="25%" align="right">${result.years*100000}&nbsp;&nbsp;</td> --%>
<%-- <td width="25%" align="right"><c:if test="${result.rank == '부장'}">500000&nbsp;&nbsp;</c:if> --%>
<%-- <c:if test="${result.rank == '과장'}">300000&nbsp;&nbsp;</c:if> --%>
<%-- <c:if test="${result.rank == '사원'}">100000&nbsp;&nbsp;</c:if> --%>
<!-- </td></tr> -->
<%-- </c:forEach> --%>
<!-- </table> -->



    
    <tbody border="1">
    <tr>
        <th scope="row" width="25%"  align="center">총 계</th>
        <td width="25%"  align="right">${basic * 2000000 }&nbsp;&nbsp;</td>
        <td width="25%"  align="right">${sum2 * 100000 }&nbsp;&nbsp;</td>
        <td width="25%"  align="right">${sum}&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <th scope="row"  align="right" colspan="4"><font color="red">합 계 : ${(basic * 2000000) + (sum2 * 100000) + sum}</font>&nbsp;&nbsp;</th>
        
    </tr>
   
    </tbody>
</table>




<!-- <table border="1" width="600" height="50"> -->
<%-- <tr><td width="25%"  align="center">총 계</td><td width="25%"  align="right">${basic * 2000000 }&nbsp;&nbsp;</td><td width="25%"  align="right">${sum2 * 100000 }&nbsp;&nbsp;</td><td width="25%"  align="right">${sum}&nbsp;&nbsp;</td></tr> --%>
<!-- <tr> -->
<%-- <td align="right" colspan="4"><font color="red">합 계 : ${(basic * 2000000) + (sum2 * 100000) + sum}</font>&nbsp;&nbsp;</td> --%>
<!-- </tr> -->
<!-- </table> -->
</body>
</html>