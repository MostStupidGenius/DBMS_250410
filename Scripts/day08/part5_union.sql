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
-- 교집합을 나타내는 연산자로 두 개의 테이블 혹은
-- SELECT문의 결과 중 동일한 행(레코드)만을 골라서
-- 반환하는 연산자다.
-- 조건식1과 조건식2가 모두 만족해야 그 행들을 가져오던
-- AND 연산자와 동일한 목적을 가진다.
-- 하지만 조건식이 아니라 테이블과 테이블의
-- 겹치는 행을 골라낼 때에는 INTERSECT를 사용해야 한다.
CREATE VIEW VIEW_1970 AS
SELECT PLAYER_NAME, "POSITION", BIRTH_DATE 
FROM PLAYER
WHERE TO_NUMBER(TO_CHAR(BIRTH_DATE, 'YYYY')) < 1980
;

SELECT *
FROM VIEW_1970;

CREATE VIEW VIEW_DF AS
SELECT PLAYER_NAME, "POSITION", BIRTH_DATE 
FROM PLAYER
WHERE "POSITION" = 'DF';
POSITION
SELECT *
FROM VIEW_DF;

-- 두 개 테이블을 INTERSECT
-- 두 테이블에 모두 등장하는, 겹치는 행만 출력
SELECT * FROM VIEW_1970 v 
INTERSECT
SELECT * FROM VIEW_DF vd;


-- 3. MINUS
-- 차집합을 나타내는 연산자로, 합집합에서 교집합을 뺀
-- 나머지 행을 가져오는 연산자다.
-- 첫번째 SELECT문의 결과에서 두번째 SELECT문의 결과를
-- 제외한 행을 반환한다.
-- 한 집합에는 존재하지만 다른 집합에는 없는 데이터를 식별하는 데
-- 유용하다.

-- 1970년대 데이터 중 DF가 아닌 행들을 반환
-- A - (A 교 B)
SELECT * FROM VIEW_1970 v 
MINUS
SELECT * FROM VIEW_DF;
-- MINUS를 했을 때, 결과행이 하나도 안 나온다면
-- 모든 행이 겹친다는 의미이므로
-- A테이블이 B테이블에 포함되어 있다는 의미가 된다.










