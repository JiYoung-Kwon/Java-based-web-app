--93) �μ� ���̵� 30���� �μ� �������� �ּ� �޿����� ���� �޿��� �޴� ������ �̸�, �޿� ��ȸ(<ANY,<ALL)
SELECT e.FIRST_NAME , e.SALARY 
FROM EMPLOYEES e
WHERE e.SALARY <ALL (SELECT e2.SALARY 
					 FROM EMPLOYEES e2 
					 WHERE e2.DEPARTMENT_ID = 30);
			
--94) 2007�⵵�� �Ի��� �������� �ִ� �޿����� �޿��� ���� �޴� �������� �̸�, �޿� ��ȸ(>ANY,>ALL)
SELECT e.FIRST_NAME ,e.SALARY 
FROM EMPLOYEES e 
WHERE e.SALARY >ALL (SELECT e2.SALARY
					 FROM EMPLOYEES e2
					 WHERE TO_CHAR(e2.HIRE_DATE,'RRRR') = 2007 );

-------------------------------------------------------
-- SEQUENCE
-------------------------------------------------------
-- �������� �߻� : ��������.nextval
-- ���� ������ ��ȸ : ��������.currval
-- ���� : �ߺ����� �ʴ� ��ȣ�� �߻����� select�� ���� �������忡�� �Ѱ��� �����͸� �������� ���� ���
			
--95) �⺻���� ����Ͽ� �������� ����
CREATE SEQUENCE seq_score;

--96) ������ �������� �߻� //������ ������ ����
SELECT seq_score.nextval FROM dual;

--97) ���� ���������� ��ȸ
SELECT seq_score.currval FROM dual;

--98) score ���̺� ������ �Է��� �� serial �÷��� �������� ����
INSERT INTO score(SERIAL,MID,SUBJECT,SCORE)
VALUES(seq_score.nextval, 'kim','����',100);

SELECT * FROM score;
			
-------------------------------------------------------
-- ������ ����
-------------------------------------------------------			
SELECT LEVEL,EMPLOYEE_ID ,LPAD(' ',LEVEL*3,' ')||FIRST_NAME ,MANAGER_ID FROM EMPLOYEES
START WITH manager_id IS NULL
CONNECT BY PRIOR EMPLOYEE_ID =MANAGER_ID 
ORDER siblings BY MANAGER_ID 			
			
--������ ������ ����¡ ó���١١�
SELECT * FROM (
	SELECT ROWNUM rn, a.* from
		(SELECT rownum, LEVEL,EMPLOYEE_ID ,LPAD(' ',LEVEL*3,' ')||FIRST_NAME ,MANAGER_ID FROM EMPLOYEES
		START WITH manager_id IS NULL
		CONNECT BY PRIOR EMPLOYEE_ID =MANAGER_ID 
		ORDER BY MANAGER_ID) a
) WHERE rn BETWEEN 1 AND 5;


--PL/SQL�� �⺻ ���

--1) ����� 100�� ������ �̸��� ����ó�� ���

DECLARE
	vname varchar2(50);
	vphone varchar2(50);
BEGIN
	SELECT first_name, phone_number
	INTO VNAME , vphone
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID =100;
	
	dbms_output.put_line(vname);
	dbms_output.put_line(vphone);
END;

--2) �μ��ڵ尡 108���� ������ �޿��հ�� ����� ���		
DECLARE
	h NUMBER(10);
	p number(7,2);
BEGIN
	SELECT sum(SALARY),AVG(SALARY)
	INTO h,p
	FROM EMPLOYEES e2 
	WHERE DEPARTMENT_ID = 80;

	dbms_output.put_line('�հ�:' || h);
	dbms_output.put_line('���:' || p);
END;
			
			
--3) Oliver�� �μ����� ���
--a) join
DECLARE
	dname VARCHAR(20);
