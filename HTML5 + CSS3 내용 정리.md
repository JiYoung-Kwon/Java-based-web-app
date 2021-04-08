# HTML5 + CSS3 내용 정리

✍️ *Written by JiYoung-Kwon*

<br/>

* 정리되지 않은 내용은 책을 참고!

***

* tomcat 설치 시 주의사항
  1. server port : 8080 -> 8888 (오라클과 충돌)
  2. admin 계정/암호 기억하기
  3. 시작옵션 : 수동

* 이클립스 jsp 생성 시 오류 해결방안

  * ![6](./resources/6.png)

  * Java Build Path - Libraries - add library - Server Runtime - tomcat 버전 선택 - apply

* 이클립스 톰캣 서버 실행 시 오류
  * ![7](./resources/7.png)
  * 서버 Open - Overview - Ports - Tomcat admin port의 포트 번호를 임의의 겹치지 않는 포트로 변경

## 1장.

### 1-1. HTML

* HTML (HyperText Markup Language)
  * 하이퍼텍스트 : 웹 사이트에서 링크를 클릭해 다른 문서나 사이트로 즉시 이동할 수 있는 기능
  * 마크업 : 태그를 사용해 문서에서 어느 부분이 제목이고 본문인지, 어느 부분이 사진이고 링크인지 표시하는 것
  * 즉, 웹에서 자유롭게 오갈 수 있는 웹 문서를 만드는 언어
  * **특징**
    1. 대소문자를 구별하지 않음
    2. 두 칸 이상의 공백은 구별하지 않음
       * 띄어쓰기 : `&nbsp;`
    3. 줄바꿈(엔터키)을 인식하지 않음
    4. 큰따옴표, 작은 따옴표를 구분하지 않음
       * 묵시적으로 작은 따옴표를 쓰는 경우가 많음

***

1-2. 웹 브라우저와 웹 편집기 => PASS

***

### 1-3. HTML 기본 문서 구조

* 태그는 <와 >을 이용해 구분
* 태그는 소문자로 사용할 것을 권장
* 여는 태그, 닫는 태그 정확히 입력할 것
* 적당히 들여쓰기 (가독성)
* HTML 문서 기본 구조
  * \<!doctype> : 문서 유형 지정
    * 이제부터 처리할 문서는 HTML 이고, 어떤 유형을 사용할 것이니 알맞게 해석해라
  * \<html> : 웹 문서 시작을 알림
    * lang 속성 : 문서에서 사용할 언어를 지정
      * html -> 전자문서를 만들 경우, 속성 표시를 안하면 한글이 깨질 수 있음
      * `<html lang = "ko">`
    * ![img](https://mblogthumb-phinf.pstatic.net/MjAxODEyMjhfMjk0/MDAxNTQ1OTgzNzMzNjE3.Mo9Q2ZN5VxmeBm5sXrLBweDKePlGZJMYd9i6E_K2Rusg.9X1ZkuCfX0jfH4CIJlbo2fqVG8Lnk7k1rU6sHQNqzoQg.PNG.mathesis_time/image.png?type=w800)
  * \<head> : 브라우저에게 정보를 줌
    * \<title> : 문서 제목
    * \<meta> : 문자 세트를 비롯한 문서 정보
      * `<meta charset = "UTF-8">` : utf-8이라는 문자 세트를 사용한다.
      * 모바일 기기 고려하기
        * 모바일을 고려하지 않을 시, 시장에서 도태될 수 있음
        * 과거 : 풀 브라우징(컴퓨터에서 보이는 웹과 같이 전체적으로 다 보이는 것)
        * 현재 : 반응형 웹이 대세
        * `<meta name = 'viewport' content='width=device-width, initial-scale=1.0'>`
          * viewport를 써주지 않으면 풀 브라우징 기반 -> 글씨가 작게 보일 수 있음
          * device-width : 디바이스가 가진 넓이
          * initial-scale = 1.0 : 확대모드를 1.0으로 설정
  * \<body> : 실제 브라우저에 표시될 내용

<br/>

***

### 1-4. 웹 문서 업로드

* 위 세 가지는 개발자라면 사용할 줄 알아야 함 (한 번쯤은 해볼 것)
  1. 원격 터미널
  2. FTP (FTP 프로그램 중, FileZila를 무료로 사용할 수 있음)
  3. GIT

<br/>

## 2장.

:pushpin: **block 타입**

* 갖고 있는 컨텐츠의 양이 적더라도 남아있는 오른쪽에 다른 요소들이 올 수 없다.

:pushpin: **inline 타입**

* 갖고 있는 컨텐츠의 양만큼만 영역을 차지하면서 남아있는 오른쪽에 다른 요소들을 올 수 있게 한다.

:pushpin: CSS에서는 이 둘의 장점만 갖고 있는 **inline-block** 타입을 지원함

<br/>

***

### 2-1. 블록 형태

* 텍스트를 블록으로 묶어 처리하는 태그

* \<h*n*> : 제목 표시

  * heading의 줄임말 h, 제목 크기를 나타내는 숫자(1~6)

  * \<h1>이 가장 큰 제목, \<h6>이 가장 작은 제목

* \<p> : 단락

* \<br> : 줄 바꿈

* \<hr> : 수평 줄 넣기 -> html5에서는 section을 구분해주는 기능으로 변경

<br/>

***

### 2-2. 인라인 형태

* 줄바꿈 없이 텍스트를 표시

* \<strong> or \<b> : 텍스트를 굵게 표시함
  * strong은 중요함의 의미, b는 단순히 글자를 굵게 표시한다는 의미
* \<em>/\<i> : 텍스트를 비스듬히 이탤릭체로 표시함
* \<q> : 인용한 내용을 표기함. blockquote와 유사하지만 인라인 형태
* \<mark> : 선택한 부분의 배경색이 노란색이 되며 형광펜 효과를 냄
* \<span> : 텍스트 단락에서 줄바꿈없이 일부 텍스트만 묶어 스타일을 적용할 때 사용. 인라인 형태의 묶음
  * 블록 단위로 묶고 싶다면 \<div> 사용

<br/>

***

### 2-3. 목록 태그

* **css의 중첩을 최대한 예방하기 위해서** 보통 body 안에 \<div id= '파일명'>으로 영역 설정
  * id는 하나만 존재해야 함
  * 구체적으로 폴더명_파일명이라고 기술하는 경우도 있음
*  \<ul> : unordered list라는 의미이며, 항목에 기호문자를 붙여줌.
  * type = 'circle' : 속이 빈 동그라미
  * type = 'disc' : 속이 찬 동그라미
  * type = 'square' : 속이 찬 네모
*  \<ol> : ordered list라는 의미이며, 항목에 순서를 나타내는 번호를 붙여줌 		
  * 1 : 기호를 숫자로 나타냄
  * a A : 기호를 알파벳으로 나타냄
  * i I : 기호를 로마자로 나타냄
  * type, start, reversed
*  \<dl> : description list라는 의미이며, 제목과 설명을 한 쌍으로 해서 목록으로 보여줌