<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>if2</title>
<style>
	#if2{
		border : 2px solid #aaa;
		border-radius:10px;
		padding: 0px 30px 30px 30px;
		margin:5px auto;
		margin-top: 50px;
		width: 450px;
		height:150px;
		box-shadow: 0px 0px 15px 5px #F8E0F7;
	}

	#if2 h2{
		padding-top:0;
		text-align:center;
	}
	#if2 label{
		display:inline-block;
		width: 50px;
	}
	
	#if2 input[type=button]{
		background-color:#F8E0F7;
		border:0;
		outline:0;
	}
	
	#if2 .subject{
		padding-bottom:5px;
		margin-bottom:5px;
		border-bottom:2px solid #ddd;
	}
</style>
</head>
<body>
	<!-- 두 개의 성적을 입력받아 합계를 계산하여 평균이 60이상이면 합격, 그렇지 않으면 불합격을 표시하시오. -->
	<div id = 'if2'>
		<h2>성적 처리</h2>
		<div class = 'subject'>
			<label>국어</label>
			<input type = 'text' id='kor'>
			<br/>
			
			<label>수학</label>
			<input type = 'text' id='mat'>
			
			<input type ='button' value='계산' id = 'btn'>
		</div>		
		
		<label>결과</label>
		<input type = 'text' id='result'>
	
	</div>

	<script>
		var kor = document.getElementById('kor');
		var mat = document.getElementById('mat');
		var btn = document.getElementById('btn');
		var result = document.getElementById('result');

		btn.onclick = function() {
			var v = Number(kor.value) + Number(mat.value);
			if (v / 2 >= 60)
				result.value = '합격';
			else
				result.value = '불합격';
		}
	</script>
</body>
</html>