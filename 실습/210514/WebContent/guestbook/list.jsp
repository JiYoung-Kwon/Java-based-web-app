<%@page import="gb.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@page import="gb.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content ='width=device-width, initial-scale=1.0'>
<title>방명록</title>
<link rel ='stylesheet' type='text/css' href ='/WebStudy/css/guestbook.css'>
<script src = './lib/jquery-3.6.0.min.js'></script>
</head>
<body>
	<%
		GuestBookDao dao = new GuestBookDao();
		List<GuestBookVo> list = dao.select();
		request.setAttribute("list", list);
	%>
	<div id = 'guestbook'>
		<h2>방명록</h2>
		
		<c:if test = '${not empty sessionScope.id }'>
			<form name = 'frm_guestbook' id = 'frm_gb' method='post' action=''>
				<label>작성자</label>
				<input type='text' name = 'mid' size = '9' value = '${sessionScope.id }' readOnly/>
				(<input type='date' name ='nal' id = 'nal'/>)
				<br/>
				<textarea name = 'doc'></textarea>
				<br/>
				<label>바탕색</label>
				<input type = 'color' name = 'bgcolor'/>
				<input type = 'button' value='저장' id = 'btnRegister'/>
			</form>
		</c:if>
		
		<div class = 'items'>
			<c:forEach var = "vo" items="${list }">
				<div class = 'item' >
					<label>${vo.mid }</label>
					<span>${vo.nal }</span>
					<br/>
					<div class ='repl' style = 'background-color:${vo.bgcolor}33;'>
						${vo.doc }
					</div>
					<c:if test = '${vo.mid eq sessionScope.id }'>
					<div class ='btn_zone'>
						<input type = 'button' value = '수정' onclick = "funcUpdate('${vo.serial}', '${vo.doc }')"/>
						<input type = 'button' value = '삭제' onclick = "funcDelete('${vo.serial}')"/>
					</div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>

	<script src = './js/guestbook.js'></script>
</body>
</html>