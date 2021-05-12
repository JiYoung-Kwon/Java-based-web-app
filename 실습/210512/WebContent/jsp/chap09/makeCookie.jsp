<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makeCookie</title>
</head>
<body>
	<%
		String pName = "냉장고";
		String pModel = "500L 양문형";
		
		Cookie pnCookie = new Cookie("pName", URLEncoder.encode(pName,"utf-8"));
		pnCookie.setMaxAge(5);
		Cookie pmCookie = new Cookie("pModel", URLEncoder.encode(pModel,"utf-8"));
		
		response.addCookie(pnCookie);
		response.addCookie(pmCookie);
	%>
	
	<label>Cookie 값이 저장되었습니다.</label>
	<a href = 'viewCookie.jsp'>쿠키확인</a>
</body>
</html>