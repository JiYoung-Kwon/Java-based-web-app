<%@page import="chap10.StudentVo"%>
<%@page import="chap10.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<div id = 'login'>
		<%
			String id = request.getParameter("id");
			String pwd = request.getParameter("password");
			StudentDao dao = new StudentDao();
			
			StudentVo vo = dao.login(id,pwd);
			
			if(vo == null){
		%>
				<script>
					alert('아이디나 암호가 잘못되었습니다.');
					location.href = 'loginForm.jsp';
				</script>
		<%
			}else{
				
		%>
				<ul>
					<li>mid 	: <%=vo.getMid() %></li>
					<li>irum	: <%=vo.getIrum() %></li>
					<li>phone 	: <%=vo.getPhone() %></li>
					<li>address : <%=vo.getAddress() %></li>
					<li>email 	: <%=vo.getEmail() %></li>
					<li>pwd 	: <%=vo.getPwd() %></li>
					<li>grade 	: <%=vo.getGrade()%></li>
				</ul>
		<% 
			session.setAttribute("id",vo.getMid());
			response.sendRedirect("loginForm.jsp");
			}
		%>
			
	</div>
</body>
</html>