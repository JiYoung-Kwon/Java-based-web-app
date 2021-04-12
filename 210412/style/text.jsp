<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = 'ko'>
<head>
	<meta charset="UTF-8">
	<meta name = 'viewport' content = 'width=device-width, initial-scale=1.0'>
	<title>텍스트 스타일</title>
	<style>
		/*text-shadow안에 있는 문자의 색상과 크기를 변경*/
		#text #text-shadow{
			font-size:60pt;
			color: #ff00ff;
			font-weight:bold;
			text-shadow:5px 5px 3px #000000;
		}
		
		#white-space div{
			border:1px solid #aaaaaa;
			padding:10px;
			width: 800px;
			margin:10px;
		}
		
		#white-space .type1{
			white-space: nowrap;
			overflow : hidden;
			text-overflow: ellipsis;
		}
		
		#white-space .type2{
			white-space : pre-line;
		}
		
		#white-space .type3{
			white-space : pre-wrap;
		}
		
		#line-height {
			border: 2px solid #888;
			width:300px;
			height:250px;
			font-size:4em;
			/* padding-top:80px; */
			line-height:250px;
			box-sizing:border-box;
		}
	</style>
</head>
<body>
	<div id = 'text'>
		<h1>text-shadow</h1>
		<div id = 'text-shadow'>
			권지영
		</div>
		
		<div id = 'white-space'>
			<div class ='type1'>
			얼음에 밥을 위하여 따뜻한 천하를 아니다. 것은 안고, 그들은 못할 시들어 온갖 얼마나 것이다.보라, 주며, 운다. 이상의 피가 있음으로써 때에, 미묘한 가치를 되려니와, 우리 봄바람이다. 할지니, 우리 하여도 때까지 우리 이는 것이다. 것은 구할 쓸쓸한 것이다. 할지라도 그들의 새가 착목한는 곳이 하는 긴지라 이상이 것이다. 그들은 맺어, 더운지라 많이 열매를 눈에 고행을 하였으며, 철환하였는가?
			</div>
			
			<div class ='type2'>
			얼음에 밥을            위하여       따뜻한 천하를 아니다. 것은 안고, 그들은 못할 시들어 온갖 얼마나 것이다.보라, 주며, 운다. 이상의 피가 있음으로써 때에, 미묘한 가치를 되려니와, 우리 봄바람이다. 할지니, 우리 하여도 때까지 우리 이는 것이다. 것은 구할 쓸쓸한 것이다. 할지라도 그들의 새가 착목한는 곳이 하는 긴지라 이상이 것이다. 그들은 맺어, 더운지라 많이 열매를 눈에 고행을 하였으며, 철환하였는가?
			</div>
			
			<div class ='type3'>
			얼음에 밥을       위하여 따뜻한 천하를 아니다. 것은 안고, 그들은 못할 시들어 온갖 얼마나 것이다.보라, 주며, 운다. 이상의 피가 있음으로써 때에, 미묘한 가치를 되려니와, 우리 봄바람이다. 할지니, 우리 하여도 때까지 우리 이는 것이다. 것은 구할 쓸쓸한 것이다. 할지라도 그들의 새가 착목한는 곳이 하는 긴지라 이상이 것이다. 그들은 맺어, 더운지라 많이 열매를 눈에 고행을 하였으며, 철환하였는가?
			</div>
		</div>
		
		<div id = 'line-height'>
			권지영
		</div>
	</div>
</body>
</html>