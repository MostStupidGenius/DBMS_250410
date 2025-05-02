-- part3_join_outer_join.sql
-- 아우터 조인(외부 조인)
-- OUTER JOIN은 세 가지 종류로 나뉘는데
-- LEFT, RIGHT
-- FULL
-- FULL JOIN은 두 테이블의 모든 레코드를 포함한다는 의미이다.
-- 즉, JOIN ON의 조건을 만족하지 않는 행(레코드)도
-- 반대쪽 테이블의 정보를 NULL로 채워넣어 표시하게 된다.
-- RIGHT, LEFT JOIN은, 두 테이블 중 하나만
-- 모든 레코드를 표시하고자 할 때 사용된다.

-- STADIUM 테이블의 HOMETEAM_ID와
-- TEAM 테이블의 TEAM_ID를 기준으로 JOIN하여
-- 각 경기장의 홈팀 이름을 하나의 테이블로 표현해보자.
SELECT S.STADIUM_NAME, T.TEAM_ID, T.TEAM_NAME
FROM STADIUM S
FULL OUTER JOIN TEAM T
ON S.HOMETEAM_ID = T.TEAM_ID
ORDER BY T.TEAM_ID
;

-- SELF JOIN
-- 자기자신 테이블의 PK를 FK로 삼는 컬럼이 있는 경우
-- SELF JOIN을 할 수 있다.
-- 이때 SELF라는 단어를 직접 쓰는 건 아니다(INNER, OUTER)
SELECT E.EMPLOYEE_ID, E.FIRST_NAME -- 직원정보
	, M.EMPLOYEE_ID M_ID, M.FIRST_NAME M_NAME -- 매니저 직원 정보
FROM EMPLOYEES E
LEFT OUTER JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID
ORDER BY E.EMPLOYEE_ID;