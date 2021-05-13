<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<li><%=application.getAttribute("mid") %></li>
	<li><%=session.getAttribute("mid") %></li>
	<li><%=request.getAttribute("mid") %></li>
</body>
</html>