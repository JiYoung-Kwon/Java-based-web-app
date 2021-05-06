SELECT * FROM EMPLOYEES e ;
SELECT first_name FROM EMPLOYEES;

--1) ��� ������ �̸��� �ּҸ� ��ȸ
SELECT first_name, email FROM EMPLOYEES;

--2) ��� �μ��� �μ���� �Ŵ��� ���̵� ��ȸ
SELECT department_name, manager_id FROM DEPARTMENTS d;

--3) �÷� ���� ��Ī ����ϱ�
SELECT 10 + 10 FROM DUAL;
SELECT 10 + 10 hap FROM DUAL;

--4) ��� ���̺��� �μ��ڵ�(department_id)�� �ߺ����� ��ȸ
SELECT department_id FROM EMPLOYEES e;
SELECT DISTINCT department_id FROM EMPLOYEES e;

-- * ���� ���ļ� Unique�� ���� ���� -> �ߺ� ���� �� ����(1���� �÷����� ��� ��� �÷��� �����)
SELECT DISTINCT department_id, employee_id FROM EMPLOYEES e ;
SELECT DISTINCT department_id, MANAGER_ID FROM EMPLOYEES e ;

--5) ��� ���̺��� ������ �Ʒ��� ���� ����Ͻÿ�.
--	 XXX ����� �μ��ڵ�� XXX �Դϴ�.
SELECT first_name||' ����� �μ��ڵ�� ' ||DEPARTMENT_ID ||' �Դϴ�.' FROM EMPLOYEES e2; 

--6) �޿�(salary)�� 10000�� �̻��� ������ �̸��� �޿��� ��ȸ 
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000;

--7) �޿��� 10000�� �̻��̰ų�, 4000������ ������ �̸�, �޿�, �̸��� ��ȸ
SELECT FIRST_NAME, SALARY, EMAIL 
FROM EMPLOYEES
WHERE SALARY >= 10000 OR SALARY <=4000;

--8) �μ��ڵ尡 100���̰ų� �޿��� 10000�� �̻��� ������ �μ��ڵ�, �̸�, �޿� ��ȸ
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100 OR SALARY >=10000;

--9) �޿��� 5000 �̻��̰� 7000 ������ ������ ����, �޿� ���(between)
-- salary >=5000 and salary <=7000
SELECT first_name, salary
FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 7000;

--10) �μ����̵� 80 �Ǵ� 90 �Ǵ� 100�� ������ �̸�, �̸���, �μ����̵� ��ȸ(in)
-- d=80 or d=90 or d=100
SELECT FIRST_NAME, EMAIL , DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (80,90,100);

--11) �̸��� S�� �����ϴ� ������ ���̵�, ������ ��ȸ(like)
SELECT EMPLOYEE_ID ,FIRST_NAME 
FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE 'S%';

--12) �̸��� s�� ���ԵǾ� �ִ� ������ ���̵�, ������ ��ȸ(like)
SELECT EMPLOYEE_ID ,FIRST_NAME 
FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE '%s%';

--13) commission_pct�� �ִ� ������ �̸��� commission_pct�� ��ȸ(is null, is not null)
SELECT FIRST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL;

--14) commission�� �ִ� �������� ����,�޿�,���ʽ�(�޿�*commission_pct)�� �Ʒ��� ���� ��ȸ
--	  ����   �޿�   ���ʽ�
--	  xxx	 xxxx	xxx
SELECT FIRST_NAME ����, SALARY �޿�, SALARY * COMMISSION_PCT ���ʽ�
FROM EMPLOYEES e
WHERE COMMISSION_PCT IS NOT NULL;

--15) �޿��� 10000�� �̻��� ������ �̸�, �޿��� �޿������� ��ȸ
SELECT FIRST_NAME ����, SALARY �޿�
FROM EMPLOYEES e2 
WHERE SALARY >= 10000
ORDER BY SALARY;

--16) 15�� �������� ������ �޿��� ��� �̸������� ����
SELECT FIRST_NAME ����, SALARY �޿�
FROM EMPLOYEES e2 
WHERE SALARY >= 10000
ORDER BY SALARY, FIRST_NAME;



