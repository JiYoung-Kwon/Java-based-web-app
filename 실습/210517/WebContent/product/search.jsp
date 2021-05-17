<%@page import="product.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="product.Page"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<title>제품 입출고 조회</title>
<link rel='stylesheet' type='text/css' href='./css/product.css'>
</head>
<body>
	<%
		String findStr = request.getParameter("findStr");
		String[] gubun = new String[0];
		int nowPage = 1;
		
		if(request.getParameterValues("gubun") != null){
			gubun = request.getParameterValues("gubun");
		}
		
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		ProductDao dao = new ProductDao();
		
		Page p = new Page("all", "", 0, nowPage);
		
		List<ProductVo> list = dao.select(p);
		
		//jstl을 사용하기 위해 request에 저장
		request.setAttribute("p", p);
		request.setAttribute("list", list);
	%>

	<div id = 'product'>
		<h1>입출고 조회</h1>
		
		<form name = 'frm_product' method = 'post' action =''>
			<input type ='button' value = '입력'/>
			<div class ='find_zone'>
				<label>
					<input type ='checkbox' name = 'gubun' value = '입고'>입고
				</label>
				<label>
					<input type ='checkbox' name = 'gubun' value = '출고'>출고
				</label>
				<label>
					<input type ='checkbox' name = 'gubun' value = '재고'>재고
				</label>
				<label>
					<input type ='checkbox' name = 'checkAll' value = '모두'>모두
				</label>
				<input type ='text' name='findStr'/>
				<input type = 'button' value ='검색'/>
			</div>
		</form>
		<hr/>
		<div class = 'title'>
			<span class = 'no'>NO</span>
			<span class = 'gubun'>구분</span>
			<span class = 'nal'>일자</span>
			<span class = 'code'>제품코드</span>
			<span class = 'pname'>제품명</span>
			<span class = 'ea'>수량</span>
			<span class = 'price'>단가</span>
			<span class = 'amt'>금액</span>
		</div>
		<hr/>
		<div class = 'items'>
			<c:forEach var = 'v' items = "${list }">
			<div class ='item'>
				<span class = 'no'>${v.serial }</span>
				<span class = 'gubun'>${v.gubun }</span>
				<span class = 'nal'>${v.nal }</span>
				<span class = 'code'>${v.pCode }</span>
				<span class = 'pname'>${v.pName }</span>
				<span class = 'ea'>${v.ea }</span>
				<span class = 'price'>${v.price }</span>
				<span class = 'amt'>${v.amt }</span>
			</div>
			</c:forEach>
		</div>
		<hr/>
		
		<div id = 'btn_zone'>
			<input type ='button' value ='맨첨'/>
			<input type ='button' value ='이전'/>
			<input type ='button' value ='1'/>
			<input type ='button' value ='2'/>
			<input type ='button' value ='3'/>
			<input type ='button' value ='다음'/>
			<input type ='button' value ='맨끝'/>
		</div>
	
	
	
	</div>
</body>
</html>