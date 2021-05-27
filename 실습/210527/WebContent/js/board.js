/**
 * 게시판
 */

var brd ={};
brd.init = function(){
	$('#board #btnSelect').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board', param);
	})
	
	$('#board #btnFind').on('click', function(){
		var frm = $('#frm_board')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();
		$('#board').load('./board', param);
	})
	
	$('#board #btnInsert').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/register.jsp', param);
	})
	
	$('#board #btnInsertR').on('click', function(){
		var frm = $('#frm_board')[0];
		
		//내용 입력폼과 파일 업로드 폼이 분리되지 않아서 임시로 해결하기 위해
		if(frm.findStr.value == '') frm.findStr.value = ' '; //임시조치
		if(frm.serial.value == '') frm.serial.value = 0; //임시조치
		
		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			url  : './boardUpload.do?flag=insert',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#board').load('./board');
			} 
		});
	})
	
	$('#board #btnModify').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/modify.jsp', param);
	})
	
	$('#board #btnView').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/view.jsp', param);
	})
	
	$('#board #btnRepl').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/repl.jsp', param);
	})
}

brd.view = function(serial){
	var frm = $('#frm_board')[0];
	var param = $(frm).serialize();
	$('#board').load('./board/view.jsp', param);
}

brd.move = function(nowPage){
	var frm = $('#frm_board')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#board').load('./board',param);
}