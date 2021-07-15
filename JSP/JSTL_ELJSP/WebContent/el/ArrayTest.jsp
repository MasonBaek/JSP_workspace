<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h2> "WebContent/el/ArrayTest.jsp" </h2>
  <%
  	String[] foods = (String[])request.getAttribute("foods");
  	
  for(int i=0 ; i<foods.length ; i++){
	  out.println(foods[i]+"<br>");
  }
  out.println("<hr>");
  ArrayList<String> sports = (ArrayList)request.getAttribute("sports");
  
  for(int i=0;i<sports.size();i++){
 	 out.print(sports.get(i)+"<br>");    	 
  }
  %>
  
  <h4> EL </h4>
  ${requestScope.foods }<br>
  
  <h4> JSTL + EL </h4>
  <c:forEach var="food" items="${requestScope.foods }">
  	음식 :  ${food } <br>
  </c:forEach>
  <hr>
  <h4> JSTL + EL Sports</h4>
  <c:forEach var="sports" items="${requestScope.sports }">
  sports : ${sports }  <br>
  </c:forEach>
  
  
  
</body>
</html>