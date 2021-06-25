
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<h1> loginPro_JSP </h1>
   <%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL ="jdbc:mysql://localhost:3306/jspdb";
	final String DBID ="root";
	final String DBPW ="1234";
	
	Class.forName(DRIVER);
	System.out.println(" 드라이버 로드 성공 ");
	 
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println(" 디비연결 성공 ");
	 
	String sql = "select * from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(rs.getString("pass").equals(pass)){
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		}else {
			%>
			<script type="text/javascript">
			alert("회원정보가 없거나 비밀번호 틀렸습니다. ");
			history.back();
			</script>
			<%
		}
	}else{
		%>
		<script type="text/javascript">
			var noId = confirm("회원정보 없는거임~~~ 회원가입하쉴?");
			if(noId){
				location.href="insertForm.jsp";
			}else{
				history.back();
			}
		</script>
		<%	
	}
	
   %>
</body>
</html>