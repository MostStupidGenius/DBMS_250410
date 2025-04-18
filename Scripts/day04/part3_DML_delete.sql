-- DELETE문
-- 테이블에서 특정 조건을 만족하는 데이터를 삭제할 때 사용
-- SELECT문처럼 작성한다.
-- DELETE FROM [테이블명]
-- WHERE [조건]

-- SALARY 값이 200만원 이하인 데이터를 삭제 TBL_EMP 테이블로부터
DELETE FROM TBL_EMP
WHERE SALARY <= 2000000;

SELECT *
FROM TBL_EMP;