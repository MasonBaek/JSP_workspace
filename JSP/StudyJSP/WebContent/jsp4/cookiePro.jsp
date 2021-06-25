<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookiePro_JSP</h1>
	
	<%
	//2. 전달된 정보사용 쿠키값 생성
	Cookie cookie = new Cookie("lang",request.getParameter("language"));
	
	//3. 쿠키시간 설정
	cookie.setMaxAge(3600);
	
	//4. 사용자에게 쿠키정보 전달(HDD 저장)
	response.addCookie(cookie);
	
	//5. cookieForm 페이지로 이동
	%>
	<script type="text/javascript">
	alert("언어 쿠키정보를 생성!");
	location.href="cookieForm.jsp";
	
	</script>
</body>
</html>