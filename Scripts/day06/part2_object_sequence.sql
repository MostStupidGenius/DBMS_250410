-- 시퀀스 SEQUENCE
-- 시퀀스는 사용자가 설정한 START WITH부터
-- INCREMENT 만큼의 등차를 가지는 등차수열의 값을
-- 하나씩 순차적으로 자동으로 생성하여
-- 시퀀스를 호출하는 쪽에 그 값을 전달하는 객체다.
-- CREATE SEQUENCE 시퀀스명
-- START WITH 1 -- 1로 시작하는
-- INCREMENT BY 1 -- 1씩 증가하는
-- MAXVALUE 100 -- 100까지 생성하는
-- NOMINVALUE -- 최소값이 없는
-- CYCLE -- 모두 순회시 처음부터 다시 시작하는
-- CACHE 5 -- 5개의 숫자를 미리 준비해놓는
-- CREATE 구문을 제외한 나머지 구문은 옵션으로
-- 반드시 적어줄 필요는 없다.

-- 이때, 시작값과 증가값은 모두 기본값이 1이고
-- 최소값은 1, 최대값은 없다.
-- 캐시 기본 개수는 20개다.
-- 이러한 기본값은 옵션을 통해 변경할 수 있다.
CREATE SEQUENCE TEST_SEQ;

CREATE SEQUENCE TEST
START WITH 1 -- 1로 시작하는
INCREMENT BY 1 -- 1씩 증가하는
MAXVALUE 100 -- 100까지 생성하는
NOMINVALUE -- 최소값이 없는
CYCLE -- 모두 순회시 처음부터 다시 시작하는
CACHE 5; -- 5개의 숫자를 미리 준비해놓는