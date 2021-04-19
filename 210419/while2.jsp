<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ='ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content='width=device-width, initial-scale=1.0'>
<title>while2</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing : border-box;
	}
	#while2{
		width:850px;
		border : 2px solid #aaFF00;
		padding : 25px 120px 30px 120px;
		border-radius:10px;
		box-shadow: 0px 0px 15px 10px #ccFF00;
		margin:50px auto;
	}
	
	#while2 fieldset{
		padding : 10px;
		margin-bottom:10px;
	}
	
	#while2 #result{
		border : 2px solid #ccc;
		width:605px;
		min-height:100px;
		margin-top:10px;
		padding : 10px 20px 10px 20px;
		border-radius : 15px;
	}
	
	#while2 label{
		display:inline-block;
		margin-bottom : 5px;
		width: 15px;
	}
	
	#while2 input[type=button]{
		background-color:#AAFF00;
		width: 50px;
		height:30px;
		border:2px solid #00ff00;
		outline:0;
	}
</style>
</head>
<body>
	<div id = 'while2'>
		<h2>WHILE2</h2>
		<fieldset>
			<legend>while example</legend>
			<div>
				두 수 x,y를 입력받아 두 수 사이의 수 중 4 또는 7의 배수의 개수를 출력하시오.
			</div>
		</fieldset>
		<div class ='body'>
		<label>X</label>
		<input type='text' id='x' value='1'/>
		<br/>
		<label>Y</label>
		<input type='text' id='y' value='100'/>
		<br/>
		<input type='button' id ='btn' value='실행'/>
		<div id='result'></div>
		</div>
	</div>
	
	<script>
		var btn=document.getElementById('btn');
		var result=document.getElementById('result');
		btn.onclick=function(){
			var x = Number(document.getElementById('x').value);
			var y = Number(document.getElementById('y').value);
			var sum = 0;
			
			while(x <= y){
				if((x%4)==0 || (x%7)==0)
					sum = sum + 1;
				x=x+1;
			}
			
			result.innerHTML = sum;
		}
	
	</script>
</body>
</html>