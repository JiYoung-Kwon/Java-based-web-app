<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>array3</title>
<link rel='stylesheet' type='text/css' href='array3.css'>
</head>
<body>
	<div id = 'array3'>
		<h2>성적처리</h2>
		<div class = 'left'>
			<form name = 'frm' method='post' action=''>
				<label>아이디</label>
				<input type = 'text' id ='mid'/>
				<br/>
				
				<label>국어</label>
				<input type = 'text' id ='kor'/>
				<br/>
				
				<label>수학</label>
				<input type = 'text' id ='mat'/>
				<input type = 'button' id = 'btnCompute' value='계산'/>
				<hr/>
				
				<label>총점</label>
				<input type = 'text' id ='tot' readonly/>
				<br/>
				
				<label>평균</label>
				<input type = 'text' id ='avg' readonly/>
				<hr/>
				
				<div class='btn_zone'>
					<input type='button' id ='btnSave' value='저장'/>
					<input type='button' id ='btnOutput' value='출력'/>
				</div>
			</form>
		</div>
		
		<div class ='right'>
			<h3>성적 처리 결과</h3>
			<div class='title'>
				<span class='mid'>아이디</span>
				<span class='kor'>국어</span>
				<span class='mat'>수학</span>
				<span class='tot'>총점</span>
				<span class='avg'>평균</span>		
			</div>
			<div id ='items'></div>	
		</div>
		
		<div id ='status'>성적을 입력하세요~</div>
	</div>
	
	<script src='array3.js'></script>	
</body>
</html>
