-- INSERT문
-- 지정한 테이블에 새로운 데이터행을 추가할 때 사용하는 명령어
-- INSERT INTO [테이블명] (컬럼1, 컬럼2,...)
-- VALUES (값1, 값2,...)
-- 지정한 컬럼 순서에 맞게 값이 순서대로 삽입된다.

-- ※ SELECT문 실습을 위해 HR에서 제공하는 학습용 테이블이 아닌
-- 직접 만든 테이블에 CRUD 중 C,U,D를 진행하겠습니다.
-- 1. 테이블 만들기
-- TBL_EMP 테이블을 만들자.
-- EMP_ID, NAME, SALARY, BIRTH_DAY
CREATE TABLE TBL_EMP (
	EMP_ID INTEGER,
	NAME VARCHAR2(50),
	SALARY INTEGER,
	BIRTH_DAY DATE
);

-- TBL_EMP 테이블에 데이터 삽입하기
-- 컬럼명의 개수와 삽입하려는 값의 개수가 일치해야 한다.
INSERT INTO TBL_EMP (EMP_ID, NAME, SALARY, BIRTH_DAY)
VALUES (1, '홍길동', 2000000, TO_DATE('1990-01-01'));

SELECT *
FROM TBL_EMP;





