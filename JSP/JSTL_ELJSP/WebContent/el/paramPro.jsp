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
	<h1>WebContent/el/paramPro.jsp</h1>

	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
	%>
	스포츠 : <%=request.getParameterValues("sports")[0] %><br>
	스포츠 : <%=request.getParameterValues("sports")[1] %>
	
	<%
		String[] sports = request.getParameterValues("sports");
	%>
	<hr>
	스포츠 :<%=sports[0]%><br>
	스포츠 :<%=sports[1]%>
	<hr>
	<hr>
	<h4> 취미 name : hobby for문사용</h4>
	<%	String[] hobbies = request.getParameterValues("hobby");
	if(hobbies!=null){
	 for(int i=0 ; i<hobbies.length ; i++){%>
			취미: <%=hobbies[i]	%> //
	<%}
	}%>
	<h2> EL 표현식을 사용한 처리 </h2>
	이름 : ${ param.name } <br>
	아이디 : ${ param.id } <br>
	아이디 : ${id } (영역객체가 아니기 때문에 항상 param 객체사용) <br>
    스포츠 : ${paramValues.sports[0] }<br>	
    스포츠 : ${paramValues.sports[1] }<br>
	<hr>
	for문으로 el 표현식으로 쓰기 =>불가능
	<%
		for(int i=0 ; i<hobbies.length ; i++){%>
			${hobbies[i] }
		<%}
	%>
	<hr>
	취미 : ${paramValues.hobby[0]}<br>
	취미 : ${paramValues.hobby[2]}<br>
	취미 : ${paramValues.hobby[1]}
	<hr>
	<h4>  el 표현식은 JSTL-forEach를 사용해서 반복</h4>
	
	<c:forEach var="h" items="${paramValues.hobby }">
		취미 : ${h }
	</c:forEach>
	<hr>
	// EL 표현식으로 전달되는 파라미터값은 자동으로 형변환 된다. //<br>
	나이 : ${param.age }<br>
	나이+10 : ${param.age+10 }
	
	
</body>
</html>