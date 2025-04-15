-- DML
-- 테이블의 구조를 정의하고 변경하는 게 DDL이었다면
-- 해당 테이블에 데이터를 넣고, 제거하고, 변경하는 작업은
-- DML이 담당한다.
-- SELECT [컬럼명1], [컬럼명2] FROM [테이블명]
SELECT * -- * 문자는 모든 컬럼을 가리킨다.
FROM EMPLOYEES;

-- 특정 컬럼명을 반점,으로 구분하여 SELECT 구문에 적어주면
-- 해당 컬럼의 데이터만 모아서 보여준다.
-- 이때, 같은 컬럼을 두 번 이상 적어도 상관없다.
SELECT EMPLOYEE_ID, FIRST_NAME
--	, HIRE_DATE
--	, HIRE_DATE
FROM EMPLOYEES;

-- 데이터의 중복 제거
-- DISTINCT
-- 데이터 중 중복을 제거하고 보고 싶을 때 
-- 사용하는 키워드다.
-- 중복의 기준은 SELECT 해온 결과에서
-- 모든 컬럼의 데이터가 같을 경우 중복 데이터로 취급한다.
-- SELECT DISTINCT [컬럼명] FROM [테이블명]
SELECT
DISTINCT
	JOB_ID
--	, SALARY
FROM EMPLOYEES e ;

-- 중복제거 조회 실습 (~21:38)
-- 1. *을 사용하여 EMPLOYEES 테이블에서
-- 모든 데이터 조회
SELECT *
FROM EMPLOYEES e;

-- 2. JOB_ID를 조회
SELECT JOB_ID
FROM EMPLOYEES e;

-- 3. 중복제거하여 조회
-- DISTINCT
SELECT DISTINCT
	JOB_ID
FROM EMPLOYEES e;