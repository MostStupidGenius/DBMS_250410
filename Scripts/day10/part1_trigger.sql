-- part1_trigger.sql
-- 트리거(trigger)
-- 방아쇠라는 의미의 트리거는 db에 있어서
-- CRUD 중 R을 제외한 DML 문법을 특정 테이블에서 사용했을 때
-- 다른 동작을 연계하여 실행되도록 만들어놓는 자동화 문법이다.
-- 회원가입시, 탈퇴시 해당 날짜와 시간을 정확하게 기록하기 위해서
-- 주로 사용된다.
-- 실습용 테이블 만들기
CREATE TABLE TBL_PERSON (
	ID INTEGER PRIMARY KEY,
	NAME VARCHAR2(50) NOT NULL,
	BIRTH_DATE DATE NOT NULL,
	AGE INTEGER
);
-- ID는 자동으로 증가하는 SEQUENCE로 설정하고
-- 이름과 생일만 입력받는 방식으로 INSERT 이벤트에 대해서
-- AGE를 자동으로 계산하여 입력되도록 해보자.

-- 트리거 만들기(바로 아래 코드는 실행 안됨.)
-- OR REPLACE: 트리거가 이미 존재하면 덮어쓰기
CREATE OR REPLACE TRIGGER TRG_PERSON_AGE
-- 실행시점에 따른 분류
AFTER INSERT ON TBL_PERSON -- INSERT 이벤트가 일어난 뒤
-- TBL_PERSON 테이블에서
-- 각각의 레코드마다 트리거 실행
FOR EACH ROW
--WHEN AGE IS NULL -- AGE 값을 입력하지 않은 경우에만 동작
-- 트리거 정의 부분(프로시저)
--DECLARE -- 변수 선언부
BEGIN -- 로직 실행부
	-- 현재 날짜에서 생일의 연도를 뺀 값을 AGE 컬럼 값으로 업데이트
	-- ID가 새로 INSERT된 대상과 같아야 한다.
	UPDATE TBL_PERSON
	SET AGE = TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
		- TO_NUMBER(TO_CHAR(:NEW.BIRTH_DATE, 'YYYY'))
	WHERE ID = :NEW.ID; -- 새로 삽입된 레코드의 ID인 경우
--EXCEPTION -- 예외 처리부
END;

-- 여기 코드가 실행 됨.
CREATE OR REPLACE TRIGGER TRG_PERSON_AGE
AFTER INSERT ON TBL_PERSON 
FOR EACH ROW
--WHEN :NEW.AGE IS NULL
BEGIN
	INSERT INTO PERSON_AGE(ID, AGE)
	VALUES (
	:NEW.ID, -- 새로 삽입된 레코드의 ID를 사용
--	햇수만 뺀 경우
--	TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(TO_CHAR(:NEW.BIRTH_DATE, 'YYYY'))
--	날짜값을 빼고 365를 나눠서 정수값을 구한 경우(몫)
	(SYSDATE-:NEW.BIRTH_DATE) / 365
--	+ -- IF문은 안 되더라
--	IF MONTH(SYSDATE) > MONTH(:NEW.BIRTH_DATE) THEN 1
--		WHEN MONTH(SYSDATE) <= MONTH(:NEW.BIRTH_DATE) THEN 0
--		ELSE 0
--	END IF
	);
END;

-- 나이값만 업데이트 혹은 새로 삽입 받는 테이블 만들기
CREATE TABLE PERSON_AGE(
	ID INTEGER PRIMARY KEY,
	AGE INTEGER,
	CONSTRAINT FK_PERSON_ID FOREIGN KEY(ID)
	REFERENCES TBL_PERSON(ID)
);

-- 데이터 삽입해보기
INSERT INTO TBL_PERSON(ID, NAME, BIRTH_DATE)
VALUES (5, '고동', TO_DATE('1993-06-13'));

SELECT *
FROM TBL_PERSON;
SELECT *
FROM PERSON_AGE;