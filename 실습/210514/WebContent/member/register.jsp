<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale=1.0'>
<title>회원 가입</title>
<link rel = 'stylesheet' type='text/css' href ='./css/member.css'>
</head>
<body>
	<div id='member'>
		<h1>REGISTER</h1>
		
		<form name='frm_register' method='post' action=''>
			<label>아이디</label>
			<input type='text' name='mid' value = 'hong'/>
			<br/>
			
			<label>성명</label>
			<input type='text' name='irum' value = '길동이'/>
			<br/>
			
			<label>암호</label>
			<input type='password' name='pwd'/>
			<output>확인</output>
			<input type='password' name='pwd'/>
			<br/>
			
			<label>연락처</label>
			<input type='text' name='phone' value = '010-1111-1111'/>
			<br/>
			
			<label>주소</label>
			<input type='text' name='post'/>
			<input type='button' value = '우편번호'/>
			<br/>
			<input type='text' name = 'address' size='50'/>
			<br/>
			<label>상세주소</label>
			<input type='text' name='address2' size='50'/>
			<br/>
			<label>이메일</label>
			<input type='text' name='account'/>
			<output>@</output>
			<select name = 'host'>
				<option value = '네이버'>네이버</option>
				<option value = '네이트'>네이트</option>
				<option value = '다음'>다음</option>
				<option value = 'IT여행자'>IT여행자</option>
				<option value = 'acorn'>ACORN</option>
			</select>
			<div id = 'btn_zone'>
				<input type ='button' value= '가입'>
				<input type= 'reset' value='취소'>
			</div>
			<img src = 'http://placehold.it/150x180' class = 'photo'/>
		</form>
	
	 
	
	</div>	
</body>
</html>