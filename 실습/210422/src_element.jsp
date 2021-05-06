<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>src_element</title>
<style>
	#src_element{
		border:1px solid #aaa;
		width: 500px;
		height: 400px;
		margin: 30px auto;
	}

</style>
</head>
<body>
	<div id = 'src_element'>
		<div id = 'result'></div>
	</div>
	
	<script>
		var ele = document.getElementById('src_element');
		ele.onclick = myFunc;
		
		function myFunc(ev){
			var x = ev.x;
			var y = ev.y;
			var id = ev.srcElement.id;
			var result = document.getElementById('result');
			result.innerHTML = 'x=' + x + ', y=' + y + ', id=' + id;
		}
	</script>
</body>
</html>