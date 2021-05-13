<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale = 1.0'>
<title>scope</title>
</head>
<body>
	<div id = 'scope'>
		<%
			//application, session, request, pageContext
			application.setAttribute("mid","app hong");
			session.setAttribute("mid","session hong");
			request.setAttribute("mid","req hong");
		%>
		
		<input type = 'button' value = 'GO'
			onclick = "location.href = 'scope_check.jsp'">
	
	</div>
</body>
</html>