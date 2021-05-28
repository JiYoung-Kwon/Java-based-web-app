<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width = device-width, initial-scale=1.0'>
<title>상세보기</title>
<link rel ='stylesheet' type='text/css' href ='/WebStudy/css/board.css'>
</head>
<body>
	<div id = 'board'>
		<h1>VIEW</h1>
		
		<form name='frm_board' id = 'frm_board' method='post' action=''>
			<label>작성자</label>
			<input type='text' name='mid' value = '${vo.mid }'/>
			<br/>
			
			<label>제목</label>
			<input type='text' name='subject' value = '${vo.subject }'/>
			<br/>
			
			<textarea name = 'doc'>${vo.doc }</textarea>
			<br/>
			
			<label>암호</label>
			<input type='password' name='pwd'/>
			<br/>
			
			<label>첨부파일</label>
			<input type='file' name='attfile' multiple/>
			
			<div id = 'image_preview'>
				<div id = 'attzone'>
					<c:forEach var = 'f' items = '${ vo.attList}'>
						<a href ='./upload/${f.sysAtt }' download = '${f.oriAtt }'>
							<img src = './upload/${f.sysAtt }' width = '150px' height = '180px'/>
						</a>
					</c:forEach>
				</div>
			</div>
					
			<div id = 'btn_zone'>
				<input type='button' value='수정' id ='btnModify'/>
				<input type='button' value='삭제' id ='btnDelete'/>
				<input type='button' value='답글' id ='btnRepl'/>
				<input type='button'  value='취소' id ='btnSelect'/>
			</div>
			
			<input type = 'text' name = 'nowPage' value = '${param.nowPage }'/>
			<input type = 'text' name = 'serial' value = '${param.serial }'/>
			<input type = 'text' name = 'findStr' value = '${param.findStr }'/>
		</form>
	
	</div>
	
	<script>brd.init();</script>
</body>
</html>