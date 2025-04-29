-- part3_TCL.sql
-- TCL(Transaction Control Language)
-- 트랜젝션을 제어하기 위한 명령어의 집합
-- 트랜젝션 명령어는 크게 두 가지가 있다.
-- 1. 지금까지 했던 작업을 확정
-- -> COMMIT;

-- 2. 지금까지 했던 작업을 취소
-- -> ROLLBACK;
-- 롤백을 하면 마지막으로 COMMIT했던 시점으로
-- 데이터베이스의 상태를 되돌린다.
-- 단, 일부 명령어는 롤백으로도 되돌릴 수가 없다.

SELECT *
FROM EMPLOYEES e ;

ROLLBACK; 	-- 작업사항을 취소
COMMIT;		-- 작업사항을 확정

SELECT *
FROM DEPARTMENTS d ;

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES(2, '고길동');