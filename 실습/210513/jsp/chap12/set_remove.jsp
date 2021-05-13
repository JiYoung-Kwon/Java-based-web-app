<%@page import="chap10.StudentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set_remove</title>
</head>
<body>
	<div id = 'set_remove'>
		<h2>c:set</h2>
		<c:set var ="irum" value = "hong"/>
		<c:set var ="address" value = "서울 종로구"/>
		<c:set var ="phone" value = "010-1234-1234"/>
		
		<b>IRUM : </b> ${irum } <br/>
		<b>ADDRESS : </b> ${address } <br/>
		<b>PHONE : </b> ${phone } <br/>
				
		<!-- 두 점수를 a, b에 대입한 후 두 수의 합을 출력 -->
		<c:set var = "a" value = "1"/>
		<c:set var = "b" value = "2"/>
		
		<b>점수 : </b> ${a+b } <br/>
		
		<%
			StudentVo vo = new StudentVo();
			vo.setMid("kim");
			vo.setPhone("010-1111-2222");
			vo.setAddress("부산");
		%>
		<hr/>
		<c:set var = "vo" value = "<%=vo %>"/>
		<ul>
			<li>MID : ${vo.mid }</li>
			<li>ADDRESS : ${vo.address }</li>
			<li>PHONE :  ${vo.phone } </li>
		</ul>
		
		<h2>c:remove</h2>
		<c:remove var = "vo"/>
		<ul>
			<li>MID : ${vo.mid }</li>
			<li>ADDRESS : ${vo.address }</li>
			<li>PHONE :  ${vo.phone } </li>
		</ul>
	</div>
</body>
</html>