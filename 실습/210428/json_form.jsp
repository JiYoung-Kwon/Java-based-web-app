<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale= 1.0'>
<title>json_form</title>
</head>
<body>
	<div id = 'json_form'>
		<h2>주소 검색</h2>
		<div class = 'input_zone'>
			<form name = 'frm' method = 'post' onsubmit = 'return false'>
				<label>검색어</label>
				<input type = 'text' size = '40' name = 'findStr'/>
				<input type = 'button' value = '검색' id = 'btnFind'/>
			</form>
		</div>
		
		<div class = 'result'></div>
	</div>
	
	<script>
		var frm = document.frm;
		var btn = document.getElementById('btnFind');
		var rs = document.getElementsByClassName('result')[0];
		var input = frm.findStr;
		var xhr = new XMLHttpRequest();
			
		input.onkeyup = funcKey;	
		btn.onclick = funcFind;

		function funcKey(ev){
			if(ev.keyCode == 13){
				funcFind();
			}
		}
		
		function funcFind(){
			var url = 'json_form_result.jsp';
			var data = {};
			data.findStr = frm.findStr.value;
			
			var param = JSON.stringify(data);
			console.log(param);
			
			url = url + "?findStr=" + frm.findStr.value;
			
			xhr.open('get',url);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.status == 200 && xhr.readyState == 4){
					var temp = xhr.responseText;
					rs.innerHTML = temp;
					//var json = JSON.parse(temp);
				}
			}
		}
		
	</script>
</body>
</html>