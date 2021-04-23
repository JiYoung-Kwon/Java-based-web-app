/**
 * object_array.js
 */

var list = [];
function Data(mid, mname){
	this.mid = mid;
	this.mname = mname;
	
	this.setMid = function(mid){this.mid = mid;}
	this.setMname = function(mname){this.mname = mname;}
	this.getMid = function(){return this.mid;}
	this.getMname = function(){return this.mname;}
	this.toString = function(pos){
		var str = "<div class = 'item' onclick ='view(" +pos+ ")'>"
				+ "	<span class = 'mid'>" + this.mid + "</span>"
				+ " <span class = 'mname'>" + this.mname + "</span>"
				+ "</div>";
		return str;
	}
}

function view(pos){
	flag = pos;
	var o = list[pos];
	frm.mid.value = o.getMid();
	frm.mname.value = o.getMname();
}

var btnSave = document.getElementById('btnSave');
var btnDelete = document.getElementById('btnDelete');
var btnModify = document.getElementById('btnModify');
var btnFind = document.getElementById('btnFind');
var btnList = document.getElementById('btnList');
var frm = document.frm;
var flag = -1; //참는 데이터가 없다.
btnSave.onclick = function(){
	flag = -1;
	var o = new Data(frm.mid.value, frm.mname.value); 
	list.push(o);
	console.log(o.toString());
}

btnList.onclick = function(){
	flag = -1;
	var items = document.getElementsByClassName('items')[0];
	var str ='';
	for(var i =0; i<list.length; i++){
		str += list[i].toString(i);
	}
	items.innerHTML = str;
}

btnFind.onclick = function(){
	flag = -1; //찾는 데이터가 없다.
	var findMid = frm.mid.value;
	
	frm.mname.value = '';
	for(var i=0; i<list.length; i++){
		var o = list[i];
		if(o.getMid() == findMid){
			frm.mname.value = o.getMname();
			flag=i;
			break;
		}
	}
	
	if(flag==-1){
		alert('찾는 데이터가 없습니다.');
	}
	
}

btnModify.onclick = function(){
	if(flag == -1){
		alert("수정하려면 먼저 검색해주세요.");
		return;
	}	
	var o = new Data(frm.mid.value, frm.mname.value);
	list[flag] = o;
	alert('데이터가 수정되었습니다.');
	flag = -1;
}

btnDelete.onclick = function(){
	var yn =false;
	if(flag == -1){
		alert('삭제하시려면 먼저 검색해주세요.');
		return;
	}
	
	yn=confirm('정말 삭제하시겠습니까?');
	if(yn){
		list.splice(flag,1);//flag위치에서부터 1개
		frm.mid.value ='';
		frm.mname.value = '';
	}
	else{
		alert('삭제가 취소되었습니다.');
	}
	flag = -1;
}








