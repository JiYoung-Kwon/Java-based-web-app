<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>mouseover</title>
<style>
	#mouseover .img img{
		width:90px;
		height:80px;
		float:left;
	}
	#mouseover .imgs{
		display:flex;
		flex-direction:row;
		gap:5px;
	}
	#mouseover .imgs img{
		width:86px;
		height:80px;
	}
</style>
</head>
<body>
	<div id ='mouseover'>
		<img src = 'http://placehold.it/540x400' id ='here' width='540' height='400'><br/>
		<div class = 'imgs'>
			<img src = '../imgs/pic1.jpg' onmouseover = 'mover(0)'/>
			<img src = '../imgs/pic2.jpg' onmouseover = 'mover(1)'/>
			<img src = '../imgs/pic3.jpg' onmouseover = 'mover(2)'/>
			<img src = '../imgs/pic4.jpg' onmouseover = 'mover(3)'/>
			<img src = '../imgs/pic5.jpg' onmouseover = 'mover(4)'/>
			<img src = '../imgs/pic6.jpg' onmouseover = 'mover(5)'/>
		</div>
	</div>
	
	<script>
		var imgs = ['pic1.jpg', 'pic2.jpg', 'pic3.jpg', 'pic4.jpg', 'pic5.jpg', 'pic6.jpg'];
		function mover(n){
			var here = document.getElementById('here');
			here.src = '../imgs/' + imgs[n];
		}
	</script>
</body>
</html>