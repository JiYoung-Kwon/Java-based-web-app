/**
 * 방명록에서 사용하는 스크립트(jquery 사용)
 */
document.frm_guestbook.nal.valueAsDate = new Date();
$('#btnRegister').on('click', function(){
	var param = $('#frm_gb').serialize();
	//alert(param);
	
	$.ajax({
		type : 'POST',
		data : param,
		url  : './guestbook/register_result.jsp',
		success : function(resp){
			alert(resp);
			$('#guestbook').load('./guestbook/list.jsp');
		},
		error : function(xhr, status, error){
			alert(status);
		}
	});
})

function funcUpdate(serial, doc){
	var win = window.open('./guestbook/update.jsp', 'win', 'width=500px, height=350px');
	win.onload = function(){
		win.frm_guestbook.serial.value = serial;
		win.frm_guestbook.doc.value = doc;
	}
	
}


function funcDelete(serial){
	var yn = confirm("삭제하시겠습니까?");
	if(!yn) return;
	
	var param = 'serial=' + serial;
	
	$.ajax({
		type : 'POST',
		data : param,
		url	 : './guestbook/delete_result.jsp',
		success : function(resp){
			$('#guestbook').load('./guestbook/list.jsp');
		}
	});
}