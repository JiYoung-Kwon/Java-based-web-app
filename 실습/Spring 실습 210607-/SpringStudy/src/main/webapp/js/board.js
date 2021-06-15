/**
 * 게시판
 */

var brd ={};
//게시판 메뉴를 클릭한 경우
brd.home = function(){
	$('#border').load('search.brd');
}
brd.init = function(){
	$('#board #btnSelect').on('click', function(){	
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('search.brd', param);
	})
	
	$('#board #btnFind').on('click', function(){		
		var frm = $('#frm_board')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();

		$('#border').load('search.brd', param);
	})
	
	$('#board #btnInsert').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('register.brd', param);
	})
	
	$('#board #btnInsertR').on('click', function(){
		var frm = $('#frm_upload')[0];
		var data = new FormData(frm);
		
		var frm2 = $('#frm_board')[0];
		var param = $(frm2).serialize();
		
		$.ajax({
			type : 'POST',
			url  : 'fup.brd',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#border').load('registerR.brd', param);
			},
			error : function(){
				alert("error");
			}  
		});
	})
	
	$('#board #btnModify').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('./board?job=modify', param);
	})
	
	$('#board #btnUpdate').on('click', function(){
		$('#brdPasswordZone').css({
			'display' : 'block'
		})
	})
	
	$('#board #btnUpdateR').on('click', function(){
		var frm = $('#frm_board')[0];
		var pwd = $('#brdPasswordZone #pwd').val();
		frm.pwd.value = pwd;

		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			url  : 'update.fup',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#brdPasswordZone').css({'display' : 'none'});
				$('#border').load('modifyR.brd');
			} 
		});
	})
	
	$('#btnDelete').on('click', function(){
		$('#brdPasswordZone').css({
			'display' : 'block'
		})
	})

	$('#btnCancel').on('click', function(){
		$('#brdPasswordZone').css({
			'display' : 'none'
		})
	})

	$('#board #btnDeleteR').on('click', function(){
		var frm = $('#frm_board')[0];
		var pwd = $('#brdPasswordZone #pwd').val();
		frm.pwd.value = pwd;

		var param = $(frm).serialize();
		$('#border').load('delete.brd', param, function(){
			$('#brdPasswordZone').css({
				'display' : 'none'
			})
		});
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
	
	$('#board #btnReplR').on('click', function(){
		var frm = $('#frm_board')[0];
		
		var data = new FormData(frm);
		
		$.ajax({
			type : 'POST',
			url  : 'repl.fup',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#border').load('repl.brd');
			} 
		});
	})
}



brd.view = function(serial){
	var frm = $('#frm_board')[0];
	frm.serial.value = serial;
	var param = $(frm).serialize();
	$('#border').load('view.brd', param);
}

brd.move = function(nowPage){
	var frm = $('#frm_board')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#border').load('search.brd',param);
}

function imageView(fileTag, imageZone){
	var ft = document.getElementById(fileTag);
	var izone = document.getElementById(imageZone);
	
	ft.onchange = function(ev){
		var ele = ev.srcElement; //이벤트가 발생한 태그
		var files = ele.files;
		for(var index in files){
			console.table(files[index]);
		}
		
		for(var file of files){
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(ev2){
				var div = makeItem(izone);
				var img = new Image();
				img.src =  ev2.target.result;
				
				div.appendChild(img);
				izone.appendChild(div);
			}
		}	
	} //end of ft.onchange
	
	//drag & drop 기능 추가
	izone.ondragenter = function(e){
		e.preventDefault();
		e.stopPropagation(); //브라우저가 인식할수 없는 파일이어도 냅둠
		return false;
	}
	
	izone.ondragover = function(e){
		e.preventDefault();
		e.stopPropagation();
		return false;
	}
	
	izone.ondrop = function(e){
		e.preventDefault();
		e.stopPropagation();
		
		var dt = e.dataTransfer;
		var files = dt.files;

		for(var file of files){
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(ev2){
				var div = makeItem(izone);
				var img = new Image();
				img.src =  ev2.target.result;
				
				div.appendChild(img);
				izone.appendChild(div);
			}
		}	
	} 
	
}

function makeItem(izone){
	//div 태그 생성 : <div class = 'item'></div>
	var div = document.createElement('div');
	div.setAttribute('class','item');
	
	//삭제 버튼 : <input type = 'button' value = 'x' class = 'del_btn' name = 'btnDel + N'/>
	var delBtn = document.createElement('input');
	delBtn.setAttribute('type','button');
	delBtn.setAttribute('value','X');
	delBtn.setAttribute('class','del_btn');
	delBtn.setAttribute('name','btnDel');
	
	div.appendChild(delBtn);
	
	delBtn.onclick = function(){
		var p = this.parentNode;
		izone.removeChild(p);
	}
	
	return div;
}