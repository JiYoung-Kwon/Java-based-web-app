<%@page import="java.util.Iterator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
	<%
		//자바 타입의 한줄 주석
		/*자바 타입의 여러줄 주석 */
	%>
	<%-- jsp 타입의 주석 --%>
	<!-- html 타입의 주석. 소스 보기에서 표시됨. 중요한 내용 X  -->

	<% 
		//sendRedirect(url)
		//name값이 null이거나 빈문자라면 페이지를 form.jsp로 이동
		String n = request.getParameter("name");
		if(n == null || n.equals("")){
			response.sendRedirect("form.jsp");
		}
	%>
	
	
	<b>request.getParameter() 메서드 사용</b><br>
	name 파라미터 = <%= request.getParameter("name") %> <br>
	address 파라미터 = <%= request.getParameter("address") %>	
	<p>
	
	<b>request.getParameterValues() 메서드 사용</b><br>
	<%
		String[] values = request.getParameterValues("pet");
		if(values != null){
			for(int i=0; i<values.length; i++){
	%>
				<%= values[i] %>
	<%
			}
		}
	%>
	
	<p>
	<b>request.getParameterNames() 메서드 사용</b><br>
	<%
		Enumeration paramEnum = request.getParameterNames();
		while(paramEnum.hasMoreElements()){
			String name = (String)paramEnum.nextElement();
	%>
			<%=name%>
	<%
			out.print(Arrays.toString(request.getParameterValues(name)));
		}
	%>
	
	<p>
	<b>request.getParameterMap() 메서드 사용</b><br>
	<!-- [미션] 모든 파라미터 값을 출력하도록 코드 수정 -->
	<%
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[])parameterMap.get("name");
		String[] addressParam = (String[])parameterMap.get("address");
		String[] petParam = (String[])parameterMap.get("pet");
		
		if(nameParam != null){
			out.print("name =" + nameParam[0]+"<br>");
		}
		
		if(addressParam != null){
			out.print("address =" + addressParam[0]+"<br>");
		}
		
		if(petParam != null){
			String pet = Arrays.toString(petParam);
			out.print("pet =" + pet+"<br>");
		}
	%>
	
	<p>
	<b>request.getParameterMap() 메서드 사용</b><br>
	<!-- [미션] 모든 파라미터 값을 출력하도록 코드 수정 -->
	<%
		Map pm = request.getParameterMap();

		Iterator<String> iterator = pm.keySet().iterator();
		while(iterator.hasNext()){
			String key = iterator.next();
			String[] value = (String[])pm.get(key);
			out.print( key + " = " + Arrays.toString(value) +"<br>");
		}

	%>
</body>
</html>