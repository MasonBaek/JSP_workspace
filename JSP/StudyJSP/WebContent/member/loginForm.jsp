<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> loginForm_JSP </h1>
<!-- 
사용자의 ID,PASS 정보를 입력받아서  회원여부 판단 로그인 처리
회원가입 버튼
-->
<form action="loginPro.jsp" method="post" >
	
	아 이 디 : <input type="text" name="id"> <br>
	비밀번호 : <input type="password" name="pass"><br><br>
	<input type="submit" value="로그인"> &nbsp;&nbsp;
	<input type="button" value="회원가입" onclick="location.href='insertForm.jsp';">    
</form>
	



</body>
</html>