<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale = 1.0'>
<title>이미지 태그</title>
</head>
<body>
	<div id = 'img'>
		<h2>절대 경로</h2>
		<img src = '/WebStudy/imgs/doraemon.jpg' width='100px' />
		<br/>
		<img src = '/WebStudy/imgs/lava.jpg' width='100px' />
	
		<h2>상대 경로</h2>
		<img src = '../imgs/pikachu.jpg' width='200px'/>
		<br/>
		<img src = '../imgs/ryan.jpg' width='100px'/>
		
		<h2>웹 상에 있는 이미지 연결</h2>
		<img src = 'https://img.hankyung.com/photo/202008/BF.23393413.1.jpg' width='200px'/>
	 </div>
	 
	 <div>
		<h2>이미지와 텍스트</h2>
		<img src = '../imgs/zzanggu.jpg'width= '200px' align = 'left'/>
		위 사진은 말을 안듣는 못말리는 짱구가 잠옷을 입고 신나하고 있는 사진이다. 짱구 바보!
		오징어는 말려도 짱구는 못말려~! 신짱구 다섯살 어서오너라~
	</div>
</body>
</html>