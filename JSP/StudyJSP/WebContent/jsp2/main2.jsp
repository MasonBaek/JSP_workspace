<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1> main_JSP</h1>
 
 <table border="1" width="600" height="600">
 	<tr>
 		<td colspan="2" height="100"> 	<jsp:include page="TOP.jsp"></jsp:include> </td>
 	</tr>
 	<tr>
 		<td width="100">left</td>
 		<td> Centre </td>
 	</tr>
 	<tr>
 		<td colspan="2" height="100"> bottom </td>
 	</tr>
 </table>
 
</body>
</html>