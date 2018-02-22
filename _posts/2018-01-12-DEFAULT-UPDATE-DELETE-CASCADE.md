---
layout: post
title: "DEFAULT/UPDATE/DELETE/CASCADE"
description: "DEFAULT/UPDATE/DELETE/CASCADE"
categories: [Oracle]
tags: [DEFAULT,UPDATE,DELETE,CASCADE,대량 입력]
redirect_from:
  - /2018/01/12/
---

# DEFAULT

```sql
------------------------------------
--DEFAULT 표현식

/*
1. insert와 update 문에서 특정 값이 아닌 디폴트값을 입력할 수 도 있다.

2.
컬럼명 데이터타입 DEFAULT 디폴트값

3. INSERT 명령 실행시 해당 컬럼에 값을 할당하지 않거나, DEFAULT 키워드에 의해서 디폴트값을 입력할 수 있다.

4. DEFAULT 키워드와 다른 제약 (NOT NULL 등) 표기가 같이 오는 DEFAULT 키워드 를 먼저 표기할 것.

*/


--DEFAULT 표현식 테스트
CREATE TABLE bbs (
	sid NUMBER PRIMARY KEY  --글번호(자동 번호 증가, 자동 입력)
	,name VARCHAR2(10)      --글쓴이 이름
	,content VARCHAR2(100)  --글내용
	,writeday DATE  DEFAULT SYSDATE  --글쓴 날짜(현재 날짜 자동 입력)
);
--> sid 운영하려면 시퀀스 객체 필요함.
--> 자동 입력되는 컬럼은 입력 항목에서 제외해야 됩니다.

INSERT INTO bbs (sid, name, content) --writeday 컬럼 지정 제외
	VALUES (1, 'hong', 'TEST');
INSERT INTO bbs (sid, name, content) --writeday 컬럼 지정 제외
	VALUES (2, 'park', 'ABCD');
COMMIT;

SELECT * FROM bbs; 
--> 출력해보면 writeday 컬럼에 날짜가 자동 입력된 것을 확인할 수 있다.


--DEFAULT 표현식 확인
SELECT * FROM user_tab_columns 
	WHERE table_name='BBS';
--> data_default 컬럼의 값 확인

--테이블 생성 후 DEFAULT 표현식 추가
/*
ALTER TABLE 테이블명
	MODIFY 컬럼명 [자료형] DEFAULT 값;
*/


--DEFAULT 표현식 삭제
/*
ALTER TABLE 테이블명
	MODIFY 컬럼명 [자료형] DEFAULT NULL;
*/

--DEFAULT 제약 확인용 사용자 뷰 실행
SELECT *
    FROM constraintsCheckView
     WHERE table_name='BBS';


-----------------------------------------------

/*
DML(Data Manipulation Language) - INSERT, UPDATE, DELETE
DDL(Data Definition Language) - CREATE, ALTER, DROP
DCL(Data Control Language)
TCL(Transaction Control Language) - COMMIT, ROLLBACK
DQL(Data Query Language) - SELECT
*/


```

# UPDATE

