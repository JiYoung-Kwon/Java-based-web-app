<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>hap</title>
</head>
<body>
	<div id = 'hap'>
		<h2>두 수 입력</h2>
		<form name ='frm' method='get' action='hap_result.jsp'>
			<label>수 1</label>
			<input type ='text' name = 'su1'/>
			<br/>
			<label>수 2</label>
			<input type ='text' name = 'su2'/>
			<br/>
			<input type ='submit' value = '전송'/>
		</form>
	</div>
</body>
</html>