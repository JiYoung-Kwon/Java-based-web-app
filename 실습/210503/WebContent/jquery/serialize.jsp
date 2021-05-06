<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<title>serialize</title>
<script src = '../lib/jquery-3.6.0.min.js'></script>
</head>
<body>
	<div id = 'serialize'>
		<h2>serialize example</h2>
		<form name = 'frm' id = 'frm' method='post' action =''>
			<input type ='text' name = 'mid' value = 'hong'/><br/>
			<input type ='color' name = 'fcolor'/><br/>
			<input type ='date' name = 'nal'/><br/>			
			<input type ='checkbox' name = 'chk' value = '백두산'/>백두산
			<input type ='checkbox' name = 'chk' value = '한라산'/>한라산
			<input type ='checkbox' name = 'chk' value = '지리산'/>지리산
			<br/>
			<input type ='radio' name = 'rad' value = '남자'/>남자
			<input type ='radio' name = 'rad' value = '여자'/>여자
			<br/>
			<input type = 'button' value = 'button' id = 'btn'/>
		</form>
		
		<div id = 'result'></div>
	</div>
	
	<script>
		$('#btn').on('click', function(){
			var param = $('#frm').serialize();
			$('#result').text(param);
		})
	</script>
</body>
</html>