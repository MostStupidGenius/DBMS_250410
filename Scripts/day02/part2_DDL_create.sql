-- 테이블 생성
-- CREATE TABLE
-- 데이터를 저장할 공간의 형태를 지정, 구성된 것을
-- 테이블이라고 부르며 이러한 테이블의 형태를
-- 정하는 명령어가 CREATE 명령어다.
-- CREATE TABLE [테이블명] ([테이블정의]);

CREATE TABLE TBL_TEST (
	-- 컬럼을 만들 때에는
	-- [컬럼명] [데이터타입] [옵션들]
	-- 가변길이 문자열 타입의 NAME 컬럼을 만들어보자.
	NAME VARCHAR2(50),
	-- 정수형 타입의 AGE 컬럼을 만들어보자.
	AGE INTEGER,
	-- BIRTH_DAY 컬럼을 DATE 타입으로 만들어보자.
	BIRTH_DAY DATE
);
-- 테이블 확인하기
SELECT *
FROM TBL_TEST;

-- 테이블의 설정을 변경
-- 테이블의 구조를 수정할 때 사용하는 명령어가 있다.
-- ALTER [객체명] [옵션]

-- 1. 기존 열(컬럼) 삭제
-- DROP
ALTER TABLE TBL_TEST
DROP COLUMN BIRTH_DAY;

-- 2. 새로운 열 추가
-- ADD
ALTER TABLE TBL_TEST 
ADD (
	HOBBY VARCHAR2(20),
	NICKNAME CHAR(5)
);

-- 3. 열의 데이터 타입 변경
-- MODIFY [기존컬럼명] [새로운데이터타입]
ALTER TABLE TBL_TEST
MODIFY NICKNAME VARCHAR2(20);

-- 열 이름 변경
-- RENAME COLUMN [기존열이름] TO [새열이름]
ALTER TABLE TBL_TEST
RENAME COLUMN NICKNAME TO NICK_NAME;

-- 테이블 이름 변경
-- RENAME TO [새테이블명]
ALTER TABLE TBL_TEST
RENAME TO TBL_RENAMED;

SELECT *
FROM TBL_RENAMED;

-- 테이블 삭제
-- DROP
-- 테이블, 인덱스, 뷰 등의 객체를 완전히 삭제한다.
-- 이때 삭제된 데이터는 복구할 수 없다.
-- DROP [객체종류] [객체명];
DROP TABLE TBL_RENAMED;

-- TRUNCATE
-- DROP TABLE과 비슷하지만
-- 데이터만 삭제하고 테이블의 구조는 유지한다.
-- 속도가 매우 빠르고 롤백(복구)이 불가능하다.
-- 주의: 실무에서 사용할 일은 없다고 보면 된다.