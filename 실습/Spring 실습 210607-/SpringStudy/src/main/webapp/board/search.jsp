<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name ='viewport' content ='width=device-width, initial-scale=1.0'>
<title>search</title>
</head>
<body>
	<form name = 'frm_board' method = 'post' action ='search.board'>
		<label>검색어 입력</label>
		<input type = 'text' name = 'findStr'/>
		
		<input type = 'submit' value = '전송'/>
	</form>
</body>
</html>