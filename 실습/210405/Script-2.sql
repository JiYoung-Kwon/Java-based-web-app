-------------------------------------------------------
-- DDL (create, truncate, drop, alter)
-------------------------------------------------------

--61) student(id, irum, phone, address, email) 테이블 생성
CREATE TABLE student(
	id varchar(20),
	irum varchar(30),	
	phone varchar(50),
	address varchar(100),
	email varchar(50)
);

--62) student 테이블을 완전 삭제(데이터+구조)
DROP TABLE STUDENT ;

--63) 삭제된 테이블 student를 다시 생성한 후, 암호, 학년 컬럼을 alter 명령을 사용하여 추가
ALTER TABLE STUDENT 
ADD (
	pwd varchar(20),
	grade NUMBER(2)
);

--64) student 테이블에 score(number) 컬럼을 추가한 후, 다시 score 컬럼을 삭제
ALTER TABLE STUDENT ADD (score NUMBER(2));
ALTER TABLE STUDENT DROP COLUMN score;

--65) student 테이블의 id 컬럼명을 mid로 수정
ALTER TABLE STUDENT RENAME COLUMN id TO mid;

--66) student 테이블의 phone 컬럼의 크기를 30으로 수정
ALTER TABLE STUDENT MODIFY (phone varchar(30));

--67) score 테이블을 아래와 같은 구조로 생성하시오
-- serial number, mid varchar(20), subject varchar(30), score number(4)
CREATE TABLE score(
	serial number,
	mid varchar(20),
	subject varchar(30),
	score number(4)
);

-- 68) 임의의 데이터를 score에 입력한 후 truncate 명령을 사용하여 데이터만 삭제.
INSERT INTO SCORE (serial, mid, subject, score)
VALUES(100,'hong','영어',100);

COMMIT; -- insert, update, delete 명령을 확정짓는 명령. (rollback : 취소)

SELECT * FROM SCORE;

TRUNCATE TABLE SCORE; -- 구조만 남음

SELECT * FROM SCORE;

-------------------------------------------------------
-- DML (insert, update, delete, merge)
-------------------------------------------------------

-- 1) INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...) values(값1, 값2, ...);
-- 2) INSERT INTO 테이블명 values(값1, 값2, ...);
--모든 컬럼의 순서대로 값을 모두 입력하려 할 때는 테이블명 뒤에 있는 컬럼명을 생략할 수 있다.
-- 3) INSERT INTO 테이블명 SELECT 절 사용
-- 4) 여러 테이블에 동시에 같은 값을 입력할 때
--    INSERT ALL 
--	  INTO 테이블명1 values(컬럼명1, 컬럼명2, ...)
--	  INTO 테이블명2 values(컬럼명1, 컬럼명2, ...)
--	  SELECT 절

--69) score 테이블에 hong, kim 성적 정보를 입력하시오.
-- (1, hong, 국어, 90)
-- (2, kim, 영어, 80)
INSERT INTO SCORE(SERIAL,MID,SUBJECT,SCORE) VALUES(1,'hong','국어',90);
INSERT INTO SCORE(SERIAL,SCORE,MID,SUBJECT) VALUES(2, 80,'kim','영어');

--70) 컬럼명을 생략하여 아래의 점수를 입력하시오.
-- (3, park, 수학, 80)
INSERT INTO SCORE VALUES(3,'park','수학',80);

--71) score 테이블의 구조를 사용하여 tempScore 테이블을 생성하시오.
CREATE TABLE tempScore
AS
SELECT * FROM SCORE
WHERE 1=2;

--72) score 테이블의 모든 데이터를 tempScore에 저장.
INSERT INTO TEMPSCORE
SELECT * FROM SCORE;

--73) score 테이블의 자료 중 국어점수에 해당하는 자료만 tempScore에 저장
INSERT INTO TEMPSCORE
SELECT * FROM SCORE
WHERE SUBJECT = '국어';

--74) score 테이블의 구조를 사용하여 imsiScore 테이블을 생성한 뒤, 
-- 	  insert all을 사용하여 score 테이블의 모든 데이터를 tempScore, imsiScore 테이블에 저장
CREATE TABLE IMSISCORE
AS
SELECT * FROM SCORE
WHERE 1=2;

INSERT ALL
INTO tempScore VALUES(SERIAL,MID,SUBJECT,SCORE)
INTO imsiScore VALUES(SERIAL,MID,SUBJECT,SCORE)
SELECT * FROM SCORE;

SELECT * FROM tempScore;
SELECT * FROM imsiScore;

