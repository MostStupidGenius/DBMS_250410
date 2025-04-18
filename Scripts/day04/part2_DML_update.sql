-- UPDATE 문
-- 테이블에 저장된 기존 데이터를 수정하고자 할 때 사용
-- UPDATE [테이블명] SET 컬럼명1 = 값1, 컬럼2 = 값2,...
-- WHERE 조건식
-- UPDATE문을 사용할 때, WHERE 절이 없으면
-- 모든 행에 대해서 UPDATE를 진행해버린다.

-- 생일 데이터가 있는 행 추가
INSERT INTO TBL_EMP (EMP_ID, NAME, SALARY, BIRTH_DAY)
VALUES (6, '마이콜', 3000000, TO_DATE('1990-03-01'));

-- BIRTH_DAY가 NULL인 데이터에 대해서
-- 그 값을 2000-01-01로 수정한다.
UPDATE TBL_EMP
SET BIRTH_DAY = TO_DATE('2000-01-01')
WHERE BIRTH_DAY IS NULL;

SELECT *
FROM TBL_EMP;