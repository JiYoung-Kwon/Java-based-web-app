<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale=1.0'>
<title>답글</title>
</head>
<body>
	<div id = 'repl'>
		<h1>REPL</h1>
		
		<form name='frm_repl' method='post' action=''>
			<label>작성자</label>
			<input type='text' name='mid'/>
			<br/>
			
			<label>제목</label>
			<input type='text' name='subject' value = 'hi...'/>
			<br/>
			
			<textarea name = 'doc' rows = '15'>수고하세요~~</textarea>
			<br/>
			
			<label>암호</label>
			<input type='password' name='pwd' value = '1234'/>
			<br/>
			
			<label>첨부파일</label>
			<input type='button' name='file tag' value='파일 선택'/>
			선택된 파일 없음
			<br/>
			<br/>
			<input type='button' value='작성'/>
			<input type='reset' value='취소'/>
		</form>
	
	</div>
</body>
</html>