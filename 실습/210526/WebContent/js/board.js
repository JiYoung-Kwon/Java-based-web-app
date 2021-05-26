/**
 * 게시판
 */

var brd ={};
brd.init = function(){
	$('#board #btnSelect').on('click', function(){
		var frm = $('frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/search.jsp', param);
	})
	
	$('#board #btnInsert').on('click', function(){
		var frm = $('frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/register.jsp', param);
	})
	
	$('#board #btnModify').on('click', function(){
		var frm = $('frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/modify.jsp', param);
	})
	
	$('#board #btnView').on('click', function(){
		var frm = $('frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/view.jsp', param);
	})
	
	$('#board #btnRepl').on('click', function(){
		var frm = $('frm_board')[0];
		var param = $(frm).serialize();
		$('#board').load('./board/repl.jsp', param);
	})
}