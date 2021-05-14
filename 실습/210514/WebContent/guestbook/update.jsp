<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='../lib/jquery-3.6.0.min.js'></script>
</head>
<body>
	<form name = 'frm_guestbook' id = 'frm_gb' method ='post' action=''>
		<textarea name = 'doc' cols ='50' rows='4'></textarea>
		<br/>
		<label>바탕색</label>
		<input type = 'color' name = 'bgcolor'/>
		<br/>
		<input type = 'button' value = '저장' id = 'btnModify'/>
		<input type = 'hidden' name = 'serial'/>
	</form>
	
	<script>
		$('#btnModify').on('click',function(){
			var param = $('#frm_gb').serialize();
			
			$.ajax({
				type : 'POST',
				data : param,
				url  : '../guestbook/update_result.jsp',
				success : function(resp){
					var target = window.opener.document.getElementById('guestbook');
					$(target).load('../guestbook/list.jsp', function(){
						self.close();
					});
				}
			});
		});
	</script>
</body>
</html>