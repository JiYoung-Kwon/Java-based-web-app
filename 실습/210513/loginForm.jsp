<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
	<div id = 'loginForm'>
		
		<%if(session.getAttribute("id") == null){%>
			<!-- 로그인 이전 -->
			<form name = 'frm' method = 'post' action = 'login.jsp'>
				<label>아이디</label>
				<input type = 'text' name ='id' size = '10'>
				<label>암호</label>
				<input type = 'password' name ='password' size = '10'>
				<input type ='submit' value ='로그인'/>
			</form>
		<%}else{ %>
			<!-- 로그인 이후 -->
			<label>[ <%=session.getAttribute("id") %>]</label>
			<input type = 'button' value ='로그아웃' onclick = "location.href='logout.jsp'"/>
		<%} %>
		
	</div>
</body>
</html>