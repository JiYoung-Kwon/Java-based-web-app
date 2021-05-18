/**
 * 제품관리에 사용되는 스크립트
 */

var product = {};
product.init= function(){	
	$('#checkAll').on('click',function(){
		var chk= document.frm_product.gubun;
		
		for(var i of chk){
			i.checked = this.checked;
		}
	});
	
	$('#btnFind').on('click', function(){
		var param = $('#frm_product').serialize();
		$('#product').load('./product/search.jsp',param);
	})
}

product.move = function(nowPage){
	document.frm_product.nowPage.value = nowPage;
	var param = $('#frm_product').serialize();
	$('#product').load('./product/search.jsp',param);
	
}

product.modify = function(serial){
	document.frm_product.serial.value=serial;
	var param =  $('#frm_product').serialize();
	$('#product').load('./product/modify.jsp',param);
}

product.select = function(){
	var param =  $('#frm_product').serialize();
	$('#product').load('./product/search.jsp',param);
}

product.deleteR = function(){
	var yn = confirm("정말 삭제하시겠습니까?");
	if(!yn) return;
	
	var param =  $('#frm_product').serialize();
	$.ajax({
		type 	: 'POST',
		url		: './product/delete_result.jsp',
		data	: param,
		success	: function(resp){
			$('#product').load('./product/search.jsp',param);
		},
		error	: function(xhr, status, resp){
			alter("삭제 중 오류 발생");
		}
	})
}

product.modifyR = function(){
	var yn = confirm("정말 수정하시겠습니까?");
	if(!yn) return;
	
	var param =  $('#frm_product').serialize();
	$.ajax({
		type 	: 'POST',
		url		: './product/modify_result.jsp',
		data	: param,
		success	: function(resp){
			$('#product').load('./product/search.jsp',param);
		},
		error	: function(xhr, status, resp){
			alter("수정 중 오류 발생");
		}
	})
}

product.insert = function(){
	var param =  $('#frm_product').serialize();
	$('#product').load('./product/register.jsp',param);
}

product.insertR = function(){
	var param =  $('#frm_product').serialize();
	$.ajax({
		type 	: 'POST',
		url		: './product/register_result.jsp',
		data	: param,
		success	: function(resp){
			$('#product').load('./product/search.jsp',param);
		},
		error	: function(xhr, status, resp){
			alter("수정 중 오류 발생");
		}
	})
	
}