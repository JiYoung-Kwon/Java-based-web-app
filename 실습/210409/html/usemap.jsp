<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<meta name ='viewport' content='width = device-width, initial-scale = 1.0'>
<title>usemap</title>
</head>
<body>
	<div id = 'usemap'>
		<fieldset>
			<legend>usemap</legend>
			<dl>
				<dt>shape</dt>
				<dd>circle, rect, poly
				
				<dt>coords</dt>
				<dd>
					- circle : 'x, y, r' =>  x,y 원의 중점이고, r은 원의 반지름<br/>
					- rect : 'x1,y1, x2,y2' => x1,y1은 사각형의 좌측상단 모서리 좌표. x2,y2는 우측하단 모서리 좌표<br/>\
					- poly : 'x1,y1, x2,y2, x3,y3, ... ' => 각각의 좌표를 이은 선이 영역이 됨
				</dd>
			</dl>
		</fieldset>
		
		<img src = '../imgs/zzanggu.jpg' usemap='#zzang'>
		
		<map name = 'zzang'>
			<area shape = 'circle' coords = '219,152,30' href = "https://www.naver.com" alt='네이버'/>
			<area shape = 'rect' coords = '71,198,112,236' href = "https://www.google.com" alt='구글'/>
			<area shape = 'poly' coords = '195,248,171,290,233,276' href = "https://www.youtube.com" alt='유튜브'/>
		</map>
	</div>
</body>
</html>