<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale = 1.0'>
<title>register</title>
</head>
<body>
	<div id = 'register'>
		<h3>제품 입고</h3>
		<form name ='frm' method = 'post' action = 'register_result.jsp'>
			<label>제품코드</label>
			<input type ='text' name ='pCode' value = 'p001'/><br/>
			
			<label>제품명</label>
			<input type ='text' name ='pName' value = '냉장고'/><br/>
			
			<label>수량</label>
			<input type ='text' name ='ea' value = '5000'/><br/>
			
			<label>거래처</label>
			<input type ='text' name ='custom' value = '종로상회'/><br/>
			
			<label>단가</label>
			<input type ='text' name ='price' value = '1300000'/><br/>
			
			<label>거래처 연락처</label>
			<input type ='text' name ='phone' value = '010-1111-1111'/><br/>
			
			<label>담당자</label>
			<input type ='text' name ='manager' value = '홍길동'/><br/>
			
			<br/>
			<input type ='submit' value = '저장'/>
		</form>		
	</div>
</body>
</html>