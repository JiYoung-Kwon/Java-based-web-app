--11) LOOP-end�� ����Ͽ� 5���� ����Ͻÿ�.
DECLARE
	dan NUMBER :=5;
	su NUMBER :=0;
	r NUMBER :=0;
BEGIN
	dbms_output.put_line(dan||'�� ���.............');

	LOOP 
		su:= su+1;
	 	r := dan*su;
	 	dbms_output.put_line(dan||'*'||su||'='|| r);
	 	EXIT WHEN su = 9;
	END LOOP;
END;

--12) WHILE ���� ����Ͽ� 5�� ����Ͻÿ�.
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

--13) for���� ����Ͽ� 5���� ����Ͻÿ�.
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

--14) �μ��ڵ尡 80���� �������� �̸��� �̸���, �޿��� for���� ����Ͽ� ����Ͻÿ�.
DECLARE

BEGIN
	FOR cur IN (SELECT first_name, email,salary FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=80) LOOP
	dbms_output.put_line(cur.first_name ||' '||cur.email||' '|| CUR.salary);
	END LOOP;
END;

--15) �μ��ڵ尡 80���� �������� �̸��� �̸���, �޿��� for���� cursor�� ����Ͽ� ����Ͻÿ�.
DECLARE
	CURSOR cur IS /*cur��� ������ cursorŸ������ ����� ��*/
		SELECT first_name, email, salary FROM EMPLOYEES e2 WHERE DEPARTMENT_ID = 80;
BEGIN
	dbms_output.put_line(' ');
	FOR rec IN cur LOOP /*cur�� �ִ� �����͸� �� �Ǿ� rec�� ����ش�.*/
		dbms_output.put_line(rec.first_name ||' '||rec.email||' '|| rec.salary);
	END LOOP;
END;

--16) ����� 206�� ������ �޿��� 5000���� �����Ͻÿ�.(procedure�� ���)
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

--17) ����� �޿��� ���޹޾� �ش� ����� �޿��� �����ϴ� procedure�� �ۼ��Ͻÿ�.(up_sal2)
CREATE PROCEDURE up_sal2(vempid IN employees.employee_id%TYPE, vsalary IN employees.salary%type)
IS
	BEGIN
		UPDATE EMPLOYEES SET SALARY = vsalary
		WHERE EMPLOYEE_ID = vempid;
	END;

begin
	up_sal2(206,8000);
END;

--18) �μ��ڵ带 �Է¹޾� �ش� �μ��� �ѱ޿��� ��ȸ�ϴ� function�� �ۼ��Ͻÿ�.
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

--19) ����� �Է¹޾� �μ����� ��ȸ�ϴ� function�� �ۼ��Ͻÿ�.
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

--20) score ���̺� �ڷᰡ �ԷµǸ� �ܼ�â�� �޽����� ����Ͻÿ�. (trigger)
CREATE OR REPLACE TRIGGER triA
AFTER INSERT ON score
BEGIN
	dbms_output.put_line('score���̺� �ڷᰡ �߰���.');
END;

INSERT INTO score(serial, mid, SUBJECT, SCORE) VALUES(seq_score.nextval, 'abc','����',90);
INSERT INTO TEMPSCORE(serial, mid, SUBJECT, SCORE) VALUES(seq_score.nextval, 'abc','����',90);

--21) score ���̺��� �ڷ��� score�÷��� �ڷᰡ update�Ǹ� ���� �� score�� ���� �� score �ֿܼ� ǥ���Ͻÿ�.
CREATE OR REPLACE TRIGGER triB
AFTER UPDATE ON SCORE 
FOR EACH ROW 
BEGIN
	dbms_output.put_line('���� �� ���� : ' || :OLD.score);
	dbms_output.put_line('���� �� ���� : ' || :NEW.score);
END;

UPDATE score SET score = 50 WHERE SERIAL = 23;
UPDATE score SET score = 90 WHERE SERIAL = 23;

--22) score ���̺� �����Ͱ� �߰��Ǹ� ���� ������ tempScore���� ����ǵ��� Ʈ���Ÿ� �����Ͻÿ�(triA ����)
CREATE OR REPLACE TRIGGER triA
AFTER INSERT ON score
FOR EACH row
BEGIN
	dbms_output.put_line('score���̺� �ڷᰡ �߰���.');
	INSERT INTO TEMPSCORE(serial,mid,subject,score)
	VALUES (:NEW.serial,:NEW.mid,:NEW.subject,:NEW.score);
END;