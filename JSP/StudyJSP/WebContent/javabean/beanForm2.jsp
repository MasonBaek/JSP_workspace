<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1> beanForm2_JSP </h1>
	
		<!-- beanPro2.jsp 정보전달
			id,pass,age,tel => pro2페이지에서 출력 
		 -->
	
	<form action="beanPro2.jsp" method="post">
		아이디 : <input type="text" name="id"><br> 
		비밀번호 : <input type="password" name="pass"><br>
		나이 : <input type="text" name="age"><br>
		전화번호 : <input type="text" name="tel"><br>
		<input type="submit" value="전송">
	</form>
	
</body>
</html>