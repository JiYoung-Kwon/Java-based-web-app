SELECT * FROM EMPLOYEES e ;
SELECT first_name FROM EMPLOYEES;

--1) 모든 사원명과 이메일 주소만 조회
SELECT first_name, email FROM EMPLOYEES;

--2) 모든 부서의 부서명과 매니저 아이디만 조회
SELECT department_name, manager_id FROM DEPARTMENTS d;

--3) 컬럼 명의 별칭 사용하기
SELECT 10 + 10 FROM DUAL;
SELECT 10 + 10 hap FROM DUAL;

--4) 사원 테이블에서 부서코드(department_id)를 중복없이 조회
SELECT department_id FROM EMPLOYEES e;
SELECT DISTINCT department_id FROM EMPLOYEES e;

-- * 둘이 합쳐서 Unique한 값만 추출 -> 중복 제거 시 주의(1개의 컬럼에만 적어도 모든 컬럼에 적용됨)
SELECT DISTINCT department_id, employee_id FROM EMPLOYEES e ;
SELECT DISTINCT department_id, MANAGER_ID FROM EMPLOYEES e ;

--5) 사원 테이블의 정보를 아래와 같이 출력하시오.
--	 XXX 사원의 부서코드는 XXX 입니다.
SELECT first_name||' 사원의 부서코드는 ' ||DEPARTMENT_ID ||' 입니다.' FROM EMPLOYEES e2; 

--6) 급여(salary)가 10000원 이상인 직원의 이름과 급여를 조회 
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000;

--7) 급여가 10000원 이상이거나, 4000이하인 직원의 이름, 급여, 이메일 조회
SELECT FIRST_NAME, SALARY, EMAIL 
FROM EMPLOYEES
WHERE SALARY >= 10000 OR SALARY <=4000;

--8) 부서코드가 100번이거나 급여가 10000원 이상인 직원의 부서코드, 이름, 급여 조회
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100 OR SALARY >=10000;

--9) 급여가 5000 이상이고 7000 이하인 직원의 성명, 급여 출력(between)
-- salary >=5000 and salary <=7000
SELECT first_name, salary
FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 7000;

--10) 부서아이디가 80 또는 90 또는 100인 직원의 이름, 이메일, 부서아이디를 조회(in)
-- d=80 or d=90 or d=100
SELECT FIRST_NAME, EMAIL , DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (80,90,100);

--11) 이름이 S로 시작하는 직원의 아이디, 성명을 조회(like)
SELECT EMPLOYEE_ID ,FIRST_NAME 
FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE 'S%';

--12) 이름에 s기 포함되어 있는 직원의 아이디, 성명을 조회(like)
SELECT EMPLOYEE_ID ,FIRST_NAME 
FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE '%s%';

--13) commission_pct가 있는 직원의 이름과 commission_pct를 조회(is null, is not null)
SELECT FIRST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL;

--14) commission이 있는 직원들은 성명,급여,보너스(급여*commission_pct)를 아래와 같이 조회
--	  성명   급여   보너스
--	  xxx	 xxxx	xxx
SELECT FIRST_NAME 성명, SALARY 급여, SALARY * COMMISSION_PCT 보너스
FROM EMPLOYEES e
WHERE COMMISSION_PCT IS NOT NULL;

--15) 급여가 10000원 이상인 직원의 이름, 급여를 급여순으로 조회
SELECT FIRST_NAME 성명, SALARY 급여
FROM EMPLOYEES e2 
WHERE SALARY >= 10000
ORDER BY SALARY;

--16) 15번 문제에서 동일한 급여인 경우 이름순으로 정렬
SELECT FIRST_NAME 성명, SALARY 급여
FROM EMPLOYEES e2 
WHERE SALARY >= 10000
ORDER BY SALARY, FIRST_NAME;



