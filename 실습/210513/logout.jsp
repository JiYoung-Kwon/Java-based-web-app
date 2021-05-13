<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<div id = 'logout'>
		<%
			//session에 등록된 id값 제거
			session.removeAttribute("id");
			response.sendRedirect("loginForm.jsp");
			
			//session 전체 삭제
			//session.invalidate();
		%>
	</div>
</body>
</html>