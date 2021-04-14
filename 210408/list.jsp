<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content ='width=device-width, initial-scale=1.0'>
<title>방명록</title>
<link rel ='stylesheet' type='text/css' href ='/WebStudy/css/guestbook.css'>
</head>
<body>
	<div id = 'guestbook'>
		<h2>방명록</h2>
		
		<form name = 'frm_guestbook' method='post' action=''>
			<label>작성일</label>
			<input type='date' name ='nal'/>
			<label>작성자</label>
			<input type='text' name = 'mid'/>
			<br/>
			<textarea name = 'doc'></textarea>
			<br/>
			<label>바탕색</label>
			<input type = 'color' name = 'bcolor'/>
			<input type = 'button' value='저장'/>
		</form>
		
		<div class = 'items'>
			<div class = 'item'>
				<label>작성자</label>
				<span>작성일</span>
				<br/>
				<div class ='repl'>댓글</div>
				<input type = 'button' value = '수정'/>
				<input type = 'button' value = '삭제'/>
			</div>
			
			<div class = 'item'>
				<label>작성자</label>
				<span>작성일</span>
				<br/>
				<div class ='repl'>댓글</div>
				<input type = 'button' value = '수정'/>
				<input type = 'button' value = '삭제'/>
			</div>
			
			<div class = 'item'>
				<label>작성자</label>
				<span>작성일</span>
				<br/>
				<div class ='repl'>댓글</div>
				<input type = 'button' value = '수정'/>
				<input type = 'button' value = '삭제'/>
			</div>
		</div>
	</div>


</body>
</html>