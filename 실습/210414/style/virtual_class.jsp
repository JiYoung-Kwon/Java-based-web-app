<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>virtual_class</title>
<style>
	*{
		margin : 0;
		padding : 0;
		box-sizing : border-box;
	}
	
	h2{
		margin-left : 100px;
	}
	
	#virtual_class .menu ul{
		margin-top:60px;
		margin-left : 100px;
		width : 60%;
		height : 30px;
		padding:4px;
		background-color:#4444ff;
		box-shadow: 2px 2px 3px 0px #aaa;
		border-radius:5px;
	}
	
	#virtual_class .menu li{
		list-style:none;
		float: left;
		width : 90px;
		height : 23px;
		text-align:center;
		color : white;
		border-radius:5px;
	}
	
	#virtual_class .menu li:hover{
		color:#4444ff;
		background-color :#fff;
	}
	
	/* 메뉴에 마우스가 올라가면 서브 메뉴 보여주기 */
	#virtual_class .menu li:hover .submenu{
		display:block;
	}
	
	/* 짝수번째 메뉴의 바탕색을 변경 */
	#virtual_class .menu li:nth-child(2n){
		color: #00ff00;
	}
	
	/* 첫번째 메뉴와 마지막 메뉴의 색상을 빨강 */
	#virtual_class .menu li:first-child{
		color : #ff0000;
	}
	
	#virtual_class .menu li:last-child{
		color : #ff0000;
	}
	
	#virtual_class .menu .submenu{
		display:none;
	}
	
	#virtual_class .menu .submenu ul{
		width : 90px;
		height : 115px;
		background-color:white;
		border: 2px solid #4444ff;
		margin : 0;
		padding:0;
		margin-top : 2px;
	}
	
	#virtual_class .menu .submenu li{
		color : black;
		width : 80px;
		margin : 2px;
	}
	
	#virtual_class .menu  .submenu li:hover{
		background-color:#4444ff;
		color:white;
	}
</style>
</head>
<body>
	<div id = 'virtual_class'>
		<h2>가상 클래스, 요소를 사용한 메뉴 설계</h2>
		<div class ='menu'>
			<ul>
				<li>MENU1
					<div class = 'submenu'>
						<ul>
							<li> sub 1</li>
							<li> sub 2</li>
							<li> sub 3</li>
							<li> sub 4</li>
						</ul>
					</div>
				</li>
				<li>MENU2
					<div class = 'submenu'>
						<ul>
							<li> sub 1</li>
							<li> sub 2</li>
							<li> sub 3</li>
							<li> sub 4</li>
						</ul>
					</div>
				</li>
				<li>MENU3</li>
				<li>MENU4</li>
				<li>MENU5</li>
				<li>MENU6</li>		
			</ul>
		</div>
	</div>
</body>
</html>