<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content='width=device-width, initial-scale=1.0'>
<title>border</title>
<style>
	#border div{
		border : 1px solid #666;
		width : 300px;
		height:70px;
		box-sizing : border-box;
	}
	
	#border .base{
		border-left-width : 30px;
		border-color : #ff4444;
	}
	
	#border .radius{
		border-left-width : 30px;
		border-radius : 0px 35px 35px 0px;
		background: linear-gradient(to right, #777, #fff 80%)
	}
	
	#border .shadow{
		box-shadow : 0px 0px 30px 5px #ff0;
	}
</style>
</head>
<body>
	<div id = 'border'>
		<h2>기본형</h2>
		<div class='base'></div>
	
		<h2>둥근형</h2>
		<div class='radius'></div>
		
		<h2>그림자</h2>
		<div class='shadow'></div>
	</div>
</body>
</html>