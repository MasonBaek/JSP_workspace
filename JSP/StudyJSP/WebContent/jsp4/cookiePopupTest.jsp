<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	// 페이지 온로드 이벤트 발생시 pageLoad() 호출
	window.onload = pageLoad();
	
	function pageLoad(){
		var notShowPop = getCookieValue();
			
		if(notShowPop != "true"){
		//새창(팝업)열기
		open("cookiePopup.jsp","","width=500m,height=500,left=200,top=300");
		}
	}
	
	function getCookieValue(){
		var result = "false";
		//쿠키정보를 확인해서 해당쿠키를 체크
		if(document.cookie != ""){
			var cookie = document.cookie.split(";");
			for(var i = 0 ; i <cookie.length ; i++){
				var element = cookie[i].split("=");
				var nameValue = element[0];
				// \ s(문자열공백) 을 제거 
				nameValue = nameValue.replace(/^\s*/, '') ;
				//쿠키이름이 notShowPop 쿠키를 찾아서
				if(nameValue == "notShowPop"){
					result = element[1];
				}
			}
		}
		return result ;
	}
	function popUpReStart(){
		document.cookie = "notShowPop="+"false"+";path=/; expires=-1";
	}
</script>

</head>
<body>
	<h1> cookiePopupTest_JSP</h1>
	
	<h2> 쿠키사용한 팝업 예제</h2>
	<input type="button" value="팝업 허용하기" onclick="popUpReStart();">
  
	
	
</body>
</html>