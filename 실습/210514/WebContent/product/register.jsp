<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale=1.0'>
<title>제품 입출고 입력</title>
<link rel='stylesheet' type='text/css' href='./css/product.css'>
</head>
<body>
	<div id = 'product'>
		<h1>제품 입출고</h1>
		
		<form name = 'frm_product' method = 'post' action=''>
			<label>구분</label>
			<label> <input type='radio' name='gubun' value='입고' checked>입고</label>
			<label> <input type='radio' name='gubun' value='출고'>출고</label>		
			<br/>
			
			<label>입출고일</label>
			<input type = 'date' name = 'nal' />
			<br/>
		
			<label>제품코드</label>
			<input type = 'text' name = 'pCode' size='8'/>
			<br/>
			
			<label>제품명</label>
			<input type = 'text' name = 'pName' readonly size = '35'/>
			<br/>
			
			<label>수량</label>
			<input type = 'number' name = 'ea' />
			<br/>
			
			<label>단가</label>
			<input type = 'number' name = 'price' />
			<br/>
			
			<label>금액</label>
			<input type = 'number' name = 'amt' readonly />
			<br/>
			
			<label>작성자</label>
			<input type = 'text' name = 'mid' />
			<hr/>
			<div id = 'btn_zone'>
				<input type = 'button' value = '작성'/>
				<input type = 'reset' value= '취소'/>
			</div>
		</form>
	</div>
</body>
</html>