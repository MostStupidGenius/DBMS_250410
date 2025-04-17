-- SELECT문의 WHERE절
-- WHERE절은 '조건식'을 평가하여 '참'이 나오는 데이터만
-- 결과 데이터 테이블에 출력한다.
-- # 조건식이란?
-- 참 또는 거짓으로 결과값이 나오는 연산식(표현식)
-- 연산자
--	1. 초과, 미만 >, <
--  2. 이상, 이하 >=, <=
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES e
-- SALARY의 값이 10000 초과인 데이터만 가져와라
--WHERE SALARY > 10000;
-- SALARY의 값이 5000 이상인 데이터만 가져와라
WHERE SALARY >= 5000;

-- 3. 동일여부 = 같니? != 다르니?
-- 두 값이 같은지 여부를 반환하는 연산자
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES e
-- JOB_ID가 문자열 'IT_PROG'인 데이터만 가져와라
-- 단어만 그냥 적으면 컬럼으로 인식한다.
-- 때문에 문자열 데이터값으로 인식시키려면 작은따옴표''로
-- 감싸주어야 한
WHERE JOB_ID = 'IT_PROG';

-- employees 테이블에서
-- 직원의 모든 정보를 조회해보세요.
SELECT *
FROM EMPLOYEES
-- department_id가 60이고
WHERE DEPARTMENT_ID = 60
-- SALARY가 6000 이상인 데이터를 가져와라
AND SALARY >= 6000;


-- 데이터의 정렬
-- 출력 결과의 데이터를 기준 열을 정하여
-- 오름차순 혹은 내림차순으로 데이터행을 정렬할 수 있다.
-- ORDER BY 절
-- ASC, DESC
-- FROM 절, WHERE 절 이후에 ORDER BY 절을 작성해야 한다.
-- 오름차순 정렬이 기본으로 적용되기 때문에
-- ASC를 생략할 수도 있다.
SELECT *
FROM EMPLOYEES
ORDER BY SALARY;

-- ORDER BY 절에서 여러 개의 컬럼을 기준으로 잡을 수 있다.
-- 이때, 먼젓번의 기준열의 값이 같은 경우
-- 다음번의 기준열을 기준으로 정렬을 시행한다.
-- 여러 열을 기준으로 삼을 때에는 반점,으로 구분하여 작성한다.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC, EMPLOYEE_ID DESC;