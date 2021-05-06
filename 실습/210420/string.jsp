<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>string</title>
</head>
<body>
	<div id ='string'>
		<script>
		var jumin='801212-1';
		//substr을 사용하여 년,월,일,성별을 구분
		var y = jumin.substr(0,2);
		var m = jumin.substr(3,2);
		var d = jumin.substr(5,2);
		var g = jumin.substr(7,1);
		console.log('년 : ' +  y);
		console.log('월 : ' +  m);
		console.log('일 : ' +  d);
		console.log('성별 : ' +  g);
		
		
		var str ='abcdefg';
		console.log(str.indexOf('c'));
		console.log(str.lastIndexOf('c'));
		console.log(str.charAt(2));
		
		console.log('----------------------');
		var n1=123;
		var n2='123';
		var n3='abc';
		var n4='abc123';
		
		console.log(parseInt('ff',16));
		console.log(n2+100);
		console.log(parseInt(n2)+100);
		
		console.log(isFinite(n1));
		console.log(isFinite(n2));
		console.log(isFinite(n3));
		console.log(isFinite(n4));
		
		console.log('----------------------');
		var sp='1,2,3,a,b,c,4,5,6';
		// 문자열을 ,로 분리하여 숫자형의 자료만 합계를 구하여 console에 출력
		var a = sp.split(',');
		var sum =0;
		console.log(a);
		for(var i in a){
			if(isFinite(a[i]))
				sum+=Number(a[i])                                                                                                                                                                                                                                        ;
		}
		console.log(sum);
		</script>
	</div>
</body>
</html>