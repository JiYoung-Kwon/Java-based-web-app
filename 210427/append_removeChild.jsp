<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale= 1.0'>
<title>append_removeChild</title>
</head>
<body>
	<div id = 'append_removeChild'>
		<h2>상품 옵션 추가</h2>
		<label>컬러 : <input type = 'text' id = 'color'/></label>
		<input type = 'button' value = 'APPEND' id = 'btnAppend'/>
		<input type = 'button' value = 'REMOVE' id = 'btnRemove'/>
		<div id = 'zone'></div>
	</div>
	
	<script>
		var zone = document.getElementById('zone');
		var btnAppend = document.getElementById('btnAppend');
		var btnRemove = document.getElementById('btnRemove');
		var color = document.getElementById('color');
		
		btnAppend.onclick = function(){
			var label = document.createElement('label');
			var radio = document.createElement('input');
			
			radio.setAttribute('type','radio');
			radio.setAttribute('value', color);
			radio.setAttribute('name','ra');
						
			label.appendChild(radio);	
			label.innerHTML += color.value;
			
			zone.appendChild(label);
			
		}
		
		btnRemove.onclick = function(){ //선택된 라디오 버튼을 삭제
			var radios = zone.getElementsByTagName('input');
			for(var i=0; i<radios.length; i++){
				if(radios[i].checked){
					var p = radios[i].parentNode;
					zone.removeChild(p);
				}
			}
		}
	</script>
</body>
</html>