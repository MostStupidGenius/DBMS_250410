-- part2_join_inner_join.sql
-- 조인(join)
-- 두 테이블 간에 관계가 있는 경우,
-- 관계를 맺게 해주는 키열(pk, fk)을 기준으로, 중심으로 하여
-- 두 개 테이블을 하나의 테이블로 합치는 것을
-- 조인이라고 한다.
-- 이러한 조인은 종류가 나뉘는데
-- 1. INNER JOIN
-- 2. OUTER JOIN
-- 3. CROSS JOIN
-- 4. SELF JOIN
-- 위와 같이 조인하는 방식에 따라 네 가지로 나뉜다.

-- INNER JOIN
-- 두 테이블의 PK와 FK가 모두 존재하는 행만
-- 병합할 테이블의 행으로 넣는다.
--SELECT E.*, D.*
SELECT E.EMPLOYEE_ID, E.FIRST_NAME , D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES e 
INNER JOIN DEPARTMENTS d
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.EMPLOYEE_ID
;