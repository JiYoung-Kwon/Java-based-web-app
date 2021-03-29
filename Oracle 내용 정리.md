# Oracle 내용 정리

✍️ *Written by JiYoung-Kwon*

<br/>

## 0장.

* 로그인

  * 시스템명 : system
  * 비밀번호 : 내가 설정한 PW

* 기존에는 user 앞에 C##을 붙여서 사용해야 했음

  -> 변경하는 법

  * ```sql
    alter session set "_ORACLE_SCRIPT" = true;
    ```

<br/>

## 1장.

* select는 CRUD의 Read에 해당

* 모든 컬럼 조회

  * ```sql
    SELECT * FROM EMPLOYEES e;
    ```

    * select - 조회
    * \* - 모든 컬럼
    * EMPLOYEES - 테이블명
    * e - 테이블명의 별칭(Alias) 옵션

* 원하는 컬럼 조회

  * ```sql
    SELECT first_name FROM EMPLOYEES;
    ```

* 컬럼 별칭 사용하여 조회

  * ```sql
    SELECT 10 + 10 FROM DUAL;  // 1.
    SELECT 10 + 10 hap FROM DUAL; // 2.
    ```

  * 1. | 10+10 |
       | :---: |
       |  20   |

  * 2. | HAP  |
       | :--: |
       |  20  |
  
* 중복 제거

  * 명령어 : DISTINCT

  * 예시

    * ```sql
      SELECT DISTINCT department_id FROM EMPLOYEES e;
      ```

  * 주의사항

    * ```sql
      SELECT DISTINCT department_id, employee_id FROM EMPLOYEES e ;
      ```

    * 둘이 합쳐서 Unique한 값만 추출 -> 중복 제거 시 주의

      * 1개의 컬럼에만 적어도 모든 컬럼에 적용됨

* 연결연산자

  * ||

    * 자바의 ||과 다르게 쓰이므로 주의할 것

  * ```sql
    SELECT first_name||' 사원의 부서코드는 ' ||DEPARTMENT_ID ||' 입니다.' FROM EMPLOYEES e2; 
    ```

* 원하는 조건만 골라내기

  * WHERE 절 사용

  * 문법

    * ```sql
      SELECT [Column or Expression]
      FROM [Table or View]
      WHERE 원하는 조건;
      ```

    * 순서가 바뀌면 안됨

    * 문자와 날짜를 조회하고 싶은 경우, 반드시 작은따옴표를 붙여야 함

* 다양한 연산자

  * 항상 좌변이 기준

  * BETWEEN a AND b : 사이 범위 값 모두

    * 두 값을 **포함하는** 결과를 출력함
    * BETWEEN 연산자보다 비교 연산자를 쓰는 것을 권장함
      * 속도 면에서 비교 연산자가 더 빠름

  * IN(a,b,c) : A이거나 B이거나 C인 조건

  * LIKE : 특정 패턴을 가지고 있는 조건

    * % : 글자수 제한 X, 어떤 글자가 와도 상관 없음
  * _ : 글자수는 한 글자만 올수 있음, 어떤 글자가 와도 상관 없음
  
  * **IS NULL / IS NOT NULL** 
  
  * 어떤 값인지 '모른다'
    * **관계연산자 = 로 구분할 수 없음!** ex) first_name = null
    * exception이 발생하지 않아, 오류 찾기가 어려움. 주의할 것!
  
* AND
  
    * 논리곱(∩)
  
      * | A    | B    | A and B |
        | ---- | ---- | ------- |
        | 1    | 1    | 1       |
      | 1    | 0    | 0       |
        | 0    | 1    | 0       |
      | 0    | 0    | 0       |
  
* OR
  
    * 논리합(∪)
  
      * | A    | B    | A and B |
        | ---- | ---- | ------- |
        | 1    | 1    | 1       |
      | 1    | 0    | 1       |
        | 0    | 1    | 1       |
        | 0    | 0    | 0       |
  
* 정렬하여 출력

  * ORDER BY 절
    * 오름차순은 ASC, 내림차순은 DESC로 표시
    * DEFAULT는 ASC
    * 정렬에 시간이 많이 걸림 
      * 다른 방법으로는 인덱스를 이용하는 방법이 있음 
      * 하지만, 모든 데이터에 인덱스를 만들었을 시, 오히려 수행속도가 더 걸리는 경우도 있음 (데이터 추가 삭제 시, 인덱스 변경)
      * 따라서, 경우에 따라 적절하게 사용하는 것이 좋음
