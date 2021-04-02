--41) 부서코드가 80번이거나 입사월이 04월인 직원들의 평균급여는?
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES WHERE DEPARTMENT_ID = 80 OR TO_CHAR(HIRE_DATE,'mm') = '04';

----group by-----------------------------------------------

--42) 부서별 인원수는 몇명?
SELECT DEPARTMENT_ID ,COUNT(EMPLOYEE_ID) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

--43) 입사년도 별 인원수는 몇명?
SELECT  TO_char(hire_date,'rrrr'), count(EMPLOYEE_ID) cnt FROM EMPLOYEES 
GROUP BY  TO_char(hire_date,'rrrr')
ORDER BY cnt DESC ;


--44) 부서별 급여합계 
SELECT DEPARTMENT_ID, sum (SALARY) hap FROM EMPLOYEES e 
GROUP BY  DEPARTMENT_ID
ORDER BY hap DESC ;

SELECT  * FROM DEPARTMENTS WHERE DEPARTMENT_ID =10;

--45) 직무별(job_id) 인원수와 평균 급여를 계산하시오
SELECT count(JOB_ID), AVG(SALARY) FROM EMPLOYEES e ;


--46) 부서코드가 80번인 직원들 중 직무별 인원수는?
SELECT JOB_ID , COUNT(JOB_ID) cnt FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 80
GROUP BY JOB_ID ;


--47) 직무별 인원수 조회
SELECT JOB_ID , COUNT(JOB_ID) cnt FROM EMPLOYEES e 
GROUP BY JOB_ID ;


--48) 직무별 인원수 중 인원이 5명보다 큰 정보를 조회
SELECT JOB_ID ,COUNT(JOB_ID) cnt FROM EMPLOYEES e 
GROUP BY JOB_ID 
HAVING COUNT(JOB_ID)>5;

--49) 부서별, 직무별 인원수 조회
SELECT  department_id, COUNT(employee_id) FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID ;

SELECT  JOB_ID, COUNT(employee_id) FROM EMPLOYEES e2 
GROUP BY JOB_ID ;

--50) 부서_직무별 인원 조회
SELECT  department_id, JOB_ID,COUNT(employee_id) FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID,JOB_ID;

----join--------------------------------------------

--51) Lex의 부서명은 ?
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

--52) 사번이 112인 직원의 이름, 급여, 부서코드, 부서명을 조회

-- oracle join
SELECT FIRST_NAME, SALARY , e.DEPARTMENT_ID ,DEPARTMENT_NAME FROM EMPLOYEES e, DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND employee_id = 112;

-- ansi join
SELECT FIRST_NAME, SALARY , e.DEPARTMENT_ID ,DEPARTMENT_NAME FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE employee_id = 112;

--53) 부서명이 IT인 직원들의 이름, 이메일, 부서코드를 조회

-- oracle join
SELECT FIRST_NAME, EMAIL, e.DEPARTMENT_ID FROM EMPLOYEES e,DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND DEPARTMENT_NAME = 'IT';

-- ansi join
SELECT FIRST_NAME, EMAIL, e.DEPARTMENT_ID FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE DEPARTMENT_NAME = 'IT';

--54) 부서명이 Sales인 부서의 급여합계를 조회

-- oracle join
SELECT SUM(salary) FROM EMPLOYEES e2, DEPARTMENTS d2 
WHERE e2.DEPARTMENT_ID = d2.DEPARTMENT_ID 
AND DEPARTMENT_NAME = 'Sales';

-- ansi join
SELECT SUM(salary) FROM EMPLOYEES e2 JOIN DEPARTMENTS d2 
ON e2.DEPARTMENT_ID = d2.DEPARTMENT_ID 
WHERE DEPARTMENT_NAME = 'Sales';

--55) 부서명이 Finance인 부서의 매니저 이름은?

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

-- outer join, eqiv join 차이
SELECT count(*) FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID ;
-- 위의 커리는 부서가 없는 직원은 카운팅되지 않음

SELECT count(*) FROM EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS d 
ON e.DEPARTMENT_ID =d.DEPARTMENT_ID ;

--56) departments 테이블을 기준으로 부서코드, 부서명, 직원이름을 조회.
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

--57) Sigal 사원의 매니저 이름은?
SELECT MANAGER_ID FROM EMPLOYEES e WHERE first_name = 'Sigal';
SELECT first_name FROM EMPLOYEES e WHERE EMPLOYEE_ID = 114;

SELECT m.first_name FROM EMPLOYEES e JOIN EMPLOYEES m
ON e.MANAGER_ID = m.EMPLOYEE_ID 
WHERE e.FIRST_NAME ='Sigal';

--58) 매니저 이름이 John Russell이 관리하는 직원들의 사번, 이름, 급여를 조회
SELECT e.EMPLOYEE_ID, e.FIRST_NAME , e.SALARY FROM EMPLOYEES e JOIN EMPLOYEES m
ON e.MANAGER_ID = m.EMPLOYEE_ID 
WHERE m.FIRST_NAME = 'John' AND m.LAST_NAME = 'Russell';

--59) Luis와 같은 해에 입사한 직원들의 이름과 이메일을 조회
SELECT e.first_name, e.EMAIL FROM EMPLOYEES e JOIN EMPLOYEES l
ON TO_CHAR(e.HIRE_DATE,'RRRR') =  TO_CHAR(l.HIRE_DATE,'RRRR')
WHERE l.FIRST_NAME = 'Luis';

--60) David Austin과 같은 부서 사람들의 이름, 연락처를 조회
SELECT e.FIRST_NAME ,e.PHONE_NUMBER FROM EMPLOYEES e JOIN EMPLOYEES d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE d.FIRST_NAME = 'David' AND d.LAST_NAME = 'Austin';

-- 테이블 생성
CREATE TABLE student(
	id varchar(20),
	irum varchar(30),
	address varchar(100),
	phone varchar(20)
);