<%@page import="com.itwillbs.beantest.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> beanPro2_JSP </h1>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		int age = Integer.parseInt(request.getParameter("age"));
		String tel = request.getParameter("tel");
	%>
	아이디 : <%=id %><br>
	비밀번호 : <%=pass %><br>
	나이 : <%=age %><br>
	전화번호 : <%=tel %>
	<%
	
	///////////////////////////////////////////////////////////////////////
	// 아이디,비밀번호, 나이, 전화번호 정보를 저장하는 JavaBean2 객체 생성
	
	// 전달된 4개의 정보를 JavaBean2 객체를 생성후 저장
	// 정보 출력
	
// 	JavaBean2 jb3 = new JavaBean2();
// 	jb3.setId(id);
// 	jb3.setPass(pass);
// 	jb3.setAge(age);
// 	jb3.setTel(request.getParameter("tel"));
	
	%>
<%-- 	<%=jb3 %><br> --%>
<%-- 	<%=jb3.getId() %><br> --%>
	
	<h2> 액션태그 </h2>
	<!-- 객체 생성 -->
	<jsp:useBean id="jb4" class="com.itwillbs.beantest.JavaBean2"></jsp:useBean>
	
		
	<!-- 정보저장(액션태그) -->
	<!-- property와 param 속성이 동일할경우 param을 생략가능 -->
	
	<jsp:setProperty property="*" name="jb4"/>
<%--<jsp:setProperty property="id" name="jb4" param="id"/><br>
	<jsp:setProperty property="pass" name="jb4" param="pass"/><br>
	<jsp:setProperty property="age" name="jb4" param="age"/><br>
	<jsp:setProperty property="tel" name="jb4" param="tel"/><br>
	 --%>
	
	<!-- 정보 출력(액션태그) -->
	<jsp:getProperty property="id" name="jb4"/><br>
	<jsp:getProperty property="pass" name="jb4"/><br>
	<jsp:getProperty property="age" name="jb4"/><br>
	<jsp:getProperty property="tel" name="jb4"/><br>

	
	
</body>
</html>