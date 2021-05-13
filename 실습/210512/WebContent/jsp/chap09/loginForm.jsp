<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
	<div id = 'loginForm'>
		<form name = 'frm' method = 'post' action = 'login.jsp'>
			<label>아이디</label>
			<input type = 'text' name ='id' size = '10'>
			<label>암호</label>
			<input type = 'password' name ='password' size = '10'>
			<input type ='submit' value ='로그인'/>
		</form>
	</div>
</body>
</html>