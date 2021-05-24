<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id = 'member'>
	<h1>REGISTER RESULT</h1>
	<form name = 'frm_register' method = 'post' action = ''>
		<input type ='hidden' name = 'nowPage' value = '${param.nowPage }'/>
		<input type ='hidden' name = 'findStr' value = '${param.findStr }'/>
		<input type ='hidden' name = 'mid' value = '${param.mid }'/>
	</form>
</div>
</body>
</html>