<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// show(),hide(),toggle()
		// slideDown(),slideUp(),slideToggle()
		// fadeIn(),fadeOut(),fadeToggle()
		
		$('h1').click(function(){
			//$(this).next().toggle();
			//$(this).next().slideToggle();
			$(this).next().fadeToggle('slow',function(){
				// 콜백함수 : 적용되는 효과를 100% 실행후 동작하는 함수
			    alert("효과 끝!");				
			});
		});
		

	});
</script>

</head>
<body>

	<h1>메뉴1 (열기/닫기)</h1>
	<div>
		<h1>제목1</h1>
		<p>내용1</p>
	</div>
	
	<h1>메뉴2 (열기/닫기)</h1>
	<div>
		<h1>제목2</h1>
		<p>내용2</p>
	</div>

    <hr>
    
    
    





</body>
</html>