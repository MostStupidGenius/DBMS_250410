-- INSERT문 복습
-- 기존 테이블을 삭제(DROP)하고
-- 새로 똑같은 테이블을 만들어 진행해보자.
DROP TABLE TBL_EMP;

-- 테이블 만들기
CREATE TABLE TBL_EMP(
	EMP_ID INTEGER,
	NAME VARCHAR2(50),
	SALARY INTEGER,
	BIRTH_DAY DATE
);

-- 한 줄의 데이터 삽입하기
INSERT INTO TBL_EMP (EMP_ID, NAME, SALARY) -- 컬럼명들
VALUES (2, '고길동', 1900000); -- 각 컬럼에 들어갈 값

-- 여러 줄의 데이터를 한번에 삽입하기
-- INSERT ALL
-- INTO () VALUES ()
-- INTO () VALUES ()
-- SELECT * FROM DUAL;
-- 여러 행의 데이터를 삽입할 때,
-- 서로 다른 테이블에 데이터를 삽입해도 된다.
-- 하지만 일반적으로 같은 테이블에 데이터를 넣는 것을
-- 하나의 문장으로 구성하는 게 좋다.(한 테이블, 한 문장)

INSERT ALL
	INTO TBL_EMP (EMP_ID, NAME, SALARY)
	VALUES (3, '둘리', 2500000)	
	INTO TBL_EMP (EMP_ID, NAME, SALARY)
	VALUES (4, '또치', 2400000)
	INTO TBL_EMP (EMP_ID, NAME, SALARY)
	VALUES (5, '도우너', 2300000)
SELECT * FROM DUAL;

SELECT *
FROM TBL_EMP;