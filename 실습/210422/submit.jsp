<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>submit</title>
</head>
<body>
	<div id = 'submit'>
		<h2>submit sample</h2>
		<form name = 'frm' method ='get' action='submit_result.jsp'>
			<label>아이디</label>
			<input type='text' name = 'mid'/>
			<br/>
			<label>암호</label>
			<input type='password' name = 'pwd'/>
			<br/>
			<label><input type='radio' name = 'register' value ='회원' checked/>회원</label>
			<label><input type='radio' name = 'register' value ='비회원'/>비회원</label>
			<br/>
			<input type='submit' value='전송'/>
		</form>
	
	</div>
</body>
</html>