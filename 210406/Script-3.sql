--93) 부서 아이디가 30번인 부서 직원들의 최소 급여보다 작은 급여를 받는 직원의 이름, 급여 조회(<ANY,<ALL)
SELECT e.FIRST_NAME , e.SALARY 
FROM EMPLOYEES e
WHERE e.SALARY <ALL (SELECT e2.SALARY 
		     FROM EMPLOYEES e2 
		     WHERE e2.DEPARTMENT_ID = 30);
			
--94) 2007년도에 입사한 직원들의 최대 급여보다 급여를 많이 받는 직원들의 이름, 급여 조회(>ANY,>ALL)
SELECT e.FIRST_NAME ,e.SALARY 
FROM EMPLOYEES e 
WHERE e.SALARY >ALL (SELECT e2.SALARY
		     FROM EMPLOYEES e2
		     WHERE TO_CHAR(e2.HIRE_DATE,'RRRR') = 2007 );

-------------------------------------------------------
-- SEQUENCE
-------------------------------------------------------
-- 시퀀스를 발생 : 시퀀스명.nextval
-- 현재 시퀀스 조회 : 시퀀스명.currval
-- 목적 : 중복되지 않는 번호를 발생시켜 select와 같은 쿼리문장에서 한건의 데이터를 가져오기 위한 방법
			
--95) 기본값을 사용하여 시퀀스를 생성
CREATE SEQUENCE seq_score;

--96) 생성된 시퀀스를 발생 //실행할 때마다 증가
SELECT seq_score.nextval FROM dual;

--97) 현재 시퀀스값만 조회
SELECT seq_score.currval FROM dual;

--98) score 테이블에 성적을 입력할 때 serial 컬럼에 시퀀스를 적용
INSERT INTO score(SERIAL,MID,SUBJECT,SCORE)
VALUES(seq_score.nextval, 'kim','국어',100);

SELECT * FROM score;
			
-------------------------------------------------------
-- 계층형 쿼리
-------------------------------------------------------			
SELECT LEVEL,EMPLOYEE_ID ,LPAD(' ',LEVEL*3,' ')||FIRST_NAME ,MANAGER_ID FROM EMPLOYEES
START WITH manager_id IS NULL
CONNECT BY PRIOR EMPLOYEE_ID =MANAGER_ID 
ORDER siblings BY MANAGER_ID 			
			
--계층형 쿼리와 페이징 처리☆☆☆
SELECT * FROM (
	SELECT ROWNUM rn, a.* from
		(SELECT rownum, LEVEL,EMPLOYEE_ID ,LPAD(' ',LEVEL*3,' ')||FIRST_NAME ,MANAGER_ID FROM EMPLOYEES
		START WITH manager_id IS NULL
		CONNECT BY PRIOR EMPLOYEE_ID =MANAGER_ID 
		ORDER BY MANAGER_ID) a
) WHERE rn BETWEEN 1 AND 5;


--PL/SQL의 기본 골격

--1) 사번이 100인 직원의 이름과 연락처를 출력

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

--2) 부서코드가 108번인 직원의 급여합계와 평균을 출력		
DECLARE
	h NUMBER(10);
	p number(7,2);
BEGIN
	SELECT sum(SALARY),AVG(SALARY)
	INTO h,p
	FROM EMPLOYEES e2 
	WHERE DEPARTMENT_ID = 80;

	dbms_output.put_line('합계:' || h);
	dbms_output.put_line('평균:' || p);
END;
			
			
--3) Oliver의 부서명을 출력
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

--4) Tayler의 직무명을 출력
--a) join
DECLARE
	job VARCHAR(20);
BEGIN
	SELECT j2.JOB_TITLE 
	INTO job
	FROM JOBS j2  JOIN EMPLOYEES e2
	ON j2.JOB_ID = e2.JOB_ID 
    WHERE e2.FIRST_NAME = 'Tayler';
	
	dbms_output.put_line('직무명 : ' || job);						
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
	
	dbms_output.put_line('직무명 : ' || job);						
END;
		
