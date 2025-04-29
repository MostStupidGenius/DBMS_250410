-- NULL값과 NULL 값 처리
-- 알 수 없는 값인 NULL 값은 비교연산에서 그 결과가
-- 항상 NULL로 나온다.
-- 때문에 데이터상에서 NULL값이 포함되어 있으면
-- 통계를 내기가 까다로워진다.
-- 이때문에 NULL값을 처리해야 하는데 이러한 처리를 도와주는
-- 함수가 두 개 있다.
-- 1. NVL(대상, 대체값)
-- NVL 함수에 전달한 대상의 값을 평가하여 만약 NULL이라면
-- 대체값으로 바꿔서 반환/치환하고
-- NULL이 아니라면 기존값으로 그대로 표현시켜주는 함수다.
SELECT LAST_NAME, SALARY, COMMISSION_PCT
--	, SALARY + SALARY * COMMISSION_PCT
-- NULL값이 포함된 상태이면 그 결과 NULL이 나온다. 
	, SALARY + SALARY * NVL(COMMISSION_PCT, 0) AS "SALARY_YEAR"
--	평가하려는 컬럼을 NVL함수의 첫번째 인자로 전달하고
--	해당 컬럼의 값이 NULL일 경우 대체할 값을 두번째 인자에 전달해주면 된다.
FROM EMPLOYEES e ;
SELECT NVL(COMMISSION_PCT , 0) AS "NVL"
	, COMMISSION_PCT AS "ORIGIN" 
FROM EMPLOYEES e ;

-- NULL값처리 두번째 함수
-- NVL2(대상, NULL일경우대체값, NULL이아닐경우대체값)
-- NVL이 대상이 NULL이 아닌 경우 기존값을 그대로 사용했다면
-- NVL2는 NULL이 아닌 경우에도 값을 바꾸어 표현하는 것이 특징이다.
SELECT DEPARTMENT_NAME, MANAGER_ID
	, NVL2(
		MANAGER_ID,-- 첫번째 인수는 평가할 컬럼명이 주로 들어간다.
		'TRUE', -- 평가한 값이 NULL이 아닌 경우에 표현할 값
		'FALSE' -- 평가한 값이 NULL일 경우 대체할 값
	) AS "HAS_MANGER"
FROM DEPARTMENTS d ;







