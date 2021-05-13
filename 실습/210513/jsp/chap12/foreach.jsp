<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>c:foreach</title>
</head>
<body>
	<div id = 'foreach'>
		<h3>1~100 출력</h3>
		<c:forEach var = "i" begin="1" end = "100">
			${i }
		</c:forEach>
		
		<h3>1~100 홀수</h3>
		<c:forEach var = "i" begin="1" end = "100" step = "2">
			${i }
		</c:forEach>
		
		<h3>1~100 합계</h3>
		<c:set var = 'hap' value = '0'/>
		<c:forEach var = "i" begin="1" end = "100">
			<c:set var = 'hap' value = '${hap+i }'/>
		</c:forEach>
		hap : ${hap }
		
		<h3>Array 출력</h3>
		<%
			int[] score = {3,4,36,3,64,7,245,37,3,2,5,2,4575,23,45,6};
		%>
		
		<h3>List 출력</h3>
		
		<h3>Map 출력</h3>
	</div>
</body>
</html>