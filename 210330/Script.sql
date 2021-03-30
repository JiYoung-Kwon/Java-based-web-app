--------------------------------------------------------------------
CREATE TABLE emp AS SELECT * FROM EMPLOYEES WHERE salary>8000;
SELECT  * FROM emp;

-- 테이블 삭제
DROP TABLE emp;

--17) employees 테이블과 emp 테이블의 내용을 union으로 병합
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM EMPLOYEES e 
UNION
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM emp;

--18) employees 테이블과 emp 테이블의 내용을 중복허용하여 union all으로 병합
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM EMPLOYEES e 
UNION ALL
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY 
FROM emp;

--19) employees, emp 테이블의 중복되는 자료를 조회(intersect)
SELECT * FROM EMPLOYEES
INTERSECT
SELECT * FROM emp;

--20) employees, emp 테이블의 차집합를 조회(minus)
SELECT * FROM EMPLOYEES
MINUS
SELECT * FROM emp;

SELECT * FROM emp
MINUS
SELECT * FROM EMPLOYEES;

--21) first_name은 모두 대문자로, last_name은 모두 소문자로 출력(Upper,Lower)
SELECT UPPER(FIRST_NAME),LOWER(LAST_NAME) FROM EMPLOYEES e ;

--22) email 주소의 길이를 성명, 이메일, 이메일 길이로 출력(length)
SELECT FIRST_NAME 성명, EMAIL 이메일 ,LENGTH(EMAIL) 이메일길이 FROM EMPLOYEES;

--23) 부서코드가 100번인 사원들의 이메일을 이메일@korea.com 형태로 출력(concat)
SELECT CONCAT(EMAIL,'@korea.com') 이메일 FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

--24) 성명에 th가 포함되어 있는 사원들의 급여를 급여출력, 자리는 10자리로 지정한뒤 나머지 공간은 '*'로 채워 성명과 함께 출력(lpad)
SELECT FIRST_NAME 성명,LPAD(SALARY,10,'*') 급여 FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE '%th%';

--25) 이름의 앞 두자리는 '**'으로 변환하여 조회하시오(replace, substr)
SELECT FIRST_NAME , SUBSTR(FIRST_NAME,1,2)  FROM EMPLOYEES e ;
SELECT FIRST_NAME , REPLACE(FIRST_NAME,'D','*') FROM EMPLOYEES e ;
SELECT FIRST_NAME , REPLACE(FIRST_NAME, SUBSTR(FIRST_NAME,1,2) ,'**') FROM EMPLOYEES e ;

--26) 연락처의 뒷4자리를 모두 '****'로 바꾸어 성명,이메일과 함께 조회.
SELECT FIRST_NAME ,EMAIL ,REPLACE (PHONE_NUMBER, SUBSTR(PHONE_NUMBER,-4,4) , '****') FROM EMPLOYEES e ;

--27) 사원들의 성명, 급여, 보너스(급여의 300%), 총액(급여+보너스)를 출력하시오.(단, 총액은 100단위 미만은 절상하시오) ceil
SELECT FIRST_NAME 성명, SALARY 급여, SALARY * 3 보너스, CEIL((SALARY+SALARY*3)/100)*100 FROM EMPLOYEES e;

--28) 사원들의 성명, 급여, 세금(급여의 10%), 지급액(급여-세금)을 출력하시오.(단, 지급액의 소숫점 이하는 절삭하시오) floor
SELECT FIRST_NAME 성명, SALARY 급여, SALARY *0.1 세금, FLOOR(SALARY+SALARY*0.1) FROM EMPLOYEES e ;

--29) 본인이 살아온 개월수를 계산
SELECT MONTHS_BETWEEN(SYSDATE,'1998/04/16') FROM DUAL;

-- 년월일 표시
SELECT FIRST_NAME ,HIRE_DATE , TO_CHAR(HIRE_DATE,'MM') 입사월 FROM EMPLOYEES e ;

--30) 3월에 입사한 직원의 이름, 입사일을 조회
SELECT FIRST_NAME ,HIRE_DATE FROM EMPLOYEES e WHERE TO_CHAR(HIRE_DATE,'MM') = 3;

--31) 5월에 입사한 직원의 이름, 입사일, 급여를 출력하되, 급여에는 천단위 기호를 사용하여 조회.
SELECT FIRST_NAME ,HIRE_DATE ,TO_CHAR(SALARY,'99,999') FROM EMPLOYEES e WHERE TO_CHAR(HIRE_DATE,'MM')=5; 

--32) 입사년도가 2007년 3월 이후에 입사한 직원의 성명, 급여, 보너스(급여*commission_pct)를 출력하되,
--	  commission_pct가 없는 직원의 보너스는 0으로 처리하시오.(NVL, TO_CHAR)
SELECT FIRST_NAME 성명, SALARY 급여, NVL(SALARY *COMMISSION_PCT,0) 보너스
FROM EMPLOYEES e
WHERE TO_CHAR(HIRE_DATE,'RRRR-MM') > '2007-03'; 

--33) 부서 코드가 100이면 부서명 오른쪽에 '우수부서'를 붙여서 사원명과 함께 출력.
SELECT FIRST_NAME ,DEPARTMENT_ID|| DECODE(DEPARTMENT_ID,100,'(우수부서)')
FROM EMPLOYEES e2 ;

--34) 사원명, 급여, 보너스를 출력하되, 부서코드가 100이면 보너스를 급여의 50% 아니면 급여의 10%를 지급하도록 조회
SELECT FIRST_NAME ,SALARY, DEPARTMENT_ID, DECODE(DEPARTMENT_ID,100,SALARY*.5,SALARY*.1) 보너스
FROM EMPLOYEES e2 ;

--35) 사원명, 급여를 출력하되 급여가 15000 이상이면 '(고액연봉자)', 5000 미만인 경우 '(저소득 사원)'을 급여 오른쪽에 함께 출력.
SELECT FIRST_NAME , SALARY ||
		CASE
			WHEN SALARY >= 15000 THEN '(고액연봉자)'
			WHEN SALARY < 5000 THEN '(저소득 사원)'
		END 
		급여
FROM EMPLOYEES e ;

-- locations 테이블을 사용하여 문제를 해결하세요.
--36) 우편번호에 영문자가 들어있는 정보를 조회하시오.
SELECT * FROM LOCATIONS 
WHERE REGEXP_LIKE(POSTAL_CODE,'[a-zA-Z]'); 

--37) 우편번호가 영문자로 시작하는 정보를 조회하시오.
SELECT * FROM LOCATIONS
WHERE REGEXP_LIKE(POSTAL_CODE,'^[a-zA-Z]') ;

--38) 직원 전체 인원수를 조회
SELECT count(EMPLOYEE_ID) FROM EMPLOYEES;

--39) 3월에 입사한 직원수를 조회
SELECT count(EMPLOYEE_ID) FROM EMPLOYEES e WHERE TO_CHAR(HIRE_DATE,'mm') = '03';

--40) 전 직원의 급여합계를 조회
SELECT SUM(SALARY) FROM EMPLOYEES;
-- 급여 평균
SELECT AVG(SALARY) FROM EMPLOYEES;

