<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale=1.0'>
<title>조회</title>
<link rel ='stylesheet' type='text/css' href ='/WebStudy/css/board.css'>
</head>
<body>
	<div id = 'board'>
		<h1>SEARCH</h1>
		
		<form name = 'frm_board' method='post' action=''>
			<input type = 'button' value = '가입'/>
			
			<div class ='find_zone'>
				<input type = 'search' name = 'findStr'/>
				<input type = 'button' value = '검색'/>
			</div>
		</form>
		
		<div class = 'title'>
			<span class='no'>순번</span>
			<span class='subject'>제목</span>
			<span class='date'>작성일</span>
			<span class='mid'>작성자</span>
			<span class='hit'>조회수</span>
		</div>

		<div class='items'>
			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>

			<div class = 'item'>
				<span class='no'>100</span>
				<span class='subject'>제목1</span> 
				<span class='date'>작성일1</span> 
				<span class='mid'>작성자1</span>
				<span class='hit'>1</span>
			</div>
		</div>
		
		<div id = 'btn_zone'>
			<input type='button' value = '맨첨'/>
			<input type='button' value = '이전'/>
			<input type='button' value = '1'/>
			<input type='button' value = '2'/>
			<input type='button' value = '3'/>
			<input type='button' value = '다음'/>
			<input type='button' value = '맨끝'/>			
		</div>
	</div>
</body>
</html>