<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>input</title>
</head>
<body>
<form name='frm_board' method='post' action='input.board'>
	<label>ID</label>
	<input type='text' name='mid' value='hong' /><br/>
	
	<label>Phone</label>
	<input type='text' name='phone' value='010-1111-1111'><br/>
	
	<input type='submit' value='전송'/>

</form>
</body>
</html>