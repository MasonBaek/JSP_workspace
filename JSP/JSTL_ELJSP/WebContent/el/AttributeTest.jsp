<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h2> "WebContent/el/AttributeTest.jsp" </h2>
  <%
	// int cnt = (int)request.getAttribute("cnt"); // 권장 (x)
 	// Integer cnt = (Integer)request.getAttribute("cnt");
	int cnt = (Integer)request.getAttribute("cnt");
  %>
  
  <h2>전달된 데이터 출력</h2>
  JSP : <%=cnt %> <br>
  JSP+100 : <%=cnt+100 %> <br>
  <hr>
  EL : ${cnt }<br>
  EL : ${requestScope.cnt+100 }<br>
  
</body>
</html>