<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale=1.0'>
<title>답글</title>
<link rel ='stylesheet' type='text/css' href ='./css/board.css'>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src = './js/board.js'></script>
</head>
<body>
	<div id = 'board'>
		<h1>REPL</h1>
		
		<form name='frm_board' id = 'frm_board' method='post' action=''>
			<label>작성자</label>
			<input type='text' name='mid' value = '${vo.mid }'/>
			<br/>
			
			<label>제목</label>
			<input type='text' name='subject' value = '${vo.subject }'/>
			<br/>
			
			<textarea name = 'doc'></textarea>
			<br/>
			
			<label>암호</label>
			<input type='password' name='pwd'/>
			<br/>
			
			<input type = 'text' name = 'nowPage' value = '${param.nowPage }'/>
			<input type = 'text' name = 'serial' value = '${param.serial }'/>
			<input type = 'text' name = 'findStr' value = '${param.findStr }'/>
		</form>
	
		<form name = 'frm_upload' id = 'frm_upload' method ='post'>
			<label>첨부파일</label>
			<input type='file' name='attfile' id = 'attfile' multiple/>
			
			<div id = 'image_preview'>
				<div id = 'attzone'></div>
			</div>	
		</form>
		
		<div id = 'btn_zone'>			
			<input type='button' value='답글작성' id = 'btnReplR'/>
			<input type='button' value='취소' id = 'btnSelect'/>
		</div>
	</div>

	<script>
		brd.init();
		imageView('attfile', 'attzone');
	</script>
</body>
</html>