BEGIN
	SELECT d.DEPARTMENT_NAME 
	INTO dname
	FROM DEPARTMENTS d JOIN EMPLOYEES e
	ON d.DEPARTMENT_ID = e.DEPARTMENT_ID 
	WHERE e.FIRST_NAME = 'Oliver';
	
	dbms_output.put_line(dname);						
END;

--b) sub query
DECLARE
	name VARCHAR(20);
BEGIN
	SELECT d.DEPARTMENT_NAME 
	INTO name
	FROM DEPARTMENTS d 
	WHERE d.DEPARTMENT_ID = (SELECT e2.DEPARTMENT_ID 
							 FROM EMPLOYEES e2 
							 WHERE e2.FIRST_NAME = 'Oliver');
	
	dbms_output.put_line(name);						
END;

--4) Tayler�� �������� ���
--a) join
DECLARE
	job VARCHAR(20);
BEGIN
	SELECT j2.JOB_TITLE 
	INTO job
	FROM JOBS j2  JOIN EMPLOYEES e2
	ON j2.JOB_ID = e2.JOB_ID 
    WHERE e2.FIRST_NAME = 'Tayler';
	
	dbms_output.put_line('������ : ' || job);						
END;

--b) sub query
DECLARE
	job VARCHAR(20);
BEGIN
	SELECT j2.JOB_TITLE 
	INTO job
	FROM JOBS j2  
	WHERE j2.JOB_ID = (SELECT e2.JOB_ID 
							 FROM EMPLOYEES e2 
							 WHERE e2.FIRST_NAME = 'Tayler');
	
	dbms_output.put_line('������ : ' || job);						
END;
		
-- ������ ����
-- 1) SCALAR �� : ����Ŭ�� �⺻ ������ ����(varchar, NUMBER, char, ...)
-- 2) %TYPE : �ϳ��� �÷� ������ ������
-- 3) %ROWTYPE : �� ��ü�� ������ ������
-- 4) RECORD TYPE: %ROWTIPE�� �����ϳ� ������ ��Ҹ� ���Ƿ� �߰�, ������ �� �ִ�.
-- 5) TABLE TYPE : �ϳ��� �迭�� ������

--5) ����� 117���� ������ �̸���, �޿�, ����ó�� ��ȸ�Ͻÿ�.(��, ������ ������ %type�� ����� ��)
DECLARE
	ename employees.first_name%TYPE; /* ename varchar2(30) */
	sal   employees.salary%TYPE;	/*number(8,1);*/
	phone employees.phone_number%TYPE; /*varchar2(40);*/
BEGIN
	SELECT 	first_name, salary, phone_number
	INTO	ename, sal, phone
	FROM 	EMPLOYEES e2 
	WHERE 	EMPLOYEE_ID = 117;

	dbms_output.put_line('���� : ' || ename);
	dbms_output.put_line('�޿� : ' || sal);
	dbms_output.put_line('����ó : ' || phone);
END;

--6) Marketing �μ��� �����ȣ(postal_code)�� ������ �ּ�(street_address) ���(��, ������ ������ %TYPE ���)
--a) join
DECLARE
	pcode LOCATIONS.POSTAL_CODE%TYPE;
	address LOCATIONS.STREET_ADDRESS%TYPE;
BEGIN
	SELECT POSTAL_CODE ,STREET_ADDRESS
	INTO PCODE ,address
	FROM LOCATIONS l JOIN DEPARTMENTS d
	ON l.LOCATION_ID = d.LOCATION_ID 
	WHERE d.DEPARTMENT_NAME = 'Marketing';

	dbms_output.put_line('�����ȣ : ' || pcode);
	dbms_output.put_line('�ּ� : ' || address);
END;

--b) sub query
DECLARE
	pcode LOCATIONS.POSTAL_CODE%TYPE;
	address LOCATIONS.STREET_ADDRESS%TYPE;
