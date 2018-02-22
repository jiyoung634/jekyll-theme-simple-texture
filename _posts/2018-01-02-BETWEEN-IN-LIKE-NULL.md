---
layout: post
title: "BETWEEN & IN & LIKE & NULL"
description: "BETWEEN & IN & LIKE & NULL"
categories: [Oracle]
tags: [BETWEEN , IN , LIKE , NULL]
redirect_from:
  - /2018/01/02/
---

# BETWEEN

```sql
-- BETWEEN 연산자로 구간 데이터 조회하기
-- SELECT select-list FROM source_list WHERE 컬럼 BETWEEN 값1 AND 값2;
-- 값1에서 값2 범위에 존재하는 경우를 출력한다.
-- ex) hr.employees 테이블에서 급여(salary)가 5000에서 10000인 경우 출력
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
WHERE salary BETWEEN 5000 and 10000;
-- 43

-- BETWEEN 연산자를 일반 관계 연산자로 표현하면 다음과 같다.
SELECT employee_id, first_name, last_name, salary
FROM hr.employees
WHERE salary >= 5000 AND salary <=10000;
-- 43

-- ex) hr.employees 테이블에서 입사일(hire_date) 기준으로 2000년도~2005년도 입사자 출력
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE TO_CHAR(hire_date, 'YYYY') BETWEEN '2000' and '2005';
-- 53

-- ex) hr.employees 테이블에서 이름(first_name) 기준으로 'A'~'B'로 시작하는 이름을 가진 사원 출력
SELECT employee_id, first_name, last_name
FROM hr.employees
WHERE first_name BETWEEN 'A' and 'C';
-- 12
```

# IN

```sql
-- IN 연산자로 비슷한 것들 모두 찾기
-- SELECT select-list FROM source_list WHERE 컬럼 IN (값1, 값2, 값3, ...);
-- 값1, 값2, 값3 등 나열된 값 중에 하나를 만족하면 출력한다.
-- hr.employees 테이블에서 입사일(hire_date) 정보 중에서 1,2,3월 입사자만 출력
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE TO_CHAR(hire_date, 'MM') IN(1, 2, 3); -- 암시적 형변환

-- IN 연산자를 일반 관계 연산자로 표현하면 다음과 같다
SELECT employee_id, first_name, last_name, hire_date
FROM hr.employees
WHERE TO_CHAR(hire_date, 'MM') = '01'
        OR TO_CHAR(hire_date, 'MM') = '02' 
        OR TO_CHAR(hire_date, 'MM') = '03' ; -- 암시적 형변환
        
-- hr.employees 테이블에서 job_id가 Manager인 경우 출력
-- 'SA_MAN', 'ST_MAN', 'PU_MAN', 'AC_MGR'
SELECT employee_id, first_name, last_name, job_id
FROM hr.employees
WHERE job_id IN('SA_MAN', 'ST_MAN', 'PU_MAN', 'AC_MGR');
-- 12
```

# LIKE

```sql
-- LIKE 연산자로 비슷한 것들 모두 찾기
-- SELECT select_list FROM source_list WHERE 컬럼 LIKE '와일드카드 포함 값';
-- 와일드카드는 %(여러 문자 대체 가능), _(한 문자 대체) 중에 하나로 표시
-- ex) '%값', '값%', '%값%' 형태로 사용

--hr.employees 테이블에서 first_name이 'A'로 시작하는 경우 출력.
SELECT employee_id, first_name, last_name
FROm hr.employees
WHERE first_name LIKE 'A%';
--10

--hr.employees 테이블에서 first_name이 'A'~'B'로 시작하는 경우 출력.
SELECT employee_id, first_name, last_name
FROM hr.employees
WHERE first_name LIKE 'A%' OR first_name LIKE 'B%';
--12

-- hr.employees 테이블에서 first_name이 'An'로 시작하는 경우 출력
SELECT employee_id, first_name, last_name
FROM hr.employees
WHERE first_name LIKE 'An%';
-- 1

-- hr.employees 테이블에서 phone_number가 '123'를 포함하는 경우 출력.
SELECT employee_id, first_name, last_name, phone_number
FROM hr.employees
WHERE phone_number LIKE '%123%';
-- 16
-- 주의) 와일드카드를 LIKE 연산자 조건식의 앞에 표기하는 경우는 권장하지 않는다. 속도 저하.

```

# IS NULL / IS NOT NULL

```sql

--IS NULL, IS NOT NULL 연산자로 NULL 검색하기
--SELECT select_list FROM source_list WHERE 컬럼 IS NULL;
--NULL 은 =(같음 비교) 연산자로 검색 불가.
--컬럼의 값이 명시적으로 존재하지 않는 상태를 NULL이라고 한다. 숫자, 문자, 날짜 자료형 모두 NULL 허용.
--NULL 허용하지 않는 경우는 Primary key와 같은 제약이 지정된 경우이다.

-- hr.employees 테이블에서 부서번호(department_id)가 할당되지 않은 사원 출력
SELECT employee_id, first_name , last_name, department_id
FROM hr.employees
WHERE department_id IS NULL;
-- 1

SELECT employee_id, first_name , last_name, department_id
FROM hr.employees
WHERE department_id IS NOT NULL;
-- 106

```

# 외부입력(&)

```sql
-- 쿼리 실행시 외부에서 자료 입력받기
-- 쿼리 구문에 &식별자를 사용하면 쿼리 실행시 외부 입력 처리 가능
-- ex) 직원번호(employee_id)를 외부 입력 받은 후 검색 진행
SELECT employee_id, first_name , last_name
FROM hr.employees
WHERE employee_id = &employee_id;
```

