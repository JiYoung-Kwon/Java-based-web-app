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

* 집합 연산자

  * UNION - 두 집합 결과 합쳐서 출력, 중복값 제거, 정렬

  * UNION ALL - 두 집합 결과 합쳐서 출력, 중복값 제거 X, 정렬 X

  * INTERSECT - 교집합 결과 출력 및 정렬

  * MINUS - 차집합 결과 출력 및 정렬. 쿼리 순서 중요

  * ```sql
    SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY FROM EMPLOYEES e 
    UNION
    SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY FROM emp;
    ```

<br/>

## 2장.

* 단일행 함수
  * 한 번에 하나씩 처리하는 함수
  * 정리하지 않은 함수들은 책 내용 참고

1. 문자 함수

   * UPPER / LOWER : 전부 대문자/소문자 변환

     * ```sql
       SELECT UPPER(FIRST_NAME),LOWER(LAST_NAME) FROM EMPLOYEES e ;
       ```

   * LENGTH : 길이값 출력

     * ```sql
       SELECT FIRST_NAME 성명, EMAIL 이메일 ,LENGTH(EMAIL) 이메일길이 FROM EMPLOYEES;
       ```

   * CONCAT : 두 문자열 결합해 출력 (||과 동일)

     * ```sql
       SELECT CONCAT(EMAIL,'@korea.com') 이메일 FROM EMPLOYEES
       WHERE DEPARTMENT_ID = 100;
       ```

   * LPAD / RPAD : 왼쪽/오른쪽 특정 문자 채움

     * ```sql
       SELECT FIRST_NAME 성명,LPAD(SALARY,10,'*') 급여 FROM EMPLOYEES e 
       WHERE FIRST_NAME LIKE '%th%';
       //급여를 10자리로 설정, 원래 데이터를 오른쪽에 두고 빈자리는 *로 채움
       //출력 형식 : Timothy | ******2900 
       ```

   * REPLACE : 문자열 치환

     * ```sql
       SELECT FIRST_NAME , REPLACE(FIRST_NAME, SUBSTR(FIRST_NAME,1,2) ,'**') FROM EMPLOYEES e ;
       // 이름의 앞 두자리는 '**'으로 변환하여 조회
       ```

2. 숫자 관련 함수

   * CEIL - 절상. 가장 근접한 큰 정수 출력

   * FLOOR - 절삭. 가장 근접한 작은 정수 출력

     * ```sql
       SELECT FIRST_NAME 성명, SALARY 급여, SALARY *0.1 세금, FLOOR(SALARY+SALARY*0.1) FROM EMPLOYEES e ;
       ```

3. 날짜 관련 함수

   * SYSDATE - 시스템의 현재 날짜와 시간

   * MONTHS_BETWEEN - 두 날짜 사이의 개월 수

     * ```sql
       --29) 본인이 살아온 개월수를 계산
       SELECT MONTHS_BETWEEN(SYSDATE,'1998/04/16') FROM DUAL;
       ```

4. 형 변환 함수

   * TO_CHAR(날짜 -> 문자)
     * 날짜 표현
       * 연도 : RRRR - Y2K 버그로 인해 등장한 연도 4자리 표기법
       * 월 : MM
       * 일 : DD
       * 시간 : HH / HH24
       * 분 : MI
       * 초 : SS
   * TO_CHAR(숫자 -> 문자)
   * TO_NUMBER(문자 -> 숫자)
   * TO_DATE (날짜처럼 생긴 문자 -> 날짜)

5. 일반 함수

   * NVL - NULL 값을 만나면 다른 값으로 치환해서 출력

     * ```sql
       SELECT FIRST_NAME 성명, SALARY 급여, NVL(SALARY *COMMISSION_PCT,0) 보너스
       FROM EMPLOYEES e ;
       ```

   * DECODE - IF문을 ORACLE SQL안으로 가져온 함수

     * ```sql
       SELECT FIRST_NAME ,SALARY, DEPARTMENT_ID, DECODE(DEPARTMENT_ID,100,SALARY*.5,SALARY*.1) 보너스
       FROM EMPLOYEES e2 ;
       ```

   * CASE

     1. ```sql
        -- DECODE문과 유사
        CASE 조건
        	WHEN 결과1 THEN 출력 1
        [	WHEN 결과2 THEN 출력 2
        	...
        	ELSE 기타출력
        ]
        END '컬럼명'
        ```

     2. ```sql
        -- IF와 유사
        CASE
        	WHEN 조건1 THEN 출력 1
        [	WHEN 조건2 THEN 출력 2
        	...
        	ELSE 기타출력
        ]
        END '컬럼명'
        ```

