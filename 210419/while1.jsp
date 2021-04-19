<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ='ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content='width=device-width, initial-scale=1.0'>
<title>while1</title>
<style>
	#while1 #result{
		border : 2px solid #ccc;
		width:405px;
		min-height:100px;
		margin-top:10px;
		padding : 10px 20px 10px 20px;
		border-radius : 15px;
	}
</style>
</head>
<body>
	<div id ='while1'>
		<fieldset>
			<legend>while example</legend>
			<div>
				두 수 x,y가 1부터 시작하여 x는 2씩 증가하고, y는 3씩 증가되고 있다.<br/>
				두 수 x,y의 합이 1000이상이 되면 해당 합과 두 수 x,y를 출력하시오.
			</div>
		</fieldset>
		<div id='result'></div>
	</div>
	
	<script>
		var x=1, y=1;
		var sum=0; //두 수의 합
		var result = document.getElementById('result');
		
		while(sum<1000){
			sum=x+y;
			x = x + 2;
			y = y + 3;
		}
		
		result.innerHTML = '◇ 해당 합 = '+sum+ '<br/>◇ x = '+x + ', y = '+y;
		
	
	</script>
</body>
</html>