-------------------------------------------------------
-- DDL (create, truncate, drop, alter)
-------------------------------------------------------

--61) student(id, irum, phone, address, email) ���̺� ����
CREATE TABLE student(
	id varchar(20),
	irum varchar(30),	
	phone varchar(50),
	address varchar(100),
	email varchar(50)
);

--62) student ���̺��� ���� ����(������+����)
DROP TABLE STUDENT ;

--63) ������ ���̺� student�� �ٽ� ������ ��, ��ȣ, �г� �÷��� alter ����� ����Ͽ� �߰�
ALTER TABLE STUDENT 
ADD (
	pwd varchar(20),
	grade NUMBER(2)
);

--64) student ���̺� score(number) �÷��� �߰��� ��, �ٽ� score �÷��� ����
ALTER TABLE STUDENT ADD (score NUMBER(2));
ALTER TABLE STUDENT DROP COLUMN score;

--65) student ���̺��� id �÷����� mid�� ����
ALTER TABLE STUDENT RENAME COLUMN id TO mid;

--66) student ���̺��� phone �÷��� ũ�⸦ 30���� ����
ALTER TABLE STUDENT MODIFY (phone varchar(30));

--67) score ���̺��� �Ʒ��� ���� ������ �����Ͻÿ�
-- serial number, mid varchar(20), subject varchar(30), score number(4)
CREATE TABLE score(
	serial number,
	mid varchar(20),
	subject varchar(30),
	score number(4)
);

-- 68) ������ �����͸� score�� �Է��� �� truncate ����� ����Ͽ� �����͸� ����.
INSERT INTO SCORE (serial, mid, subject, score)
VALUES(100,'hong','����',100);

COMMIT; -- insert, update, delete ����� Ȯ������ ���. (rollback : ���)

SELECT * FROM SCORE;

TRUNCATE TABLE SCORE; -- ������ ����

SELECT * FROM SCORE;

-------------------------------------------------------
-- DML (insert, update, delete, merge)
-------------------------------------------------------

-- 1) INSERT INTO ���̺��(�÷���1, �÷���2, ...) values(��1, ��2, ...);
-- 2) INSERT INTO ���̺�� values(��1, ��2, ...);
--��� �÷��� ������� ���� ��� �Է��Ϸ� �� ���� ���̺�� �ڿ� �ִ� �÷����� ������ �� �ִ�.
-- 3) INSERT INTO ���̺�� SELECT �� ���
-- 4) ���� ���̺� ���ÿ� ���� ���� �Է��� ��
--    INSERT ALL 
--	  INTO ���̺��1 values(�÷���1, �÷���2, ...)
--	  INTO ���̺��2 values(�÷���1, �÷���2, ...)
--	  SELECT ��

--69) score ���̺� hong, kim ���� ������ �Է��Ͻÿ�.
-- (1, hong, ����, 90)
-- (2, kim, ����, 80)
INSERT INTO SCORE(SERIAL,MID,SUBJECT,SCORE) VALUES(1,'hong','����',90);
INSERT INTO SCORE(SERIAL,SCORE,MID,SUBJECT) VALUES(2, 80,'kim','����');

--70) �÷����� �����Ͽ� �Ʒ��� ������ �Է��Ͻÿ�.
-- (3, park, ����, 80)
INSERT INTO SCORE VALUES(3,'park','����',80);

--71) score ���̺��� ������ ����Ͽ� tempScore ���̺��� �����Ͻÿ�.
CREATE TABLE tempScore
AS
SELECT * FROM SCORE
WHERE 1=2;

--72) score ���̺��� ��� �����͸� tempScore�� ����.
INSERT INTO TEMPSCORE
SELECT * FROM SCORE;

--73) score ���̺��� �ڷ� �� ���������� �ش��ϴ� �ڷḸ tempScore�� ����
INSERT INTO TEMPSCORE
SELECT * FROM SCORE
WHERE SUBJECT = '����';

