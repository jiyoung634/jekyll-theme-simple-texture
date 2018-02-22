---
layout: post
title: "CREATE/ALTER/DROP/INSERT/CONSTRAINT"
description: "CREATE/ALTER/DROP/INSERT/CONSTRAINT"
categories: [Oracle]
tags: [CREATE, ALTER, DROP, INSERT, Integrity, CONSTRATINT, PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK]
redirect_from:
  - /2018/01/11/
---

# 개요

```sql
-----------------------------------------------------------
--데이터베이스 객체

/*
1. 데이터베이스에 저장되는 것들은 테이블 외에 기타 여러 가지 것들이 저장되는데 이것을 데이터베이스 객체(Database Objects)라고 부른다.

2. TABLE
하나 또는 여러 컬럼(Column)들이 모여 하나의 레코드를 이루며, 이러한 레코드들이 모여 테이블이된다. 예를 들어 "사원" 테이블은 사번, 이름, 부서 등 여러 컬럼을 갖게 되고 사원수만큼의 레코드를 갖게 된다.

3.
CREATE 문
데이터베이스 내의 모든 객체를 생성할 때 사용하는 문장
ALTER 문
이미 생성된 객체의 구조를 변경
DROP 문
생성된 객체를 삭제

=>주의) 관리자에 의해 RESOURCE 권한을 부여 받은 사용자만 작업 가능

*/


----------------------------------------------
--테이블 작성

/*
1. 테이블은 관계 데이터베이스에 데이터 저장을 위해 이용되는 객체이며, 행과 열 을 통해 spread sheet와 비슷한 방식으로 데이터를 표시한다.

예를 들어, 성적 정보 저장용 테이블이 있다면
column  column  column column column
번호(PK) 이름     국어   영어   수학
1        홍길동   100    100    100    -> row
2        박길동    90     80     90    -> row
3        최길동   100     70     80    -> row

2.
CREATE [GLOBAL TEMPORARY] TABLE [스키마.]테이블_이름 (
	열_이름 데이터타입 [DEFAULT 표현식] [제약조건]
	[, 열_이름 데이터타입 [DEFAULT 표현식] [제약조건] ]
	[ ,...]
);

테이블 생성시 PK 제약을 지정할 수 있는 컬럼을 반드시 추가할 것.

예를 들어, 성적 정보 저장용 테이블을 만든다면
--테이블 생성
CREATE TABLE sungjuk (
  sid NUMBER --고유번호 저장용 컬럼(PK). 필수 항목.
  ,name VARCHAR2(20) --이름 저장용 컬럼. 영숫자 20자 이내. 한글 저장시 NVARCHAR2(20) 한글 20자 이내.
  ,kor NUMBER(3) --과목 점수 저장용 컬럼. 0~100
  ,eng NUMBER(3) --과목 점수 저장용 컬럼. 0~100
  ,mat NUMBER(3) --과목 점수 저장용 컬럼. 0~100
);

--테이블 존재 확인
SELECT * FROM user_tables;

*/




-------------------------------------------
--데이터 타입(자료형)

/*
1. 오라클이 제공하는 데이터 타입은 단일 값을 저장하는 스칼라 데이터 타입, 여러 개의 데이터를 저장할 수 있는 컬렉션 데이터 타입 그리고, 컬럼이 다른 테이블 객체를 참조하는 관계 데이터 타입이있다.

2. VARCHAR2
형식 : VARCHAR2(n)
가변 길이 문자 데이터를 저장하며 최대 길이는 4000자이고, 반드시 길이를 명시해야 한다.
NLS(국가별 언어 집합)는 한글과 영문만 가능
VARCHAR 는 최대 2000개 문자를 저장하며 VARCHAR2와는 다르게 VARCHAR(10)로 선언하면 null을 채워 실제로는 10개의 공간을 사용한다. 
하지만 VARCHAR2(10)는 필요한 문자까지만 저장하는 variable length이며 최대 4000개 문자까지 저장할 수 있다.
주로 영문 사용
한글 저장용 NVARCHAR2(n) 자료형


3. NUMBER
형식 : NUMBER(P, S)
P(1~38)는 정밀도로 전체 자리수를 나타내며 기본 값이 38이고 S(-84~127)는 소수점 이하의 자릿수이다.
정수나 실수 저장하기 위한 가변길이의 표준 내부 형식이다.

4.DATE
『년/월/일 시:분:초』까지 저장하며, 기본적으로 년/월/일 정보를 출력한다.
*/



-------------------------------------------------
--INSERT

/*
1. INSERT 문은 테이블에 새 행(row)을 추가하는데 이용하며, single table insert이나 multi table insert를 수행할 수 있다.

Single table insert : 오직 하나의 테이블이나 뷰에 오직 하나의 행(row)의 값들을 삽입할 수 있다.

Multi table insert : 하나 이상의 테이블로부터 서브 쿼리로 얻은 여러 행(row)을 삽입하는 경우이다.

2.
INSERT INTO 테이블_명 [(컬럼_명1, 컬럼_명2, ...)] VALUES (값1, 값2, ...);

주의) 컬럼명과 값은 서로 일치(갯수, 순서, 자료형)해야 한다.
주의) INSERT 명령 실행시 메모리에서만 입력된 상태이므로, 물리적 저장이 필요하면 COMMIT; 명령 실행 필요.
*/


----------------------------------
--제약 조건

/*
Primary key - 고유한 값을 유지하는 제약. 중복된 자료가 입력되지 않도록 차단하는 역할.

제약 추가 방법은 테이블 생성시, 테이블 생성후 제약 추가 가능.

ALTER TABLE 테이블명
    ADD [CONSTRAINT 제약명] PRIMARY KEY(컬럼명);

제약명은 사용자가 작성하는 것을 권장한다.

*/


```

