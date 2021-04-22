<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>hap_result</title>
</head>
<body>
	<div id = 'hap_result'>
		<h2>합계 출력</h2>
		<%
			request.setCharacterEncoding("utf-8");
		
			String su1 = request.getParameter("su1");
			String su2 = request.getParameter("su2");
			int hap = Integer.parseInt(su1)+Integer.parseInt(su2);
		%>
		
		<ul>
			<li>수 1 : <%=su1 %> </li>
			<li>수 2 : <%=su2 %> </li>
			<li>합 계 : <%=hap %> </li>
		</ul>
	
	</div>
</body>
</html>