--74) score ���̺��� ������ ����Ͽ� imsiScore ���̺��� ������ ��, 
-- 	  insert all�� ����Ͽ� score ���̺��� ��� �����͸� tempScore, imsiScore ���̺� ����
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

-- update ���̺�� set �÷���1= ������1, �÷���2= ������2, ... where ����
-- update ���̺�� set �÷���1= ������1, �÷���2= ������2, ... where �÷���=(sub query)

--75) hong�� ���� ������ 100������ �����Ͻÿ�.
UPDATE SCORE SET score = 100 WHERE mid = 'hong' AND SUBJECT = '����';

--76) park�� ������ ���п��� ����� �����Ͻÿ�.
UPDATE SCORE SET subject = '����' WHERE MID = 'park' AND SUBJECT ='����';

SELECT * FROM SCORE;

-- delete from ���̺�� where ����

--77) tempScore�� �ִ� �ڷ� �� hong�� ���� ���� �ڷḦ ��� ����
DELETE FROM tempscore WHERE mid = 'hong' AND subject = '����';
--78) imsiScore�� �ִ� ��� �ڷḦ ����
DELETE FROM imsiScore;

SELECT * FROM tempScore;
SELECT * FROM imsiScore;

-------------------------------------------------------
-- TCL (commit, rollback)
-------------------------------------------------------

-- DBeaver�� commit �ɼ��� Auto -> Manual type���� ����
-- SQL Plus�� ��� hr ������ �α���

--79) tempScore�� �����͸� ��� ������ �� commit �� Ȯ��, rollback Ȯ��
SELECT * FROM tempScore;
DELETE FROM tempScore;
SELECT * FROM tempScore;
ROLLBACK;
SELECT * FROM tempScore;

DELETE FROM tempScore;
COMMIT;

-------------------------------------------------------
-- ��������
-------------------------------------------------------

/*
 * ���� :
 * 		1) not null or null
 * 		2) unique
 * 		3) primary key
 *  	4) foreign key
 * 		5) check
 * 
 * 		���� ��� : 
 * 		 1) ���̺� ���� �� : inline type, table type
 * 		 2) ���̺� ���� �� ���� ���� : alter table
*/

--80) �������� 5������ ���̺� ���� �� ����
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

--81) no�÷��� �ߺ��� ���� �Է��Ͽ� primary key �Ӽ��� �׽�Ʈ�Ͻÿ�.
INSERT INTO constTest VALUES(1,'hong','901212',1,100);

--82) no�÷��� null�� �����Ͽ� primary key �Ӽ��� �׽�Ʈ�Ͻÿ�.
INSERT INTO constTest(name,jumin,loc_code,deptno) VALUES('kim','990101',1,100);

--83) jumin ��ȣ�� �ߺ��Է��Ͽ� unique �Ӽ��� �׽�Ʈ�Ͻÿ�.
INSERT INTO constTest VALUES(2, 'kim','901212',2,100);

--84) loc_code�� 8�� �Է��Ͽ� check �Ӽ��� ������� �׽�Ʈ�Ͻÿ�.
INSERT INTO constTest VALUES(3, 'kim','901214',8,100);

--85) departments ���̺��� department_id�� ���� ���� �Է��Ͽ� foreign key �Ӽ��� �׽�Ʈ�Ͻÿ�.
INSERT INTO constTest VALUES(3, 'kim','901214',2,999);

-- constTest ���̺� �����Ǿ� �ִ� ���� ���� ����
SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'CONSTTEST';

ALTER TABLE CONSTTEST DROP CONSTRAINT constTest_no_pk;
ALTER TABLE CONSTTEST DROP CONSTRAINT constTest_jumin_uk;
ALTER TABLE CONSTTEST DROP CONSTRAINT constTest_loc_ck;
ALTER TABLE CONSTTEST DROP CONSTRAINT constTest_deptno_fk;