```sql
------------------------------------------------------------
--UPDATE

/*
1. 테이블에서 기존의 데이터를 변경한다.

2. UPDATE 테이블_명
	SET 컬럼_명= 변경할_값[, 컬럼_명= 변경할_값, ...]
	[WHERE 조건];
*/

--------------------------
--한 개의 row를 상대로 한 개의 항목 수정
--원본 상태 확인
SELECT * FROM members;

--박길동 전화번호 변경 시도
--주의) 검색 조건 지정 중요
UPDATE members
    SET tel = '1111'
    WHERE mid=2;
COMMIT;

--변경된 전화번호 확인
SELECT * FROM members;


---------------------
--한 개의 row를 상대로 여러개의 항목 수정
--원본 상태 확인
SELECT * FROM insa;
--basicpay 2610000	sudang 200000

--홍길동(num=1001) 기본급, 수당 변경 시도
--주의) 검색 조건 지정 중요
UPDATE insa
    SET basicpay = 3000000, sudang = 500000
    WHERE num=1001;
COMMIT;

--변경된 기본급, 수당 확인
SELECT * FROM insa;
--basicpay 3000000	sudang 500000

---------------------
--여러개의 row를 상대로 한 개의 항목 수정
--원본 상태 확인
SELECT * FROM insa
    WHERE buseo='개발부';
--sudang 102000 ~ 210000

--개발부 직원 전체의 수당 변경 시도
--주의) 검색 조건 지정 중요
UPDATE insa
    SET sudang = sudang + (sudang * 0.01)
    WHERE buseo='개발부';
ROLLBACK;

--변경된 수당 확인
SELECT * FROM insa
    WHERE buseo='개발부';
--sudang 103020 ~ 212100



-------------------------------------------------
--주의) WHERE 조건절을 지정하지 않거나, 잘못된 조건인 경우 원하지 않는 row까지 수정의 범위에 포함된다.

--홍길동의 전화번호 변경시 WHERE 조건절 지정 하지 않는 경우를 상정
SELECT * FROM insa
    WHERE num=1001; --조건 지정시 유일한 값(PK 컬럼의 값)을 가지고 검색 권장
--011-2356-4528

--올바른 수정 예    
UPDATE insa
    SET tel = '010-1234-1234'
    WHERE num=1001;
COMMIT;

SELECT * FROM insa
    WHERE num=1001;
--010-1234-1234

--잘못된 수정 예    
UPDATE insa
    SET tel = '010-1234-1234';
--COMMIT;

SELECT * FROM insa;
-->모든 직원의 전화번호가 변경된 상태가 된다.
-->ROLLBACK;


------------------------------------------------------
--서브쿼리를 UPDATE 구문의 일부로 사용 가능
--서브쿼리는 무조건 SELECT

/*
UPDATE 테이블명
    SET 컬럼명 = (서브쿼리)
    WHERE (서브쿼리를 이용한 조건식);
    
    
예를 들어,
UPDATE employees
	SET salary = salary*1.1
	WHERE department_id IN (SELECT department_id
				 FROM departments
				 WHERE department_name='IT');
                 
                 

UPDATE (서브쿼리-JOIN 쿼리를 이용한 가상 테이블)
    SET 컬럼명 = 값
    WHERE 조건식;
    -
예를 들어,
UPDATE (SELECT e.first_name, e.last_name, e.salary, d.department_name
	FROM employees e, departments d
	WHERE e.department_id = d.department_id)  
  SET salary=salary*1.1
  WHERE department_name='IT';
  
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
COMMIT;


--수당 항목 추가 + 기본값 추가
ALTER TABLE employees
    ADD (extrapay NUMBER DEFAULT 100000);


--원본 상태 확인
SELECT sid, name, e.extrapay , e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
/*  
1	hong	100000	1	CLERK
2	park	100000	2	MANAGER
3	choi	100000	2	MANAGER
*/


--jobs.jikwi_name 이 'CLERK'인 직원의 수당(employees.extrapay) 변경
    
--방법1    
UPDATE employees
    SET extrapay = 20000
    WHERE jikwi_id = (SELECT jikwi_id FROM jobs WHERE jikwi_name = 'CLERK');    
    
--방법2
UPDATE (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    SET extrapay = 20000
    WHERE jikwi_name = 'CLERK';
COMMIT;

--수정된 상태 확인
SELECT sid, name, e.extrapay , e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
/*  
1	hong	20000	1	CLERK
2	park	100000	2	MANAGER
3	choi	100000	2	MANAGER
*/  


--jobs.jikwi_name이 'CLERK'인 직원의 수당(employees.extrapay) 20% 인상. jobs.jikwi_name이 'MANAGER'인 직원의 수당(employees.extrapay) 10% 인상.
--> DECODE() 함수 사용.
UPDATE (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    SET extrapay = DECODE(jikwi_name, 'CLERK', extrapay*1.2, 'MANAGER', extrapay*1.1, extrapay);
COMMIT;

--문제)jobs.jikwi_name이 'CLERK'인 직원의 수당(employees.extrapay) 20% 인상. jobs.jikwi_name이 'MANAGER'인 직원의 수당(employees.extrapay) 10% 인상.
--> CASE ~ END 사용.

UPDATE (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    SET extrapay = (CASE jikwi_name
                        WHEN 'CLERK' THEN extrapay*1.2
                        WHEN 'MANAGER' THEN extrapay*1.1
                        ELSE extrapay
                    END);
COMMIT;

--수정된 상태 확인
SELECT sid, name, e.extrapay , e.jikwi_id, jikwi_name
  FROM employees e, jobs j
  WHERE e.jikwi_id=j.jikwi_id;
/*  
1	hong	24000	1	CLERK
2	park	110000	2	MANAGER
3	choi	110000	2	MANAGER
*/


```

# DELETE

