<%@page import="chap10.StudentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id = 'choose'>
	<%
		StudentVo vo = new StudentVo();
		vo.setIrum("홍길동");
		vo.setGrade(3);
	%>
	
	<c:set var = "vo" value = "<%=vo %>"/>
	
	학생의 이름은 <b>${vo.irum}</b>입니다.<br/>
	${vo.grade} 학년의 출석 요일은 <font color = 'red'>
		<c:choose>
			<c:when test="${vo.grade eq 1}">
				월, 화, 수 입니다.
			</c:when>
			
			<c:when test="${vo.grade eq 2}">
				목, 금, 토 입니다.
			</c:when>
			
			<c:otherwise>
				출석 요일이 없습니다. 집에서 폭 쉬세요~
			</c:otherwise>
		</c:choose>
	</font>
	</div>
</body>
</html>