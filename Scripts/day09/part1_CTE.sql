-- part1_CTE.sql
-- CTE(Common Table Expression)
-- sql쿼리 내에서 임시로 사용할 수 있는 임시 테이블을 이름을 정하여
-- 정의하는 것을 가리킨다.
-- 이러한 CTE는 이름이 없는 1회용 서브쿼리나
-- 매우 자주 사용되는 VIEW 테이블과 달리
-- 해당 쿼리(;) 안에서만 재사용이 가능하다는 점이 특이한 점이다.
-- 복잡한 SELECT문을 상단에 미리 정의해두고
-- 그 이름만으로 테이블을 참조하는 방식은
-- 가독성과 유지보수, 관리 면에서도 생산성 향상을 기대할 수 있다.

-- 작성법
-- WITH [RECURSIVE] 테이블명 [(컬럼명1, 컬럼명2,...)] AS (서브쿼리)
-- SELECT문

-- WITH 구문은 반복적으로 여러 테이블을 정의할 수 있으며
-- 정의한 여러 테이블을 가장 아래의 SELECT 문에서
-- 테이블 이름만으로 사용/재사용할 수 있다.

-- CTE 예시
-- 2010년 이전에 입단한 선수들의 테이블
WITH PLAYER_2000 AS (
	SELECT PLAYER_ID, PLAYER_NAME, JOIN_YYYY, "POSITION"
	FROM PLAYER
	WHERE TO_NUMBER(JOIN_YYYY) < 2010
),
-- 포지션이 DF인 선수들
	PLAYER_DF AS (
	SELECT PLAYER_ID, PLAYER_NAME, JOIN_YYYY, "POSITION"
	FROM PLAYER
	WHERE "POSITION" = 'DF'
),
-- 2000년대 입단 선수이거나 포지션이 DF인 선수들을 가리키는 테이블
	DF_2000 AS (
	SELECT * FROM PLAYER_2000
	UNION
	SELECT * FROM PLAYER_DF
)
-- DF_2000 테이블을 정렬하는 마지막 부분
SELECT *
FROM DF_2000
ORDER BY JOIN_YYYY
;

-- 재귀적 CTE(RECURSIVE CTE)
-- 자기자신 테이블을 참조하는 CTE를 가리킨다.
-- 주로 자신 테이블의 PK를 참조하는 FK를 보유한 경우,
-- 계층적 구조의 데이터를 처리하는 데 쓰인다.
SELECT EMPLOYEE_ID, MANAGER_ID
FROM EMPLOYEES;

-- 재귀적 CTE를 사용할 때에는 기본케이스(중단케이스)와
-- 재귀 케이스를 구분할 필요가 있다.

-- ※ 12c 버전 이후로 사용 가능한 문법
WITH RECURSIVE EMPLOYEE_HIERARCHY (EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, LEVELS) AS
	(
	SELECT * --	기본 케이스 -> 최상위 관리자
	FROM (
		SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, 1 AS LEVELS
		FROM EMPLOYEES
		WHERE MANAGER_ID IS NULL
	)
	UNION ALL
	--	재귀 케이스
	SELECT *
	FROM (
		SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.MANAGER_ID, H.LEVELS +1 AS LEVELS
		FROM EMPLOYEES e 
		JOIN EMPLOYEE_HIERARCHY H
		ON E.MANAGER_ID = H.EMPLOYEE_ID
	)
)
SELECT *
FROM EMPLOYEE_HIERARCHY;

WITH RankedEmployees AS (
    SELECT 
        employee_id, 
        first_name,
        last_name,
        department_id,
        salary,
        RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT *
FROM RankedEmployees
WHERE salary_rank <= 3; -- 각 부서별 상위 3명만 선택







