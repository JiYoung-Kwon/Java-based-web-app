/**
 * 성적 처리를 위한 스크립트
 * 2021.04(JJIYOM)
 */

var ff= document.frm;
var btn= document.getElementById('btnCompute');
var btnSave= document.getElementById('btnSave');
var btnOutput= document.getElementById('btnOutput');
var info = document.getElementById('status');
var arMid = [];
var arKor = [];
var arMat = [];
var arTot = [];
var arAvg = [];

btn.onclick = function(){
	var tot=0;
	var avg=0;
	if(ff.mid.value ==''){
		info.innerHTML = "아이디를 입력하세요...";
		ff.mid.focus();
		return;
	}else if(ff.kor.value ==''){
		info.innerHTML = '국어 성적을 입력하세요...';
		ff.kor.focus();
		return;
	}else if(ff.mat.value ==''){
		info.innerHTML = '수학 성적을 입력하세요...';
		ff.mat.focus();
		return;
	}
	
	tot = Number(ff.kor.value) + Number(ff.mat.value);
	ff.tot.value = tot;
	avg = tot/2;
	ff.avg.value = avg;
}

btnSave.onclick = function(){
	var i = arMid.length;
	arMid[i] = frm.mid.value;
	arKor[i] = frm.kor.value;
	arMat[i] = frm.mat.value;
	arTot[i] = frm.tot.value;
	arAvg[i] = frm.avg.value;
	
	info.innerHTML = (i+1) +'번째 데이터가 저장되었습니다.';
	
	frm.mid.value = '';
	frm.kor.value = '';
	frm.mat.value = '';
	frm.tot.value = '';
	frm.avg.value = '';
	frm.mid.focus();
}

btnOutput.onclick = function(){
	var str='';
	var items= document.getElementById('items');
	for(var i=0; i<arMid.length; i++){
		str += '<div>';
		str += '	<span class="mid">' +arMid[i]+ '</span>';
		str += '	<span class="kor">' +arKor[i]+ '</span>';
		str += '	<span class="mat">' +arMat[i]+ '</span>';
		str += '	<span class="tot">' +arTot[i]+ '</span>';
		str += '	<span class="avg">' +arAvg[i]+ '</span>';
		str += '</div>';
	}
	
	items.innerHTML = str;
}