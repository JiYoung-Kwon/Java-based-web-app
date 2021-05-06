<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>onfocus | onblur</title>
</head>
<body>
	<div id = 'focus'>
		<textarea rows='10' cols='60' id ='tt'></textarea>
	</div>
	<script>
		var tt = document.getElementById('tt');
		tt.onfocus = function(){
			tt.style.backgroundColor = '#99f';
		}
		
		tt.onblur = function(){
			tt.style.backgroundColor = '';
		}
	</script>
</body>
</html>