# CREATE & INSERT

```sql
--------------------------------------
--샘플 테이블 생성 쿼리
--이름, 전화번호 저장용 테이블 생성
--PK(고유한 값을 저장하는 역할) 컬럼 추가 필요
/*
CREATE TABLE 테이블명 (
    컬럼 자료형
    , 컬럼 자료형
    , ...
);
*/

CREATE TABLE new_table(
    no_ NUMBER(3)
    , name_ VARCHAR2(10)
    , birth DATE
);

CREATE TABLE members2 (
    mid NUMBER   --PK 역할. 숫자 전용.
    , name_ NVARCHAR2(10)  --한글, 영숫자 가능. 10자 이내.
    , phone VARCHAR2(10) --영숫자 가능. 10자 이내.
);

--PK 제약 추가
--제약명 작성시 '테이블명_컬럼명_제약종류' 표기 권장
ALTER TABLE members2
    ADD CONSTRAINT members2_mid_pk PRIMARY KEY(mid);
    

--생성된 테이블 확인
SELECT * 
    FROM user_tables;
    
--생성된 테이블 구조(컬럼명, 자료형, null 여부) 확인
DESC new_table;
DESC members2;

--생성된 테이블에 샘플 데이터 입력
INSERT INTO members2 (mid, name_, phone) VALUES (1, '홍길동', '1234');
INSERT INTO members2 (mid, name_, phone) VALUES (2, '박길동', '5678');
INSERT INTO members2 (mid, name_, phone) VALUES (3, '최길동', '9123');
INSERT INTO members2 (mid, name_, phone) VALUES (4, '김길동', '4567');
INSERT INTO members2 (mid, name_, phone) VALUES (5, '이길동', '8912');
COMMIT;

--생성된 테이블에 입력된 자료 확인
SELECT mid, name_, phone
    FROM members2;

--특정인(이름이 '홍길동'인 경우)의 정보 출력
SELECT *
FROM members2
WHERE name_ = '홍길동';

--특정인(번호가 2인 경우)의 정보 출력
SELECT *
FROM members2
WHERE mid = 2;

--전화번호에 '3'이 포함된 경우 출력
SELECT *
FROM members2
WHERE INSTR(phone,3,1,1) > 0 ;

-- 인사 테이블
CREATE TABLE insa(
        num NUMBER(5) NOT NULL CONSTRAINT insa_pk PRIMARY KEY
       ,name NVARCHAR2(20) NOT NULL
       ,ssn  VARCHAR2(14) NOT NULL
       ,ibsaDate DATE     NOT NULL
       ,tel   VARCHAR2(15)
       ,city  NVARCHAR2(10)
       ,buseo NVARCHAR2(15) NOT NULL
       ,jikwi NVARCHAR2(15) NOT NULL
       ,basicPay NUMBER(10) NOT NULL
       ,sudang NUMBER(10) NOT NULL
);

INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1001, '홍길동', '771212-1022432', '1998-10-11', '서울', '011-2356-4528', '기획부', 
   '부장', 2610000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '이순신', '801007-1544236', '2000-11-29', '경기', '010-4758-6532', '총무부', 
   '사원', 1320000, 200000);

COMMIT;

-- @경로명:\INSA.SQL

```

# 자료형 & DROP

