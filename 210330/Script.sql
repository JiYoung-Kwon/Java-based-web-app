--------------------------------------------------------------------
CREATE TABLE emp AS SELECT * FROM EMPLOYEES WHERE salary>8000;
SELECT  * FROM emp;

-- ���̺� ����
DROP TABLE emp;

--17) employees ���̺�� emp ���̺��� ������ union���� ����
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM EMPLOYEES e 
UNION
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM emp;

--18) employees ���̺�� emp ���̺��� ������ �ߺ�����Ͽ� union all���� ����
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM EMPLOYEES e 
UNION ALL
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM emp;

--19) employees, emp ���̺��� �ߺ��Ǵ� �ڷḦ ��ȸ(intersect)
SELECT * FROM EMPLOYEES
INTERSECT
SELECT * FROM emp;

--20) employees, emp ���̺��� �����ո� ��ȸ(minus)
SELECT * FROM EMPLOYEES
MINUS
SELECT * FROM emp;

SELECT * FROM emp
MINUS
SELECT * FROM EMPLOYEES;

--21) first_name�� ��� �빮�ڷ�, last_name�� ��� �ҹ��ڷ� ���(Upper,Lower)
SELECT UPPER(FIRST_NAME),LOWER(LAST_NAME) FROM EMPLOYEES e ;

--22) email �ּ��� ���̸� ����, �̸���, �̸��� ���̷� ���(length)
SELECT FIRST_NAME ����, EMAIL �̸��� ,LENGTH(EMAIL) �̸��ϱ��� FROM EMPLOYEES;

--23) �μ��ڵ尡 100���� ������� �̸����� �̸���@korea.com ���·� ���(concat)
SELECT CONCAT(EMAIL,'@korea.com') �̸��� FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

--24) ���� th�� ���ԵǾ� �ִ� ������� �޿��� �޿����, �ڸ��� 10�ڸ��� �����ѵ� ������ ������ '*'�� ä�� ����� �Բ� ���(lpad)
SELECT FIRST_NAME ����,LPAD(SALARY,10,'*') �޿� FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE '%th%';

--25) �̸��� �� ���ڸ��� '**'���� ��ȯ�Ͽ� ��ȸ�Ͻÿ�(replace, substr)
SELECT FIRST_NAME , SUBSTR(FIRST_NAME,1,2)  FROM EMPLOYEES e ;
SELECT FIRST_NAME , REPLACE(FIRST_NAME,'D','*') FROM EMPLOYEES e ;
SELECT FIRST_NAME , REPLACE(FIRST_NAME, SUBSTR(FIRST_NAME,1,2) ,'**') FROM EMPLOYEES e ;

--26) ����ó�� ��4�ڸ��� ��� '****'�� �ٲپ� ����,�̸��ϰ� �Բ� ��ȸ.
SELECT FIRST_NAME ,EMAIL ,REPLACE (PHONE_NUMBER, SUBSTR(PHONE_NUMBER,-4,4) , '****') FROM EMPLOYEES e ;

--27) ������� ����, �޿�, ���ʽ�(�޿��� 300%), �Ѿ�(�޿�+���ʽ�)�� ����Ͻÿ�.(��, �Ѿ��� 100���� �̸��� �����Ͻÿ�) ceil
SELECT FIRST_NAME ����, SALARY �޿�, SALARY * 3 ���ʽ�, CEIL((SALARY+SALARY*3)/100)*100 FROM EMPLOYEES e;

--28) ������� ����, �޿�, ����(�޿��� 10%), ���޾�(�޿�-����)�� ����Ͻÿ�.(��, ���޾��� �Ҽ��� ���ϴ� �����Ͻÿ�) floor
SELECT FIRST_NAME ����, SALARY �޿�, SALARY *0.1 ����, FLOOR(SALARY+SALARY*0.1) FROM EMPLOYEES e ;

--29) ������ ��ƿ� �������� ���
SELECT MONTHS_BETWEEN(SYSDATE,'1998/04/16') FROM DUAL;

