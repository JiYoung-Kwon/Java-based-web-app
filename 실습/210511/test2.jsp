<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test2</title>
</head>
<body>
	<!-- 
	9단의 구구단을 out.print(), %lt%= %>, el로 작성하여 출력하시오. 
 	-->

	<%
	StringBuffer sb = new StringBuffer();
	for (int i = 1; i <= 9; i++) {
		String s = "9 * " + i + " = " + 9 * i + "<br>";
		sb.append(s);
	}

	out.print("<b>out.print</b><br/>");
	out.print(sb.toString());

	request.setAttribute("gu", sb.toString());
	%>

	<b>표현식</b>
	<br />
	<%=sb.toString()%>

	<b>el</b>
	<br /> ${gu}
</body>
</html>