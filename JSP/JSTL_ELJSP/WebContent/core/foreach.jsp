<%@page import="java.util.ArrayList"%>
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
  <h1>WebContent/core/foreach.jsp</h1>
  <%
   for(int i=0;i<5;i++){
  %>
  	<h2> Hello~ </h2>
  <%
   }
  %>
  <hr>
   JSTL - forEach구문<br>
   
  <c:forEach begin="1" end="5" step="1">
     <h2> itWill ! </h2>
  </c:forEach>
  
  <hr>
  1~10 까지 수 중에서 홀수만 출력(forEach)
    <!-- forEach문에서 반복에 사용되는 값은 var 변수를 사용해서 저장가능
       값을 사용할때는 el 표현식을 사용해야한다(html)
    -->
  <c:forEach  begin="1" end="10" step="2" var="i">
      ${i }<br>
  </c:forEach>
  
  <%-- 
  <c:set var="a" value="1"/>
  <c:forEach begin="1" end="10" step="2">
  	<h2> <c:out value="${a }"/> </h2>
    <c:set var="a" value="${a+2 }"/>
  </c:forEach>
  내답 --%>
  
  
    <%
    
    ArrayList<Object> arr = new ArrayList<>();
    arr.add(1);
    arr.add(2);
    arr.add(3);
    arr.add(4);
    arr.add(5);
    
    for(int i=0;i<arr.size();i++){
    	out.println(arr.get(i)+"<br>");
    }
  %>
  <hr>
  <%
    //자바 foreach
  	for(Object a :arr) { out.println(a);}
  
  	
  	//영역객체에 저장
  	pageContext.setAttribute("arr", arr);
  
  %>
  <hr><hr>
  ${arr }
  <hr><hr>
  <c:forEach var="a" items="${arr }">
  
  	${a }<br>
  </c:forEach>
  
  <hr><hr>
  
  <c:set var="arr2" value="a,b,c,d,e,f"></c:set>
  <c:forTokens var="test" items="${arr2 }" delims=",">
        ${test }&nbsp;&nbsp;&nbsp;<button>${test }</button> <br> 
  </c:forTokens>
  <hr><hr>
  <c:set var="arr3" value="itwill Busan 교육 센터 5 강의장 홍 길 동"/>
  <c:forTokens var="test2" items="${arr3 }" delims=" ">
        ${test2 }&nbsp;&nbsp;&nbsp;<button>${test2 }</button> <br> 
  </c:forTokens>
  
  
  
  
  
</body>
</html>