-- part4_function.sql
-- 사용자 정의 함수
-- 이전까지 우리는 이미 만들어져 있던 함수만 사용해 왔다.
-- 이번에는 사용자가 직접 정의하고 구성, 프로그래밍하는
-- 그런 함수를 만들어보자.

CREATE OR REPLACE FUNCTION FUNC_ADD
	-- 매개변수란 함수를 사용하는 쪽(바깥쪽)에서 전달하는 값에
	-- 이름을 붙여서 그 이름만으로 바뀌는 그 값들을 가리키기 위해
	-- 사용하는 변수를 가리킨다.
	( -- 매개변수를 정의하는 공간
		NUM1 INTEGER,
		NUM2 INTEGER
	)
RETURN INTEGER -- 이 함수가 실행되었을 때 반환할 값의 타입을 정의
-- 값을 반드시 하나는 반환해야 하기 때문에 이 부분은 필수다.
IS
	-- 함수 내부의 변수를 선언하는 부분
BEGIN -- 매개변수를 활용하여 함수가 동작하고
	-- 그 결과 특정값을 반환하는 로직을 작성하는 곳.
	RETURN NUM1 + NUM2;
END;

SELECT FUNC_ADD(3, 7)
FROM DUAL;
	
-- 화씨를 입력받으면 섭씨로 변환하여 반환하는 함수 만들기
CREATE OR REPLACE FUNCTION F_TO_C
	(F FLOAT,  -- 실수, 즉 소숫점이 존재하는 숫자를 모두 가리킨다.
	JARI NUMBER  -- 자릿수를 설정하는 매개변수
	)
RETURN FLOAT
IS
BEGIN
	-- 반환할 때 자릿수를 제한하여 반환.
	-- 이때 제한하는 자릿수는 사용하는 쪽에서 결정
	RETURN ROUND((F - 32) * (5 / 9), JARI); 
END;

SELECT F_TO_C(64, 1)
FROM DUAL;
SELECT (5 / 9) * (64 - 32)
FROM DUAL;
