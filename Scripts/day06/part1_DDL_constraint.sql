-- 제약조건
-- 제약조건이란, 테이블의 컬럼을 설정할 때
-- 특정 값이나 특정 범위 안에서 값이 입력될 수 있도록
-- 시스템적으로 제한하고 제약을 거는 것을 가리킨다.
-- 제약조건을 충족하지 않은 데이터 입력 시,
-- 데이터 입력을 원천 차단한다.
-- 이러한 제약 조건에는 필수 요소(PK)와 
-- 선택적 제약조건이 존재한다.
-- 1.PK
-- 기본키라고 불리며 테이블의 각 레코드(행 ROW)를
-- 고유하게 식별하기 위해 한 컬럼에 역할을 지정하는 것이다.
-- - 중복 불가 -> 고유하게 식별하기 위함.
-- - NULL 불가 -> 비워둘 수 없음.
-- 역할, 목적: 다른 테이블에서 현재 테이블의
-- 각 행을 참조할 때 정확하게 하나의 레코드를 가리키기 위함.
-- 이러한 PK는 각 테이블당 하나만 존재할 수 있으며
-- PK는 하나 이상의 열에 지정할 수 있다.(2개 이상은 조합키)

-- FK FOREIGN KEY
-- 다른 테이블의 레코드를 고유하게 가리키는 PK를 참조하는 역할을 부여한다
-- 다른 테이블과 관계를 형성하여 연결된 정보가 삭제되었을 때
-- 따라서 삭제되거나 NULL로 설정하는 등 정보를 연결하는 것이 목적이다.
-- FK는 PK와 달리 비워둘(NULL) 수 있다.
-- 중복 사용도 가능하다. 
-- -> 상황에 따라 FK이더라도 중복을 방지하는 제약조건을 걸 수도 있다.

-- NOT NULL
-- 기본적으로 PK 제약조건이 없다면 모든 컬럼은 NULL값을 허용한다(NULLABLE)
-- 하지만 모든 필드가 비어있다면 데이터로서의 아무 의미가 없게 된다.
-- 반드시 입력을 필요로 하는 컬럼에 NOT NULL 제약조건을 걸게 되면
-- 데이터 입력 시 반드시 값을 넣어야 하는 의무를 부여할 수 있다.

-- UNIQUE
-- '고유한'이라는 의미의 유니크는, 테이블의 모든 컬럼에 각각 적용할 수 있다.
-- 이 제약조건을 부여하면 해당 컬럼의 모든 값은 중복을 허용하지 않게 된다.
-- 다만, oracle DBMS의 경우 NULL값을 허용한다.(DBMS마다 다르다.)

-- CHECK
-- 입력되는 값에 직접적인 조건을 거는 제약조건으로,
-- WHERE문에서 사용했던 조건식처럼 직접 제약을 걸 수 있다.
-- 조건식은 반드시 TRUE/FALSE 값이 반환되는 표현식이어야 한다.
-- 해당 조건을 만족(TRUE)하지 못하는 값이 입력되면 
-- 데이터베이스에 입력을 원천 차단한다.
-- CHECK (조건식)

-- 학과 테이블
CREATE TABLE TBL_MAJOR (
	MAJOR_ID INTEGER PRIMARY KEY,
	MAJOR_NAME VARCHAR2(50) UNIQUE NOT NULL
);
-- 학생 테이블
CREATE TABLE TBL_STUDENT (
	-- 기본키PK 설정. 각 레코드를 고유하게 식별
	STUDENT_ID INTEGER PRIMARY KEY,
	-- FK를 설정할 컬럼 생성. 이후 FK로 따로 설정.
	M_ID INTEGER,
	-- 이름칸은 비워두면 안 되므로 NOT NULL 부여
	STUDENT_NAME VARCHAR2(20) NOT NULL
	-- 이름을 빈 문자열로 입력하는 경우 방지
	CHECK (STUDENT_NAME <> ''),
	-- 이메일은 고유해야 하므로 UNIQUE 제약조건 부여
	EMAIL VARCHAR2(50) UNIQUE
	-- 이메일의 형식을 간단하게 검사
	CHECK (EMAIL LIKE '%@%.%'),
	-- 성별은 반드시 정해놓은 목록 중 하나로 입력해야 한다.
	GENDER CHAR(1) CHECK(GENDER IN ('남', '여', 'U')),
	-- 생년월일을 입력하지 않은 경우 자동으로 2000년생으로 입력 + NULL방지
	BIRTH_DATE DATE DEFAULT TO_DATE('2000-01-01'),
	-- FK 설정 부분. FK는 여러 개를 설정할 수 있다.
	-- FOREIGN KEY (FK가 될 열이름)
	-- REFERENCES 참조테이블명(참조테이블PK컬럼명)
	FOREIGN KEY (M_ID)
	REFERENCES TBL_MAJOR(MAJOR_ID)
);

-- 제약조건의 추가
-- ALTER TABLE 테이블명
-- ADD CONSTRAINT 제약조건명 제약조건 (컬럼명)
-- 위 문법을 사용하여 기존에 배웠던 제약조건을 특정 테이블,
-- 특정 컬럼에 추가할 수 있다.
ALTER TABLE TBL_STUDENT 
ADD CONSTRAINT NN_STD CHECK(GENDER IS NOT NULL);

-- 제약조건의 제거
-- 제약조건명을 명시하여 특정 테이블의 제약조건을
-- 제거할 수 있다.
ALTER TABLE TBL_STUDENT
DROP CONSTRAINT NN_STD;

-- 다만 PK는 각 테이블당 하나씩만 존재할 수 있으므로
-- 명시적으로 PK 제약조건명을 적어줄 필요는 없다.
ALTER TABLE TBL_STUDENT 
DROP CONSTRAINT PRIMARY KEY;

-- 주의사항
-- 일반적으로 제약사항은 특정 값이 입력되거나 
-- 중복, NULL 등을 방지하는 필터 역할을 하기 때문에
-- 제약조건을 잘못 제거하는 경우, 데이터의 무결성을 해치는 결과를
-- 초래할 수도 있다.

SELECT *
FROM TBL_STUDENT;