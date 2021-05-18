<%@page import="product.ProductVo"%>
<%@page import="product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale=1.0'>
<title>제품 입출고 수정</title>
<link rel='stylesheet' type='text/css' href='./css/product.css'>
</head>
<body>
<%
	String serial = request.getParameter("serial");
	ProductDao dao = new ProductDao();
	ProductVo vo = dao.selectOne(serial);
	
	request.setAttribute("vo", vo);
%>

	<div id = 'product'>
		<h1>제품 입출고 정보 수정</h1>
		
		<form name = 'frm_product' id='frm_product' method = 'post' action=''>
			<label>구분</label>
			<label> <input type='radio' name='gubun' value='입고' ${(vo.gubun=='입고')? 'checked' : '' }>입고</label>
			<label> <input type='radio' name='gubun' value='출고' ${(vo.gubun =='출고')? 'checked' : ''}>출고</label>		
			<br/>
			
			<label>입출고일</label>
			<input type = 'date' name = 'nal' value='${vo.nal }'/>
			<br/>
		
			<label>제품코드</label>
			<input type = 'text' name = 'pCode' value = '<%=vo.getpCode()%>'/>
			<br/>
			
			<label>제품명</label>
			<input type = 'text' name = 'pName' value = '${vo.pName }'/>
			<br/>
			
			<label>수량</label>
			<input type = 'number' name = 'ea' value = '${vo.ea }' />
			<br/>
			
			<label>단가</label>
			<input type = 'number' name = 'price' value = '${vo.price }'/>
			<br/>
			
			<label>금액</label>
			<input type = 'number' name = 'amt' readonly value = '${vo.amt }'/>
			<br/>
			
			<label>작성자</label>
			<input type = 'text' name = 'mid' value = '${vo.mid }'/>
			<hr/>
			<div id = 'btn_zone'>
				<input type = 'button' value = '수정' onclick = 'product.modifyR()'/>
				<input type = 'button' value = '삭제' onclick = 'product.deleteR()'/>
				<input type = 'reset' value= '취소' onclick = 'product.select()'/>
			</div>
			
			<input type = 'text' name = 'nowPage' value ='${param.nowPage }'/>			
			<input type = 'text' name = 'findStr' value ='${param.findStr }'/>			
			<input type = 'text' name = 'serial' value ='${param.serial }'/>
		</form>
	</div>
</body>
</html>