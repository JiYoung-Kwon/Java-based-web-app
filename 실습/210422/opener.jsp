<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>opener</title>
</head>
<body>
	<div id ='opener'>
		<input type ='text' id ='send'/>
		<input type ='button' value ='전송' id = 'btnSend'/>
		<br/>
		<input type ='text' id = 'receive'/>
	</div>
	
	<script>
		var btnSend = document.getElementById('btnSend');
		btnSend.onclick=function(){
			var win = window.open('opener_sub.jsp', 'win','');
		}
	</script>
</body>
</html>