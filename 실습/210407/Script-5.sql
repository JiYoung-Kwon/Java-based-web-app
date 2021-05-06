--11) LOOP-end를 사용하여 5단을 출력하시오.
DECLARE
	dan NUMBER :=5;
	su NUMBER :=0;
	r NUMBER :=0;
BEGIN
	dbms_output.put_line(dan||'단 출력.............');

	LOOP 
		su:= su+1;
	 	r := dan*su;
	 	dbms_output.put_line(dan||'*'||su||'='|| r);
	 	EXIT WHEN su = 9;
	END LOOP;
END;

--12) WHILE 문을 사용하여 5단 출력하시오.
DECLARE
	dan number(4) :=5;
	su number(2) :=0;
	r number(6) :=0;
BEGIN
	WHILE su<99 LOOP
		su:= su+1;
	 	r := dan*su;
	 	dbms_output.put_line(dan||'*'||su||'='|| r);
	END LOOP;
END;

--13) for문을 사용하여 5단을 출력하시오.
DECLARE
	dan number :=5;
	su number :=0;
	r number :=0;
BEGIN
	FOR su IN reverse 1..99 LOOP
	 	r := dan*su;
	 	dbms_output.put_line(dan||'*'||su||'='|| r);
	END LOOP;
END;

--14) 부서코드가 80번인 직원들의 이름과 이메일, 급여를 for문을 사용하여 출력하시오.
DECLARE

BEGIN
	FOR cur IN (SELECT first_name, email,salary FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=80) LOOP
	dbms_output.put_line(cur.first_name ||' '||cur.email||' '|| CUR.salary);
	END LOOP;
END;

--15) 부서코드가 80번인 직원들의 이름과 이메일, 급여를 for문과 cursor를 사용하여 출력하시오.
DECLARE
	CURSOR cur IS /*cur라는 변수가 cursor타입으로 선언된 것*/
		SELECT first_name, email, salary FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = 80;
BEGIN
	dbms_output.put_line(' ');
	FOR rec IN cur LOOP /*cur에 있는 데이터를 한 건씩 rec에 담아준다.*/
		dbms_output.put_line(rec.first_name ||' '||rec.email||' '|| rec.salary);
	END LOOP;
END;

--16) 사번이 206인 직원의 급여를 5000으로 수정하시오.(procedure을 사용)
SELECT * FROM EMPLOYEES e WHERE EMPLOYEE_ID =206;

CREATE OR REPLACE PROCEDURE up_sal(vempid IN employees.employee_id%type)
IS 
	BEGIN
		UPDATE EMPLOYEES SET salary = 5000
		WHERE EMPLOYEE_ID = vempid;
	END;

begin
	up_sal(206);
END;

--17) 사번과 급여를 전달받아 해당 사번에 급여를 수정하는 procedure을 작성하시오.(up_sal2)
CREATE PROCEDURE up_sal2(vempid IN employees.employee_id%TYPE, vsalary IN employees.salary%type)
IS
	BEGIN
		UPDATE EMPLOYEES SET SALARY = vsalary
		WHERE EMPLOYEE_ID = vempid;
	END;

begin
	up_sal2(206,8000);
END;

--18) 부서코드를 입력받아 해당 부서의 총급여를 조회하는 function을 작성하시오.
CREATE OR REPLACE FUNCTION tot_sal(vdept employees.department_ID%type)
	RETURN NUMBER
IS
	reSal employees.salary%TYPE;
BEGIN
	SELECT max(salary) 
	INTO reSal
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID = vdept;

	RETURN reSal;
END;

SELECT tot_sal(100) FROM dual;

--19) 사번을 입력받아 부서명을 조회하는 function을 작성하시오.
CREATE OR REPLACE FUNCTION getDeptName(eid employees.EMPLOYEE_ID%TYPE)
	RETURN varchar2
IS 
	dname departments.DEPARTMENT_NAME %TYPE;
BEGIN 
	SELECT d2.DEPARTMENT_NAME 
	INTO dname
	FROM DEPARTMENTS d2 JOIN EMPLOYEES e2 
	ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID 
	WHERE e2.EMPLOYEE_ID  = eid;

	RETURN dname;
END;

SELECT getDeptName(103) FROM dual;

--20) score 테이블에 자료가 입력되면 콘솔창에 메시지를 출력하시오. (trigger)
CREATE OR REPLACE TRIGGER triA
AFTER INSERT ON score
BEGIN
	dbms_output.put_line('score테이블에 자료가 추가됨.');
END;

INSERT INTO score(serial, mid, SUBJECT, SCORE) VALUES(seq_score.nextval, 'abc','영어',90);
INSERT INTO TEMPSCORE(serial, mid, SUBJECT, SCORE) VALUES(seq_score.nextval, 'abc','영어',90);

--21) score 테이블에서 자료의 score컬럼의 자료가 update되면 수정 전 score와 수정 후 score 콘솔에 표시하시오.
CREATE OR REPLACE TRIGGER triB
AFTER UPDATE ON SCORE 
FOR EACH ROW 
BEGIN
	dbms_output.put_line('수정 전 점수 : ' || :OLD.score);
	dbms_output.put_line('수정 후 점수 : ' || :NEW.score);
END;

UPDATE score SET score = 50 WHERE SERIAL = 23;
UPDATE score SET score = 90 WHERE SERIAL = 23;

--22) score 테이블에 데이터가 추가되면 관련 정보를 tempScore에도 저장되도록 트리거를 생성하시오(triA 편집)
CREATE OR REPLACE TRIGGER triA
AFTER INSERT ON score
FOR EACH row
BEGIN
	dbms_output.put_line('score테이블에 자료가 추가됨.');
	INSERT INTO TEMPSCORE(serial,mid,subject,score)
	VALUES (:NEW.serial,:NEW.mid,:NEW.subject,:NEW.score);
END;