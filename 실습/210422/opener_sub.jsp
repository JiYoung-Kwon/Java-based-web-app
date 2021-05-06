<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>opener_sub</title>
</head>
<body>
	<div id ='opener_sub'>
		<input type ='text' id ='here'/>
		<input type ='button' value ='변경' id = 'btnModify'/>
	</div>
	
	<script>
		window.onload = function(){
			var txt = window.opener.document.getElementById('send').value;
			var here = document.getElementById('here');
			here.value = txt;
		}
	</script>
</body>
</html>