<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content= 'width=device-width, initial-scale = 1.0'>
<title>worker</title>
</head>
<body>
	<div id = 'worker'>
		<input type = 'text'name = 'mid' size = '50'/>
		<input type = 'button' value = 'RUN' id = 'btnRun'/>
		<input type = 'button' value = 'WORKER' id = 'btnWorker'/>
		<input type = 'button' value = '구구단' id ='btnGuGu'/>
		<div id = 'result'></div>
	</div>
	
	<script>
		var btn = document.getElementById('btnRun');
		var btnWorker = document.getElementById('btnWorker');
		var rs  = document.getElementById('result');
		//worker 없이 1~1000까지의 합계를 매우 느린 처리 속도로 구함
		btn.onclick = function(){
			var sum =0;
			for(var i = 1; i<=1000; i++){
				sum += 1;
				for(var j=0; j<9999999; j++){}
			}
			rs.innerHTML = sum;
		}
		
		btnWorker.onclick = function() {
			var w = new Worker('worker_hap.js');
			w.onmessage= function(ev){
				rs.innerHTML = ev.data; //postMessage() 의해서 전달된 값은 ev.data에 저장
			}
		}
		
		btnGuGu.onclick = function(){
			var w = new Worker('worker_gugu.js');
			w.onmessage = function(ev){ //ev: event를 의미
				rs.innerHTML = ev.data;
			}
		}
		
		
	</script>
</body>
</html>