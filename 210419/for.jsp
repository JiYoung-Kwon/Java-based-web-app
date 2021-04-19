<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ='ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content='width=device-width, initial-scale=1.0'>
<title>for</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing : border-box;
	}
	#for{
		width : 500px;
		border : 2px solid #F5A9F2;
		padding : 25px 30px 30px 120px;
		border-radius:10px;
		box-shadow: 0px 0px 15px 10px #F8E0F7;
		margin:30px auto;
		position:relative;
	}
	
	#for label{
		display:inline-block;
		width:20px;
	}
	#for input[type=button]{
		width:80px;
		height:46px;
		position:absolute;
		margin-left:10px;
	}
	
	#for #result{
		border : 2px solid #ccc;
		width:258px;
		height:100px;
		margin-top:10px;
	}
</style>
</head>
<body>
	<div id ='for'>
		<h2>for</h2>
		<label>X</label>
		<input type = 'text' id = 'x' value ='1'/>
		<input type='button' id ='btn' value ='계산'>
		<br/>
	
		<label>Y</label>
		<input type = 'text' id = 'y' value ='10'/>
				
		<div id ='result'>
			
		</div>
	</div>
	
	
	<script>
		var btn = document.getElementById('btn');
		var result = document.getElementById('result');
		
		btn.onclick = function(){
			var x = Number(document.getElementById('x').value);
			var y = Number(document.getElementById('y').value);
			
			var sum=0;
			for(var i=x; i<=y; i++){
				sum=sum +i;
			}
			
			result.innerHTML = sum;
		}
		
	</script>
</body>
</html>