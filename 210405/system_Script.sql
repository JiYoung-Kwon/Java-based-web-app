-- 새 유저 등록 및 암호 설정
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER park IDENTIFIED BY 1111;

-- 등록된 유저에게 권한(ROLE)
GRANT CONNECT, resource, dba TO park;

-- 유저 삭제
DROP USER park;
DROP USER kim;