<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name ='viewport' content ='width=device-width, initial-scale=1.0'>
<title>index</title>
<link rel ='stylesheet' type='text/css' href ='./css/index.css'>
<script src = './js/main.js'></script>
</head>
<body>
	<%
		// 기본 include page들
		//String border = "./member/search.jsp";
		String border = "./member/member.do";
		String stock = "./product/search.jsp";
		String gb = "./guestbook/list.jsp";
		
		request.setAttribute("border", border);
	%>

	<div id='index'>
		<div id = 'login'>
			<jsp:include page = 'loginForm.jsp'/>
		</div>
		
		<%@include file = "header.jsp" %>
		
		<div id = 'center'>
			<div id = 'sub_menu'>
				서브메뉴
			</div>
			<div id = 'middle'>
				<div id = 'border'>
					
				</div>
				
				<div id = 'stock'>
					<jsp:include page="<%=stock %>"/>
				</div>
			</div>
			
			<div id = 'guestbook'>
				<jsp:include page="<%=gb %>"/>
			</div>
		
		</div>
		
		<%@include file = "footer.jsp" %>
		
		<!-- 대소문자 구분 X, 두 칸 이상 띄어쓰기 X, 엔터 인식 X -->
		<!-- <h1 style='color:#ff0088'> INDEX</h1>
		<h1> INDEX</h1>
		<h1 class='cls'> INDEX</h1>
		<input type='button' value='button'/>
		<input type="text" value='text'/>
		-->
	</div>
	
	<script>
		$('#border').load('${border}', 'job=search');
	</script>
</body>
</html>