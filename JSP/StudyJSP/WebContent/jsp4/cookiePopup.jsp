<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

		// onclick="setPopupStart(this);" 
		// this 가 그객체를 가리킴 여기서는 체크박스
		function setPopupStart(obj){
			if(obj.checked == true){
	    		  var expireDate = new Date();
	    		  expireDate.setMonth(expireDate.getMonth()+1); // 유효기간 1달
	    		  // 쿠키이름=쿠키값; path=경로; expires = 기간;
	    		  document.cookie = "notShowPop="+"true"+";path=/; expires="+ expireDate.toGMTString();
	    		  
	    		  alert( document.cookie );
	    		  
	    		  window.close();
	    	  }
			
		}
</script>


</head>
<body bgcolor="pink">
	<h1>cookiePopup_JSP</h1>
	<h2>ITWILL 광고 이벤트 입니다.</h2>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<input type="checkbox" onclick="setPopupStart(this);"> 오늘 다시 보지않기
	
	
</body>
</html>