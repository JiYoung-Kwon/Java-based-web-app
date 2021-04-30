<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content='width=device-width, initial-scale = 1.0'>
<title>each</title>
<script src="../lib/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id = 'each'>
		<div class ='here'>A</div>
		<div class ='here'>B</div>
		<div class ='here'>C</div>
		<div class ='here'>D</div>
		<div class ='here'>E</div>
		<div class ='here'>F</div>
	</div>
	
	<script>
		var bg = ['#ff0000','#00ff00','#0000ff','#ffff00','#ff00ff','#00ffff'];
		$('.here').each(function(index){
			$(this).css('background-color', bg[index])
			$(this).text(bg[index])
		});
		
	</script>
</body>
</html>