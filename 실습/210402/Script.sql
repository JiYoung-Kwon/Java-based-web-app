--41) �μ��ڵ尡 80���̰ų� �Ի���� 04���� �������� ��ձ޿���?
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES WHERE DEPARTMENT_ID = 80 OR TO_CHAR(HIRE_DATE,'mm') = '04';

----group by-----------------------------------------------

--42) �μ��� �ο����� ���?
SELECT DEPARTMENT_ID ,COUNT(EMPLOYEE_ID) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

--43) �Ի�⵵ �� �ο����� ���?
SELECT  TO_char(hire_date,'rrrr'), count(EMPLOYEE_ID) cnt FROM EMPLOYEES 
GROUP BY  TO_char(hire_date,'rrrr')
ORDER BY cnt DESC ;


--44) �μ��� �޿��հ� 
SELECT DEPARTMENT_ID, sum (SALARY) hap FROM EMPLOYEES e 
GROUP BY  DEPARTMENT_ID
ORDER BY hap DESC ;

SELECT  * FROM DEPARTMENTS WHERE DEPARTMENT_ID =10;

--45) ������(job_id) �ο����� ��� �޿��� ����Ͻÿ�
SELECT count(JOB_ID), AVG(SALARY) FROM EMPLOYEES e ;


--46) �μ��ڵ尡 80���� ������ �� ������ �ο�����?
SELECT JOB_ID , COUNT(JOB_ID) cnt FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 80
GROUP BY JOB_ID ;


--47) ������ �ο��� ��ȸ
SELECT JOB_ID , COUNT(JOB_ID) cnt FROM EMPLOYEES e 
GROUP BY JOB_ID ;


--48) ������ �ο��� �� �ο��� 5���� ū ������ ��ȸ
SELECT JOB_ID ,COUNT(JOB_ID) cnt FROM EMPLOYEES e 
GROUP BY JOB_ID 
HAVING COUNT(JOB_ID)>5;

--49) �μ���, ������ �ο��� ��ȸ
SELECT  department_id, COUNT(employee_id) FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID ;

SELECT  JOB_ID, COUNT(employee_id) FROM EMPLOYEES e2 
GROUP BY JOB_ID ;

--50) �μ�_������ �ο� ��ȸ
SELECT  department_id, JOB_ID,COUNT(employee_id) FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID,JOB_ID;

----join--------------------------------------------

--51) Lex�� �μ����� ?
SELECT * FROM EMPLOYEES e WHERE FIRST_NAME = 'Lex';
SELECT * FROM DEPARTMENTS d WHERE DEPARTMENT_ID = 90;

-- oracle join
SELECT DEPARTMENT_NAME FROM EMPLOYEES e2, DEPARTMENTS d
WHERE e2.DEPARTMENT_ID  = d.DEPARTMENT_ID 
AND FIRST_NAME = 'Lex';

-- ansi join
SELECT department_name FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE first_name = 'Lex';

--52) ����� 112�� ������ �̸�, �޿�, �μ��ڵ�, �μ����� ��ȸ

-- oracle join
SELECT FIRST_NAME, SALARY , e.DEPARTMENT_ID ,DEPARTMENT_NAME FROM EMPLOYEES e, DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND employee_id = 112;

-- ansi join
SELECT FIRST_NAME, SALARY , e.DEPARTMENT_ID ,DEPARTMENT_NAME FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE employee_id = 112;

--53) �μ����� IT�� �������� �̸�, �̸���, �μ��ڵ带 ��ȸ

-- oracle join
SELECT FIRST_NAME, EMAIL, e.DEPARTMENT_ID FROM EMPLOYEES e,DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND DEPARTMENT_NAME = 'IT';

-- ansi join
SELECT FIRST_NAME, EMAIL, e.DEPARTMENT_ID FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE DEPARTMENT_NAME = 'IT';

--54) �μ����� Sales�� �μ��� �޿��հ踦 ��ȸ

-- oracle join
SELECT SUM(salary) FROM EMPLOYEES e2, DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID 
AND DEPARTMENT_NAME = 'Sales';

-- ansi join
SELECT SUM(salary) FROM EMPLOYEES e2 JOIN DEPARTMENTS d2 
ON e2.DEPARTMENT_ID = d2.DEPARTMENT_ID 
WHERE DEPARTMENT_NAME = 'Sales';

--55) �μ����� Finance�� �μ��� �Ŵ��� �̸���?

-- oracle join
SELECT d.manager_id FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND DEPARTMENT_NAME = 'Finance';

-- ansi join
SELECT d.manager_id FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.EMPLOYEE_ID = d.MANAGER_ID 
WHERE DEPARTMENT_NAME = 'Finance';

SELECT first_name FROM DEPARTMENTS d JOIN EMPLOYEES e2 
ON  e2.EMPLOYEE_ID = d.MANAGER_ID 
WHERE DEPARTMENT_NAME = 'Finance';

-- outer join, eqiv join ����
SELECT count(*) FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID ;
-- ���� Ŀ���� �μ��� ���� ������ ī���õ��� ����

SELECT count(*) FROM EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID =d.DEPARTMENT_ID ;

--56) departments ���̺��� �������� �μ��ڵ�, �μ���, �����̸��� ��ȸ.
--56.1) join
SELECT d2.DEPARTMENT_ID, DEPARTMENT_NAME, FIRST_NAME
FROM DEPARTMENTS d2 JOIN EMPLOYEES e2 
ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID ;

--56.2) left outer join
SELECT d2.DEPARTMENT_ID, DEPARTMENT_NAME, FIRST_NAME 
FROM DEPARTMENTS d2 LEFT OUTER JOIN EMPLOYEES e2 
ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID ;


SELECT employee_id, manager_id FROM EMPLOYEES e ;

----self join---------------------------------------------

--57) Sigal ����� �Ŵ��� �̸���?
SELECT MANAGER_ID FROM EMPLOYEES e WHERE first_name = 'Sigal';
SELECT first_name FROM EMPLOYEES e WHERE EMPLOYEE_ID = 114;

SELECT m.first_name FROM EMPLOYEES e JOIN EMPLOYEES m
ON e.MANAGER_ID = m.EMPLOYEE_ID 
WHERE e.FIRST_NAME ='Sigal';

--58) �Ŵ��� �̸��� John Russell�� �����ϴ� �������� ���, �̸�, �޿��� ��ȸ
SELECT e.EMPLOYEE_ID, e.FIRST_NAME , e.SALARY FROM EMPLOYEES e JOIN EMPLOYEES m
ON e.MANAGER_ID = m.EMPLOYEE_ID 
WHERE m.FIRST_NAME = 'John' AND m.LAST_NAME = 'Russell';

--59) Luis�� ���� �ؿ� �Ի��� �������� �̸��� �̸����� ��ȸ
SELECT e.first_name, e.EMAIL FROM EMPLOYEES e JOIN EMPLOYEES l
ON TO_CHAR(e.HIRE_DATE,'RRRR') =  TO_CHAR(l.HIRE_DATE,'RRRR')
WHERE l.FIRST_NAME = 'Luis';

--60) David Austin�� ���� �μ� ������� �̸�, ����ó�� ��ȸ
SELECT e.FIRST_NAME ,e.PHONE_NUMBER FROM EMPLOYEES e JOIN EMPLOYEES d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE d.FIRST_NAME = 'David' AND d.LAST_NAME = 'Austin';

-- ���̺� ����
CREATE TABLE student(
	id varchar(20),
	irum varchar(30),
	address varchar(100),
	phone varchar(20)
);