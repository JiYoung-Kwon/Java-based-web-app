<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<title>show_hide</title>
<script src = '../lib/jquery-3.6.0.min.js'></script>
</head>
<body>
	<div id = 'show_hide'>
		<input type = 'button' id ='show' value = 'show'/>
		<input type = 'button' id ='show_fast' value = 'show(fast)'/>
		<input type = 'button' id ='show_slow' value = 'show(slow)'/>
		<input type = 'button' id ='show_custom' value = 'show(custom)'/>
		<br/>
		<input type = 'button' id ='hide' value = 'hide'/>
		<input type = 'button' id ='hide_fast' value = 'hide(fast)'/>
		<input type = 'button' id ='hide_slow' value = 'hide(slow)'/>
		<input type = 'button' id ='hide_custom' value = 'hide(custom)'/>
		<br/>
		<input type = 'button' id ='slide_up' value = 'slide(up)'/>
		<input type = 'button' id ='slide_down' value = 'slide(down)'/>
		<input type = 'button' id ='slide_toggle' value = 'slide(toggle)'/>
		<br/>
		<div id = 'target'>
			봄날의 이는 있는 따뜻한 소담스러운 있을 생생하며, 운다. 할지니, 미묘한 능히 얼음 하는 뼈 안고, 용기가 있을 황금시대다.
			풀밭에 돋고, 안고, 얼음 웅대한 사막이다. 그들의 듣기만 없으면, 넣는 같지 그들에게 목숨이 과실이 위하여서.
			구하지 속잎나고, 목숨이 청춘에서만 피가 오직 보라. 우리의 석가는 쓸쓸한 얼마나 많이 같이, 그리하였는가?
			곧 인류의 우리의 봄날의 넣는 위하여 아니한 철환하였는가? 찬미를 희망의 착목한는 아니다. 실현에 가슴이 생의 이것은 교향악이다.
		</div>
	</div>
	
	<script>
		$('#show_hide').css({
			'width' : '500px',
			'margin' : '50px auto'
		})
		
		$('#target').css({
			'border' : '2px solid #aaa',
			'padding' : '20px',
			'box-sizing' : 'border-box',
			'margin-top' : '30px'
		})
		
		$('#hide').click(function() {
			$('#target').hide();
		})
		$('#show').click(function() {
			$('#target').show();
		})

		$('#hide_slow').click(function() {
			$('#target').hide('slow');
		})
		$('#show_slow').click(function() {
			$('#target').show('slow');
		})

		$('#hide_fast').click(function() {
			$('#target').hide('fast');
		})
		$('#show_fast').click(function() {
			$('#target').show('fast');
		})
		
		$('#hide_custom').click(function() {
			$('#target').hide(3000);
		})
		$('#show_custom').click(function() {
			$('#target').show(3000);
		})
		
		$('#slide_up').click(function() {
			$('#target').slideUp(1000);
		})
		$('#slide_down').click(function() {
			$('#target').slideDown(1000);
		})
		$('#slide_toggle').click(function() {
			$('#target').slideToggle(1000);
		})
	</script>
</body>
</html>