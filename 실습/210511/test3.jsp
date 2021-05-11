<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test3</title>
</head>
<body>
<%!
	int a; //서블릿 클래스의 필드 a가 선언된 것임.
	public void output(HttpServletResponse rep, String s) throws Exception{
		PrintWriter out = rep.getWriter();
		out.print(s);
	}
%>

<%
	a=100;
	output(response, "권지영");
%>
</body>
</html>