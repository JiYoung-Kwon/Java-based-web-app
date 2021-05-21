/**
 * 회원 관리
 */

var member={};

member.init = function(){
	var url = './member/member.do?job=';
	$('#btnRegister').on('click', function(){ //입력폼으로
		var param = $('#frm_member').serialize();
		$('#border').load(url+'register',param);	
	})
	
	$('#btnInsert').on('click', function(){ //저장
		var frm = $('#frm_member')[0];
		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			enctype : 'multipart/form-data',
			url : '/WebStudy/upload.do',
			data : data,
			processData : false,
			contentType : false,
			success : function(resp){
				$('member').load('/WebStudy/member/member.do');
			}
		})
	})
	
	$('#btnSelect').on('click', function(){ //저장
		var param = $('#frm_member').serialize();
		$('#border').load(url+'search',param);	
	})
	
	$('#btnDelete').on('click', function(){ //저장
		var param = $('#frm_member').serialize();
		$('#border').load(url+'deleteR',param);	
	})
	
	$('#btnModify').on('click', function(){ //저장
		var param = $('#frm_member').serialize();
		$('#border').load(url+'modify',param);	
	})
	
	$('#btnUpdate').on('click', function(){ //저장
		var param = $('#frm_member').serialize();
		$('#border').load(url+'modifyR',param);	
	})
	
	$('#btnFind').on('click', function(){ //저장
		var param = $('#frm_member').serialize();
		$('#border').load(url+'search',param);	
	})
	
	$('#btnZipCode').on('click',function(){
		var frm = document.frm_member;
		new daum.Postcode({
			oncomplete : function(data){
				frm.post.value = data.zonecode;
				frm.address.value = data.address;
			}			
		}).open();
	})
	
	$('#photo').on('click',function(){
		$('#picture').click();
	})
	
	var pic = document.getElementById('picture');
	pic.onchange = function(ev){
		var files = ev.srcElement.files;		
		var reader = new FileReader();

		reader.readAsDataURL(files[0]);
		reader.onload = function(ev2){
			var img = new Image();
			img.src = ev2.target.result;
			
			$('#photo')[0].src = img.src;
		}
	}
}

member.view = function(){
	var url = './member/member.do?job=';
	var param = $('#frm_member').serialize();
	$('#border').load(url+'view',param);
}