```sql
------------------------------------------------
--DELETE

/*
1. 테이블에서 지정한 행을 삭제하는데 사용한다.

2. DELETE [FROM] 테이블_명 [WHERE 조건];
*/



--------------------------
--한 개의 row를 상대로 삭제
--원본 상태 확인
SELECT * FROM members;

--박길동 자료 삭제 시도
--주의) 검색 조건 지정 중요
DELETE FROM members
    WHERE mid=2;
COMMIT;

--삭제된 상태 확인
SELECT * FROM members;




--------------------------
--여러 개의 row를 상대로 삭제
--원본 상태 확인
SELECT * FROM insa;

--'개발부' 전체 자료 삭제 시도
--주의) 검색 조건 지정 중요
DELETE FROM insa
    WHERE buseo='개발부';
COMMIT;

--삭제된 상태 확인
SELECT * FROM insa;



-------------------------------------------------
--주의) WHERE 조건절을 지정하지 않거나, 잘못된 조건인 경우 원하지 않는 row까지 삭제의 범위에 포함된다.

DELETE FROM insa;
--COMMIT;

--삭제된 상태 확인
SELECT * FROM insa;
--> 모든 자료가 삭제된 상태이다.
--> ROLLBACK;



--jobs.jikwi_name 이 'CLERK'인 직원(employees 테이블)만 삭제 시도
DELETE FROM (SELECT extrapay, jikwi_name
            FROM employees emp, jobs j
            WHERE emp.jikwi_id = j.jikwi_id)
    WHERE jikwi_name = 'CLERK';
COMMIT;

--삭제된 상태 확인
SELECT *
        FROM employees emp, jobs j
        WHERE emp.jikwi_id = j.jikwi_id;
      
--주의) jobs 테이블의 row를 삭제하는 경우(참조 당하는 경우 삭제 불가)        
SELECT * FROM jobs;

DELETE FROM jobs
    WHERE jikwi_id = 2; --ORA-02292: integrity constraint (MINJONG.EMPLOYEES_JIKWI_ID_FK) violated - child record found

--> FK 제약 생성시 ON DELETE CASCADE, ON DELETE SET NULL 옵션 지정하면 삭제 가능


---------------------------------------
```

# CASCADE

