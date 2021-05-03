<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<script src = '../lib/jquery-3.6.0.min.js'></script> 
<title>ajax_load</title>
</head>
<body>
	<div id = 'ajax_load'>
		<input type = 'button' value ='load 1' id = 'btnLoad1'/>
		<input type = 'button' value ='load 2' id = 'btnLoad2'/>
		<br/>
		<div id = 'here'></div>
	</div>
	
	<script>
		$('#btnLoad1').click(function(){
			$('#here').load('../html/list.jsp');
		})
		
		$('#btnLoad2').on('click' , function(){
			$('#here').load('../html/img.jsp');
		})
	</script>
</body>
</html>