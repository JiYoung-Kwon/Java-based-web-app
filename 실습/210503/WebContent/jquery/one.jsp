<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<title>one</title>
<script src = '../lib/jquery-3.6.0.min.js'></script>
</head>
<body>
	<div id = 'one'>
		<label>아이디</label>
		<input type = 'text' name = 'mid' id = 'mid'/>
		<input type = 'button' value = 'ONE' id = 'one'/>
		<div id = 'result'></div>
	</div>
	
	<script>
		$('#mid').bind('keyup click',func);
		function func(ev){
			if(ev.type == 'keyup')
				$('#result').html('keyup event가 발생함.')
			else if(ev.type == 'click')
				$('#result').html('click event가 발생함.')
		}
		
		$('#one').one('keyup click',one);
		function one(ev){
			if(ev.type == 'keyup')
				$('#result').html('keyup event가 한 번 발생함.')
			else if(ev.type == 'click')
				$('#result').html('click event가 한 번 발생함.')
		}
	</script>
</body>
</html>