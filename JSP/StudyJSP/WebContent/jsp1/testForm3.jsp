<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>TestForm3.JSP</h1>
	
	<fieldset> 
		<legend> 입력 하자 </legend>
		<form action="testPro3.jsp" method="post">
		
		이름 :  <input type="text" name="name"><br>
		성별 :	<input type="radio" name="gender" value="남"> 남 
				<input type="radio" name="gender" value="여"> 여 <br>
		취미 : <input type="checkbox" name="hb" value="헬스"> 헬스
				<input type="checkbox" name="hb" value="게임"> 게임
				<input type="checkbox" name="hb" value="사진"> 사진
				<input type="checkbox" name="hb" value="숨쉬기운동"> 숨쉬기운동 <br>
		과목 : <select name="subject" multiple="multiple" size="5">
				<option value=""> 선택하시오.</option>
				<option value="자바"> 자바 </option>
				<option value="자바스크립트"> 자바스크립트 </option>
				<option value="CSS"> CSS </option>
				<option value="오라클"> 오라클 </option> 
				</select>
				<hr>
			<input type="submit" value="가즈아~~">
		</form>
	</fieldset>
</body>
</html>