<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>if1</title>
</head>
<body>
	<div id='if1'>
		<input type='text' id='score' /> 
		<input type='button' value='확인' id='btn' /> 
		<br /> 
		<input type='text' id='result' />
	</div>
	<script>
		var score = document.getElementById('score');
		var btn = document.getElementById('btn');
		var result = document.getElementById('result');
	
		btn.onclick = function(){
			var v = Number(score.value);
			if(v>=60){
				result.value='합격';
			}else{
				result.value='불합격';
			}
			
		}
	
	</script>
</body>
</html>