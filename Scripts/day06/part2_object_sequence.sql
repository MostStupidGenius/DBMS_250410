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

-- 시퀀스의 사용
-- 시퀀스 객체를 사용하려면 해당 객체 뒤에
-- 마침표와 함께 어떻게 사용할지를 적어주어야 한다.

-- 주의사항: 시퀀스를 처음 사용할 때에는
-- 반드시 한번 이상은 NEXTVAL로 값을 호출해주어야 한다.
-- 1. 값을 호출하기
-- SEQ.NEXTVAL
SELECT TEST.NEXTVAL
FROM DUAL;

-- 2. 값을 확인하기
-- 현재 시퀀스의 값을 확인하려면
-- seq.CURRVAL를 사용해야 한다.
-- .CURRVAL은 마지막으로 사용했던 NEXTVAL 값을 가져온다.
SELECT TEST.CURRVAL
FROM DUAL;

-- 3. 활용
-- 테이블에서 기본 키 값으로 시퀀스 객체의 값을 활용할 수 있다.
CREATE TABLE TBL_SEQ_TEST(
	ID INTEGER PRIMARY KEY,
	NAME VARCHAR2(20)
);

-- 주로 테이블의 정수형 컬럼인 PK의 값을
-- 자동으로 생성, 삽입할 때 사용된다.
-- 혹은 고유한 숫자값을 생성할 때 사용된다.
INSERT INTO TBL_SEQ_TEST(ID, NAME)
VALUES(TEST.NEXTVAL, '둘리2');

SELECT * FROM TBL_SEQ_TEST;