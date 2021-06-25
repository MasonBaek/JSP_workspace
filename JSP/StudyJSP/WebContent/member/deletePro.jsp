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
	<h1> deletePro_JSP </h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = (String) request.getParameter("id");
		if(id==null) {response.sendRedirect("loginForm.jsp");}
		String pass = (String) request.getParameter("pass");
		if(pass==null) {response.sendRedirect("deleteForm.jsp");}
		final String DRIVER="com.mysql.jdbc.Driver";
		final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
		final String DBID ="root";
		final String DBPW ="1234";
		Class.forName(DRIVER);
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		String sql = "select pass from itwill_member where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(rs.getString("pass").equals(pass)){
				sql = "delete from itwill_member where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				session.invalidate();
				%>
				<script type="text/javascript">
					alert("회원탈퇴 완료");
					location.href='loginForm.jsp';
				</script>
				<%	
			}else{
				%>
				<script type="text/javascript">
					alert("비밀번호 오류");
					history.back();
				</script>
				<%
			}
		}
	%>
</body>
</html>