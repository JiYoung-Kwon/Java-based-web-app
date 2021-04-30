<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content='width=device-width, initial-scale = 1.0'>
<title>var_html_text</title>
<script src="../lib/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id = 'var_html_text'>
		<input type = 'button' value = '버튼' id = 'af_btn'/>
		<input type = 'button' value = 'html버튼' id = 'af_html_btn'/>
		<input type = 'button' value = 'text버튼' id = 'af_text_btn'/>
		
		<div id = 'af_div'></div>
	</div>
	
	<script>
		$(document).ready(function(){
			$btn = $('#af_btn');
			var v = $btn.attr('value') + ',' + $btn.attr('type');
			$btn.click(function(){
				$btn.attr('value','after button');
			})
			
			$('#af_html_btn').click(function(){
				var str = '<font color=red>love</font>';
				$('#af_div').html(str);
			})
			
			$('#af_text_btn').click(function(){
				var str = '<font color=red>love</font>';
				$('#af_div').text(str);
			})
			
		});
	
	</script>
</body>
</html>