```sql
----------------------------------------
--NUMBER 자료형 테스트
CREATE TABLE test1 (
	col1 NUMBER       --38자리
	,col2 NUMBER(3)   --3자리
	,col3 NUMBER(5,2) --5자리, 소수 이하 2자리
);

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123, 123);  --123, 123, 123
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123.45, 123.45); --123, 123, 123.45
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123.456, 123.456); --123, 123, 123.46
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 1234, 1234); --ORA-01438: value larger than specified precision allowed for this column
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123, 123456); --ORA-01438: value larger than specified precision allowed for this column
SELECT * FROM test1;

INSERT INTO test1 (col1, col2, col3) 
	VALUES (123, 123, 123.456); --123, 123, 123.46
SELECT * FROM test1;

-- ROLLBACK;  ->  insert 된 내용을 저장하지 않고 취소하겠습니다.
COMMIT;

DROP TABLE test1;





----------------------------------
--VARCHAR2 자료형 테스트 (Byte기준)
CREATE TABLE test2 (
	col0 VARCHAR2     --ORA-00906: missing left parenthesis
);
--> 테이블 생성 실패

CREATE TABLE test2 (
	col0 VARCHAR2(5000)     --ORA-00910: specified length too long for its datatype
);
--> 테이블 생성 실패

CREATE TABLE test2 (
	col1 VARCHAR2(1)     --1글자(영문, 숫자 기준)
	,col2 VARCHAR2(10)   --10글자(10byte)
	,col3 VARCHAR2(4000) --MAX
);
-->테이블 생성 성공


INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', 'TEST', 'TEST');
SELECT * FROM test2;

INSERT INTO test2 (col1, col2, col3)
	VALUES ('TEST', 'TEST', 'TEST');  --ORA-12899: value too large for column "MINJONG"."TEST2"."COL1" (actual: 4, maximum: 1)
SELECT * FROM test2;

INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', '홍길동', '홍길동');
SELECT * FROM test2;

INSERT INTO test2 (col1, col2, col3)
	VALUES ('T', '대한민국', '대한민국');  --ORA-12899: value too large for column "MINJONG"."TEST2"."COL2" (actual: 12, maximum: 10)
SELECT * FROM test2;

COMMIT;

DROP TABLE test2;





-----------------------------------
--NVARCHAR2 자료형 테스트 (유니코드 저장용 자료형, 글자수 기준)
CREATE TABLE test3 (
	col1 NVARCHAR2(1)     --1글자(한글, 영문, 숫자 기준)
	,col2 NVARCHAR2(10)   --10글자
	,col3 NVARCHAR2(2000) --MAX
);
-->테이블 생성 성공

INSERT INTO test3 (col1, col2, col3)
	VALUES ('T', '대한민국', '대한민국');
SELECT * FROM test3;

COMMIT;

DROP TABLE test3;





---------------------------------------
--DATE 자료형 테스트
CREATE TABLE test4 (
	col1 DATE     --년/월/일 시:분:초 저장
	,col2 DATE
);

--날짜와 시간 정보 모두 저장되므로 
--SYSDATE인 경우는 현재 시간까지 저장된다.
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, TO_DATE('20120118')); --문자를 날짜형으로 변환
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, '20120118'); --문자를 자동 형변환
INSERT INTO test4 (col1, col2) 
	VALUES (SYSDATE, SYSDATE);
COMMIT;

SELECT * FROM test4; --년/월/일만 출력됨.
SELECT TO_CHAR(col1, 'YYYY-MM-DD HH24:MI:SS') AS col1
	,TO_CHAR(col2, 'YYYY-MM-DD HH24:MI:SS') AS col2
	FROM test4; --년-월-일 시:분:초로 출력됨

DROP TABLE test4;

DROP TABLE members;


----------------------------
/*
10. 기존 테이블 삭제 (휴지통 기능 있음)
DROP TABLE 테이블이름;
--> 테이블 삭제시 관련 객체(제약조건, 인덱스, 트리거 등)들이 같이 삭제된다.
--> 참조 관계가 있는 테이블은 제약조건에 따라서 삭제 안되는 경우가 있다.
--> 단독 테이블은 항상 삭제 가능.
*/

CREATE TABLE test1 (
    col NUMBER
);

INSERT INTO test1 (col) VALUES (1);
COMMIT;

SELECT * FROM test1;

SELECT * FROM user_tables;
--> test1 테이블 존재 확인

DROP TABLE test1;  --휴지통 사용. 복구 가능.

SELECT * FROM user_tables;
--> test1 테이블 삭제 확인


```

# ALTER

