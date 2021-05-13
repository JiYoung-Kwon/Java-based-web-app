<%@page import="chap10.StudentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el</title>
</head>
<body>
<%
String name = "hong";
request.setAttribute("name", name);
StudentVo std = new StudentVo();
std.setAddress("종로구");
std.setPhone("010-6351-3491");

request.setAttribute("vo",std);
%>

<ul>
	<li>Name : <%=name %></li>
	<li>Name : <% out.print(name); %></li>
	<li>Name : ${requestScope.name}</li>	
	<li>Name : ${name}</li>
</ul>

<ul>
	<li>Address : <%=std.getAddress() %></li>
	<li>Address : <% out.print(std.getAddress()); %></li>
	<li>Address : ${requestScope.vo.address}</li>
	<li>Address : ${vo.address}</li>
	
	<li>Phone : ${vo.phone}</li>
</ul>
</body>
</html>