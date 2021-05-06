<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>switch</title>
<style>
	#switch{
		box-sizing : border-box;
		width : 500px;
		border : 2px solid #F5A9F2;
		padding : 0px 30px 30px 30px;
		border-radius:10px;
		box-shadow: 0px 0px 15px 10px #F8E0F7;
		margin:30px auto;
	}
	
	#switch h2{
		padding-top:0;
		text-align:center;
	}
	#switch label{
		display:inline-block;
		width: 50px;
	}
	
	#switch input[type=button]{
		background-color:#F8E0F7;
		border:0;
		outline:0;
		width: 50px;
		height:25px;
	}
	
	#switch .input{
		padding-bottom:10px;
		margin-bottom:10px;
		border-bottom:2px solid #ccc;
	}
</style>
</head>
<body>
	<div id = 'switch'>
		<h2>고객 분류</h2>
		<div class = 'input'>
			<label>입력</label>
			<input type='text' id ='custom'>
			<input type='button' value='확인' id='btn'>
		</div>
		<label>결과</label>
		<input type ='text' id ='result'>
		
	</div>
	
	<script>
		var custom = document.getElementById('custom');
		var btn = document.getElementById('btn');
		var result = document.getElementById('result');
		
		btn.onclick= function(){
			switch(custom.value){
				case 'A' :
					result.value='vip 고객';
					break;
				case 'B' :
					result.value='우수고객';
					break;
				case 'C' :
					result.value='고객';
					break;
				case 'D' :
					result.value='진상고객';
					break;
				case 'E' :
				case 'F' :
					result.value='입장금지 고객';
					break;
				default :
					result.value='고객 정보 없음'
					break;
			}
		}
	</script>
	
</body>
</html>