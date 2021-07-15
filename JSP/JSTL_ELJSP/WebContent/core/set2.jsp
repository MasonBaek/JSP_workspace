<%@page import="java.util.Vector"%>
<%@page import="com.itwillbs.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>webConten/core/set2_JSP </h1>
	<h2> set1_JSP 페이지에서 전달된 정보 출력 </h2>
	
	<%
		//String name = (String)request.getAttribute("name");
		//String price = (String)request.getAttribute("price");
		//String model = (String)request.getAttribute("model");
	%>
	<%-- name : <%=name %><br>
	price : <%=price %><br>
	model : <%=model %><br> --%>
	<hr>
	<h2> el 표현식 사용</h2>
	name : ${requestScope.name}<br>
	<!-- requestScope 생략가능 -->
	name : ${name }<br>
	price : ${price }<br>
	model : ${model }<br>
	<hr>
	<c:out value="<c:remove/>사용하여출력"/> 
	<c:remove var="name"/><!-- 권장(X) -->
	<c:remove var="name" scope="request"/><!-- 권장(O) -->
	name : ${name }<br>
	price : ${price }<br>
	model : ${model }<br>
	
	<hr>
	<%MemberBean mb = (MemberBean)request.getAttribute("mb"); %>
	<h2> 서블릿 사용하여 정보 전달</h2>
	<h4> 아이디 : ${requestScope.mb.id}</h4>
	<h4> 비밀번호 : <%=mb.getPw() %></h4>
	<h4> 이름 : ${mb.name} </h4>
	<c:set var="m" value="${requestScope.mb }"/>
	<h4> 나이 : ${m.age }</h4>
	
	<hr>
	<%-- 
	<%MemberBean mb2 = (MemberBean)request.getAttribute("mb2"); %>
	<h2> 서블릿 사용하여 정보 전달</h2>
	<h4> 아이디 : ${requestScope.mb2.id}</h4>
	<h4> 비밀번호 : <%=mb2.getPw() %></h4>
	<h4> 이름 : ${mb2.name} </h4>
	<c:set var="m2" value="${requestScope.mb2 }"/>
	<h4> 나이 : ${m2.age }</h4>
	 --%>
	 
	<h2> 서블릿 사용하여 정보 전달</h2>
	<h4> 아이디 : ${requestScope.mb2.id}</h4>
	<h4> 비밀번호 : ${mb2.pw }</h4>
	<c:set var="mb2" value="${requestScope.mb2 }"/>
	<h4> 이름 : ${mb2.name} </h4>
	<h4> 나이 : ${mb2.age }</h4>
	
	<hr>
	<h3> 서블릿에서 전달되는 리스트 정보를 출력 </h3>
	
	아이디 : ${requestScope.memberList[0].id }
	비밀번호 : ${memberList[0].pw }
	이름 : ${memberList[0].name }
	나이 : ${memberList[0].age }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>