-- 변수의 유형
-- 1) SCALAR 형 : 오라클의 기본 데이터 유형(varchar, NUMBER, char, ...)
-- 2) %TYPE : 하나의 컬럼 유형을 가져옴
-- 3) %ROWTYPE : 행 전체의 유형을 가져옴
-- 4) RECORD TYPE: %ROWTIPE과 유사하나 변수의 요소를 임의로 추가, 삭제할 수 있다.
-- 5) TABLE TYPE : 하나의 배열과 유사함

--5) 사번이 117번인 직원의 이름과, 급여, 연락처를 조회하시오.(단, 변수의 유형은 %type을 사용할 것)
DECLARE
	ename employees.first_name%TYPE; /* ename varchar2(30) */
	sal   employees.salary%TYPE;	/*number(8,1);*/
	phone employees.phone_number%TYPE; /*varchar2(40);*/
BEGIN
	SELECT 	first_name, salary, phone_number
	INTO	ename, sal, phone
	FROM 	EMPLOYEES e2 
	WHERE 	EMPLOYEE_ID = 117;

	dbms_output.put_line('성명 : ' || ename);
	dbms_output.put_line('급여 : ' || sal);
	dbms_output.put_line('연락처 : ' || phone);
END;

--6) Marketing 부서의 우편번호(postal_code)와 지사의 주소(street_address) 출력(단, 변수의 유형은 %TYPE 사용)
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

	dbms_output.put_line('우편번호 : ' || pcode);
	dbms_output.put_line('주소 : ' || address);
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
						
	dbms_output.put_line('우편번호 : ' || pcode);
	dbms_output.put_line('주소 : ' || address);
END;

--7) Adam의 부서 아이디, 부서이름, 매니저 아이디, location_ID를 조회(단, 변수의 유형은 %ROWTYPE 사용)
DECLARE
	dept departments%ROWTYPE;
BEGIN
	SELECT d.*
	INTO DEPT 
	FROM DEPARTMENTS d JOIN EMPLOYEES e2 
	ON d.DEPARTMENT_ID = e2.DEPARTMENT_ID 
	WHERE e2.FIRST_NAME = 'Adam';

	dbms_output.put_line('부서 아이디 : '|| dept.department_id);
	dbms_output.put_line('부서명 : '||dept.department_name);
	dbms_output.put_line('매니저 아이디 : '||dept.manager_id);
	dbms_output.put_line('Location_ID : '||dept.location_id);
END;

--8) 부서코드가 60번인 부서의 부서명, 매니저명, 우편번호를 조회(RECORD type)
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
   
	dbms_output.put_line('부서명 : '|| t.dname);
	dbms_output.put_line('매니저명 : '||t.mname);
	dbms_output.put_line('우편번호 : '||t.pcode);

END;

--9) Allan의 급여합계(급여+급여*수수료율)가 15,000 이상이면 고액연봉자, 아니면 평균연봉자란 문자열을 급여합계와 합께 출력하시오.(if~then else end if)
DECLARE
	str varchar2(30);
	hap NUMBER;
BEGIN
	SELECT SALARY + (SALARY*COMMISSION_PCT)
	INTO hap
	FROM EMPLOYEES
	WHERE FIRST_NAME ='Allan';

	IF(hap>15000) THEN
		str := '고액연봉자';
	ELSE
		str := '평균연봉자';
	END IF;

    dbms_output.put_line('hap : '||hap ||'('||str||')');
END;

--10) Bruce의 부서코드가 60번이면 'IT부서', 80번이면 '영업부서', 100번이면 '회계부서', 그 외에는 '기타부서'를 부서코드와 함께 출력하시오.(CASE)
DECLARE
	dcode departments.department_id%TYPE;	
	dname varchar2(20);
	
BEGIN
	SELECT department_id
	INTO dcode
	FROM EMPLOYEES
	WHERE FIRST_NAME = 'Bruce';

	dname := CASE dcode
				WHEN 60 THEN 'IT부서'
				WHEN 80 THEN '영업부서'
				WHEN 100 THEN '회계부서'
				ELSE '기타부서'
			 END;

	dbms_output.put_line('code : '||dcode);		
	dbms_output.put_line('name : '||dname);		
END; 
