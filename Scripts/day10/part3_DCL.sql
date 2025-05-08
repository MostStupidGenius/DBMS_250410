-- part3_DCL.sql
-- 상단에서 SYSDBA 커넥션으로 연결
-- -> 계정 관리 등 모든 권한에 접근이 가능해진다.

-- 현재 존재하는 계정 리스트 출력(VIEW 테이블)
SELECT *
FROM DBA_USERS du ;

-- 새 사용자 생성
-- CREATE USER 유저이름 IDENTIFIED BY 비밀번호;
CREATE USER LEE
IDENTIFIED BY 1234;
-- 새로 만들어진 계정의 최초의 상태는 
-- 아무런 권한도 없는 상태다.
-- 권한 부여가 필요하다.

-- 권한 부여
-- GRANT
-- GRANT 권한 TO 유저이름
-- 해당 유저에게 권한을 부여한다.
-- 가장 기본이 되는 권한은 접속 권한으로
GRANT CREATE SESSION TO LEE; -- 접속 권한 부여

-- 특정 권한(DML, DDL) 부여
GRANT
	CREATE TABLE, -- 테이블 생성 권한
	CREATE VIEW -- VIEW테이블 생성 권한
TO LEE;

-- 역할(ROLE) 부여
GRANT CONNECT, RESOURCE TO LEE;

-- 특정 테이블에 대한 권한 부여
GRANT
	SELECT, INSERT -- 이 권한들을
ON HR.PERSON_AGE -- 이 테이블에 대한
-- 스키마.테이블이름
TO LEE; -- 이 유저에게 부여하겠다.

-- 권한 부여 여부 확인
SELECT *
FROM DBA_SYS_PRIVS dsp
WHERE GRANTEE = 'LEE'
--ORDER BY PRIVILEGE
;

-- 특정 역할 부여 확인
SELECT *
FROM DBA_ROLE_PRIVS drp
WHERE GRANTEE = 'LEE';

-- 특정 권한 회수(REVOKE)
-- REVOKE 권한 ON 스키마.테이블명 FROM 유저
REVOKE CREATE TABLE
-- ON HR.PERSON_AGE -- 특정 테이블에 부여되어 있다면
FROM LEE;

-- 계정 삭제
DROP USER LEE
CASCADE; -- 관련된 모든 권한을 삭제