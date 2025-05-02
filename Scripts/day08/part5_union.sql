-- part5_union.sql
-- 집합 연산자
-- 1. UNION
-- 합집합을 만들기 위한 연산자로 JOIN과 다르게
-- 각 열의 이름이 같은 경우 두 개 이상의 테이블이나
-- 결과를 하나의 테이블로 병합하는 연산자다.
-- 이때, 기본적으로 같은 레코드를 가진 경우는 중복을 제거한다.
SELECT PLAYER_NAME, "POSITION", TEAM_ID
FROM PLAYER
WHERE "POSITION" = 'DF'
UNION -- 두 테이블을 하나의 테이블로 병합
SELECT PLAYER_NAME, "POSITION", TEAM_ID 
FROM PLAYER
WHERE TEAM_ID = 'K06';




-- 2. INTERSECT



-- 3. MINUS