6. 정규식(Regular Expression) 함수

   * 유닉스에서 사용하는 정규식을 사용하여 다양한 검색을 할 수 있음
   * REGEXP_LIKE 함수 - 특정 패턴과 매칭되는 결과를 검색

<br/>

## 3장.

* 복수행 함수(그룹 함수)
  * 여러 건의 데이터를 동시에 입력받아 결괏값 1건을 만들어주는 함수
  * 정리하지 않은 함수들은 책 내용 참고
  * 집계함수
    * count () - 입력되는 데이터의 총 건수를 반환
    * sum() - 입력된 데이터들의 합계 값을 구하는 함수
    * avg() - 입력된 값들의 평균 값을 구해주는 함수
  * GROUP BY 절
    * **유의 사항**
      1. select 절에는 group by 절에서 사용한 컬럼명만 사용 가능
      2. 만약 group by 절에서 사용한 컬럼명이 아닌 경우, 반드시 **집계함수** 내에서 사용해야 함!!

  * HAVING 절
    * 그룹 함수를 비교 조건으로 사용하고 싶을 경우
      * WHERE 절은 그룹 함수를 비교 조건으로 쓸 수 없음

## 4장.

* 정규화 -> 비정규화가 최종목적

  * 비정규화
    * 필요에 따라서 테이블이 쪼개진 상태인데, 성능,사용성 등의 요인으로 다시 두 개 이상의 테이블이 다시 하나로 합쳐지는 상태
  * 정규화
    * 중복데이터를 배제, NULL 값 배제

* 카디션 곱(Cartesian Product)

  * 조인 조건절을 잘못 기술하거나 적지 않을 경우, 해당 테이블에 대한 모든 데이터를 전부 가져오는 현상 
  * 참조되는 테이블 행 수를 모두 곱한 값의 결과가 만들어짐

* EQUI Join (등가 조인) - 기본

  * 선행 테이블에서 데이터를 가져온 후, 조인 조건절을 검사해 동일한 조건을 가진 데이터를 후행 테이블에서 꺼내 오는 방법

* Non-Equi Join (비등가 조인)

  * 서로 틀린 것만 가져오는 것. 잘 사용하지 않음

* **OUTER Join (아우터 조인)**

  * Inner Join : 참여하는 모든 테이블에 데이터가 존재하는 경우에만 결괏값을 출력

  * 한쪽에는 데이터가 있고 한쪽에는 없는 경우, 있는 쪽 내용을 전부 출력

  * ANSI Join 구문 : LEFT OUTER JOIN

  * ```sql
    SELECT d2.DEPARTMENT_ID, DEPARTMENT_NAME, FIRST_NAME 
    FROM DEPARTMENTS d2 LEFT OUTER JOIN EMPLOYEES e2 
    ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID ;
    ```

* **SELF Join**

  * 자주 사용

  * 원하는 데이터가 하나의 테이블에 다 들어있을 경우

  * ```sql
    SELECT e.first_name, e.EMAIL FROM EMPLOYEES e JOIN EMPLOYEES l
    ON TO_CHAR(e.HIRE_DATE,'RRRR') =  TO_CHAR(l.HIRE_DATE,'RRRR')
    WHERE l.FIRST_NAME = 'Luis';
    ```

<br/>

## 5장.

* DDL : Data Definition Language(데이터 정의 언어)

1. CREATE - 새로 생성하라

   ```sql
   * 문법
   CREATE TABLE 테이블명(
   	컬럼명 컬럼유형 옵션,
   	...
   );
   ```

   * 값을 입력하지 않을 경우 자동으로 NULL값이 입력됨
   * 기본 값으로 특정값 지정
     * DEFAULT 특정 값

2. ALTER - 수정,변경

   * 새로운 컬럼 추가 : ADD
   * 테이블 컬럼 이름 변경 : RENAME
     * 번외) 테이블명 변경 `RENAME dept6 TO dept7`
   * 컬럼 유형(데이터 크기) 변경 : MODIFY
   * 컬럼 삭제 : DROP

3. 삭제 명령 비교

   * TRUNCATE : 구조만 남는다.
   * DROP : 남아있는 것이 없다.
   * DELETE : 구조와 데이터가 저장되어 있던 공간만 남는다.

4. Data Dictionary(데이터 딕셔너리)
   * 오라클은 DB를 운영하기 위한 정보를 모두 특정 테이블에 모아두고 관리함. 이 테이블

<br/>

## 6장.

