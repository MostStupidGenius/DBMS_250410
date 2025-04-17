-- 연산자
-- 연산자란 데이터를 조작하고 연산하여 새로운 값을 만들어내거나
-- 어떤 결과를 도출해낼 때 사용하는 특수한 기호들을 가리킨다.

-- 연결 연산자
-- || -> Enter 위에 \를 Shift와 함께 누르면 나옵니다.
-- 여러 개의 문자열''을 하나의 문자열로 결합할 때 사용한다.
SELECT FIRST_NAME || '/' || LAST_NAME 
FROM EMPLOYEES;

SELECT FIRST_NAME, EMAIL || '@test.kr'
FROM EMPLOYEES;

-- 별칭을 지어 열의 이름 변경하기
-- ALIAS
-- SELECT 문에서 열 이름 뒤에 AS와 함께 
-- 새로운 열 이름을 큰따옴표"" 감싸서 지정할 수 있다.
-- 생략 가능한 내용:
-- 1. 별칭의 내용을 큰따옴표""로 작성한 경우, AS를 생략할 수 있다.
-- 2. 별칭에 공백문자가 없을 경우, 큰따옴표""도 생략 가능
-- 3. 별칭이 만약 예약어로 지정된 단어인 경우,
-- 별칭 안에 공백문자가 없더라도 반드시 큰따옴표로 감싸야 한다.
SELECT FIRST_NAME "SELECT", -- AS 생략 가능
	LAST_NAME 성,
	FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME"
FROM EMPLOYEES e;

-- 특수기호가 아닌 단어로 이루어진 연산자
-- WHERE 절에서 쓰여 특수한 방식으로 참, 거짓 결과를 반환하는
-- 연산자들을 가리킨다.
-- BETWEEN
-- 특정 컬럼의 값이 주어진 두 값 사이에 위치하는지 여부를 반환
-- 이때 기준이 되는 두 값을 포함(이상, 이하)한다.
-- WHERE [열이름] BETWEEN 작은값 AND 큰값
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
-- SALARY의 값이 6000이상 10000이하인 데이터만 가져와라
WHERE SALARY BETWEEN 6000 AND 10000
ORDER BY SALARY DESC
;
-- SALARY가 6000인 데이터와 10000인 데이터 모두
-- 포함되는 것을 확인할 수 있다.

-- IN
-- 특정 그룹 안에 해당되는 열의 값이 포함되는지 여부를 반환하는 연산자
-- WHERE [열이름] IN (값1, 값2, 값3)
SELECT FIRST_NAME, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (90, 60, 100);
--WHERE DEPARTMENT_ID = 90
--	OR DEPARTMENT_ID = 60
--	OR DEPARTMENT_ID = 100;

-- 
SELECT *
FROM EMPLOYEES
WHERE FIRST_NAME IN ('Alexander', 'David', 'Steven')
-- ORDER BY FIRST_NAME
;

-- LIKE
-- 문자열 패턴 매칭을 통해 원하는 값을 가져올 수 있다.
-- WHERE절에서 단순히 같은지 여부나 IN 연산자로는
-- 정확하게 같은 값만 가져올 수 있었다면
-- LIKE 연산자는 "'A'로 시작하는 문자열"과 같은
-- 좀더 포괄적이고 개념적인 검색이 가능해진다.
-- WHERE [열이름] LIKE [패턴문자열]
-- 패턴 문자열 안에 % 기호를 사용하여
-- 문자열의 확장을 나타낼 수 있다.
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME
--LIKE 'A%' -- A로 시작하는 문자열 검색
--LIKE 'A%a' -- A로 시작해서 중간에 여러개 문자열이 들어갈 수 있고
-- 소문자 a로 끝나는 문자열 검색 
--LIKE '%e%er' -- er로 끝나고 중간에 e가 들어가는 이름 검색
LIKE '%e' -- e로 끝나는 문자열
ORDER BY FIRST_NAME;

-- IS NULL
-- NULL 값은 값이 없음을 명시적으로 나타내는 특수한 값이다.
-- NULL인지 여부를 검사할 때에는 =연산자가 아니라
-- IS NULL을 사용해야 한다.
SELECT FIRST_NAME, COMMISSION_PCT 
FROM EMPLOYEES
--WHERE COMMISSION_PCT IS NULL;
-- NULL이 아닌 경우를 필터링하고자 할 때
-- IS NOT NULL
WHERE COMMISSION_PCT IS NOT NULL;

-- 논리 연산자
-- 논리값(TRUE, FALSE)과 논리값을 연산하여
-- 그 결과를 도출해내는 연산자를 가리킨다.
-- 1. 논리곱(AND), 교집합
-- 두 논리값이 모두 참일 때 그 결과 참을 반환한다.
-- -> 두 조건을 모두 만족하면 참을 반환한다.
-- 하나라도 거짓(FALSE)라면 FALSE를 반환한다.
-- TRUE TRUE	-> TRUE
-- 1 X 1 -> 1
-- TRUE FALSE 	-> FALSE
-- 1 X 0 -> 0
-- FALSE FALSE 	-> FALSE
-- 0 X 0 -> 0

-- 논리합(OR)
-- 두 논리값 중 하나라도 참(TRUE)이면
-- 그 결과 참을 반환하는 연산자
-- TRUE TRUE 	-> TRUE
-- 1 + 1 -> 1
-- TRUE FALSE 	-> TRUE
-- 1 + 0 -> 1
-- FALSE FALSE 	-> FALSE
-- 0 + 0 -> 0

-- 부정 연산자(NOT)
-- 논리값 하나 앞에 쓰여 해당 논리값을 반전시키는
-- 단항 연산자다.
SELECT *
FROM DUAL
WHERE NOT (DUMMY = 'X')
;

SELECT SALARY
FROM EMPLOYEES
WHERE NOT (SALARY >= 10000);



