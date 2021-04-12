<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<title>제품 입출고 조회</title>
</head>
<body>
	<div id = 'product'>
		<h1>입출고 조회</h1>
		
		<form name = 'frm_product' method = 'post' action =''>
			<input type ='button' value = '입력'/>
			<div>
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
		<div>
			<span>NO</span>
			<span>구분</span>
			<span>일자</span>
			<span>제품코드</span>
			<span>제품명</span>
			<span>수량</span>
			<span>단가</span>
			<span>금액</span>
		</div>
		<hr/>
		<div>
			<div>
				<span>100</span>
				<span>입고</span>
				<span>2021-04-17(월)</span>
				<span>a001</span>
				<span>컴퓨터 본체</span>
				<span>1,000</span>
				<span>1,000</span>
				<span>1,000,000</span>
			</div>
			
			<div>
				<span>100</span>
				<span>입고</span>
				<span>2021-04-17(월)</span>
				<span>a001</span>
				<span>컴퓨터 본체</span>
				<span>1,000</span>
				<span>1,000</span>
				<span>1,000,000</span>
			</div>
			
			<div>
				<span>100</span>
				<span>입고</span>
				<span>2021-04-17(월)</span>
				<span>a001</span>
				<span>컴퓨터 본체</span>
				<span>1,000</span>
				<span>1,000</span>
				<span>1,000,000</span>
			</div>
		</div>
		<hr/>
		
		<div>
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