```sql
------------------------------
/*
5. 기존 테이블에 새 열 추가

ALTER TABLE 기존테이블명
	ADD (열이름 자료형, ...);
--> 기존 테이블에 데이터가 있는 경우는 새로 만들어진 컬럼의 데이터는 NULL만 채워진다.
--> NULL이 채워진 컬럼에 자료를 채우려면 UPDATE 명령을 이용한다.
--> 컬럼 생성시 자동으로 기본값을 채우려면 DEFAULT 키워드를 이용한다.
*/

DESC members2;
/*
MID   NOT NULL NUMBER        
NAME_          NVARCHAR2(10) 
PHONE          VARCHAR2(10) 
*/
--> 등록일(regDate) 컬럼 추가

ALTER TABLE members2
	ADD (regDate DATE);
--> 컬럼은 추가되지만 자료는 NULL로 채워진다.

SELECT * FROM members2;
--> regDate 컬럼은 NULL로 채워진 상태이다.
--> 자료를 입력하려면 UPDATE 쿼리 사용




--------------------------
/*
6. 기존 테이블에서 기존 열 자료형 변경
ALTER TABLE 기존테이블명
	MODIFY (기존열이름 새로운자료형);
--> 기존 테이블에 데이터가 있는 경우는 새로운 자료형이 기존 자료에 적합해야 한다.
*/

DESC members2;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE 
*/
--> PHONE 컬럼의 크기 확장. 10->20

ALTER TABLE members2
	MODIFY (phone VARCHAR2(20));
    
DESC members2;
--> phone 컬럼의 크기 확인

SELECT * FROM members2;
--> 기존 자료 그대로 남아 있다.

---------------------------------------
/*
7. 기존 테이블에서 기존 열 이름 변경
ALTER TABLE 기존테이블명
	RENAME COLUMN 기존열이름 TO 새열이름;
--> 기존 테이블에 데이터가 있어도 가능하다.
*/

DESC members2;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE   
*/
--> phone 컬럼명은 tel 컬럼명으로 변경

ALTER TABLE members2
	RENAME COLUMN phone TO tel;
    
DESC members2;
--> 컬럼명이 변경되어 있다.




----------------------------------
/*
8. 기존 테이블에서 기존 열 삭제
ALTER TABLE 기존테이블명
	DROP (열이름, ...);
--> 기존 테이블에 기존 데이터가 같이 삭제된다. 복구 불가.
*/

DESC members2;
/*
MID     NOT NULL NUMBER        
NAME_            NVARCHAR2(10) 
PHONE            VARCHAR2(20)  
REGDATE          DATE   
*/
--> regDate 컬럼을 삭제

ALTER TABLE members2
	DROP (regDate);
    
DESC members2;
--> 컬럼이 삭제되어 있다.




----------------------------------
/*
9. 기존 테이블 이름 변경
RENAME 기존테이블명 TO 새로운테이블명;
*/

SELECT * FROM user_tables;
--> INSA 테이블명을 EMP 테이블명으로 변경

SELECT * FROM insa;

RENAME insa TO emp;

SELECT * FROM emp;





```

# 무결성(Integrity)

```sql
---------------------------------------------
--무결성

/*
1. 무결성에는 개체 무결성(Entity Integrity), 참조 무결성(Relational Integrity), 도메인 무결성(Domain Integrity)가 있다.

2. 개체 무결성
개체 무결성은 릴레이션에 저장되는 튜플(tuple)의 유일성을 보장하기 위한 제약조건이다.(ex. '홍길동'이 두 명-->X)
(PRIMARY KEY)

3.참조 무결성
참조 무결성은 릴레이션 간의 데이터의 일관성을 보장하기 위한 제약조건이다.(ex. 존재하지 않는(존재하는 범위를 초과한) 부서번호 입력-->X)
(FOREIGN KEY)

4. 도메인 무결성
도메인 무결성은 속성에서 허용 가능한 값의 범위를 지정하기 위한 제약조건이다. (ex. 0~100 범위 점수에 999점이 들어감-->X)

예를 들어, 학생 정보 저장용 테이블을 만든다면
--테이블 생성
CREATE TABLE member (     --테이블 이름 member
	sid NUMBER        --고유번호 저장용 컬럼
	,name VARCHAR2(10) --이름, 10글자만 허용
	,kor NUMBER(3)     --국어, 숫자 3자리만 허용(0~999). 0~100 제한.
	,eng NUMBER(3)     --영어, 숫자 3자리만 허용
	,mat NUMBER(3)     --수학, 숫자 3자리만 허용
);

5. 제약조건 종류
- PRIMARY KEY(PK) : 해당 컬럼 값은 반드시 존재해야 하며, 유일해야 함(NOT NULL과 UNIQUE 제약조건을 결합한 형태) => 개체 무결성(반드시 붙이기를 권장) / 테이블 당 1개만 가능!!
- FOREIGN KEY(FK) : 해당 컬럼 값은 참조되는 테이블의 컬럼 값 중의 하나와 일치하거나 NULL을 가짐   => 참조 무결성
- UNIQUE KEY(UK) : 테이블내에서 해당 컬럼 값은 항상 유일해야 함(NULL 허용)
- NOT NULL : 컬럼은 NULL 값을 포함할 수 없다.
- CHECK(CK) : 해당 컬럼에 저장 가능한 데이터 값의 범위나 조건 지정    => 도메인 무결성
*/



```

