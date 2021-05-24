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
		
		if(frm.findStr.value == '') frm.findStr.value = ' '; //임시 조치
		
		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			enctype : 'multipart/form-data',
			url : './upload.do?flag=insert',
			data : data,
			processData : false,
			contentType : false,
			success : function(resp){
				$('#member').load('./member/member.do', 'job=search');
			},
			error : function(xhr, status, resp){
				alert(status + ", " + resp);
			}
		});
	})
	
	$('#btnSelect').on('click', function(){ //저장
		var param = $('#frm_member').serialize();
		$('#border').load(url+'search',param);	
	})
	
	$('#btnDelete').on('click', function(){ //저장
		$('#passwordZone').css({
			'display' : 'block'
		});	
	})
	
	$('#btnCancel').on('click', function(){ //저장
		$('#passwordZone').css({
			'display' : 'none'
		});	
	})
	
	$('#btnDeleteR').on('click', function(){ //저장
		var pwd = $('#passwordZone #pwd').val();
		var frm = $('#frm_member')[0];
		frm.pwd.value = pwd;
		var param = $(frm).serialize();
		
		$('#border').load(url+'deleteR',param, function(){
			$('#passwordZone').css({
				'display' : 'none'
			})
		});	
	})
	
	$('#btnModify').on('click', function(){ //저장
		var param = $('#frm_member').serialize();
		$('#border').load(url+'modify',param);	
	})
	
	$('#btnUpdate').on('click', function(){ //저장
		$('#passwordZone').css({
			'display' : 'block'
		});
	})

	$('#btnUpdateR').on('click', function(){ //저장		
		var pwd = $('#passwordZone #pwd').val();
		var frm = $('#frm_member')[0];
		frm.pwd.value = pwd;
		
		if(frm.findStr.value == '') frm.findStr.value = ' '; //임시 조치
		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			url  : './upload.do?flag=update',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#border').load('./member/member.do', 'job=search');	
			}
		})
		
		
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
	
	var pic = $('#picture')[0];
	if(pic!=null){
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
/*	var pic = document.getElementById('picture');
	pic.onchange = function(ev){
		var files = ev.srcElement.files;		
		var reader = new FileReader();

		reader.readAsDataURL(files[0]);
		reader.onload = function(ev2){
			var img = new Image();
			img.src = ev2.target.result;
			
			$('#photo')[0].src = img.src;
		}
	}*/
}

member.view = function(mid){
	var url = './member/member.do?job=';
	var frm = $('#frm_member')[0];
	frm.mid.value = mid;
	var param = $('#frm_member').serialize();
	$('#border').load(url+'view',param);
}

member.move = function(nowPage){
	var url = './member/member.do?job=search';
	var frm = $('#frm_member')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#border').load(url,param);
}

member.checkHost = function(host){
	var frm = $('#frm_member')[0];

	switch(host){
		case '네이버':
			frm.host[0].selected = true;
			break;
			
		case '네이트':
			frm.host[1].selected = true;
			break;
			
		case '다음':
			frm.host[2].selected = true;
			break;
			
		case 'IT여행자':
			frm.host[3].selected = true;
			break;
			
		case 'acorn':
			frm.host[4].selected = true;
			break;
		
	}
}
