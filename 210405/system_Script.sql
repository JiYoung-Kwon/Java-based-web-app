-- �� ���� ��� �� ��ȣ ����
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER park IDENTIFIED BY 1111;

-- ��ϵ� �������� ����(ROLE)
GRANT CONNECT, resource, dba TO park;

-- ���� ����
DROP USER park;
DROP USER kim;