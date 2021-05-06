<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getTagName</title>
<script>
	function getEleInit(){
		var rs = document.getElementById('result');
		var btn = document.getElementById('btn');
		
		btn.onclick= function(){
			var input = document.getElementsByTagName('input');
			var str = "<ul><li>Length=" + input.length + "</li></ul>";
			
			for(i=0; i<input.length; i++){
				str+= '<ul><li>Name:' + input[i].name;
				str+= '<li>Value:' + input[i].value;
				str+= '<li>Type:' + input[i].type;
				str+= '<li>ID:' + input[i].id;
				str+= '<li>class:' + input[i].className;
				str+= '</ul>'
			}
			
			rs.innerHTML = str;
		}
	}

</script>
</head>
<body>
	<h2>getTagName</h2>
	
	<form name = 'frm'>
		<input type ='text' name = 'irum' value = 'park' id ='id_irum' class = 'class_irum'/>
		<br/>
		<input type ='text' name = 'address' value = 'seoul' id ='id_address' class = 'class_address'/>
		<br/>
		<input type ='text' name = 'phone' value = '1111-1111' id ='id_phone' class = 'class_phone'/>
		<br/>
	</form>
	<input type = 'button' id ='btn' value = '확인'/>
	
	<h2>Result</h2>
	<div id = 'result'></div>
	
	<script>getEleInit()</script>
</body>
</html>