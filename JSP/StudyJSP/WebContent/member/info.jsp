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
	<h1> info_JSP </h1>
	
	<%
	// 로그인 한 회원의 모든정보를 출력하는 페이지
		// 1) 로그인 세션 제어
    String id = (String)session.getAttribute("id");
    if(id==null){
    	response.sendRedirect("loginFrom.jsp");
    }
    
    request.setCharacterEncoding("UTF-8");
    final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
	final String DBID ="root";
	final String DBPW ="1234";
	Class.forName(DRIVER);
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	String sql = "select * from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		out.println("아이디 : "+rs.getString("id")+"<br>");
		out.println("비밀번호 : "+rs.getString("pass")+"<br>");
		out.println("이름 : "+rs.getString("name")+"<br>");
		out.println("나이 : "+rs.getInt("age")+"<br>");
		out.println("성별 : "+rs.getString("gender")+"<br>");
		out.println("이메일 : "+rs.getString("email")+"<br>");
		out.println("회원가입일 : "+rs.getTimestamp("reg_date")+"<br>");
	}
	
	//자원 해제
	rs.close();
	pstmt.close();
	con.close();
	
	%>
</body>
</html>