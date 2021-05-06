/**
 * file 태그에 의해 선택된 이미지 미리보기
 */

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