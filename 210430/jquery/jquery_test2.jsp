<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content='width=device-width, initial-scale = 1.0'>
<title>jquery_test</title>
<script src="../lib/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id = 'jquery_test'>
	<h2>jquery test</h2>
</div>
<script>
	//$('#jquery_test>h2').css('color','#0000ff');
	$('#jquery_test>h2').css({'color':'#00ff00', 'font-size':'40pt'})
</script>

</body>
</html>