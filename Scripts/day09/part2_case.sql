-- part2_case.sql
-- CASE-END 구문
-- CASE 뒤에 표현식 혹은 표현식 없이 사용하는 문법으로
-- 표현식이 있을 경우, 해당 표현식의 결과가 WHEN 뒤의 값과 동일할 경우
-- THEN 뒤의 값으로 CASE-END 구문의 결과값을 반환한다.
SELECT
	PLAYER_NAME,
	"POSITION",
	CASE "POSITION"
		WHEN 'DF' THEN '수비수'
		WHEN 'MF' THEN '미드'
		WHEN 'FW' THEN '공격수'
		WHEN 'GK' THEN '골키퍼'
		ELSE '미정' -- 위의 모든 케이스 중 하나도 맞지 않는 경우
	END	AS "포지션"
FROM PLAYER;

SELECT
	PLAYER_NAME
--	LIKE는 SELECT문에서 사용 불가능
--	, CASE PLAYER_NAME
--		WHEN '김%' THEN '김씨'
--		ELSE '이름'
--	END	AS "FNAME"
FROM PLAYER
-- WHERE 절에서 LIKE와 함께 CASE-WHEN 절은 사용이 불가능하다.
--WHERE CASE
--	WHEN PLAYER_NAME='김' THEN '이'
--	ELSE '김땡땡'
--END LIKE '김%'
;

-- ※ 11g 버전에서는 where절에서 case-when 문법 사용 불가
--SELECT PLAYER_NAME, "POSITION" 
--FROM PLAYER
--WHERE
--	CASE 
----		WHERE 절에서는 CASE-WHEN 절을 사용할 수 있지만
----	 	직접적으로 반환값을 TRUE/FALSE로 지정하면 안 된다.
----		WHEN 'DF' THEN TRUE
--		WHEN "POSITION" = 'GK' THEN HEIGHT > 170
--		WHEN "POSITION" = 'DF' THEN HEIGHT < 180
--		ELSE FALSE
--	END;