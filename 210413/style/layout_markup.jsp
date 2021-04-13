<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>layout-markup</title>
<style>
	#layout_markup {
		width: 960px;
		padding: 20px;
		margin: 0 auto;
	}
	
	#layout_markup>div {
		border: 1px solid #ccc;
	}
	
	#layout_markup #header{
		padding : 20px;
		margin-bottom : 20px;
	}
	
	#layout_markup #contents{
		width:620px;
		padding:20px;
		float:left;
		margin-bottom : 20px;
	}
	
	#layout_markup #sidebar{
		width : 220px;
		padding : 20px;
		float: right;
		margin-bottom:20px;
		background-color : #ddd;
	}
	
	#layout_markup #footer{
		clear:both;
		padding:20px;
	}

</style>
</head>
<body>
	<div id='layout_markup'>
		<div id="header">
			<h1>Layout</h1>
		</div>
		<div id='sidebar'>
			<h2>side bar</h2>
			<ul>
				<li>그들의 설레는 싹이 천하를 사람은 뭇 있으랴? 청춘의 그들의 피가 인생에 소금이라 것이다. 길을 우리의
					그들은 것은 기관과 때까지 그리하였는가?</li>
			</ul>
		</div>
		<div id='contents'>
			<h2>contents</h2>
			<p>능히 커다란 인간의 노래하며 사랑의 청춘의 그러므로 듣는다. 이상은 착목한는 끓는 행복스럽고 황금시대다. 수
				광야에서 이상 무한한 인생에 아름답고 현저하게 많이 운다. 피어나는 같은 주며, 미인을 귀는 희망의 청춘을 같으며,
				때문이다. 대고, 사랑의 구하지 봄바람을 이상 속에 그들에게 가장 쓸쓸하랴? 피부가 위하여, 방지하는 속에서 것이다. 우리
				지혜는 불어 천자만홍이 아니다. 새 힘차게 대한 위하여 이상 실로 수 것은 약동하다. 사는가 없으면, 위하여서, 뿐이다.</p>

			<p>가지에 능히 내려온 사랑의 피고, 얼음에 쓸쓸하랴? 풍부하게 것은 트고, 힘있다. 이것을 귀는 기쁘며, 피어나는
				피어나기 이 것이다. 그들의 밝은 천하를 얼마나 이것이야말로 없으면, 끓는 간에 힘있다. 천하를 소금이라 타오르고 얼마나
				위하여 것이다. 얼음에 청춘은 과실이 만천하의 노래하며 뿐이다. 목숨이 뭇 길을 그들은 시들어 것이다.보라, 이상의 인생의
				듣는다. 이상은 하여도 것은 크고 수 두손을 그것을 찾아 때문이다. 길을 우리 꾸며 위하여 주며, 불어 청춘 것이다.
				그들에게 얼마나 그들은 보배를 사막이다.</p>
		</div>
		<div id='footer'>
			<h2>footer</h2>
			<p>우리 얼마나 원대하고, 착목한는 힘차게 있는 속잎나고, 쓸쓸하랴? 사랑의 하는 충분히 역사를 행복스럽고 보이는
				이상의 간에 사막이다.</p>
		</div>
	</div>
</body>
</html>