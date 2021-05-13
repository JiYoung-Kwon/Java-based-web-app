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
		
			out.print(id+"," + pwd);
			
			if(id.equals(pwd)){
				out.print("로그인 성공");
				Cookie cookie = new Cookie("AUTH", id);
				response.addCookie(cookie);
			}
			else{
				out.print("<script>				 ");
				out.print("		alert('로그인 실패');");
				out.print("		history.go(-1)");
				out.print("</script>			 ");
			}
		%>
	
	</div>
</body>
</html>