<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" width="500" height="270">

<tr><td width="150" height="30" align="center">지급내역</td><td width="100"  align="center">지급액(원)</td><td width="150"  align="center">공제내역</td><td width="100"  align="center">공제액(원)</td></tr>
<tr><td  height="30"><font color="red">1</font>. 기본급</td><td align="right">2000000&nbsp;&nbsp;</td><td><font color="red">5</font>. 건강보험료</td>
<td  align="right">${(years*100000 + rank + 2000000 + 100000)/20}&nbsp;&nbsp;</td></tr>
<tr><td  height="30">&nbsp;&nbsp;&nbsp;연차수당</td><td align="right">${years*100000}&nbsp;&nbsp;</td><td><font color="red">6</font>. 고용보험료</td><td  align="right">${(years*100000 + rank + 2000000 + 100000)/25}&nbsp;&nbsp;</td></tr>
<tr><td  height="30">&nbsp;&nbsp;&nbsp;직책수당</td><td align="right">${rank}&nbsp;&nbsp;
</td><td><font color="red">7</font>. 결근공제</td><td></td></tr>
<tr><td  height="30"><font color="red">2</font>. 잔업수당</td><td></td><td></td><td></td></tr>
<tr><td  height="30"><font color="red">3</font>. 복리후생비</td><td align="right">100000&nbsp;&nbsp;</td><td></td><td></td></tr>
<tr><td  height="30"><font color="red">4</font>. 상여금</td><td></td><td></td><td></td></tr>
<tr><td colspan="2"  height="30" align="right">지급액계 ${(years*100000 + rank + 2000000 + 100000)}&nbsp;&nbsp;</td><td colspan="2"  align="right">공제액계
${((years*100000 + rank + 2000000 + 100000)/20) + ((years*100000 + rank + 2000000 + 100000)/25)}&nbsp;&nbsp;
</td><tr>
<tr><td colspan="4" height="30" align="right">
차인지급액 ${(years*100000 + rank + 2000000 + 100000)-(((years*100000 + rank + 2000000 + 100000)/20) + ((years*100000 + rank + 2000000 + 100000)/25))}&nbsp;&nbsp;
</td></tr>
</table>
</body>
</html>