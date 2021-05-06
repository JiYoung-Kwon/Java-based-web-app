<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content='width=device-width, initial-scale = 1.0'>
<title>func_css</title>
<script src="../lib/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id = 'func_css'>
		<div>1</div>
		<div>2</div>
		<div>3</div>
		<div>4</div>
		<div>5</div>
		<div>6</div>
		<br/>
		<input type = 'button' value =' < ' id = 'btnLeft'>
		<input type = 'button' value =' > ' id = 'btnRight'>
	</div>
	
	<script>
		// #func_css 안에 있는 모든 div의 display 속성, width, height 속성 지정
		$('#func_css>div').css({
			'display' : 'inline-block',
			'width'	: '130px',
			'height' : '60px',
			'border' : '3px solid #555'
		})
		
		var leng = $('#func_css>div').length; //func_css의 자식 div 개수
		var index = leng;
		$('#btnLeft').click(function(){ // < 버튼 클릭
			var target = $('#func_css>div').get(index) //index번째 div를 target에 저장
			$(target).css('background-color', '') // 배경색을 없앰
			
			index--; //인덱스 감소
			if(index<0) index=leng-1; //인덱스가 0보다 작을 경우, 마지막 div에 해당하는 인덱스로 설정
			var target = $('#func_css>div').get(index)
			$(target).css('background-color', '#f00') // 배경색을 빨강으로 설정
		})
		
		$('#btnRight').click(function(){ // > 버튼 클릭
			var target = $('#func_css>div').get(index) //index번째 div를 target에 저장
			$(target).css('background-color', '') // 배경색을 없앰
			
			index++; //인덱스 증가
			if(index>leng-1) index= 0; //인덱스가 마지막 div에 해당하는 인덱스를 초과할 경우, 첫 div에 해당하는 인덱스로 설정
			var target = $('#func_css>div').get(index)
			$(target).css('background-color', '#0f0')
		})
		
	</script>
</body>
</html>