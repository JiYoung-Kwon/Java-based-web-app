<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<link rel = 'stylesheet' 
	  href = 'https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css'>
<script src = '../lib/jquery-3.6.0.min.js'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>  
<title>menu</title>
<style>
	.ui-menu{width:200px;}
</style>
</head>
<body>
	<div id = 'menu'>
		<h2>MENU</h2>
		<ul id = 'menu_here'>
			<li><a href = '#'>html</a>
				<ul>
					<li><a href = ''>개요</a></li>
					<li><a href = ''>글자태그</a></li>
					<li><a href = ''>문단태그</a></li>
					<li><a href = ''>폼태그</a></li>
				</ul>
			</li>
			
			<li>
				<a href = '#'>css</a>
				<ul>
					<li>
						<a href = ''>개요</a>
						<ul>
							<li><a href = ''>aaaa</a></li>
							<li><a href = ''>bbbb</a></li>
							<li><a href = ''>cccc</a></li>
							<li><a href = ''>dddd</a></li>
						</ul>
					</li>
					<li><a href = ''>글자태그</a></li>
					<li><a href = ''>문단태그</a></li>
					<li><a href = ''>폼태그</a></li>
				</ul>
			</li>
				
			<li><a href = '#'>javascript</a></li>
			<li><a href = '#'>jsp</a></li>
			<li><a href = '#'>java</a></li>
		</ul>
		
		
	</div>
	<script> $('#menu_here').menu();</script>
</body>
</html>