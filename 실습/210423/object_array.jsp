<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>object_array</title>
<link rel='stylesheet' type='text/css' href='object_array.css'>
</head>
<body>
	<div id = 'object_array'>
		<h2>Object와 배열을 사용한 응용 예</h2>
		<div class ='left'>
			<form name = 'frm' method = 'post' action = ''>
				<label>아이디</label>
				<input type='text' name = 'mid'/>
				<input type='button' value = '검색' id = 'btnFind'/>
				<br/>
				<label>성명</label>
				<input type='text' name = 'mname'/>
				<br/>
				<div class ='btn_zone'>
					<input type='button' value = '저장' id = 'btnSave'/>
					<input type='button' value = '삭제' id = 'btnDelete'/>
					<input type='button' value = '수정' id = 'btnModify'/>
				</div>
			</form>
		</div>
		<div class = 'right'>
			<div class = 'title'>
				<span class = 'mid'>아이디</span>
				<span class = 'mname'>성명</span>
			</div>
			<div class = 'items'>
				<div class = 'item'>
					<span class = 'mid'>hong</span>
					<span class = 'mname'>홍길동</span>			
				</div>
				<div class = 'item'>
					<span class = 'mid'>kim</span>
					<span class = 'mname'>김길동</span>			
				</div>
				<div class = 'item'>
					<span class = 'mid'>park</span>
					<span class = 'mname'>박길동</span>			
				</div>
			</div>
		</div>
		<input type ='button' value = '출력' id = 'btnList'/>
	</div>
	
	<script src='object_array.js'></script>	
</body>
</html>