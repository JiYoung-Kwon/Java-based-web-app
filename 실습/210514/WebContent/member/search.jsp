<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ='ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content ='width = device-width, initial-scale = 1.0'>
<title>회원정보 조회</title>
<link rel = 'stylesheet' type='text/css' href ='./css/member.css'>
</head>
<body>
	<div id = 'member'>
		<h1>SEARCH</h1>
		
		<form name = 'frm_search' method = 'post' action = ''>
			<input type = 'button' value = '가입'/>
			<div class ='find_zone'>
				<input type = 'search' name = 'findStr'/>
				<input type = 'button' value = '검색'/>
			</div>		
		</form>

		
		<div class ='title'>
			<span class ='no'>NO</span>
			<span class ='mid'>아이디</span>
			<span class ='mname'>성명</span>
			<span class ='phone'>연락처</span>
			<span class ='email'>이메일</span>
		</div>

		
		<div class = 'items'>
			<div class = 'item'>
				<span class ='no'>1</span>
				<span class ='mid'>Kim</span>
				<span class ='mname'>김씨</span>
				<span class ='phone'>010-1111-1111</span>
				<span class ='email'>jobtc@naver.com</span>
			</div>
		
			<div class = 'item'>
				<span class ='no'>2</span>
				<span class ='mid'>Lee</span>
				<span class ='mname'>이씨</span>
				<span class ='phone'>010-2222-2222</span>
				<span class ='email'>kimgildong@naver.com</span>
			</div>
			
			<div class = 'item'>
				<span class ='no'>3</span>
				<span class ='mid'>Park</span>
				<span class ='mname'>박씨</span>
				<span class ='phone'>010-3333-3333</span>
				<span class ='email'>park@naver.com</span>
			</div>
		</div>
		
		<div id = 'btn_zone'>
			<input type='button' value = '맨첨'/>
			<input type='button' value = '이전'/>
			<input type='button' value = '1'/>
			<input type='button' value = '2'/>
			<input type='button' value = '3'/>
			<input type='button' value = '다음'/>
			<input type='button' value = '맨끝'/>			
		</div>

	</div>
</body>
</html>