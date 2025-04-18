-- SELECT문 심화
-- GROUP BY
-- 여러 행의 데이터를 특정 열의 값이 같은 그룹들로 묶어서
-- 통계, 합계, 최대/최소값 등을 도출하고자 할 때 사용
-- '집계함수'를 사용하려면 반드시 GROUP BY가 선행되어야 한다.

-- 집계함수의 종류

-- GROUP BY
-- 특정 열을 기준으로 여러 행을 그룹화한다.
SELECT JOB_ID, SUM(SALARY), COUNT(EMPLOYEE_ID )
FROM EMPLOYEES
GROUP BY JOB_ID
;

-- 합 SUM()
-- SUM() 소괄호 안에 열 이름을 넣으면 
-- 해당 열에 있는 모든 값을 더한 합계를 반환한다.
-- 집계함수에 GROUP BY를 넣지 않으면 
-- 해당 테이블의 모든 데이터에 대해서 집계한다.
SELECT SUM(SALARY)
FROM TBL_EMP;
SELECT *
FROM EMPLOYEES;

-- 평균 AVG()
-- 전달받은 열 이름의 모든 데이터에 대해서
-- 평균값을 구해 반환한다.
SELECT AVG(SALARY) AS "평균 급여" -- EMPLOYEES 테이블의
-- 모든 직원의 평균 급여 도출
FROM EMPLOYEES;

-- 최대값 MAX(), 최소값 MIN()
SELECT MAX(SALARY) "최대 급여", MIN(SALARY) "최소 급여"
FROM EMPLOYEES;

-- 행의 개수 세기 COUNT()
-- 선택한 열의 행 개수를 정수로 반환
-- 이때 NULL값은 개수에서 제외하고 센다.
SELECT COUNT(COMMISSION_PCT) "보너스 인원수"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- GROUP BY
-- 집계함수를 모든 테이블이 아니라 특정 기준에 따라 분류한
-- 그룹 단위로 적용하고자 할 때
-- GROUP BY를 통해 묶어주어야 한다.
-- 이러한 그룹화된 데이터들에 대해서 필터링을 하려면
-- WHERE절이 아니라 HAVING절을 써야 한다.

-- 예제
-- 평균 급여가 5000 이상인 부서 정보를 출력
SELECT DEPARTMENT_ID, AVG(SALARY) "부서별 평균급여"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 5000;
-- WHERE는 그룹화를 하기 전에 가져올 데이터를 고르는 것이고
-- HAVING은 그룹화가 된 뒤의 결과에 대해서
-- 조건을 설정하는 것이다.
-- FROM-WHERE-GROUP BY-HAVING-SELECT


-- 부서별 최고 급여와 최저 급여의 차이를 계산하고
-- 그 차이가 5000 이상인 부서를 조회하라.
SELECT
	DEPARTMENT_ID,
	MAX(SALARY),
	MIN(SALARY),
	MAX(SALARY) - MIN(SALARY) "급여차이"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
-- 최대급여와 최저급여의 차이가 5000 이상인 그룹 데이터만 가져와라
HAVING MAX(SALARY) - MIN(SALARY) >= 5000;