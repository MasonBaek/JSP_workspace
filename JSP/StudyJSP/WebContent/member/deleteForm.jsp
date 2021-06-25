<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> deleteForm_JSP </h1>
	<%String id = (String) session.getAttribute("id"); %>
	<form action="deletePro.jsp" method="post" >
	
	<input type="hidden" name="id" value=<%=id %>> <br>
	비밀번호 : <input type="password" name="pass"><br><br>
	<input type="submit" value="탈퇴하기"> &nbsp;&nbsp;
	<input type="button" value="돌아가기" onclick="location.href='main.jsp';">    
</form>
</body>
</html>