-- update 테이블명 set 컬럼명1= 수정값1, 컬럼명2= 수정값2, ... where 조건
-- update 테이블명 set 컬럼명1= 수정값1, 컬럼명2= 수정값2, ... where 컬럼명=(sub query)

--75) hong의 국어 성적을 100점으로 수정하시오.
UPDATE SCORE SET score = 100 WHERE mid = 'hong' AND SUBJECT = '국어';

--76) park의 과목을 수학에서 영어로 수정하시오.
UPDATE SCORE SET subject = '영어' WHERE MID = 'park' AND SUBJECT ='수학';

SELECT * FROM SCORE;

-- delete from 테이블명 where 조건

--77) tempScore에 있는 자료 중 hong의 국어 성적 자료를 모두 삭제
DELETE FROM tempscore WHERE mid = 'hong' AND subject = '국어';
--78) imsiScore에 있는 모든 자료를 삭제
DELETE FROM imsiScore;

SELECT * FROM tempScore;
SELECT * FROM imsiScore;

-------------------------------------------------------
-- TCL (commit, rollback)
-------------------------------------------------------

-- DBeaver의 commit 옵션을 Auto -> Manual type으로 수정
-- SQL Plus를 열어서 hr 유저로 로그인

--79) tempScore의 데이터를 모두 삭제한 후 commit 전 확인, rollback 확인
SELECT * FROM tempScore;
DELETE FROM tempScore;
SELECT * FROM tempScore;
ROLLBACK;
SELECT * FROM tempScore;

DELETE FROM tempScore;
COMMIT;

-------------------------------------------------------
-- 제약조건
-------------------------------------------------------

/*
 * 종류 :
 * 		1) not null or null
 * 		2) unique
 * 		3) primary key
 *  	4) foreign key
 * 		5) check
 * 
 * 		지정 방법 : 
 * 		 1) 테이블 생성 시 : inline type, table type
 * 		 2) 테이블 생성 후 구조 변경 : alter table
*/

--80) 제약조건 5가지를 테이블 생성 시 지정
CREATE TABLE constTest(
	NO number(4)
		CONSTRAINT constTest_no_pk PRIMARY KEY,
	name varchar2(20)
		CONSTRAINT constTest_name_nn NOT NULL,
	jumin varchar2(13)
		CONSTRAINT constTest_jumin_nn NOT NULL
		CONSTRAINT constTest_jumin_uk UNIQUE,
	loc_code NUMBER(1)
		CONSTRAINT constTest_loc_ck CHECK(loc_code<5),
	deptno NUMBER(6)
		CONSTRAINT constTest_deptno_fk REFERENCES departments(department_id)
);

CREATE TABLE constTest2(
	NO number(4),	
	name varchar2(20)
		CONSTRAINT constTest2_name_nn NOT NULL,
	jumin varchar2(13)
		CONSTRAINT constTest2_jumin_nn NOT NULL,
	loc_code NUMBER(1),		
	deptno NUMBER(6),

		CONSTRAINT constTest2_no_pk PRIMARY KEY(no),
		CONSTRAINT constTest2_jumin_uk UNIQUE(jumin),
		CONSTRAINT constTest2_loc_ck CHECK(loc_code<5),
		CONSTRAINT constTest2_deptno_fk FOREIGN KEY(deptno) REFERENCES departments(department_id)
);

INSERT INTO constTest VALUES(1,'hong','901212',1,100);
SELECT * FROM constTest;
COMMIT;

--81) no컬럼에 중복된 값을 입력하여 primary key 속성을 테스트하시오.
INSERT INTO constTest VALUES(1,'hong','901212',1,100);

--82) no컬럼에 null을 대입하여 primary key 속성을 테스트하시오.
INSERT INTO constTest(name,jumin,loc_code,deptno) VALUES('kim','990101',1,100);

--83) jumin 번호를 중복입력하여 unique 속성을 테스트하시오.
INSERT INTO constTest VALUES(2, 'kim','901212',2,100);

--84) loc_code에 8을 입력하여 check 속성에 위배됨을 테스트하시오.
INSERT INTO constTest VALUES(3, 'kim','901214',8,100);

--85) departments 테이블의 department_id에 없는 값을 입력하여 foreign key 속성을 테스트하시오.
INSERT INTO constTest VALUES(3, 'kim','901214',2,999);

-- constTest 테이블에 설정되어 있는 제약 조건 삭제
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'CONSTTEST';

