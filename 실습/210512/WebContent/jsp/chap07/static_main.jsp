<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale = 1.0'>
<title>static_main</title>
</head>
<body>
	<%
		String irum ="kim";
	%>
	
	<div id = 'static_main'>
		<h2>Header</h2>
		<%@include file="static_sub.jsp" %>
		<h2>Footer</h2>
	</div>
</body>
</html>