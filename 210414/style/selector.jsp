<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>선택자</title>
<style>
#selector .inheri div {
	color: #ff0000;
}

#selector .child>span {
	color: #0000ff;
}

#selector .near + span{
	color:#ff0000;
}

#selector .sibil ~span{
	color : #ff0000;
}

#selector input[abc]{
	background-color:#0000ff;
}
</style>
</head>
<body>
	<div id ='selector'>
		<fieldset>
			<legend>선택자</legend>
			<dl>
				<dt>후손 선택자</dt>
				<dd>
				- 두 선택자 사이에 빈 공백으로 표현<br/>
				- ex) p div {...} => p 태그 안에 있는 모든 div가 선택됨.
				</dd>
				<dt>자손 선택자</dt>
				<dd>
				- 두 선택자 사이에 >를 입력하여 표현<br/>
				- ex) p>div {...} => p 태그 안에 있는 1단계들의 div가 선택됨.
				</dd>
				<dt>인접 선택자</dt>
				<dd>
				- ex) p+div => p 태그의 바로 다음에 있는 div가 선택됨.
				</dd>
				<dt>형제 선택자</dt>
				<dd>
				- ex) p~div => p 태그 뒤에 있는 모든 div가 선택됨.
				</dd>
				</dl>
		</fieldset>
		
		
		<h2>후손 선택자</h2>
		<div class='inheri'>
			<div>A
				<div>B</div>
			</div>
		</div>
		
		<h2>자손 선택자</h2>
		<div class='child'>
			<span>A</span>
			<p>
				<span>B</span>
			</p>
		</div>
		
		
		<h2>인접 선택자</h2>
		<div class='near'> NEAR</div>
		<span>A</span>
		<span>B</span>
		<span>C</span>
		
		<h2>형제 선택자</h2>
		<div class='sibil'> SIBIL</div>
		<span>A</span>
		<label>B</label>
		<span>C</span>
		
		<h2>속성 선택자</h2>
		<input type='button' value='A' a='a'/>
		<input type='button' value='B' a='b'/>
		<input type='button' value='C' abc='here'/>
		
	</div>
</body>
</html>