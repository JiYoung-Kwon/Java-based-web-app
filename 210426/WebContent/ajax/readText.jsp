<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content= 'width=device-width, initial-scale = 1.0'>
<title>readText</title>
</head>
<body>
	<div id = 'readText'>
		<input type = 'button' value = 'READ' id ='btnText'/>
		<input type = 'button' value = '게시판' id = 'btnBoard' />
		<input type = 'button' value = '방명록' id = 'btnGuest' />
		<div id = 'result'></div>
		<div id = 'result2'></div>
		<div id = 'result3'></div>
	</div>
	
	<script>
	var xhr = new XMLHttpRequest();
	var btn = document.getElementById('btnText');
	var rs = document.getElementById('result');
	
	//추가한 버튼, div 객체 생성
	var btnB = document.getElementById('btnBoard');
	var btnG = document.getElementById('btnGuest');
	var rs2 = document.getElementById('result2');
	var rs3 = document.getElementById('result3');
	
	btn.onclick = function(){
		var url = 'myinfo.txt';
		xhr.open('get',url);
		xhr.send();
		xhr.onreadystatechange = function(){
			console.log(xhr.status + ', ' + xhr.readyState);
			if(xhr.status == 200 && xhr.readyState ==4) { //요청과 응답이 모두 정상일 때
				//xhr.responseText xhr.responseXML
				var data = xhr.responseText;
				rs.innerHTML = data;
			}
		}
	}
	
	btnB.onclick = function(){
		var url = '../board/search.jsp';
		xhr.open('get',url);
		xhr.send();
		xhr.onreadystatechange = function(){
			console.log(xhr.status + ', ' + xhr.readyState);
			if(xhr.status == 200 && xhr.readyState == 4){
				var data = xhr.responseText;
				rs2.innerHTML = data;
			}
		}
	}
	
	//방명록을 ajax를 사용하여 rs3에 표시하시오.
	btnG.onclick = function(){
		var url = '../guestbook/list.jsp';
		xhr.open('get',url);
		xhr.send();
		xhr.onreadystatechange = function(){
			console.log(xhr.status + ', ' + xhr.readyState);
			if(xhr.status == 200 && xhr.readyState == 4){
				var data = xhr.responseText;
				rs3.innerHTML = data;
			}
		}
	}
	
	</script>
</body>
</html>