-- ����� ǥ��
SELECT FIRST_NAME ,HIRE_DATE , TO_CHAR(HIRE_DATE,'MM') �Ի�� FROM EMPLOYEES e ;

--30) 3���� �Ի��� ������ �̸�, �Ի����� ��ȸ
SELECT FIRST_NAME ,HIRE_DATE FROM EMPLOYEES e WHERE TO_CHAR(HIRE_DATE,'MM') = 3;

--31) 5���� �Ի��� ������ �̸�, �Ի���, �޿��� ����ϵ�, �޿����� õ���� ��ȣ�� ����Ͽ� ��ȸ.
SELECT FIRST_NAME ,HIRE_DATE ,TO_CHAR(SALARY,'99,999') FROM EMPLOYEES e WHERE TO_CHAR(HIRE_DATE,'MM')=5; 

--32) �Ի�⵵�� 2007�� 3�� ���Ŀ� �Ի��� ������ ����, �޿�, ���ʽ�(�޿�*commission_pct)�� ����ϵ�,
--	  commission_pct�� ���� ������ ���ʽ��� 0���� ó���Ͻÿ�.(NVL, TO_CHAR)
SELECT FIRST_NAME ����, SALARY �޿�, NVL(SALARY *COMMISSION_PCT,0) ���ʽ�
FROM EMPLOYEES e
WHERE TO_CHAR(HIRE_DATE,'RRRR-MM') > '2007-03'; 

--33) �μ� �ڵ尡 100�̸� �μ��� �����ʿ� '����μ�'�� �ٿ��� ������ �Բ� ���.
SELECT FIRST_NAME ,DEPARTMENT_ID|| DECODE(DEPARTMENT_ID,100,'(����μ�)')
FROM EMPLOYEES e2 ;

--34) �����, �޿�, ���ʽ��� ����ϵ�, �μ��ڵ尡 100�̸� ���ʽ��� �޿��� 50% �ƴϸ� �޿��� 10%�� �����ϵ��� ��ȸ
SELECT FIRST_NAME ,SALARY, DEPARTMENT_ID, DECODE(DEPARTMENT_ID,100,SALARY*.5,SALARY*.1) ���ʽ�
FROM EMPLOYEES e2 ;

--35) �����, �޿��� ����ϵ� �޿��� 15000 �̻��̸� '(��׿�����)', 5000 �̸��� ��� '(���ҵ� ���)'�� �޿� �����ʿ� �Բ� ���.
SELECT FIRST_NAME , SALARY ||
		CASE
			WHEN SALARY >= 15000 THEN '(��׿�����)'
			WHEN SALARY < 5000 THEN '(���ҵ� ���)'
		END 
		�޿�
FROM EMPLOYEES e ;

-- locations ���̺��� ����Ͽ� ������ �ذ��ϼ���.
--36) �����ȣ�� �����ڰ� ����ִ� ������ ��ȸ�Ͻÿ�.
SELECT * FROM LOCATIONS 
WHERE REGEXP_LIKE(POSTAL_CODE,'[a-zA-Z]'); 

--37) �����ȣ�� �����ڷ� �����ϴ� ������ ��ȸ�Ͻÿ�.
SELECT * FROM LOCATIONS
WHERE REGEXP_LIKE(POSTAL_CODE,'^[a-zA-Z]') ;

--38) ���� ��ü �ο����� ��ȸ
SELECT count(EMPLOYEE_ID) FROM EMPLOYEES;

--39) 3���� �Ի��� �������� ��ȸ
SELECT count(EMPLOYEE_ID) FROM EMPLOYEES e WHERE TO_CHAR(HIRE_DATE,'mm') = '03';

--40) �� ������ �޿��հ踦 ��ȸ
SELECT SUM(SALARY) FROM EMPLOYEES;
-- �޿� ���
SELECT AVG(SALARY) FROM EMPLOYEES;

