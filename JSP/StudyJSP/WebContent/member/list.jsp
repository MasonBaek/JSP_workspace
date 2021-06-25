<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> list_JSP </h1>
	<h2> 회원 전체 목록 확인</h2>
	<% 
	request.setCharacterEncoding("UTF-8");
	
	String admin = (String) session.getAttribute("id");
	if(admin == null || !admin.equals("admin")) {response.sendRedirect("loginForm.jsp");}
	
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
	final String DBID ="root";
	final String DBPW ="1234";
	Class.forName(DRIVER);
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	String sql = "select * from itwill_member where id<>? order by reg_date";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, admin);
	ResultSet rs = pstmt.executeQuery();
	
	%>
	
	<table border="1">
		<tr>
		<td> 아이디 </td>
		<td> 비밀번호 </td>
		<td> 이름 </td>
		<td> 나이 </td>
		<td> 성별 </td>
		<td> 이메일 </td>
		<td> 가입일자 </td>
		</tr>
	<% while(rs.next()){ 
		String id = rs.getString("id");
		String pass = rs.getString("pass");
		String name = rs.getString("name");
		int age = rs.getInt("age");
		String gender = rs.getString("gender");
		String email = rs.getString("email");
		String reg_date = rs.getString("reg_date");
		
		%> 
	<tr>
		<td> <%=id %> </td>
		<td> <%=pass %> </td>
		<td> <%=name %> </td>
		<td> <%=age %> </td>
		<td> <%=gender %> </td>
		<td> <%=email %> </td>
		<td> <%=reg_date %> </td>
	</tr>
	<%}%>
	
	</table>
	
	
	
</body>
</html>