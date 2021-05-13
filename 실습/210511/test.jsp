<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
	<%
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd (E)요일 hh:mm:ss");
		String nal = sdf.format(now);
		out.print("오늘 날짜 : "+ nal);
		
		//el을 사용하여 표현하려면, 값을 scope에 저장해야 함(application, session, request, page)
		request.setAttribute("nn", nal);
	%>
	<br/>
	<b>오늘 날짜 :</b> <%= nal %>
	<br/>
	<b>el의 오늘 날짜 :</b> ${nn} <!-- 현장에서 가장 많이 사용 -->
</body> 
</html>