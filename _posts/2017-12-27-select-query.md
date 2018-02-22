---
layout: post
title: "DataBase-Select Query"
description: "DataBase-Select Query"
categories: [Oracle]
tags: [DataBase, select]
redirect_from:
  - /2017/12/27/
---

# Select 쿼리

```sql
/*

SELECT 쿼리

- 기본 형식
SELECT select_list FROM source_list;
- SELECT 쿼리는 특정 테이블에 저장된 자료를 조회하는 쿼리.
- SELECT 구문은 출력 대상을 지정하는 부분. 예를 들어, 컬럼명 지정. 이름, 전화번호 등.
- FROM 구문은 자료가 저장되어 있는 특정 테이블을 지정한다. 예를 들어, hr.employees
- SELECT ~ FROM ~ 키워드는 생략 불가.

*/

SELECT first_name, last_name 
FROM hr.employees;

SELECT 'Hello, Oracle World!'
FROM dual;


--모든 컬럼 조회하기
--특정 테이블의 모든 항목(컬럼) 조회하려면 컬럼명을 모두 나열하거나, *(와일드카드) 기호를 사용한다.
--SELECT * FROM source_list;

SELECT * FROM hr.employees;
SELECT employee_id, first_name, last_name, email, phone_number   
        , hire_date, job_id, salary, commission_pct, manager_id, department_id
FROM hr.employees;


--원하는 컬럼만 조회하기
--특정 테이블의 특정 항목(컬럼) 조회하려면 컬럼명을 나열한다.
--SELECT column1, column2,...  FROM source_list;

SELECT employee_id, first_name, last_name, email, phone_number
FROM hr.employees;

SELECT department_id, department_name
FROM hr.departments;

SELECT job_id, job_title
FROM hr.jobs;

--표현식을 사용해서 출력하기
--자료 출력시 특정 문자열을 포함해서 출력하려면 표현식(작은따옴표로 감싼 문자열) 사용.
--SELECT column1,  '표현식'  FROM source_list;

SELECT first_name, '[', last_name, ']' 
FROM hr.employees;

SELECT 'Hello, World!'
FROM hr.employees;

SELECT 'Hello, World!'
FROM dual;

--컬럼 별칭(Alias) 사용하여 출력하기
--특정 테이블의 특정 컬럼 출력시 컬럼명 대신 별칭 지정 가능.
--별칭명은 식별자 규칙에 만족하는 아무 이름이나 사용 가능. 단 공백이 포함된 경우 "(큰 따옴표)로 묶어서 표현. 오라클에서 사용하는 키워드는 사용 불가.
--주의) 출력대상이 표현식(또는 수식)인 경우 별칭 사용 권장.
--SELECT column1  별칭1, column2  별칭2, ...  FROM source_list;
--SELECT column1  "별칭1", column2  "별칭2", ...  FROM source_list;
--SELECT column1 AS  별칭1, column2 AS 별칭2, ...  FROM source_list;

SELECT employee_id empId
        , first_name fname
        , last_name lname
        , email 
        , phone_number phone
FROM hr.employees;

SELECT first_name || ' ' || last_name full_name
FROM hr.employees;



-- 중복된 값을 제거하고 출력하기
-- DISTINCT 키워드 필요
-- SELECT DISTINCT column1, column2,... FROM source_list;

SELECT first_name 
FROM hr.employees 
ORDER BY first_name; 
-- 107

SELECT DISTINCT first_name 
FROM hr.employees 
ORDER BY first_name;
-- 91

SELECT DISTINCT first_name, last_name
FROM hr.employees 
ORDER BY first_name;
-- 107

-- 연결연산자로(||) 컬럼 붙여서 출력하기
-- 두 개 이상의 컬럼이나, 표현식을 묶어서 하나의 컬럼으로 처리
-- 주의) 별칭 사용권장
SELECT DISTINCT first_name ||''|| last_name
FROM hr.employees ;

SELECT DISTINCT first_name ||','|| last_name
FROM hr.employees ;

-- 연습문제) hr.employees 테이블을 조회하여 모든 사원의 이름(first_name, last_name)과 급여(salary)를 아래와 같은 형태로 출력
-- 출력ex) Ellen, Abel's salary is $900
SELECT first_name||' '||last_name||'''s salary is $'||salary "Name and Sal"
FROM hr.employees;
```

