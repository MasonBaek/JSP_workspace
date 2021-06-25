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
	<h1> updatePro_JSP </h1>
	
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = (String) request.getParameter("id");
		if(id==null){
			response.sendRedirect("loginForm.jsp");
		}
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
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
				
				sql = "Update itwill_member set name=?, age=?, gender=?, email=? where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, age);
				pstmt.setString(3, gender);
				pstmt.setString(4, email);
				pstmt.setString(5, id);
				pstmt.executeUpdate();
				%>
				<script type="text/javascript">
					alert("회원정보 수정완료");
					location.href='main.jsp';
				</script>
				<%	
			}else{ //회원정보 O , 비밀번호 오류
				%>
				<script type="text/javascript">
					alert("비밀번호 오류 - 수정불가");
					history.back();
				</script>
				<%	
			}
		}else{ //비회원
			%>
			<script type="text/javascript">
				alert("비회원입니다");
				history.back();
			</script>
			<%	
		}
		
		
	%>
</body>
</html>