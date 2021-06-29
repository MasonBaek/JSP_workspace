/*  $('#news').innerfade({ 
 *	  animationtype: Type of animation 'fade' or 'slide' (Default: 'fade'), 
 *	  speed: Fading-/Sliding-Speed in milliseconds or keywords (slow, normal or fast) (Default: 'normal'), 
 *	  timeout: Time between the fades in milliseconds (Default: '2000'), 
 *	  type: Type of slideshow: 'sequence', 'random' or 'random_start' (Default: 'sequence'), 
 * 		containerheight: Height of the containing element in any css-height-value (Default: 'auto'),
 *	  runningclass: CSS-Class which the container get’s applied (Default: 'innerfade'),
 *	  children: optional children selector (Default: null)
 *  }); 
 * ========================================================= */

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul {
	list-style :none;
} /* list 점 지우기 */ 
</style>
<script src="../js/jquery-3.6.0.js"></script>
<script src="../js/jquery.innerfade.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			
		// $('#news').innerfade('animationtype','slide');
		$('#news').innerfade({
			animationtype: 'fade',
			speed : 'slow',
			type:'random'
		});
	
	});

</script>
</head>
<body>
  <h1> Innerfade_js_parctice.jsp </h1>
	<ul id="news">
		<li> 
			<img src ="ggbg.gif"> 
		</li>
		<li> 
			<img src ="km.jpg"> 
		</li>
		<li> 
			<img src ="rt_arch.jpg"> 
		</li>
		<li> 
			<img src ="tuev.jpg"> 
		</li>
		<li> 
			<img src ="whizzkids.gif"> 
		</li>
		
	</ul>
</body>
</html>
