<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>array</title>
</head>
<body>
	<div id='array'>
		<h2>배열 선언</h2>
		<script>
			var array1 = new Array(5);
			console.log('array1.length='+array1.length);
			array1[0]=90;
			array1[1]=80;
			array1[2]=70;
			array1[3]=60;
			array1[4]=50;
			var sum = 0;
			for(var i in array1){
				sum += array1[i];
			}
			console.log('sum:'+sum);	
		</script>
		
		<h2>JSON으로 배열 선언</h2>
		<script>
			var array2=[10,200,30,40,50];
			var max=array2[0];
			for(var i in array2){
				if(max < array2[i])
					max = array2[i];
			}
			console.log('max:'+max);
		</script>
		
		<h2>2차원 배열 선언</h2>
		<script>
			var array3 = new Array(3);
			array3[0] = new Array(5);
			array3[1] = new Array(3);
			array3[2] = new Array(2);
			
			console.log('배열의 행수 :' + array3.length);
			console.log('첫 번째 행의 칸수 :' + array3[0].length);
		</script>
		
		<h2>두 배열을 하나로 합치기</h2>
		<script>
			var mnt = ['백두산','한라산','지리산','금강산','내장산'];
			var river = ['한강','두만강','낙동강','금강'];
			
			console.log('산이름 : '+mnt);
			console.log('강이름 : '+river);
			console.log('전체 : '+mnt.concat(river));
		
			console.log('join : ' +mnt.join('*^^*'));
			
			console.log('sort : ' +mnt.sort());
			
			//임의의 수를 배열에 저장한 후 정렬 전,후를 비교하도록 배열을 출력하시오.
			var array4 = [10,123,154,225,4,13,526,224,7,11];
			console.log('정렬 전 : '+array4);
			console.log('정렬 후 : '+array4.sort());
			
			
		</script>
	</div>
</body>
</html>