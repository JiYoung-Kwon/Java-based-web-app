<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_param</title>
<%request.setCharacterEncoding("utf-8"); %>
</head>
<body>
	<div id = 'el_param'>
		<h2>el param</h2>
		<form name ='frm' method = 'post'>
			<label>성명</label>
			<input type = 'text' name = 'irum' value = '${param.irum }'/><br/>
			<label>스포츠</label>
			<label><input type = 'checkbox' name = 'hobby' value = '축구'/>축구</label>
			<label><input type = 'checkbox' name = 'hobby' value = '야구'/>야구</label>
			<label><input type = 'checkbox' name = 'hobby' value = '농구'/>농구</label>
			<label><input type = 'checkbox' name = 'hobby' value = '배구'/>배구</label>
			<label><input type = 'checkbox' name = 'hobby' value = '족구'/>족구</label>
			<p/>
			<input type ='submit' value = '전송'/>
		</form>
		
		<%	if(request.getMethod().equals("GET")) return;	%>
	
		<h3>request.getParameter</h3>
		<ul>
			<li><%=request.getParameter("irum") %></li>
			<% 
				String[] hobby = request.getParameterValues("hobby");
				for(String s : hobby){
					out.print("<li>"  + s + "</li>");
				}
			%>
		</ul>
		
		<h3>el param</h3>
		<ul>
			<li>${param.irum }</li>
			<li>${paramValues.hobby[0] }</li>
			<li>${paramValues.hobby[1] }</li>
			<li>${paramValues.hobby[2] }</li>
			<li>${paramValues.hobby[3] }</li>
			<li>${paramValues.hobby[4] }</li>
			<li>${paramValues.hobby[5] }</li>
		</ul>
	</div>
</body>
</html>