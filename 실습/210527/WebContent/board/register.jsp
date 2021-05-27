<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width = device-width, initial-scale=1.0'>
<title>입력</title>
<link rel='stylesheet' type='text/css' href='/WebStudy/css/board.css'>
<script src = './javascript/image_preview.js'></script>
<style>
	#image_preview #attzone{
		width: 100%;
		min-height : 130px;
		padding:0;
		border:2px dotted #aaa;
	}
	
	#image_preview #attzone >div{
		width: 130px;
		height : 150px;
		margin:5px;
		position:relative;
		display:inline-block;
	}
	
	#attzone .del_btn{
		position:absolute;
		font-size:24pt;
		color:#ff0000;
		right:3px;
		bottom:3px;
		background-color : rgba(255,255,255,0.2);
		border-width:0;
		padding:0;
	}
	#attzone img{
		width:100%;
		height:100%;
	}
	
	#attzone{
		border:2px solid #ffffff;
	}
</style>
</head>
<body>
	<div id = 'board'>
		<h1>REGISTER</h1>
		
		<form name='frm_board' id = 'frm_board' method='post' action=''>
			<label>작성자</label>
			<input type='text' name='mid' value = 'hong'/>
			<br/>
			
			<label>제목</label>
			<input type='text' name='subject' value = '길동이'/>
			<br/>
			
			<textarea name = 'doc'></textarea>
			<br/>
			
			<label>암호</label>
			<input type='password' name='pwd'/>
			<br/>
			
			<label>첨부파일</label>
			<input type='file' name='attfile' id = 'attfile' multiple/>
			
			<div id = 'image_preview'>
				<div id = 'attzone'></div>
			</div>			
			
			<div id = 'btn_zone'>
				<input type='submit' value='작성' id = 'btnInsertR'/>
				<input type='reset' value='취소' id = 'btnSelect'/>
			</div>
			
			
			<input type = 'text' name = 'nowPage' value = '${param.nowPage }'/>
			<input type = 'text' name = 'serial' value = '${param.serial }'/>
			<input type = 'text' name = 'findStr' value = '${param.findStr }'/>
		</form>	
	</div>
	<script>
		brd.init();
		imageView('attfile', 'attzone');
	</script>
</body>
</html>