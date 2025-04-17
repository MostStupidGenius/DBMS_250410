-- ROWNUM
-- 가져올 데이터의 행 수를 제한하여 원하는 행 개수만
-- 반환하도록 하는 특수한 객체값
-- WHERE절에서 사용된다.
-- WHERE절에서 필터링을 할 때, ROWNUM의 범위에는
-- ※반드시 1이 포함되어야 한다.
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE ROWNUM <= 10
--ORDER BY SALARY DESC
;
-- 데이터가 정제(필터링, 정렬)되는 순서는
-- 1. WHERE로 필터링
-- 2. ORDER BY로 정렬
-- 3. SELECT 절로 열 선택

-- WHERE로 필터링이 먼저 되기 때문에
-- 상위 10개 행 안에서 정렬이 된 결과가 보여지는 것이다.