<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content ='width=device-width, initial-scale=1.0'>
<title>index</title>
<link rel ='stylesheet' type='text/css' href ='./css/index.css'>
</head>
<body>
	<div id='index'>
		<div id = 'login'>
			로그인/로그아웃	
		</div>
		
		<header id = 'header'>
			<nav id = 'main_menu'>
				<a href = '#'>메뉴1</a>
				<a href = '#'>메뉴2</a>
				<a href = '#'>메뉴3</a>
				<a href = '#'>메뉴4</a>
				<a href = '#'>메뉴5</a>
			</nav>
		</header>
		
		<div id = 'center'>
			<div id = 'sub_menu'>
				서브메뉴
			</div>
			<div id = 'middle'>
				<div id = 'border'>
					<jsp:include page="./board/search.jsp"/>
				</div>
				
				<div id = 'stock'>
					<jsp:include page="./member/modify.jsp"/>
				</div>
			</div>
			<div id = 'guestbook'>
				<jsp:include page="./guestbook/list.jsp"/>
			</div>
		
		</div>
		<footer id = 'footer'>꼬릿말</footer>
		
		
		<!-- 대소문자 구분 X, 두 칸 이상 띄어쓰기 X, 엔터 인식 X -->
		<!-- <h1 style='color:#ff0088'> INDEX</h1>
		<h1> INDEX</h1>
		<h1 class='cls'> INDEX</h1>
		<input type='button' value='button'/>
		<input type="text" value='text'/>
		-->
	</div>
	
</body>
</html>