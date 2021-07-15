<%@page import="com.itwillbs.bean.Phone"%>
<%@page import="com.itwillbs.bean.Person"%>
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
  <h2> "WebContent/el/BeanTest.jsp" </h2>
  <%
  	Person p = (Person)request.getAttribute("person");
  %>
  
  이름 : <%=p.getName() %> <br>
  나이 : <%=p.getAge() %><br>
  폰객체 : <%=p.getPhone() %><br>
  p.getPhone().getModel() : <%=p.getPhone().getModel() %><br>
  p.getPhone().getModel() : <%=p.getPhone().getDigit() %><br>
  Phone phone = p.getPhone(); 선언이후 <% Phone phone = p.getPhone(); %><br>
  phone.getModel() : <%=phone.getModel() %><br>
  phone.getDigit() : <%=phone.getDigit() %><br>
  
  <h4> EL 표현식</h4>
  
  이름 : ${person.name }<br>
  나이 : ${person.age }<br>
  
  <h4> c:out </h4>
   <c:out value="${person.name }"/>
   <c:out value="${person.age }"/>
   <br>
   <c:out value="${person.phone.model }"/>
   <c:out value="${person.phone.digit }"/>
   <hr>
   <pre style="font-size:16px;"><b>
   선언된 변수명을 쓰면 된다
   Phone "phone" = new Phone("갤럭시2","010-9358-2120");
   Person "person" = new Person("홍길동", 20, phone);
   " "따옴표 안에 있는 변수를 쓰자**</b>
   </pre>
   	
  	
  
  
  
  
  
</body>
</html>