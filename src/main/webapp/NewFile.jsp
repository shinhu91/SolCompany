<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/test2.css">
</head>
<body>

<table border="1" width="600" height="50">
<tr><td width="25%"  align="center">총 계</td><td width="25%"  align="right">${basic * 2000000 }&nbsp;&nbsp;</td><td width="25%"  align="right">${sum2 * 100000 }&nbsp;&nbsp;</td><td width="25%"  align="right">${sum}&nbsp;&nbsp;</td></tr>
<tr>
<td align="right" colspan="4"><font color="red">합 계 : ${(basic * 2000000) + (sum2 * 100000) + sum}</font>&nbsp;&nbsp;</td>
</tr>
</table>



<table class="type09">
    
    <tbody border="1" width="600" height="50">
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
    
 

</body>
</html>