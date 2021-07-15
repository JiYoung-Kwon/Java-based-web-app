## web worker

- 브라우저 상에서 멀티 스레드를 구현하는 방법
- HTML, CSS의 구조를 변경하는 작업은 불가

작성절차

1. 객체를 생성

   `var w = new Worker('자바스크립트 파일명')`

2. 워커로부터 메시지 수신

   `w.onmessage = callback 함수`

3. 워커가 메시지를 전송

   `postMessage('메세지')`