BEGIN
	SELECT POSTAL_CODE, STREET_ADDRESS
	INTO PCODE, ADDRESS
	FROM LOCATIONS
	WHERE LOCATION_ID = (SELECT LOCATION_ID 
						 FROM DEPARTMENTS
						 WHERE DEPARTMENT_NAME = 'Marketing');
						
	dbms_output.put_line('�����ȣ : ' || pcode);
	dbms_output.put_line('�ּ� : ' || address);
END;

--7) Adam�� �μ� ���̵�, �μ��̸�, �Ŵ��� ���̵�, location_ID�� ��ȸ(��, ������ ������ %ROWTYPE ���)
DECLARE
	dept departments%ROWTYPE;
BEGIN
	SELECT d.*
	INTO DEPT 
	FROM DEPARTMENTS d JOIN EMPLOYEES e2 
	ON d.DEPARTMENT_ID = e2.DEPARTMENT_ID 
	WHERE e2.FIRST_NAME = 'Adam';

	dbms_output.put_line('�μ� ���̵� : '|| dept.department_id);
	dbms_output.put_line('�μ��� : '||dept.department_name);
	dbms_output.put_line('�Ŵ��� ���̵� : '||dept.manager_id);
	dbms_output.put_line('Location_ID : '||dept.location_id);
END;

--8) �μ��ڵ尡 60���� �μ��� �μ���, �Ŵ�����, �����ȣ�� ��ȸ(RECORD type)
DECLARE
	TYPE record_type IS RECORD
	(	dname DEPARTMENTS.department_name%TYPE,
		mname employees.first_name%TYPE,
		pcode locations.postal_code%TYPE
	);
	t record_type;
BEGIN
	SELECT d.DEPARTMENT_NAME ,e2.FIRST_NAME ,l.POSTAL_CODE 
	INTO t
	FROM DEPARTMENTS d JOIN EMPLOYEES e2
	ON d.MANAGER_ID = e2.EMPLOYEE_ID 
	JOIN LOCATIONS l
	ON d.LOCATION_ID = l.LOCATION_ID 
	WHERE d.DEPARTMENT_ID = 60;
   
	dbms_output.put_line('�μ��� : '|| t.dname);
	dbms_output.put_line('�Ŵ����� : '||t.mname);
	dbms_output.put_line('�����ȣ : '||t.pcode);

END;

--9) Allan�� �޿��հ�(�޿�+�޿�*��������)�� 15,000 �̻��̸� ��׿�����, �ƴϸ� ��տ����ڶ� ���ڿ��� �޿��հ�� �ղ� ����Ͻÿ�.(if~then else end if)
DECLARE
	str varchar2(30);
	hap NUMBER;
BEGIN
	SELECT SALARY + (SALARY*COMMISSION_PCT)
	INTO hap
	FROM EMPLOYEES
	WHERE FIRST_NAME ='Allan';

	IF(hap>15000) THEN
		str := '��׿�����';
	ELSE
		str := '��տ�����';
	END IF;

    dbms_output.put_line('hap : '||hap ||'('||str||')');
END;

--10) Bruce�� �μ��ڵ尡 60���̸� 'IT�μ�', 80���̸� '�����μ�', 100���̸� 'ȸ��μ�', �� �ܿ��� '��Ÿ�μ�'�� �μ��ڵ�� �Բ� ����Ͻÿ�.(CASE)
DECLARE
	dcode departments.department_id%TYPE;	
	dname varchar2(20);
	
BEGIN
	SELECT department_id
	INTO dcode
	FROM EMPLOYEES
	WHERE FIRST_NAME = 'Bruce';

	dname := CASE dcode
				WHEN 60 THEN 'IT�μ�'
				WHEN 80 THEN '�����μ�'
				WHEN 100 THEN 'ȸ��μ�'
				ELSE '��Ÿ�μ�'
			 END;

	dbms_output.put_line('code : '||dcode);		
	dbms_output.put_line('name : '||dname);		
END;