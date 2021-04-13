<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>display</title>
<style>
	#display>.disp>div{
		border:1px solid #00f;
		width:200px;
		display:inline-block;
	}
	
	#display>.disp>.hi{
		display:none;
	}
	
	#display>.visible>div{
		width : 200px;
		border:1px solid #f00;
		display:inline-block;
	}
	#display>.visible>.hi{
		visibility:hidden;
	}
</style>
</head>
<body>
	<div id ='display'>
		<h2>display</h2>
		<div class = 'disp'>
			<div>A</div>
			<div class = 'hi'>B</div>
			<div>C</div>
			<div>D</div>
		</div>
		
		<h2>visible</h2>
		<div class = 'visible'>
			<div>A</div>
			<div class = 'hi'>B</div>
			<div>C</div>
			<div>D</div>
		</div>
	</div>
	

		
</body>
</html>