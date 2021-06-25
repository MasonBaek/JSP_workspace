<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> insertPro_JSP </h1>
	<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	%>
	
	아이디 : <%=id %><br>
	비밀번호 : <%=pass %><br>
	이름 : <%=name %><br>
	나이 : <%=age %><br>
	성별 : <%=gender %><br>
	이메일 : <%=email %><br>
	가입일 : <%=reg_date %><br>
	
	<%	
	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	// 0) 라이브러리 설치
	// 1)드라이버로드
	Class.forName(DRIVER);
	System.out.println(" 드라이버 로드 성공 ");
	
	//	2) 디비연결(드라이버)

	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println(" 디비 연결 성공 ");
	
	String sql = "insert into itwill_member values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setInt(4, age);
	pstmt.setString(5, gender);
	pstmt.setString(6, email);
	pstmt.setTimestamp(7, reg_date);
	
	pstmt.executeUpdate();
// 	pstmt.executeQuery();
	response.sendRedirect("loginForm.jsp");
	
	%>
	
	
	
	
	
</body>
</html>