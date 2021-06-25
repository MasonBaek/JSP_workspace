<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> fileUpload_JSP </h1>
	<h2> 파일 업로드 페이지 </h2>
	<!-- multipart / form-data 마임타입 변경 -->
	<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data">
	
		이름 : <input type="text" name="name"><br>
		파일명 : <input type="text" name="subject"><br>
		파일 :<input type="file" name="file"><br>
		<input type="submit" value="파일 업로드">
		
	</form>
</body>
</html>
