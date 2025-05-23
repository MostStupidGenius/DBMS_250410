-- part2_regexp.sql
-- 정규표현식(Regular Expression)
-- 정규표현식이란 문자열의 패턴을 찾거나 검색, 치환 등
-- 문자열을 다루기 위한 형식 언어이다.
-- 이러한 정규표현식은 정규식이라고도 불리며
-- 프로그래밍 언어, SQL 등 많은 곳에서 공통적으로 사용되는
-- 규격화된 문자열 처리 방식이다.

-- 관련 함수는 REGEXP_으로 모든 함수 이름이 시작된다.
-- REGEXP_LIKE(검사할문자열, '정규표현식')
-- 검사할 문자열에 정규표현식 패턴이 존재하는지 여부를 반환한다.
-- WHERE ~~ LIKE '%'와 비슷하게 사용된다.
-- 다만, 더 복잡한 패턴을 표현할 수 있다.
SELECT FIRST_NAME
FROM EMPLOYEES e
--WHERE FIRST_NAME LIKE 'Alex%' -- Alex로 시작하는 문자열인가?
WHERE REGEXP_LIKE(FIRST_NAME,
	'^Alex.*' -- ^: 문자열의 시작을 나타내는 표현
--	 .: 어떤 문자열이든(any)
--	 *: 바로 앞에 오는 문자가 0번 이상 반복된다.
)
;

-- 문자열 안에서 사용되는 특수기호들의 의미(메타문자)
-- 문자열의 끝: $
-- 앞 문자가 1회이상 반복: +
-- 앞 문자가 나오거나(1) 안 나오거나(0): ?

-- 이메일 유효성 검사
SELECT email 
FROM employees
WHERE REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$');

-- 전화번호 형식 변환
-- 전화번호 형식을 (010) 1234-5678 형태로 변환
-- ^[0-9]{3}: 시작부터 3자리 숫자
-- [0-9]{4}: 중간 4자리 숫자
-- [0-9]{4}$: 마지막 4자리 숫자로 끝남
-- \1, \2, \3: 각각 첫번째, 두번째, 세번째 그룹을 참조
SELECT REGEXP_REPLACE('010-1234-5678', 
    '(^[0-9]{3})-([0-9]{4})-([0-9]{4}$)', 
    '(\1) \2-\3') AS formatted_phone
FROM dual;

-- 문자열에서 숫자만 추출(숫자를 제외한 문자를 모두 제거)
SELECT REGEXP_REPLACE('ABC123DEF456', '[^0-9]', '') AS numbers_only
FROM dual;