```sql
--ON DELETE CASCADE 옵션
-- 부모 테이블과 자식 테이블이 FK 제약으로 연결된 상태인 경우, 부모 테이블의 자료 삭제시 삭제 못하는 경우가 있다. 부모 테이블의 자료를 참조하는 자식이 존재하기 때문이다.
-- FK 제약 지정시 부모 테이블의 row(PK)가 삭제될 때 자식 테이블의 row(FK)의 삭제 여부 결정
-- FK에 대한 테이블 생성후 제약 추가
/*
ALTER TABLE 테이블명
	ADD CONSTRAINT 제약명 FOREIGN KEY(컬럼명)
			REFERENCES 참조_테이블명 (참조_컬럼명)
            ON DELETE CASCADE;
*/
-- ON DELETE CASCADE 옵션 지정시 부모 테이블의 자료 삭제하면, 관련된 자식 테이블의 자료가 같이 삭제된다.


---------------------------
--ON DELETE CASCADE 옵션 지정 전
CREATE TABLE jobs (
	jikwi_id NUMBER
	,jikwi_name VARCHAR2(10)
	,CONSTRAINT JOBS_JIKWI_ID_PK PRIMARY KEY(jikwi_id)
);

INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (1, '과장');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (2, '대리');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (3, '사원');
COMMIT;

SELECT * FROM jobs;


--FK 제약 지정
CREATE TABLE employees (
	sid NUMBER PRIMARY KEY
	,name VARCHAR2(10) 
	,jikwi_id NUMBER REFERENCES jobs(jikwi_id)
);

INSERT INTO employees (sid, name, jikwi_id)
	VALUES (1, '홍길동', 1);
INSERT INTO employees (sid, name, jikwi_id)
	VALUES (2, '김길동', 2);
COMMIT;

--employees 테이블 자료 확인
SELECT * FROM employees;

--employees 테이블에서 '김길동' 자료 삭제 시도. --O
DELETE FROM employees WHERE sid=2;

--employees 테이블 자료 확인
SELECT * FROM employees;

--jobs 테이블 자료 확인
SELECT * FROM jobs;

--jobs 테이블에서 '과장' 자료 삭제 시도. --X
DELETE FROM jobs WHERE jikwi_id=1;

--jobs 테이블에서 '사원' 자료 삭제 시도. --O
DELETE FROM jobs WHERE jikwi_id=3;

--jobs 테이블 자료 확인
SELECT * FROM jobs;

--> ON DELETE CASCADE 옵션 지정이 필요합니다.
--> employees 테이블에서 FK 제약 제거 후 다시 FK 제약 지정
SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE 컬럼의 값 확인 -> NO_ACTION -> ON DELETE CASCADE 옵션 지정 X -> 부모 row 삭제시, 자식 row가 같이 삭제되지 않는다. 기본값.


--기존 FK 제약 삭제
ALTER TABLE employees
    DROP CONSTRAINT SYS_C007214;
    
----------------------------
--ON DELETE CASCADE 옵션 지정 후
ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_JIKWI_ID_FK
		FOREIGN KEY (jikwi_id)
		REFERENCES jobs(jikwi_id)
		ON DELETE CASCADE;


SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE 컬럼의 값 확인 -> CASCADE -> ON DELETE CASCADE 옵션 지정 O -> 부모 row 삭제시, 자식 row가 같이 삭제될 수 있다.

SELECT * FROM jobs;
SELECT * FROM employees;
        
--jobs 테이블에서 '과장' 자료 삭제 시도. --O
DELETE FROM jobs WHERE jikwi_id=1;
--> employees 테이블의 자료가 같이 삭제된다.

SELECT * FROM jobs;
SELECT * FROM employees;


------------------------------------------------------------
--ON DELETE SET NULL 옵션
-- 부모 테이블과 자식 테이블이 FK 제약으로 연결된 상태인 경우, 부모 테이블의 자료 삭제시 삭제 못하는 경우가 있다. 부모 테이블의 자료를 참조하는 자식이 존재하기 때문이다.
-- FK 제약 지정시 부모 테이블의 row(PK)가 삭제될 때 자식 테이블의 row(FK)의 삭제 여부 결정
-- FK에 대한 테이블 생성후 제약 추가
/*
ALTER TABLE 테이블명
	ADD CONSTRAINT 제약명 FOREIGN KEY(컬럼명)
			REFERENCES 참조_테이블명 (참조_컬럼명)
            ON DELETE SET NULL;
*/
-- ON DELETE SET NULL 옵션 지정시 부모 테이블의 자료 삭제하면, 관련된 자식 테이블의 자료가 NULL로 대체된다.

--ON DELETE SET NULL 옵션 지정 전
CREATE TABLE jobs (
	jikwi_id NUMBER
	,jikwi_name VARCHAR2(10)
	,CONSTRAINT JOBS_JIKWI_ID_PK PRIMARY KEY(jikwi_id)
);

INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (1, '과장');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (2, '대리');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (3, '사원');
COMMIT;

SELECT * FROM jobs;


--FK 제약 지정
CREATE TABLE employees (
	sid NUMBER PRIMARY KEY
	,name VARCHAR2(10) 
	,jikwi_id NUMBER REFERENCES jobs(jikwi_id)
);

INSERT INTO employees (sid, name, jikwi_id)
	VALUES (1, '홍길동', 1);
INSERT INTO employees (sid, name, jikwi_id)
	VALUES (2, '김길동', 2);
COMMIT;

--jobs 테이블에서 '사원' 자료 삭제 시도. --O
DELETE FROM jobs WHERE jikwi_id=3;

--employees 테이블 자료 확인
SELECT * FROM employees;
SELECT * FROM jobs;

SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';

--기존 FK 제약 삭제
ALTER TABLE employees
    DROP CONSTRAINT SYS_C007223;

----------------------------
--ON DELETE SET NULL 옵션 지정 후
ALTER TABLE employees
	ADD CONSTRAINT EMPLOYEES_JIKWI_ID_FK
		FOREIGN KEY (jikwi_id)
		REFERENCES jobs(jikwi_id)
		ON DELETE SET NULL;

SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
--> DELETE_RULE 컬럼의 값 확인 -> CASCADE -> ON DELETE CASCADE 옵션 지정 O -> 부모 row 삭제시, 자식 row가 같이 삭제될 수 있다.

SELECT * FROM jobs;
SELECT * FROM employees;
        
--jobs 테이블에서 '과장' 자료 삭제 시도. --O
DELETE FROM jobs WHERE jikwi_id=1;
--> employees 테이블의 자료가 같이 삭제된다.

SELECT * FROM jobs;
SELECT * FROM employees;


-----------------------------------
-------------------------------------------------------------------------
-- CASCADE CONSTRAINTS 옵션
-- 부모 테이블과 자식 테이블이 FK 제약으로 연결된 상태인 경우, 부모 테이블의 자료 삭제시 삭제 못하는 경우가 있다. 부모 테이블의 자료를 참조하는 자식이 존재하기 때문이다.
-- 옵션 지정
/*
DROP TABLE 부모테이블명 CASCADE CONSTRAINTS;
--> 부모테이블은 삭제된다. 내부적으로 FK 제약을 삭제한 후, 테이블 삭제한다.
*/

CREATE TABLE jobs (
	jikwi_id NUMBER
	,jikwi_name VARCHAR2(10)
	,CONSTRAINT JOBS_JIKWI_ID_PK PRIMARY KEY(jikwi_id)
);

INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (1, '과장');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (2, '대리');
INSERT INTO jobs (jikwi_id, jikwi_name) VALUES (3, '사원');
COMMIT;

SELECT * FROM jobs;

CREATE TABLE employees (
	sid NUMBER PRIMARY KEY
	,name VARCHAR2(10) 
	,jikwi_id NUMBER REFERENCES jobs(jikwi_id)
);

INSERT INTO employees (sid, name, jikwi_id)
	VALUES (1, '홍길동', 1);
INSERT INTO employees (sid, name, jikwi_id)
	VALUES (2, '김길동', 2);
COMMIT;

SELECT * FROM employees;

-- jobs 테이블(부모 테이블) 삭제 시도
DROP TABLE jobs; --ORA-02449
--> 자식 테이블을 먼저 삭제하면, 부모 테이블을 삭제할 수 있다.
--> CASCADE CONSTRAINTS 옵션 지정시, 순서에 관계없이 삭제 가능

-- jobs 테이블(부모 테이블) 삭제 시도
DROP TABLE jobs CASCADE CONSTRAINTS;

SELECT * FROM jobs;
SELECT * FROM employees;

-- 자식 테이블에서 FK 제약이 삭제된 상태 확인
SELECT * FROM user_constraints WHERE table_name='EMPLOYEES';
```

