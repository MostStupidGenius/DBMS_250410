-- part4_subquery.sql
-- 서브쿼리
-- 인라인 뷰라고도 불리는 서브쿼리는
-- '이름이 없는 가상 테이블'이라고 할 수 있다.
-- 쿼리 내부적으로 먼저 실행된 결과를 하나의 테이블로 취급하여
-- 이를 테이블처럼 사용할 수 있다.

SELECT A.AVG_SAL, D.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM (
	SELECT E.DEPARTMENT_ID, AVG(E.SALARY) AVG_SAL
	FROM EMPLOYEES E
	GROUP BY E.DEPARTMENT_ID
) A
FULL OUTER JOIN DEPARTMENTS D
ON A.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- WHERE 절에서 사용되는 서브쿼리
-- 일반테이블을 대상으로 하는 FROM절의 서브쿼리와 다르게
-- 값을 비교해야 하는 WHERE 절에서는 
-- 결과 테이블의 열이 하나인 서브쿼리만 사용이 가능하다.
-- 특히 IN 연산자를 사용하는 경우에는
-- 단일 열, 다중 행 서브쿼리를 사용한다.
-- 단순 비교연산자에는 단일 열, 단일 행 서브쿼리를 사용한다.
SELECT PLAYER_NAME, HEIGHT
FROM PLAYER
WHERE HEIGHT IN (
	SELECT FLOOR(AVG(HEIGHT)) AVG_HEIGHT -- , TEAM_ID
--	IN 연산자 뒤에 오는 서브쿼리는 단일행이 아니면
--	too many values 에러가 발생한다.
	FROM PLAYER
	GROUP BY TEAM_ID
--	서브쿼리 안에서 ORDER BY를 사용하면
--	왠지 모르게 에러가 난다
--	ORDER BY AVG_HEIGHT
);

SELECT FLOOR(AVG(HEIGHT)) AVG_HEIGHT
FROM PLAYER
GROUP BY TEAM_ID
ORDER BY AVG_HEIGHT;

-- 전체 선수의 평균 몸무게보다 몸무게가 큰 선수들 정보 추출
SELECT PLAYER_NAME, WEIGHT 
FROM PLAYER
WHERE WEIGHT >= (
	-- 집계함수를 사용하는 경우에는 단일 행으로 표현된다.
	-- 단일행, 단일열인 경우 단순 값 하나로 취급된다.
	SELECT AVG(WEIGHT)
	FROM PLAYER
)
ORDER BY WEIGHT
;

-- 실습1.
-- PLAYER 테이블에서 가장 몸무게가 많이 나가는 플레이어의
-- 이름과 몸무게를 출력하라
SELECT ROWNUM, PLAYER_NAME, WEIGHT
FROM PLAYER
WHERE WEIGHT = ( -- 가장 큰 몸무게를 가진
	SELECT MAX(WEIGHT)
	FROM PLAYER
	WHERE WEIGHT <> 94 -- 가장 큰 몸무게를 가진 사람이 한명이라서
	-- 두 명 이상이 나오도록 하고자 94를 제외했다.
)
AND
ROWNUM <= 1 -- 결과가 두 명 이상일 경우
-- 가장 위의 한 명만 가져오도록 제한한다.
;
SELECT ROWNUM, PLAYER_NAME 
FROM (
SELECT PLAYER_NAME
FROM PLAYER
ORDER BY PLAYER_NAME
);