--���̺� ���� �� alter table�� ����� ���� ���� ����
ALTER TABLE CONSTTEST ADD CONSTRAINT constTest_no_pk PRIMARY KEY(no);

--null�� not null�� modify�� �����ؾ� ��.
ALTER TABLE CONSTTEST MODIFY jumin NULL;

-------------------------------------------------------
-- VIEW
-------------------------------------------------------

--86) ����, ����ó, �̸���, �Ŵ����̸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�.
CREATE VIEW emp_view AS
	SELECT e.FIRST_NAME ����, e.PHONE_NUMBER ����ó, e.EMAIL �̸���, m.first_name �Ŵ����̸�,
			e.DEPARTMENT_ID �μ��ڵ�, d.department_name �μ���
	FROM EMPLOYEES e JOIN EMPLOYEES m 
	ON e.MANAGER_ID = m.EMPLOYEE_ID 
	JOIN DEPARTMENTS d
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;

SELECT * FROM emp_view;
SELECT * FROM emp_view WHERE ���� = 'Lisa';
SELECT * FROM emp_view WHERE �Ŵ����̸� = 'Nancy';

-------------------------------------------------------
-- Sub Query
-------------------------------------------------------
--87) �μ����� Sales�� �������� ���
--a) JOIN
SELECT e2.* FROM EMPLOYEES e2 JOIN DEPARTMENTS d
ON e2.DEPARTMENT_ID =d.DEPARTMENT_ID 
WHERE d.DEPARTMENT_NAME ='Sales';

--b) Sub Query
SELECT * FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID 
					   FROM DEPARTMENTS d2
					   WHERE DEPARTMENT_NAME = 'Sales');

--88) job_title�� Programmer�� �������� �̸��� ����ó�� ��ȸ(employees, jobs)
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
			
--89) city�� London�� �μ��� �̸��� ��ȸ(departments, locations)
--a)
SELECT d.DEPARTMENT_NAME FROM DEPARTMENTS d JOIN LOCATIONS l2 
ON d.LOCATION_ID = l2.LOCATION_ID 
WHERE l2.CITY = 'London';

--b)
SELECT DEPARTMENT_NAME FROM DEPARTMENTS
WHERE LOCATION_ID = (SELECT LOCATION_ID
					 FROM LOCATIONS
					 WHERE CITY = 'London');

--90) department_name�� IT�� �μ��� �����ȣ(departments, locations)
--a)
SELECT l2.POSTAL_CODE FROM LOCATIONS l2 JOIN DEPARTMENTS d2 
ON l2.LOCATION_ID = d2.LOCATION_ID 
WHERE d2.DEPARTMENT_NAME = 'IT';

--b)
SELECT POSTAL_CODE FROM LOCATIONS
WHERE LOCATION_ID = (SELECT LOCATION_ID
					 FROM DEPARTMENTS 
					 WHERE DEPARTMENT_NAME = 'IT');

--91) David�� �μ���(departments, employees)
--a)
SELECT d2.DEPARTMENT_NAME FROM DEPARTMENTS d2 JOIN EMPLOYEES e2 
ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID
WHERE e2.FIRST_NAME = 'David';

--b)
SELECT DEPARTMENT_NAME FROM DEPARTMENTS 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
					   FROM EMPLOYEES
					   WHERE FIRST_NAME='David');
					  
--92) Adam Fripp�� ������(job_title)�� (employees, jobs)
--a)
SELECT j.JOB_TITLE FROM JOBS j JOIN EMPLOYEES e 
ON j.JOB_ID = e.JOB_ID 
WHERE e.FIRST_NAME = 'Adam' AND e.LAST_NAME = 'Fripp';

--b)
SELECT JOB_TITLE FROM JOBS
WHERE JOB_ID = (SELECT JOB_ID 
			    FROM EMPLOYEES 
				WHERE FIRST_NAME = 'Adam' AND LAST_NAME = 'Fripp');


