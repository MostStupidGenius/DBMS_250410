-- part1_view.sql
-- 뷰 테이블
-- 뷰 테이블은 원본 테이블의 SELECT 쿼리 결과를
-- 마치 실제 테이블인 것처럼 이름을 붙여서 
-- 재사용할 수 있게 만들어둔 가상의 테이블을 가리킨다.
CREATE OR REPLACE -- 기존에 VIEW테이블이 있다면 대체하고
-- 없으면 만들어라
VIEW VIEW_EMPLOYEES_SAL AS -- AS를 적어주어야 한다.
SELECT EMPLOYEE_ID, FIRST_NAME , SALARY, MANAGER_ID 
FROM EMPLOYEES e ;

SELECT *
FROM VIEW_EMPLOYEES_SAL;


