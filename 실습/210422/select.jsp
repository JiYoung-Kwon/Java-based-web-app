<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>select</title>
</head>
<body>
	<div id ='select'>
		<h2>select sample</h2>
		<form name='frm' method ='post' action=''>
			<input type='text' name='tt'/>
			<select name ='sel' onchange='chang(this.form)'>
				<option value = '#000000'>검정색</option>
				<option value = '#ff0000'>빨강색</option>
				<option value = '#00ff00'>초록색</option>
				<option value = '#0000ff'>파랑색</option>
				<option value = '#ffff00'>노랑색</option>
			</select>
			<input type='button' value ='흰색' onclick='mclick(this.form, "#fff")' />
		</form>
	</div>
	
	<script>
		function chang(ff){
			var index = ff.sel.selectedIndex;
			var color = ff.sel[index].value;
			ff.tt.style.backgroundColor = color;
		}
		
		function mclick(ff, color){
			ff.tt.style.backgroundColor = color;
		}
	</script>
</body>
</html>