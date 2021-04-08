<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content='width=device-width, initial-scale=1.0'>
<title>텍스트와 관련된 태그</title>
</head>
<body>
	<fieldset>
		<legend>Hn</legend>
		<ul>
			<li>범위는 h1~h6까지 사용 가능</li>
			<li>자동으로 굵게 표시됨</li>
			<li>위 아래 부분에 빈줄이 추가됨</li>
		</ul>
	</fieldset>

	<h1>가장 큰 heading</h1>
	<h6>가장 작은 heading</h6>
	<hr/>
	
	<fieldset>
		<legend>P | br | hr </legend>
		<ul>
			<li>문단을 만들어내는 태그</li>
			<li>아래에 한 줄의 공백이 추가됨</li>
			<li>br : 줄을 바꿔주는 태그</li>
			<li>hr : 수평선을 그어주는 태그 -> html5에서는 section을 구분해주는 기능으로 변경됨</li>
		</ul>
	</fieldset>
	
	<p>첫 번째 문단</p>
	<p>두 번째 문단</p>
	<p>세 번째 문단 <br/><br/> 줄을 바꾼 후 한 줄이 떨어짐 </p>
	<hr/>
	
	<fieldset>
		<legend>strong | b | em/i | q | mark | span </legend>
		<ul>
			<li>strong or b : 텍스트를 굵게 표시함</li>
			<li>em/i : 텍스트를 비스듬히 이탤릭체로 표시함</li>
			<li>q : 인용한 내용을 표기함. blockquote와 유사하지만 인라인 형태</li>
			<li>mark : 선택한 부분의 배경색이 노란색이 되며 형광펜 효과를 냄</li>
			<li>span : 텍스트 단락에서 줄바꿈없이 일부 텍스트만 묶어 스타일을 적용할 때 사용. 인라인 형태의 묶음</li>
		</ul>
	</fieldset>
	
	<strong>strong</strong>처럼 굵게 표시되고 <i>이탤릭체</i>로 나오기도 하며
	<q>하루를 공부하지 않으면 그것을...</q> 와 같이 인용할 수 있고
	<mark>중요 내용은</mark> 형광펜으로 칠할 수 있으며
	<span>span 태그는 영역을 인라인 형태로 묶을 수 있다.</span>
	
	<hr/>
	<h2>태그의 block 타입과 inline 타입의 비교</h2>
	block 타입은 갖고 있는 컨텐츠의 양이 적더라도 남아있는 오른쪽에 다른 요소들이 올 수 없고,
	inline 타입은 갖고 있는 컨텐츠의 양만큼만 영역을 차지하면서 남아있는 오른쪽에 다른 요소들을 올 수 있게 한다.
	CSS에서는 이 둘의 장점만 갖고 있는 inline-block 타입을 지원한다.
	<div>문단 1</div><div>문단 2</div><div>문단 3</div>
	
	<br/>
	<span>묶음 1</span>
	<span>묶음 2</span>
	<span>묶음 3</span>
	
	<hr/>
	
	
	
	
</body>
</html>