ALTER TABLE CONSTTEST DROP CONSTRAINT constTest_no_pk;
ALTER TABLE CONSTTEST DROP CONSTRAINT constTest_jumin_uk;
ALTER TABLE CONSTTEST DROP CONSTRAINT constTest_loc_ck;
ALTER TABLE CONSTTEST DROP CONSTRAINT constTest_deptno_fk;

--테이블 생성 후 alter table을 사용한 제약 조건 수정
ALTER TABLE CONSTTEST ADD CONSTRAINT constTest_no_pk PRIMARY KEY(no);

--null과 not null은 modify로 수정해야 함.
ALTER TABLE CONSTTEST MODIFY jumin NULL;

-------------------------------------------------------
-- VIEW
-------------------------------------------------------

--86) 성명, 연락처, 이메일, 매니저이름, 부서코드, 부서명을 조회하시오.
CREATE VIEW emp_view AS
	SELECT e.FIRST_NAME 성명, e.PHONE_NUMBER 연락처, e.EMAIL 이메일, m.first_name 매니저이름,
			e.DEPARTMENT_ID 부서코드, d.department_name 부서명
	FROM EMPLOYEES e JOIN EMPLOYEES m 
	ON e.MANAGER_ID = m.EMPLOYEE_ID 
	JOIN DEPARTMENTS d
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;

SELECT * FROM emp_view;
SELECT * FROM emp_view WHERE 성명 = 'Lisa';
SELECT * FROM emp_view WHERE 매니저이름 = 'Nancy';

-------------------------------------------------------
-- Sub Query
-------------------------------------------------------
--87) 부서명이 Sales인 직원들의 명단
--a) JOIN
SELECT e2.* FROM EMPLOYEES e2 JOIN DEPARTMENTS d
ON e2.DEPARTMENT_ID =d.DEPARTMENT_ID 
WHERE d.DEPARTMENT_NAME ='Sales';

--b) Sub Query
SELECT * FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
					   FROM DEPARTMENTS d2
					   WHERE DEPARTMENT_NAME = 'Sales');

--88) job_title이 Programmer인 직원들의 이름과 연락처를 조회(employees, jobs)
--a) JOIN
SELECT e.FIRST_NAME , e.PHONE_NUMBER
FROM EMPLOYEES e JOIN JOBS j 
ON e.JOB_ID = j.JOB_ID 
WHERE j.JOB_TITLE = 'Programmer';

--b) Sub Query
SELECT FIRST_NAME , PHONE_NUMBER FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
				FROM JOBS
				WHERE JOB_TITLE = 'Programmer');
			
--89) city가 London인 부서의 이름을 조회(departments, locations)
--a)
SELECT d.DEPARTMENT_NAME FROM DEPARTMENTS d JOIN LOCATIONS l2 
ON d.LOCATION_ID = l2.LOCATION_ID 
WHERE l2.CITY = 'London';

--b)
SELECT DEPARTMENT_NAME FROM DEPARTMENTS
WHERE LOCATION_ID = (SELECT LOCATION_ID
					 FROM LOCATIONS
					 WHERE CITY = 'London');

--90) department_name이 IT인 부서의 우편번호(departments, locations)
--a)
SELECT l2.POSTAL_CODE FROM LOCATIONS l2 JOIN DEPARTMENTS d2 
ON l2.LOCATION_ID = d2.LOCATION_ID 
WHERE d2.DEPARTMENT_NAME = 'IT';

--b)
SELECT POSTAL_CODE FROM LOCATIONS
WHERE LOCATION_ID = (SELECT LOCATION_ID
					 FROM DEPARTMENTS 
					 WHERE DEPARTMENT_NAME = 'IT');

--91) David의 부서명(departments, employees)
--a)
SELECT d2.DEPARTMENT_NAME FROM DEPARTMENTS d2 JOIN EMPLOYEES e2 
ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID
WHERE e2.FIRST_NAME = 'David';

--b)
SELECT DEPARTMENT_NAME FROM DEPARTMENTS 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
					   FROM EMPLOYEES
					   WHERE FIRST_NAME='David');
					  
--92) Adam Fripp의 직무명(job_title)은 (employees, jobs)
--a)
SELECT j.JOB_TITLE FROM JOBS j JOIN EMPLOYEES e 
ON j.JOB_ID = e.JOB_ID 
WHERE e.FIRST_NAME = 'Adam' AND e.LAST_NAME = 'Fripp';

--b)
SELECT JOB_TITLE FROM JOBS
WHERE JOB_ID = (SELECT JOB_ID 
			    FROM EMPLOYEES 
				WHERE FIRST_NAME = 'Adam' AND LAST_NAME = 'Fripp');