# PRIMARY KEY

```sql
------------------------------------------------
--***PRIMARY KEY (PK)

/*
1. 테이블에 대한 기본 키를 생성한다.

2. 테이블에서 각 행을 유일하게 식별하는 컬럼 또는 컬럼의 집합이다. 기본 키는 테이블 당 하나만 존재한다. 그러나, 반드시 하나의 컬럼으로 만 구성되는 것은 아니다. NULL 값이 입력될 수 없고, 이미 테이블에 존재하고 있는 데이터를 다시 입력할 수 없다. UNIQUE INDEX가 자동으로 만들어 진다.


3.
컬럼 레벨의 형식
컬럼명 데이터타입 [CONSTRAINT constraint명] PRIMARY KEY

테이블 레벨의 형식
컬럼명 데이터타입,
컬럼명 데이터타입,
...
[CONSTRAINT constraint명] PRIMARY KEY(컬럼1명, 컬럼2명,...)

4. constraint를 추가 시에 constraint 명을 생략하면 오라클 서버가 자동적으로 constraint 명을 부여한다. 일반적으로 constraint명은 테이블명_컬럼명_constraint약자'처럼 기술한다.
*/


--제약 없는 경우
CREATE TABLE test0 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10)
);

INSERT INTO test0 (col1, col2) 
	VALUES (NULL, NULL);
COMMIT;

SELECT col1, col2
  FROM test0;



-------------------------------------------
--PK 지정 테스트 - (테이블 생성시 제약 추가) 컬럼 레벨의 형식
CREATE TABLE test1 (
	col1 NUMBER(3) PRIMARY KEY
	,col2 VARCHAR2(10)
);

INSERT INTO test1 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test1 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test1 (col1, col2) 
	VALUES (3, NULL);
INSERT INTO test1 (col1, col2) 
	VALUES (2, 'ABCD');  --ORA-00001 (중복된 번호 입력 불가)
INSERT INTO test1 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400 (NULL 입력 불가)
COMMIT;

SELECT * FROM test1;

DESC test1;
/*
이름   널        유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(3)      -->PK 제약 확인 불가
COL2          VARCHAR2(10) 
*/

SELECT * FROM all_users;

--제약 조건 확인
SELECT * FROM user_constraints; -- dictionary

SELECT * FROM user_constraints 
	WHERE table_name='TEST1'; --테이블 이름 대문자

--제약이 지정된 컬럼 확인
SELECT * FROM user_cons_columns
  WHERE table_name='TEST1'; --테이블 이름 대문자

--제약이 걸린 소유주, 제약명, 테이블, 제약종류, 컬럼 정보 확인
SELECT uc.owner, uc.constraint_name, uc.table_name, uc.constraint_type, ucc.column_name
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.constraint_name = ucc.constraint_name
    AND uc.table_name='TEST1';  --테이블 이름 대문자




-------------------------------
--PK 지정 테스트 -  (테이블 생성시 제약 추가) 테이블 레벨의 형식
--> 제약명을 사용자가 결정한다
--> 제약명은 '테이블명_컬럼명_PK' 형식으로 작성한다.

CREATE TABLE test2 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10)
	,CONSTRAINT TEST2_COL1_PK PRIMARY KEY(col1)
);

INSERT INTO test2 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test2 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test2 (col1, col2) 
	VALUES (3, NULL);
INSERT INTO test2 (col1, col2) 
	VALUES (2, 'ABCD');  --ORA-00001
INSERT INTO test2 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400
COMMIT;

--제약이 걸린 소유주, 제약명, 테이블, 제약종류, 컬럼 정보 확인
SELECT *
FROM user_constraints
WHERE table_name = 'TEST2';

SELECT uc.owner, uc.constraint_name, uc.table_name, uc.constraint_type, ucc.column_name
  FROM user_constraints uc, user_cons_columns ucc
  WHERE uc.constraint_name = ucc.constraint_name
    AND uc.table_name='TEST2';  --테이블 이름 대문자


--------------------------------------
--PK 지정 테스트 - 다중 컬럼 PK 지정 (복합키)
CREATE TABLE test3 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10)
	,CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(col1, col2)
);

INSERT INTO test3 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test3 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test3 (col1, col2) 
	VALUES (3, NULL); --ORA-01400
INSERT INTO test3 (col1, col2) 
	VALUES (3, 'ABCD'); --col1은 다른 데이터, col2는 같은 데이터
INSERT INTO test3 (col1, col2) 
	VALUES (2, 'KOREA'); --col1은 같은 데이터, col2는 다른 데이터
INSERT INTO test3 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400
INSERT INTO test3 (col1, col2) 
	VALUES (2, 'ABCD'); --col1, col2 모두 같은 데이터. ORA-00001

COMMIT;


----------------------------------
--***PK 지정 테스트 - 테이블 생성 후 제약 추가 ★★★ 권장
CREATE TABLE test4 (
	col1 NUMBER(3)
	,col2 VARCHAR2(10) 
);

--ALTER TABLE 테이블명
--	ADD CONSTRAINT 제약명 PRIMARY KEY(컬럼명);

ALTER TABLE test4
	ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(col1);

INSERT INTO test4 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test4 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test4 (col1, col2) 
	VALUES (3, NULL);
INSERT INTO test4 (col1, col2) 
	VALUES (2, 'ABCD');  --ORA-00001
INSERT INTO test4 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400
COMMIT;

-- 제약만 지울 때
ALTER TABLE test4
    DROP CONSTRAINT TEST4_COL1_PK;
    
DROP TABLE test4;

```

