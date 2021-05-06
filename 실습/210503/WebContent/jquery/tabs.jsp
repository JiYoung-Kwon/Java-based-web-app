<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tabs</title>

<link rel = 'stylesheet' 
	  href = 'https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'>
<script src = '../lib/jquery-3.6.0.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>  

</head>
<body>
	<div id = 'tabs'>
		<!--  tab에 들어갈 탭 메뉴 -->
		<ul>
			<li><a href = '#menu_html'>HTML 소개</a></li>
			<li><a href = '#menu_css'>CSS 소개</a></li>
			<li><a href = '#menu_javascript'>JavaScript 소개</a></li>
			<li><a href = '#menu_ajax'>AJAX 소개</a></li>
			<li><a href = '#menu_jquery'>jQuery 소개</a></li>
		</ul>
		
		<!-- tab에 들어갈 내용 -->
		<div id = 'menu_html'>HTML5 내용입니다.</div>
		<div id = 'menu_css'>CSS 내용입니다.</div>
		<div id = 'menu_javascript'>JavaScript 내용입니다.</div>
		<div id = 'menu_ajax'>AJAX 내용입니다.</div>
		<div id = 'menu_jquery'>jQuery 내용입니다.</div>
	</div>
	<script>
		$('#tabs').tabs();
	</script>
</body>
</html>