<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale = 1.0'>
<script src = '../lib/jquery-3.6.0.min.js'></script> 
<title>depart</title>
</head>
<body>
	<div id = 'depart'>
		<form name = 'frm' id = 'frm' method = 'post' action = ''>
			<label>부서코드</label>
			<input type = 'text' name = 'dno' value ='80'/>
			<input type = 'button' value = '검색' id = 'btnFind'/>
		</form>
		<div id = 'result'></div>
	</div>
	
	<script>
		$('#btnFind').click(function(){
			var param = '?dno=' + $('input[type=text]').val();
			
			$.ajax({
				url  	 : 'depart_result.jsp' + param,
				dataType : 'json',
				type 	 : 'post',
				success  : function(data){
					var str = '<li>department name : ' + data.dname
							+ '<li>manager id : '	   + data.mid
							+ '<li>location id : '     + data.lid;
					$('#result').html(str);
				}	
			});
			
		})
	</script>
</body>
</html>