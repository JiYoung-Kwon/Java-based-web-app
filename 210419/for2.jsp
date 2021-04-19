<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ='ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content='width=device-width, initial-scale=1.0'>
<title>for2</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing : border-box;
	}
	#for2{
		width:650px;
		border : 2px solid #aaFF00;
		padding : 25px 120px 30px 120px;
		border-radius:10px;
		box-shadow: 0px 0px 15px 10px #ccFF00;
		margin:30px auto;
		position:relative;
	}
	
	
	#for2 #result{
		border : 2px solid #ccc;
		width:405px;
		min-height:100px;
		margin-top:10px;
		padding : 10px 20px 10px 20px;
		border-radius : 15px;
	}
	
	#for2 fieldset{
		padding : 10px;
		margin-bottom:10px;
	}

</style>
</head>
<body>
	<div id ='for2'>
		<h2>FOR2</h2>
		<fieldset>
			<legend>미션</legend>
			<div>정수 n을 입력받아 n단의 구구단을 출력하시오.</div>
		</fieldset>
		<label>구구단</label>
		<input type='text' value ='2' id ='gugu'>
		<input type='button' value='실행' id ='btn'>
		<div id ='result'></div>
 		
	</div>
	
	<script>		
		var btn = document.getElementById('btn')
		var result = document.getElementById('result');
		
		btn.onclick= function(){
			var gugu = Number(document.getElementById('gugu').value);
			
			var r='';
			for(var i=1; i<=9; i++){
				r += gugu+' * '+ i +' = '+gugu * i + '<br/>';
			}
			result.innerHTML=r;
		}
		
	
	
	</script>
</body>
</html>