<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Upload Test</h3>
	<%
		String mid = request.getParameter("mid");
	%>
	<div>
		enctype = 'multipart/form-data'로 전달된 값은
		일반적인 request.getParameter로 파라미터 데이터를 가져올 수 없음
	</div>
	<ul>
		<li> MID : <%=mid %></li>
	</ul>
</body>
</html>