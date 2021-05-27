<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale=1.0'>
<title>수정</title>
<link rel ='stylesheet' type='text/css' href ='/WebStudy/css/board.css'>
</head>
<body>
	<div id = 'board'>
		<h1>VIEW</h1>
		
		<form name='frm_board' id = 'frm_board' method='post' action=''>
			<label>작성자</label>
			<input type='text' name='mid' value = 'hong'/>
			<br/>
			
			<label>제목</label>
			<input type='text' name='subject' value = '길동이'/>
			<br/>
			
			<textarea name = 'doc'></textarea>
			<br/>
			
			<label>암호</label>
			<input type='password' name='pwd'/>
			<br/>
			
			<label>첨부파일</label>
			<input type='file' name='attfile' multiple/>
			
			<div id = 'btn_zone'>
				<input type='button' value='수정' id ='btnModify'/>
				<input type='button' value='삭제' id ='btnDelete'/>
				<input type='reset'  value='취소' id ='btnSelect'/>
			</div>
			
			<input type = 'text' name = 'nowPage' value = '${param.nowPage }'/>
			<input type = 'text' name = 'serial' value = '${param.serial }'/>
			<input type = 'text' name = 'findStr' value = '${param.findStr }'/>
		</form>
	
	</div>
	
	<script>brd.init();</script>
</body>
</html>