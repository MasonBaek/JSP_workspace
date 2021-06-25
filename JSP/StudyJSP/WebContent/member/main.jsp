<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> main_JSP </h1>
	
	<h2>메인페이지</h2>
	<!-- 
	로그인시 접근 가능한 페이지	 
	-->
	
	<%
	//세션영역에 있는 정보를 저장
	//정보가 없으면 로그인 페이지로 이동
	String id = (String)session.getAttribute("id"); 
	if(id ==null){
		response.sendRedirect("loginForm.jsp");
	}
	
	%>
	<%=id %> 님 환영합니다
	<input type="button" value = "로그아웃" onclick="location.href='logout.jsp'"><br>
	<hr>
	<button onclick="location.href='info.jsp'">회원정보조회(select)</button>
	<button onclick="location.href='updateForm.jsp'" >회원정보 수정(update)</button>
	<button onclick="location.href='deleteForm.jsp'" >회원탈퇴(delete)</button> <br><br>
	<!-- admin 관리자 메뉴 -->
	<% 
		if(id != null && id.equals("admin")){
	%>
	<button onclick="location.href='list.jsp'" >회원정보목록(list)</button>
	<% 
		} 
	%>
	
	
</body>
</html>