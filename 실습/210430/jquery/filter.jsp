<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content='width=device-width, initial-scale = 1.0'>
<title>filter</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous"></script>
</head>
<body>
	<div id ='filter'>
		<h2>filter</h2>
		<ul>
			<li>강아지</li>
			<li>송아지</li>
			<li>망아지</li>
			<li>호랑이</li>
			<li>고양이</li>
			<li>독수리</li>
		
		</ul>
	</div>
	
	<script>
		$('#filter ul>li:first').css('color','#ff0000')
		$('#filter ul>li:gt(3)').css('color','#0000ff')
		$('#filter ul>li:nth-child(3n)').css('font-weight','bolder')
		// .slice(start, [end]) : start <= X < end(end가 생략되면 끝까지)
		$('#filter ul>li').slice(2,5).css('text-decoration', 'underline');
		$('#filter ul>li').filter(function(index){})
	</script>
</body>
</html>