# FOREIGN KEY

```sql
----------------------------------------------------
--***FOREIGN KEY (FK)

/*
1. 참조 키 또는 외래 키(FK)는 두 테이블의 데이터 간 연결을 설정하고 강제 적용하는 데 사용되는 열이
다. 한 테이블의 기본 키 값이 있는 열을 다른 테이블에 추가하면 테이블 간 연결을 설정할 수 있다. 이 
때 두 번째 테이블에 추가되는 열이 외래 키가 된다.

외래 키가 적용된 컬럼에는 데이터 입력시 기본 키 값 범위 내에서만 입력 가능.


2. 부모 테이블이 먼저 생성된 후 자식 테이블(foreign key를 포함하는 테이블)이 생성되어야 한다.

3.

컬럼 레벨의 형식
컬럼명 데이터타입 CONSTRAINT constraint명
	REFERENCES 참조_테이블명 (참조_컬럼명)
	[ON DELETE CASCADE | ON DELETE SET NULL]


테이블레벨의 형식
컬럼명 데이터타입,
컬럼명 데이터타입,
...
CONSTRAINT constraint명 FOREIGN KEY(컬럼)
	REFERENCES 참조_테이블명 (참조_컬럼명)
	[ON DELETE CASCADE | ON DELETE SET NULL]
    
    
테이블 생성후 제약 추가
ALTER TABLE 테이블명
	ADD CONSTRAINT 제약명 FOREIGN KEY(컬럼명)
			REFERENCES 참조_테이블명 (참조_컬럼명);


4. FOREIGN KEY 생성 시 주의사항
- 참조하고자 하는 부모 테이블을 먼저 생성해야 한다.
- 참조하고자 하는 컬럼이 PRIMARY KEY 또는 UNIQUE 제약조건이 있어야 한다.
- 테이블 사이에 PRIMARY KEY와 FOREIGN KEY가 정의 되어 있으면, primary key 삭제 시 foreign key 컬럼에 그 값이 입력되어 있으면 삭제가 안 된다. (단, FK 선언 때 ON DELETE CASCADE나 ON DELETE SET NULL옵션을 사용한 경우에는 삭제된다.)
- 부모 테이블을 삭제하기 위해서는 자식 테이블을 먼저 삭제해야 한다.
- 서로 제약에 의해 참조하는 경우는 서로 삭제되지 않는다. 제약조건을 먼저 삭제해야 한다.



5. 제약 삭제

ALTER TABLE 테이블명
	DROP CONSTRAINT (참조)제약명;

--> 잘못 지정된 제약을 수정하려면 삭제 후 추가해야 한다.

*/

CREATE TABLE jobs (
	jikwi_id NUMBER
	,jikwi_name VARCHAR2(10)
);

ALTER TABLE jobs
	 ADD CONSTRAINT JOBS_JIKWI_ID_PK PRIMARY KEY(jikwi_id);
  

INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (1, 'CLERK');
INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (2, 'MANAGER');
INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (3, 'PRESIDENT');
INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (3, 'VICE PRES'); --X
INSERT INTO jobs (jikwi_id, jikwi_name)
  VALUES (4, 'VICE PRES'); --O
COMMIT;


CREATE TABLE employees (
	sid NUMBER
	,name VARCHAR2(10) 
	,jikwi_id NUMBER
);

ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_SID_PK PRIMARY KEY(sid);
ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_JIKWI_ID_FK 
			FOREIGN KEY(jikwi_id)
			REFERENCES jobs(jikwi_id);

INSERT INTO employees (sid, name, jikwi_id)
  VALUES (1, 'hong', 1); --O
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (2, 'park', 2); --O
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (3, 'choi', 2); --FK 중복 허용. O
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (3, 'kim', 3); --PK 중복 X. X
INSERT INTO employees (sid, name, jikwi_id)
  VALUES (4, 'hwang', 5); --FK 허용 범위 초과. X
COMMIT;

SELECT sid, name, e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
 
-- 문제) hr 스키마 분석을 하고, 그 결과를 쿼리로 작성
 
-- 테이블 생성
-- CREATE TABLE
-- 7개
CREATE TABLE employees_2(
employee_id	NUMBER(6,0),
first_name	VARCHAR2(20 BYTE),
last_name	VARCHAR2(25 BYTE),
email	VARCHAR2(25 BYTE),
phone_number	VARCHAR2(20 BYTE),
hire_date	DATE,
job_id	VARCHAR2(10 BYTE),
salary	NUMBER(8,2),
commission_pct	NUMBER(2,2),
manager_id	NUMBER(6,0),
department_id	NUMBER(4,0)
);

CREATE TABLE countries(
country_id	CHAR(2 BYTE),
country_name VARCHAR2(40 BYTE),
region_id	NUMBER
);

CREATE TABLE departments (
department_id	NUMBER(4,0),
department_name	VARCHAR2(30 BYTE),
manager_id	NUMBER(6,0),
location_id	NUMBER(4,0)
);

CREATE TABLE job_history (
employee_id	NUMBER(6,0),
start_date	DATE,
end_date	DATE,
job_id	VARCHAR2(10 BYTE),
department_id	NUMBER(4,0)
);

CREATE TABLE jobs_2 (
job_id	VARCHAR2(10 BYTE),
job_title	VARCHAR2(35 BYTE),
min_salary	NUMBER(6,0),
max_salary	NUMBER(6,0)
);

CREATE TABLE locations (
location_id	NUMBER(4,0),
street_address	VARCHAR2(40 BYTE),
postal_code	VARCHAR2(12 BYTE),
city	VARCHAR2(30 BYTE),
state_province	VARCHAR2(25 BYTE),
country_id	CHAR(2 BYTE)
);

CREATE TABLE regions (
region_id	NUMBER,
region_name	VARCHAR2(25 BYTE)
);
-- 제약 조건 지정
-- PRIMARY KEY, FOREIGN KEY 제약 분석 및 쿼리 작성.
-- PRIMARY KEY
ALTER TABLE employees_2
    ADD CONSTRAINT emp2_employee_id_pk PRIMARY KEY(employee_id);
ALTER TABLE countries
    ADD CONSTRAINT countries_country_id_pk PRIMARY KEY(country_id);
ALTER TABLE departments
    ADD CONSTRAINT departments_department_id_pk PRIMARY KEY(department_id);
ALTER TABLE job_history
    ADD CONSTRAINT job_his_emp_id_s_date_pk PRIMARY KEY(employee_id, start_date);    
ALTER TABLE jobs_2
    ADD CONSTRAINT jobs_2_job_id_pk PRIMARY KEY(job_id);    
ALTER TABLE locations
    ADD CONSTRAINT locations_location_id_pk PRIMARY KEY(location_id);
ALTER TABLE regions
    ADD CONSTRAINT regions_region_id_pk PRIMARY KEY(region_id);
    
    
-- FOREIGN KEY
ALTER TABLE employees_2
	ADD CONSTRAINT employees_2_department_id_fk 
			FOREIGN KEY(department_id)
			REFERENCES departments(department_id);
ALTER TABLE employees_2
	ADD CONSTRAINT employees_2_job_id_fk 
			FOREIGN KEY(job_id)
			REFERENCES jobs_2(job_id);
ALTER TABLE employees_2
	ADD CONSTRAINT employees_2_manager_id_fk 
			FOREIGN KEY(manager_id)
			REFERENCES employees_2(employee_id);
            
ALTER TABLE countries
	ADD CONSTRAINT countries_region_id_fk 
			FOREIGN KEY(region_id)
			REFERENCES regions(region_id);
            
ALTER TABLE departments
	ADD CONSTRAINT departments_location_id_fk 
			FOREIGN KEY(location_id)
			REFERENCES locations(location_id);
ALTER TABLE departments
	ADD CONSTRAINT departments_manager_id_fk 
			FOREIGN KEY(manager_id)
			REFERENCES employees_2(employee_id);

ALTER TABLE job_history
	ADD CONSTRAINT job_history_department_id_fk 
			FOREIGN KEY(department_id)
			REFERENCES departments(department_id);
ALTER TABLE job_history
	ADD CONSTRAINT job_history_employee_id_fk 
			FOREIGN KEY(employee_id)
			REFERENCES employees_2(employee_id);
ALTER TABLE job_history
	ADD CONSTRAINT job_history_job_id_fk 
			FOREIGN KEY(job_id)
			REFERENCES jobs_2(job_id);
            
 ALTER TABLE locations
	ADD CONSTRAINT locations_country_id_fk 
			FOREIGN KEY(country_id)
			REFERENCES countries(country_id);           

```

