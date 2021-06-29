<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#ani {
		width : 50px;
		height: 50px;
		background-color: orange;
	}
</style>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// show(),hide(),toggle()
		// slideDown(),slideUp(),slideToggle()
		// fadeIn(),fadeOut(),fadeToggle()
		
		$('h1').click(function(){
			//$(this).next().toggle();
			//$(this).next().slideToggle();
			$(this).next().fadeToggle('slow',function(){
				// 콜백함수 : 적용되는 효과를 100% 실행후 동작하는 함수
				alert("효과 끝 ! ")
			});
		});
		var ani_width , ani_height;
		$('div#ani').click(function(){
			ani_width = $(this).css('width');
			ani_height = $(this).css('height');
			
// 			$(this).css('width',parseInt(ani_width)+50);
// 			$(this).css('height',parseInt(ani_height)+50);
			$(this).animate({
				width : parseInt(ani_width)+50,
				height : parseInt(ani_height)+50
			},'slow');
		});
		$('button').click(function(){
			$('div#ani').css('width',parseInt(ani_width)-50);
			$('div#ani').css('height',parseInt(ani_height)-50);
		});
		
	});
</script>
</head>
<body>
	<h1> 메뉴1 (열기 / 닫기)</h1>
	<div>
		<h1>제목1</h1>
		<p>내용1</p>
	</div>
	<h1> 메뉴2 (열기 / 닫기)</h1>
	<div>
		<h1>제목2</h1>
		<p>내용2</p>
	</div>
	<hr>
	<button>홍홍홍</button>
	<hr>
	<div id="ani"></div>
</body>
</html>
