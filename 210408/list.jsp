<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<meta name = 'viewport' content = 'width=device-width, initial-scale=1.0'>
<title>목록 태그</title>
</head>
<body>
	<div id = 'list'>
		<h1>목록 태그</h1>
		
		<fieldset>
			<legend>목록 태그의 종류와 특징</legend>
			
			<ol>
				<li> ul : unordered list라는 의미이며, 항목에 기호문자를 붙여줌.</li>
					<ul type = 'disc'>
						<li>type = 'circle' : 속이 빈 동그라미</li>
						<li>type = 'disc' : 속이 찬 동그라미</li>
						<li>type = 'square' : 속이 찬 네모</li>
					</ul>
				<li> ol : ordered list라는 의미이며, 항목에 순서를 나타내는 번호를 붙여줌
					<ol type='I' start = '3'>
						<li>1 : 기호를 숫자로 나타냄</li>
						<li>a A : 기호를 알파벳으로 나타냄</li>
						<li>i I : 기호를 로마자로 나타냄</li>
						<li>type, start, reversed</li>
					</ol>
				<li> dl : description list라는 의미이며, 제목과 설명을 한 쌍으로 해서 목록으로 보여줌</li>
					<dl>
						<dt>HTML5</dt>
						<dd>현재 웹 표준으로 사용되고 있는 하이퍼 텍스트 마크업 언어이다.</dd>
						<dt>CSS3</dt>
						<dd>현재 HTML5와 같이 웹 표준 언어이며, 태그에 스타일을 지정해주는 속성</dd>
						<dt>JavaScript</dt>
						<dd>클라이언트용 인터프리터 언어이며, 브라우저에서 작동된다.</dd>
					</dl>
			</ol>		
		</fieldset>
	
		<h2>연습</h2>
		<div class = 'exam'>
			oracle, java, jsp, ajax, mybatis, spring, android 요소를 ol, li,
			설명을 포함한 dl 태그로 항목을 나열해보시오. 	
		</div>
		<hr/>
		<!--  //TODO -->
		<ol>
			<li>oracle : 미국 오라클사의 관계형 데이터베이스 관리 시스템의 이름</li>
			<li>java : 썬 마이크로시스템즈의 제임스 고슬링과 다른 연구원들이 개발한 객체 지향적 프로그래밍 언어</li>
			<li>ajax : 비동기적인 웹 애플리케이션의 제작을 위해 아래와 같은 조합을 이용하는 웹 개발 기법</li>
			<li>mybatis : 자바 퍼시스턴스 프레임워크의 하나로 XML 서술자나 애너테이션을 사용하여 저장 프로시저나 SQL 문으로 객체들을 연결시킴</li>
			<li>spring : 자바 플랫폼을 위한 오픈 소스 애플리케이션 프레임워크</li>
			<li>android : 휴대 전화를 비롯한 휴대용 장치를 위한 운영 체제와 미들웨어, 사용자 인터페이스 그리고 표준 응용 프로그램웹 브라우저, 이메일 클라이언트, 단문 메시지 서비스(SMS), MMS 등을 포함하고 있는 소프트웨어 스택이자 모바일 운영 체제</li>
		</ol>
		
		<dl>
			<dt>oracle</dt>
			<dd>미국 오라클사의 관계형 데이터베이스 관리 시스템의 이름</dd>
			<dt>java</dt>
			<dd>썬 마이크로시스템즈의 제임스 고슬링과 다른 연구원들이 개발한 객체 지향적 프로그래밍 언어</dd>
			<dt>ajax</dt>
			<dd>비동기적인 웹 애플리케이션의 제작을 위해 아래와 같은 조합을 이용하는 웹 개발 기법</dd>
			<dt>mybatis</dt>
			<dd>자바 퍼시스턴스 프레임워크의 하나로 XML 서술자나 애너테이션을 사용하여 저장 프로시저나 SQL 문으로 객체들을 연결시킴</dd>
			<dt>spring</dt>
			<dd>자바 플랫폼을 위한 오픈 소스 애플리케이션 프레임워크</dd>
			<dt>android</dt>
			<dd>휴대 전화를 비롯한 휴대용 장치를 위한 운영 체제와 미들웨어, 사용자 인터페이스 그리고 표준 응용 프로그램웹 브라우저, 이메일 클라이언트, 단문 메시지 서비스(SMS), MMS 등을 포함하고 있는 소프트웨어 스택이자 모바일 운영 체제</dd>		
		</dl>





	</div>
</body>
</html>