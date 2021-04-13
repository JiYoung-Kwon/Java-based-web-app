<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content='width=device-width, initial-scale=1.0'>
<title>gradient</title>
<style>
#gradient>#line-grad{
	width : 400px;
	height : 250px;
	border: 1px solid #999;
	background : linear-gradient(to right bottom,#fff,#0000ff 25%, #f00 75%, #fff);
}

#gradient #radial-grad{
	width : 400px;
	height : 250px;
	border: 1px solid #f00;
	background : radial-gradient(#fff,#ff0,#f00)
}
</style>
</head>
<body>
	<div id ='gradient'>
	<h2>선형 그라디언트</h2>
		<div id = 'line-grad' class = 'grad'></div>
		
		
	
	<h2>원형 그라디언트</h2>
		<div id = 'radial-grad' class = 'grad'></div>
		
	
	</div>
</body>
</html>