<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale = 1.0'>
<title>앵커 태그</title>
</head>
<body>
	<div id = 'anchor'>
		<h2>현재 페이지에 링크 걸기</h2>
		<a href = 'http://www.naver.com'>네이버</a>
		<a href = 'http://www.jobtc.kr'>IT여행자</a>
		<a href = 'http://www.github.com/jiyoung-kwon'>권지영 깃허브</a>
		
		<h2>새로운 창에 링크 열기</h2>
		<a href = 'http://www.github.com/jiyoung-kwon' target='sub'>권지영 깃허브를 새 창으로</a>
		<a href = 'http://www.naver.com' target = '_blank'> 네이버를 무조건 새 창으로</a>
		
		<h2>링크를 클릭하여 문서 다운로드</h2>
		<a href = '../imgs/zzanggu.jpg' download='짱구.jpg'>짱구(다운로드)</a>
		
		<h2>동일한 문서 내에 링크 걸기</h2>
		<a href='#1장'>1장</a>
		<a href='#2장'>2장</a>
		<hr/>
		<div id='1장'>
			1장의 내용입니다.<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</div>
		
		<div id='2장'>
			2장의 내용입니다.<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</div>
		
		
	</div>
</body>
</html>