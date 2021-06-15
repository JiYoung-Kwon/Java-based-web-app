<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Index</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src = './js/board.js'></script>
</head>
<body>
<div id ='index'>
	<h2>Spring MVC</h2>
	<a href = "board/search.board">조회(연습)</a>
	<input type = 'button' value = '게시판' onclick = 'brd.home()'>
	
	<hr/>
	<div id = 'border'></div>
</div>
</body>
</html>