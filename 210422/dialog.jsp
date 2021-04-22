<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>dialog</title>
</head>
<body>
	<div id = 'dialog'>
		<input type ='button' value='OPEN' id='btnOpen'/>
		<input type ='button' value='PROMPT' id='btnPrompt'/>
		<input type ='button' value='CONFIRM' id='btnConfirm'/>
	</div>
	
	<script>
		var btnOpen = document.getElementById('btnOpen');
		var btnPrompt = document.getElementById('btnPrompt');
		var btnConfirm = document.getElementById('btnConfirm');
		
		btnOpen.onclick = function(){
			var obj = window.open("http://www.jobtc.kr","obj","");
		}
		
		btnPrompt.onclick = function(){
			var v = prompt("값을 입력하세요.");
			console.log(v);
		}
		
		btnConfirm.onclick = function(){
			var yn = confirm("정말 이동하시겠습니까?");
			if(yn){
				console.log('ok...');
				//location.href='http://www.naver.com';
				location.href='../index.jsp';
			}else{
				console.log('nok...');
			}
		}
	</script>
</body>
</html>