# UNIQUE

```sql
------------------------------------------------
-- UNIQUE
-- PK와 유사하게 유일성을 보장하는 제약
-- NULL 허용, 하나의 테이블에 여러번 지정 가능
-- 제약 지정
/*
ALTER TABLE 테이블명
	ADD CONSTRAINT 테이블명_컬럼명_uk UNIQUE(컬럼명);
*/

CREATE TABLE test1 (
	col1 NUMBER(3)          -- PK
	,col2 VARCHAR2(10)      -- UK
);

ALTER TABLE test1
	ADD CONSTRAINT test1_col1_pk PRIMARY KEY(col1);
    
ALTER TABLE test1
    ADD CONSTRAINT test1_col2_uk UNIQUE (col2);

INSERT INTO test1 (col1, col2) 
	VALUES (1, 'TEST');
INSERT INTO test1 (col1, col2) 
	VALUES (2, 'ABCD');
INSERT INTO test1 (col1, col2) 
	VALUES (3, NULL);
INSERT INTO test1 (col1, col2) 
	VALUES (2, 'ABCD');  --ORA-00001
INSERT INTO test1 (col1, col2) 
	VALUES (NULL, NULL); --ORA-01400
INSERT INTO test1 (col1, col2)
    VALUES (4, 'ABCD');  --ORA-00001
INSERT INTO test1 (col1, col2)
    VALUES (5, NULL);
COMMIT;

DROP TABLE test1;
```