# 대량 자료 입력(INSERT/CREATE~SELECT)

```sql
-- 대량 자료 입력 쿼리
-- INSERT 쿼리는 명령 한 번에 한 개의 행만 삽입 가능
-- INSERT ~ SELECT 쿼리는 명령 한 번에 여러 개의 행 삽입 가능. 테이블은 미리 존재해야 한다.
-- CREATE ~ SELECT 쿼리는 테이블 생성시 여러 개의 행 삽입 동시 진행 가능

/*
**4. 기존 테이블 구조 및 기존 자료 복사해서 새 테이블 생성 및 자료 입력 (제약조건은 복사되지 않는다)
CREATE TABLE 새테이블명
AS
SELECT 컬럼리스트 FROM 기존테이블명 [WHERE 조건식];
*/

-- 원본 테이블 확인
SELECT * FROM insa;

-- 구조만 복사해서 새 테이블 생성
-- 주의) 제약조건은 복사되지 않는다.
CREATE TABLE emp
AS
SELECT * FROM insa WHERE 1 = 2; -- 결과가 모두 false이므로 데이터는 복사가 안되고 구조만 복사

SELECT * FROM emp;

DESC emp;

SELECT * FROM user_constraints WHERE table_name='EMP';

-- 원본 테이블의 컬럼 이름을 새로운 이름으로 설정
CREATE TABLE emp2
AS
SELECT num AS eid, name AS name_, ssn, ibsadate AS regdate, tel AS phone FROM insa WHERE 1 = 2;

DESC emp2;



-- 전체 자료 + 전체 구조 동시 복사해서 새 테이블 생성
CREATE TABLE emp3
AS
SELECT * FROM insa;

SELECT * FROM emp3;

-- 일부 자료 + 전체 구조 동시 복사해서 새 테이블 생성
CREATE TABLE emp4
AS
SELECT * FROM insa WHERE buseo = '개발부';

SELECT * FROM emp4;

-- 전체 자료 + 일부 구조 동시 복사해서 새 테이블 생성
CREATE TABLE emp5
AS
SELECT num, name, ssn, ibsadate, tel FROM insa;

SELECT * FROM emp5;

-- 일부 자료 + 일부 구조 동시 복사해서 새 테이블 생성
CREATE TABLE emp6
AS
SELECT num, name, ssn, ibsadate, tel FROM insa WHERE buseo = '개발부';

SELECT * FROM emp6;


----------------------------------------
-- 테이블이 존재하는 경우 INSERT ~ SELECT 쿼리로 대량 자료 입력 가능
/*
INSERT INTO 새테이블명
    SELECT 컬럼리스트 FROM 기존테이블명 [WHERE 조건식];
COMMIT;
*/
CREATE TABLE emp7
AS
SELECT num AS eid, name AS name_
    , ssn, ibsadate AS regdate
    , tel AS phone FROM insa WHERE 1 = 2;
    
INSERT INTO emp7
SELECT num AS eid, name AS name_
    , ssn, ibsadate AS regdate
    , tel AS phone FROM insa WHERE buseo = '개발부';
COMMIT;

SELECT * FROM emp7;
```

