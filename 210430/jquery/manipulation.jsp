<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content='width=device-width, initial-scale = 1.0'>
<title>manipulation</title>
<script src="../lib/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id = 'manipulation'>
		<div id = 'wr'>
			<div id = 'a'>AAAAA</div>
			<div id = 'b'>BBBBB</div>
			<div class = 'here'>HERE</div>
		</div>
		<hr/>
		<div id = 'ap'>
			<div id = 'a'>빌트인 냉장고</div>
			<div id = 'b'>BBBBB</div>
			<div class = 'here'>대박세일 50%DC</div>
		</div>
		<hr/>
		<div id = 'pr'>
			<div id = 'a'>AAAAA</div>
			<div id = 'b'>BBBBB</div>
			<div class = 'here'>HERE</div>
		</div>
		<hr/>
		<div id = 'be'>
			<div id = 'a'>AAAAA</div>
			<div id = 'b'>BBBBB</div>
			<div class = 'here'>HERE</div>
		</div>
	</div>
	
	<script>
		$('#manipulation>div>div').css({
			'display':'inline-block',
			'border':'1px solid #cccccc'});
		
		$('.here').css({
			'background-color':'#ff0000',
			'color':'#ffff00',
			'font-size':'8px'
		});
		
		//wrap
		$('#wr #a').wrap($('#wr .here'));
		
		//append
		$('#ap #a').append($("#ap .here"));
		
		//prepend
		$('#pr #a').prepend($("#pr .here"));
		
		//before
		$('#be #a').before($("#be .here"));
		
		//empty
		$('#be').empty();

		var len = $('.here').length;
		//var len2 = $('.here').size();
		
		console.log(len);
		//console.log(len2);
	</script>
</body>
</html>