# CHECK

```sql
------------------------------------------------
-- CHECK
-- 특정 조건을 만족하는 경우만 입력 허용하는 제약
-- ex) 정수 입력시 양수만 입력 가능
-- 하나의 테이블에 여러번 지정 가능
-- 제약 지정
/*
ALTER TABLE 테이블명
	ADD CONSTRAINT 테이블명_컬럼명_ck CHECK(조건식);
*/

CREATE TABLE test1 (
	col1 NUMBER(3)          -- PK
	,col2 NUMBER(3)         -- CK
);

ALTER TABLE test1
	ADD CONSTRAINT test1_col1_pk PRIMARY KEY(col1);
    
ALTER TABLE test1
    ADD CONSTRAINT test1_col2_uk CHECK(col2>0);
    
INSERT INTO test1(col1, col2)
    VALUES(1, 10);
INSERT INTO test1(col1, col2)
    VALUES(2, 20);
INSERT INTO test1(col1, col2)
    VALUES(3, -10);
INSERT INTO test1(col1, col2)
    VALUES(1, 10);
    
    
```

# NOT NULL

```sql
------------------------------------------------
-- NOT NULL
-- NULL 입력을 허용하지 않는 제약
-- 하나의 테이블에 여러번 지정 가능
-- 제약 지정
/*
ALTER TABLE 테이블명
	MODIFY (컬럼명 자료형 NOT NULL);
*/

-- CREATE TABLE 명령 실행시 NOT NULL 지정 권장
/*
CREATE TABLE test1 (
    컬럼명 자료형 NOT NULL
    ,...
);
*/

-- 주의) PRIMARY KEY 제약 지정시 자동으로 NOT NULL 상태가 된다.
-- 주의) 특정 테이블에서 NOT NULL 상태 확인은 DESC 명령으로도 가능하다.

CREATE TABLE test1 (
	col1 NUMBER(3)          -- PK
	,col2 NUMBER(3) NOT NULL 
);

ALTER TABLE test1
	ADD CONSTRAINT test1_col1_pk PRIMARY KEY(col1);
   
    
INSERT INTO test1(col1, col2)
    VALUES(1, 10);
INSERT INTO test1(col1, col2)
    VALUES(2, 20);
INSERT INTO test1(col1, col2)
    VALUES(3, -10);
INSERT INTO test1(col1, col2)   -- ORA-01400
    VALUES(4, NULL);
COMMIT;

DROP TABLE test1;
```

