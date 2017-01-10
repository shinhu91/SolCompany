<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="/resources/css/test2.css">
</head>
<body>

<table class="type09" width="1000" height="70" border="1">
    <thead>
    <tr>
        <th  width="25%" align="center" scope="cols"><a href="finance.do">재무재표보기</a></th>
        <th scope="cols" width="25%"><a href="totalpay.do">월급내역보기</a></th>
        <th scope="cols" width="25%">거래처보기</th>
        <th scope="cols" width="25%">사내게시판</th>
    </tr>
    </thead>
   
</table>


<!-- <table width="720" height="70" border="1"> -->
<!-- <tr><td width="180" align="center"><a href="finance.do">재무재표보기</a></td> -->
<!-- <td width="180" align="center"><a href="totalpay.do">월급내역보기</a></td> -->
<!-- <td width="180" align="center">거래처보기</td> -->
<!-- <td width="180" align="center">사내게시판</td> -->
<!-- </tr> -->

<table border="1" width="1000">
<tr><td width="360" align="center">




<table class="type09">
    <thead border="1" height="180" width="250">
    <tr>
        <th scope="cols" colspan="4">신청 내역</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row" height="30" align="center" width="100">작성자</th>
        <td width="150" align="center">${writer}</td>
    </tr>
    <tr>
        <th scope="row" height="30" align="center" >직  급</th>
        <td align="center">${rank}</td>
    </tr>
    <tr>
        <th scope="row" height="30" align="center" >주문물품</th>
        <td align="center">${buy}</td>
    </tr>
    <tr>
        <th scope="row" height="30" align="center" >수량</th>
        <td align="center">${count1}</td>
    </tr>
    <tr>
        <th scope="row" height="30" align="center" >이유</th>
        <td align="center">${reason}</td>
    </tr>
    
    </tbody>
</table>



<!-- <table border="1" height="180" width="250"> -->
 <%-- <input type="hidden" name="idx" value="${idx}"> --%> 

<!-- <tr><td colspan="2" height="30" align="center"><font color="blue">신청 내역</font></td></tr> -->
<%-- <tr><td height="30" align="center" width="100">작성자</td><td  width="150" align="center">${writer}</td></tr> --%>
<%-- <tr><td height="30" align="center" >직  급</td><td align="center">${rank}</td></tr> --%>
<%-- <tr><td height="30" align="center" >주문물품</td><td align="center">${buy}</td></tr> --%>
<%-- <tr><td height="30" align="center" >수량</td><td align="center">${count1}</td></tr> --%>
<%-- <tr><td height="30" align="center" >이유</td><td align="center">${reason}</td></tr> --%>
<!-- </table> -->


<table class="type09">    
    <tbody border="1" width="250">
    <tr>
        <th scope="row"  width="125" align="center"><a href="confirm.do?idx=${idx}">승인</a></th>
         <th scope="row" width="125" align="center"><a href="confirmdelete.do?idx=${idx}">거부</a></th>
    </tr>    
    </tbody>
</table>



<!-- <table border="1" width="250"> -->
<!-- <tr><td width="250" align="center"> -->
<%-- <a href="confirm.do?idx=${idx}">승인</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
<%-- <a href="confirmdelete.do?idx=${idx}">취소</a> --%>
<!-- </td></tr> -->
<!-- </table> -->

</td><td width="360">


<!-- <table border="1" height="30" width="360" align="center"> -->
<!-- <tr><td height="30" align="center" width="100">작성자</td> -->
<!-- <td align="center" width="70">물품</td> -->
<!-- <td align="center" width="70">수량</td> -->
<!-- <td align="center" width="60">가격</td> -->
<!-- <td align="center" width="60">상태</td> -->
<!-- </tr> -->
<!-- </table> -->


<table class="type09">
    <thead border="1" height="30" width="590" align="center">
    <tr>
        <th scope="cols" height="30" align="center" width="330">작성자</th>
        <th scope="cols" align="center" width="70">물품</th>
        <th scope="cols" align="center" width="70">수량</th>
        <th scope="cols" align="center" width="60">가격</th>
        <th scope="cols" align="center" width="60">상태</th>
    </tr>
    </thead>




  <c:forEach var="result" items="${result}">
    <tbody border="1" height="30" width="590" align="center">
    <a href="list.do?idx=${result.idx}">
    <tr>
        <th scope="row" height="30" align="center" width="330">${result.writer}</th>
        <td align="center" width="70">${result.buy}</td>
        <td align="center" width="70">${result.count}</td>
        <td align="center" width="60">${result.money}</td>
        <td align="center" width="60">${result.state}</td>
    </tr>    
    </a>
</c:forEach>
    </tbody>



<%-- <c:forEach var="result" items="${result}"> --%>
<!-- <table border="1" height="30" width="360" align="center"> -->
<%-- <a href="list.do?idx=${result.idx}"> --%>
<%-- <tr><td height="30" align="center" width="100">${result.writer}</td> --%>
<%-- <td align="center" width="70">${result.buy}</td> --%>
<%-- <td align="center" width="70">${result.count}</td> --%>
<%-- <td align="center" width="60">${result.money}</td> --%>
<%-- <td align="center" width="60">${result.state}</td> --%>
<!-- </tr> -->
<!-- </a> -->
<%-- </c:forEach> --%>
<!-- </table> -->






<div align="center">
<c:if test="${count > 0}">

<c:if test="${ endPage > pageCount }">
<c:set var="endPage" value="${pageCount}"/>
</c:if>
<c:if test="${param.pageNum > 1}">
<button type="button" class="btn btn-primary btn-xs" onclick='location.href="/list.do?pageNum=1"'>처음</button>
</c:if>
<c:if test="${ startPage > 10 }">
<button type="button" class="btn btn-primary btn-xs" onclick='location.href="/list.do?pageNum=${startPage - 5}"'>이전</button>
</c:if>

<c:if test="${endPage >= pageCount }">
<c:forEach var="i" begin="${startPage}" end="${pageCount}">
<c:if test="${param.pageNum == i}">
<button type="button" class="btn btn-success btn-xs" onclick='location.href="/list.do?pageNum=${i}"'>${i}</button>
</c:if>
<c:if test="${param.pageNum != i}">
<button type="button" class="btn btn-primary btn-xs" onclick='location.href="/list.do?pageNum=${i}"'>${i}</button>
</c:if>
</c:forEach>
</c:if>

<c:if test="${endPage < pageCount}">
<c:forEach var="i" begin="${startPage}" end="${endPage}">
<c:if test="${param.pageNum == i}">
<button type="button" class="btn btn-success btn-xs" onclick='location.href="/list.do?pageNum=${i}"'>${i}</button>
</c:if>
<c:if test="${param.pageNum != i}">
<button type="button" class="btn btn-primary btn-xs" onclick='location.href="/list.do?pageNum=${i}"'>${i}</button>
</c:if>
</c:forEach>
<button type="button" class="btn btn-primary btn-xs" onclick='location.href="/list.do?pageNum=${startPage + 5}"'>다음</button>
</c:if>
<c:if test="${param.pageNum < pageCount}">
<button type="button" class="btn btn-primary btn-xs" onclick='location.href="/list.do?pageNum=${pageCount}"'>끝</button>
</c:if>
</c:if>
</div>
</td></tr>
</table>
</body>
</html>