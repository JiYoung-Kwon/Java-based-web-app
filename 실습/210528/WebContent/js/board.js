/**
 * 게시판
 */

var brd ={};
brd.init = function(){
	$('#board #btnSelect').on('click', function(){
		if(frm.findStr.value =='') frm.findStr.value = ' ';
		if(frm.serial.value =='') frm.serial.value = 0;
		if(frm.nowPage.value =='') frm.nowPage.value = '1';
		
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('./board?job=search', param);
	})
	
	$('#board #btnFind').on('click', function(){		
		var frm = $('#frm_board')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();
		$('#border').load('./board', param);
	})
	
	$('#board #btnInsert').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('./board/register.jsp', param);
	})
	
	$('#board #btnInsertR').on('click', function(){
		var frm = $('#frm_board')[0];
		
		//내용 입력폼과 파일 업로드 폼이 분리되지 않아서 임시로 해결하기 위해
		if(frm.findStr.value == '') frm.findStr.value = ' '; //임시조치
		if(frm.serial.value == '') frm.serial.value = 0; //임시조치
		if(frm.nowPage.value == '') frm.nowPage.value = '1';

		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			url  : './boardUpload.do?flag=insert',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#border').load('./board');
			} 
		});
	})
	
	$('#board #btnModify').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('./board/modify.jsp', param);
	})
	
	$('#board #btnDelete').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('./board?job=delete', param);
	})
	
	
	$('#board #btnView').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('./board/view.jsp', param);
	})
	
	$('#board #btnRepl').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('./board/repl.jsp', param);
	})
}

brd.view = function(serial){
	var frm = $('#frm_board')[0];
	frm.serial.value = serial;
	var param = $(frm).serialize();
	$('#border').load('./board?job=view', param);
}

brd.move = function(nowPage){
	var frm = $('#frm_board')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#border').load('./board',param);
}