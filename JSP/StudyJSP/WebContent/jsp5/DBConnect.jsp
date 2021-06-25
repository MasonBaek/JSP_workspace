<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>DBConnect_JSP</h1>
	
	<%
		
		//	JDBC를 사용하여 mysql과 연결
		//	0) 필요한 드라이버 설치 (API/라이브러리)
		//	Wen
		//	WebContent/WEB-INF/lib/mysql-connector-java-5.1.49.jar
		Class.forName("com.mysql.jdbc.Driver");
		
		System.out.println("드라이브 로드 성공");
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
		
		System.out.println("디비 연결 성공");
		System.out.println("asdf"+conn);
	%>
	
</body>
</html>