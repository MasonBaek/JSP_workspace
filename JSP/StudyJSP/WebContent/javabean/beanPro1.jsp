<%@page import="com.itwillbs.beantest.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> beanPro1_JSP </h1>
	<h2> 자바빈테스트 처리</h2>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)request.getParameter("id");

	
	%>
	
	아이디 :<%=id %>
	
	<%
		//자바빈 객체사용
		JavaBean1 jb1 = new JavaBean1();
// 	System.out.println(jb1.toString());
	System.out.println();
	System.out.println(jb1);
	
	jb1.setId(request.getParameter("id"));
	System.out.println(jb1);

	%>
	<!-- 액션태그 사용하여 JavaBean 객체 사용 -->
	<!-- 자바빈 객체 생성 -->
	<jsp:useBean id="jb2" class="com.itwillbs.beantest.JavaBean1"></jsp:useBean>
	<!-- 자바빈 객체에 정보 저장 -->
	<jsp:setProperty property="id" name="jb2" param="id"/>
	<!-- 자바빈 객체에 정보 출력 -->
	<jsp:getProperty property="id" name="jb2"/>
	<%
	System.out.println("액션태그 : "+jb2);
	%>
	
</body>
</html>