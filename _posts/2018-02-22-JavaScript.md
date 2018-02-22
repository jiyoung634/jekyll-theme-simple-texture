---
layout: post
title: "JavaScript"
description: "JavaScript"
categories: [JavaScript]
tags: []
redirect_from:
  - /2018/02/22/
---

# JavaScript 출력

## 1. innerHTML (권장)

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>

</head>
<body>

<div id="content">

<p id="demo">콘텐츠 영역</p>

</div>

<script>
/* 
 
자바스크립트에서 결과(자료) 출력하는 방법
  
1. Writing into an HTML element, using innerHTML.
2. Writing into the HTML output using document.write().
3. Writing into an alert box, using window.alert().
4. Writing into the browser console, using console.log().
 
 
 
자바스크립트 프로퍼티(property)

- 객체의 상태값을 저장하는 변수(식별자)
- Java에서의 getter, setter 역할을 한다.
- 객체의 상태값을 읽어내는 경우는 변수 = 객체이름.프로퍼티;
- 객체의 상태값을 쓰기 하는 경우는 객체이름.프로퍼티 = 값 or 변수;
- 내장객체는 미리 정해진 프로퍼티가 있다. ex) innerHTML 프로퍼티. HTML 엘리먼트(<h1></h1>)의 콘텐츠(제목)를 읽거나, 쓰는 용도로 사용한다.
*/


document.getElementById("demo").innerHTML = "Hello, JavaScript World!";

</script>

</body>
</html>
```



## 2.  write()

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>

</head>
<body>

<div id="content">

<p id="demo">콘텐츠 영역</p>

</div>

<script>
/* 
 
자바스크립트에서 결과(자료) 출력하는 방법
  
1. Writing into an HTML element, using innerHTML.
2. Writing into the HTML output using document.write().
3. Writing into an alert box, using window.alert().
4. Writing into the browser console, using console.log().
 
 
 
자바스크립트 프로퍼티(property)

- 객체의 상태값을 저장하는 변수(식별자)
- Java에서의 getter, setter 역할을 한다.
- 객체의 상태값을 읽어내는 경우는 변수 = 객체이름.프로퍼티;
- 객체의 상태값을 쓰기 하는 경우는 객체이름.프로퍼티 = 값 or 변수;
- 내장객체는 미리 정해진 프로퍼티가 있다. ex) innerHTML 프로퍼티. HTML 엘리먼트(<h1></h1>)의 콘텐츠(제목)를 읽거나, 쓰는 용도로 사용한다.
*/

/* write() 메소드는 준비된 웹페이지 객체(documnet)에 출력을 진행한다. */
/* 주의) 현재 방법은 출력 위치가 코드 위치와 일치한다.
   주의) 페이지 로딩이 끝난 후에 실행하게 되면 새로운 웹페이지 객체에 출력된다. */
document.write("Hello, JavaScript World!");

</script>

</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>

</head>
<body>

<div id="content">

<p id="demo">콘텐츠영역</p>
<button type="button" onclick="document.write('Hello, JavaScript World!')">Try it</button>

</div>

<script>
/* 
 
자바스크립트에서 결과(자료) 출력하는 방법
  
1. Writing into an HTML element, using innerHTML.
2. Writing into the HTML output using document.write().
3. Writing into an alert box, using window.alert().
4. Writing into the browser console, using console.log().
 
 
 
자바스크립트 프로퍼티(property)

- 객체의 상태값을 저장하는 변수(식별자)
- Java에서의 getter, setter 역할을 한다.
- 객체의 상태값을 읽어내는 경우는 변수 = 객체이름.프로퍼티;
- 객체의 상태값을 쓰기 하는 경우는 객체이름.프로퍼티 = 값 or 변수;
- 내장객체는 미리 정해진 프로퍼티가 있다. ex) innerHTML 프로퍼티. HTML 엘리먼트(<h1></h1>)의 콘텐츠(제목)를 읽거나, 쓰는 용도로 사용한다.
*/

/* write() 메소드는 준비된 웹페이지 객체(documnet)에 출력을 진행한다. */
/* 주의) 페이지 로딩이 끝난 후에 실행하게 되면 새로운 웹페이지 객체에 출력된다. */

</script>

</body>
</html>
```



## 3. alert()

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>

</head>
<body>

<div id="content">

<p id="demo">콘텐츠 영역</p>

</div>

<script>
/* 
 
자바스크립트에서 결과(자료) 출력하는 방법
  
1. Writing into an HTML element, using innerHTML.
2. Writing into the HTML output using document.write().
3. Writing into an alert box, using window.alert().
4. Writing into the browser console, using console.log().
 
 
 
자바스크립트 프로퍼티(property)

- 객체의 상태값을 저장하는 변수(식별자)
- Java에서의 getter, setter 역할을 한다.
- 객체의 상태값을 읽어내는 경우는 변수 = 객체이름.프로퍼티;
- 객체의 상태값을 쓰기 하는 경우는 객체이름.프로퍼티 = 값 or 변수;
- 내장객체는 미리 정해진 프로퍼티가 있다. ex) innerHTML 프로퍼티. HTML 엘리먼트(<h1></h1>)의 콘텐츠(제목)를 읽거나, 쓰는 용도로 사용한다.
*/

/* alert() 메소드(함수)는 메시지 박스 호출할 때 사용.
   주의) window 객체 표현은 생략 가능.
   주의) 확인 버튼 클릭해야만 alert() 함수의 액션이 끝난다. */
 
 alert("Hello, JavaScript World!");
 window.alert("Hello, JavaScript World!");
</script>


</body>
</html>
```



## 4. console.log()  (권장)

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>

</head>
<body>

<div id="content">

<p id="demo">콘텐츠 영역</p>

</div>

<script>
/* 
 
자바스크립트에서 결과(자료) 출력하는 방법
  
1. Writing into an HTML element, using innerHTML.
2. Writing into the HTML output using document.write().
3. Writing into an alert box, using window.alert().
4. Writing into the browser console, using console.log().
 
 
 
자바스크립트 프로퍼티(property)

- 객체의 상태값을 저장하는 변수(식별자)
- Java에서의 getter, setter 역할을 한다.
- 객체의 상태값을 읽어내는 경우는 변수 = 객체이름.프로퍼티;
- 객체의 상태값을 쓰기 하는 경우는 객체이름.프로퍼티 = 값 or 변수;
- 내장객체는 미리 정해진 프로퍼티가 있다. ex) innerHTML 프로퍼티. HTML 엘리먼트(<h1></h1>)의 콘텐츠(제목)를 읽거나, 쓰는 용도로 사용한다.
*/

/* console.log() 메소드는 브라우저 콘솔창(개발자 도구)에 출력할 때 사용]
   주의) 웹페이지에는 결과가 출력되지 않는다. */
 
console.log("Hello, JavaScript World!");

</script>


</body>
</html>
```



# 변수

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>
</head>
<body>


<script>
/* 
 
자바스크립트 변수 선언 및 초기화
  
- var 키워드
- 형식
var 변수명;
var 변수명 = 값;
var 변수명1, 변수명2, ...;
var 변수명1 = 값, 변수명2 = 값, ...;

주의) 초기화되지 않은 변수 사용시 undefined 상태가 된다.
주의) 변수의 자료형(숫자형, 문자형 등)은 값에 따라 달라진다.
*/

var box;
console.log(box);

box = 100;
console.log(box);

box = "TEST";
console.log(box);

</script>


</body>
</html>
```



## 1. 문자 자료형

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>
</head>
<body>


<script>
/* 
 
자바스크립트 자료형

- 문자형(String) : "" or '' 로 표기한 문자열. ex) "TEST", 'Hello'
- 숫자형(Number) : 정수, 실수 모두 숫자형으로 취급. ex) 100, 123.45
- 논리형(Boolean) : true or false 두 가지 값만 가지는 자료형.
- null : 유효한 값
- undefined : 값이 할당되지 않은 상태를 의미.
- typeof : 자료형 확인 연산자
- Object : 사용자 정의 객체 자료형
*/


/* 문자 자료형 */
var carname = "Volvo XC60";  // Double quotes
console.log(carname);
console.log(typeof carname);

var carname = 'Volvo XC60';  // Single quotes
console.log(carname);
console.log(typeof carname);
/* 주의) 동일한 식별자(변수)를 두 번 이상 선언 가능 */


</script>


</body>
</html>
```



## 2. 숫자 자료형

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>
</head>
<body>


<script>
/* 
 
자바스크립트 자료형

- 문자형(String) : "" or '' 로 표기한 문자열. ex) "TEST", 'Hello'
- 숫자형(Number) : 정수, 실수 모두 숫자형으로 취급. ex) 100, 123.45
- 논리형(Boolean) : true or false 두 가지 값만 가지는 자료형.
- null : 유효한 값
- undefined : 값이 할당되지 않은 상태를 의미.
- typeof : 자료형 확인 연산자
- Object : 사용자 정의 객체 자료형
*/


/* 숫자 자료형 */
var x = 3.14;    // A number with decimals
console.log(x);
console.log(typeof x);

var y = 3;       // A number without decimals
console.log(y);
console.log(typeof y);

/* 지수 표현*/
var a = 123e5;	// 12300000
console.log(a);
console.log(typeof a);

var b = 123e-5	// 0.00123
console.log(b);
console.log(typeof b);


/* 주의) 문자, 논리 자료형 등을 숫자 자료형으로 형변환하려면 Number() 함수 사용 */
console.log("100");	// 문자(검정색)
console.log(Number("100"));	// 숫자(파란색)
console.log(parseInt("100^^"));
</script>


</body>
</html>
```



## 3. 논리 자료형

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>
<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>
</head>
<body>


<script>
/* 
 
자바스크립트 자료형

- 문자형(String) : "" or '' 로 표기한 문자열. ex) "TEST", 'Hello'
- 숫자형(Number) : 정수, 실수 모두 숫자형으로 취급. ex) 100, 123.45
- 논리형(Boolean) : true or false 두 가지 값만 가지는 자료형.
- null : 유효한 값
- undefined : 값이 할당되지 않은 상태를 의미.
- typeof : 자료형 확인 연산자
- Object : 사용자 정의 객체 자료형
*/


/* 논리 자료형 */
var x=5;
var y=5;
var z=6;
console.log(x==y);	// true
console.log(x==z);	// false

/* 주의) Boolean() 함수를 이용하면 일반 자료를 논리값으로 변환할 수 있다. */
console.log(Boolean(0));	// false
console.log(Boolean(1));	// true
console.log(Boolean(""));	// false
console.log(Boolean("A"));	// true

</script>


</body>
</html>
```



# 연산자

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>
</head>

<body>

<div id="content">

</div>

<script>
/*
자바 스크립트 연산자

- 산술, 관계(비교), 논리, 문자열, 자료형 연산자
- 산술 연산자 종류
+	Addition
-	Subtraction
*	Multiplication
/	Division
%	Modulus (Remainder)
++	Increment
--	Decrement



- 대입(할당) 연산자
=	
+=	
-=	
*=	
/=	
%=
	
	
	
- 문자열 결합 연산자
+
+=
	
	
	
- 관계(비교) 연산자
==	equal to
===	equal value and equal type
!=	not equal
!==	not equal value or not equal type
>	greater than
<	less than
>=	greater than or equal to
<=	less than or equal to
?	ternary operator


		
- 논리 연산자
&&	logical and
||	logical or
!	logical not



- 자료형 연산자
typeof 자료
instanceof
*/
 
/* 문자열 결합 연산자 */
var txt1 = "What a very ";
txt1 += "nice day";
console.log(txt1);


/* 관계(비교) 연산자 */
var x = 10;
var y = "10";
console.log(x==y);
console.log(x===y);


/* 자료형 연산자 */
var a;
console.log(typeof a);
var a = 10;
console.log(typeof a);
var a = "10";
console.log(typeof a);
var a = true;
console.log(typeof a);


</script>
</body>

</html>
```



# 제어문, 반복문

## 1. for문/if문

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>
</script>
</head>

<body>

<div id="content">
	<h1>자바스크립트 제어문(반복문)</h1>
	<p id="demo">결과 출력 에정</p>
</div>

<script>
/*
자바 스크립트 제어문(반복문)
- if, else, eifsleif, switch, for, for/in, while 구문


- if 구문 형식
if (condition) {
    block of code to be executed if the condition is true
}


- else 구문 형식
if (condition) {
    block of code to be executed if the condition is true
} else { 
    block of code to be executed if the condition is false
} 


- else if 구문 형식
if (condition1) {
    block of code to be executed if condition1 is true
} else if (condition2) {
    block of code to be executed if the condition1 is false and condition2 is true
} else {
    block of code to be executed if the condition1 is false and condition2 is false
}


- switch 구문 형식
switch(expression) {
case n:
    code block
    break;
case n:
    code block
    break;
default:
    code block
}


- for 구문 형식
for (statement 1; statement 2; statement 3) {
    code block to be executed
}
Statement 1 is executed before the loop (the code block) starts.
Statement 2 defines the condition for running the loop (the code block).
Statement 3 is executed each time after the loop (the code block) has been executed.


- for/in 구문 형식
for (변수 in 객체or배열) {
    code block to be executed
}

- while 구문 형식
while (condition) {
    code block to be executed
}
*/

/*for 구문*/
var i=0;
var text="";
for (i=0; i<=100; ++i) {
	if (i%7==0 && i%5==0) {
		/* text += "<font color='Gold'>" + i + "</font><br>"; */
		text += "<span style='color:Gold'>" + i + "</span><br>";
	} else if (i%7==0) {
		text += "<span style='color:DodgerBlue'>" + i + "</span><br>";
	} else if (i%5==0) {
		text += "<span style='color:FireBrick'>" + i + "</span><br>";
	} else {
		text += "<span>" + i + "</span><br>";
	}
}

document.getElementById("demo").innerHTML = text;
</script>
</body>
</html>
```



## 2. for in문

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>
</script>
</head>

<body>

<div id="content">
	<h1>자바스크립트 제어문(반복문)</h1>
	<p id="demo">결과 출력 에정</p>
</div>

<script>
/*
자바 스크립트 제어문(반복문)
- if, else, eifsleif, switch, for, for/in, while 구문


- if 구문 형식
if (condition) {
    block of code to be executed if the condition is true
}


- else 구문 형식
if (condition) {
    block of code to be executed if the condition is true
} else { 
    block of code to be executed if the condition is false
} 


- else if 구문 형식
if (condition1) {
    block of code to be executed if condition1 is true
} else if (condition2) {
    block of code to be executed if the condition1 is false and condition2 is true
} else {
    block of code to be executed if the condition1 is false and condition2 is false
}


- switch 구문 형식
switch(expression) {
case n:
    code block
    break;
case n:
    code block
    break;
default:
    code block
}


- for 구문 형식
for (statement 1; statement 2; statement 3) {
    code block to be executed
}
Statement 1 is executed before the loop (the code block) starts.
Statement 2 defines the condition for running the loop (the code block).
Statement 3 is executed each time after the loop (the code block) has been executed.


- for/in 구문 형식
for (변수 in 객체or배열) {
    code block to be executed
}

- while 구문 형식
while (condition) {
    code block to be executed
}
*/

/*for/in 구문*/
var person = {fname:"John", lname:"Doe", age:25}; 

var text = "";
var x;
for (x in person) {
    text += person[x] + "<br>";
}

document.getElementById("demo").innerHTML = text;
</script>
</body>
</html>
```



## 3. for문을 이용한 테이블 생성

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>
div#content{
	width: 1080px;
	margin: auto;
}


table#t01 {
	border-collapse: collapse;
	width: 100%;
}

table#t01 td, table#t01 th {
	border: 1px solid #ddd;
	padding: 8px;
}

table#t01 tr:nth-child(odd) {
	background-color: #f2f2f2;
}

table#t01 th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>

<script>
</script>
</head>

<body>

<div id="content">
	<h1>자바스크립트 제어문(반복문)</h1>
	<p id="demo">결과 출력 에정</p>
</div>

<script>
/*
자바 스크립트 제어문(반복문)
- if, else, eifsleif, switch, for, for/in, while 구문


- if 구문 형식
if (condition) {
    block of code to be executed if the condition is true
}


- else 구문 형식
if (condition) {
    block of code to be executed if the condition is true
} else { 
    block of code to be executed if the condition is false
} 


- else if 구문 형식
if (condition1) {
    block of code to be executed if condition1 is true
} else if (condition2) {
    block of code to be executed if the condition1 is false and condition2 is true
} else {
    block of code to be executed if the condition1 is false and condition2 is false
}


- switch 구문 형식
switch(expression) {
case n:
    code block
    break;
case n:
    code block
    break;
default:
    code block
}


- for 구문 형식
for (statement 1; statement 2; statement 3) {
    code block to be executed
}
Statement 1 is executed before the loop (the code block) starts.
Statement 2 defines the condition for running the loop (the code block).
Statement 3 is executed each time after the loop (the code block) has been executed.


- for/in 구문 형식
for (변수 in 객체or배열) {
    code block to be executed
}

- while 구문 형식
while (condition) {
    code block to be executed
}
*/

/*for 구문*/
var i, j = 0;
var count = 0;
var text = "<table id='t01'>";
for (i = 0; i < 10; ++i) {
    text += "<tr>";
    for(j = 0; j<10; ++j) {
    	text += "<td>" + (++count) + "</td>"; 
    }
    text += "</tr>";
}
text += "</table>";



document.getElementById("demo").innerHTML = text;
</script>
</body>
</html>
```



# 내장객체

## 1. 날짜 정보 객체

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>
</head>

<body>

<div id="content">
	<h1>날짜출력</h1>
	<p id="demo">결과출력</p>
</div>

<script>
/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM()은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. ex) 창 열기, 창 닫기
- DOM()은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. ex) 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

날짜 정보 객체
- Date 객체를 이용해서 년, 월, 일, 시, 분, 초 정보를 얻을 수 있다.
- 메소드 종류
getDate()	Get the day as a number (1-31)
getDay()	Get the weekday as a number (0-6)
getFullYear()	Get the four digit year (yyyy)
getHours()	Get the hour (0-23)
getMilliseconds()	Get the milliseconds (0-999)
getMinutes()	Get the minutes (0-59)
getMonth()	Get the month (0-11)
getSeconds()	Get the seconds (0-59)
getTime()	Get the time (milliseconds since January 1, 1970)
setDate()	Set the day as a number (1-31)
setFullYear()	Set the year (optionally month and day)
setHours()	Set the hour (0-23)
setMilliseconds()	Set the milliseconds (0-999)
setMinutes()	Set the minutes (0-59)
setMonth()	Set the month (0-11)
setSeconds()	Set the seconds (0-59)
setTime()	Set the time (milliseconds since January 1, 1970)
*/


/* 현재 날짜 및 시간 정보 */
/* document.getElementById("demo").innerHTML = new Date(); */
document.getElementById("demo").innerHTML = Date();

/* 현재 날짜 및 시간 정보 */
var d = new Date();
var text = "";
text += "년: " + d.getFullYear() + "<br>";
text += "월: " + (d.getMonth()+1) + "<br>";		// Month는 0부터 출발
text += "일: " + d.getDate() + "<br>";
document.getElementById("demo").innerHTML = text;

</script>
</body>

</html>
```



## 2. 숫자 정보 객체

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>
div#content{
	width: 1080px;
	margin: auto;
}
</style>

<script>

</script>
</head>

<body>

<div id="content">
	<h1>숫자출력</h1>
	<p id="demo">결과출력</p>
</div>

<script>
/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM()은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. ex) 창 열기, 창 닫기
- DOM()은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. ex) 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

숫자 정보 객체
- 숫자 정보 객체를 이용해서 숫자 정보를 얻을 수 있다.
- 숫자 관련 키워드 NaN(Not a Number), Infinity
- 메소드 종류
toString()
toString(진수)
Number()	Returns a number, converted from its argument.
parseFloat()	Parses its argument and returns a floating point number
parseInt()	Parses its argument and returns an integer
*/

var x = 100 / 10 ;
console.log(x);

x = 100 / "10";
console.log(x);

x = 100 / "a";
console.log(x);

x = 100 / 0 ;
console.log(x);

x = 255 ;
console.log(x.toString());
console.log(x + "의 16진수: " + x.toString(16));
console.log(x + "의 2진수: " + x.toString(2));

x = "123.45";
console.log(Number(x));
console.log(parseFloat(x));
console.log(parseInt(x));

x = "100px";
console.log(x + 100);
console.log(parseInt(x) + 100);
</script>
</body>

</html>
```



## 3. 수학 객체

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 수학 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체


수학 객체
- Math 객체를 이용해서 수학적 연산에 필요한 메소드를 사용할 수 있다.
- 예를 들어, 난수 발생시 Math.random() 메소드 사용.
- Math 객체의 대표적인 상수로 Math.PI가 있다.

*/


/* 특정 범위(0~100)의 난수 발생 */

console.log(Math.random());

for (var a=0; a<10; ++a) {
	console.log(Math.floor(Math.random()*101));
}


</script>
</body>
</html>
```



## 4. 배열 객체

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 배열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체


배열 객체
- 여러개의 자료(값)을 한꺼번에 저장할 수 있는 자료형 객체
- 배열의 크기는 자동 관리된다. Java의 ArrayList 컬렉션과 비슷한 기능.
- 배열 선언
var 변수 = new Array();
변수[0] = 값;
변수[1] = 값;
...
변수[n] = 값;
-주의) 빈 배열 객체 생성시 var 변수 = []; 표현 권장.

*/

//var array = new Array();
var array = [];
array[0] = "TEST";
array[1] = "SAMPLE";
array[2] = "JAVASCRIPT";
array[3] = "HTML/CSS";

console.log(array);

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 배열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체


배열 객체
- 여러개의 자료(값)을 한꺼번에 저장할 수 있는 자료형 객체
- 배열의 크기는 자동 관리된다. Java의 ArrayList 컬렉션과 비슷한 기능.
- 초기값 지정된 배열 선언
var 변수 = new Array(값1, 값2, ..., 값n);
-주의) 배열 객체 생성시 var 변수 = [값1, 값2, ..., 값n]; 표현 권장.

*/

//var array = new Array("TEST","SAMPLE","JAVASCRIPT","HTML/CSS");
var array = ["TEST","SAMPLE","JAVASCRIPT","HTML/CSS"];

console.log(array);

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 배열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체


배열 객체
- 여러개의 자료(값)을 한꺼번에 저장할 수 있는 자료형 객체
- 배열의 크기는 자동 관리된다. Java의 ArrayList 컬렉션과 비슷한 기능.
- 배열 요소 탐색은 인덱스 사용. 인덱스는 0부터 시작된다.
- 배열 요소 갯수 확인은 length 프로퍼티 사용.

*/

var array = ["TEST","SAMPLE","JAVASCRIPT","HTML/CSS"];

console.log(array.length);
console.log(array[0]);
console.log(array[1]);
console.log(array[2]);
console.log(array[3]);

/* 일반 for문 이용한 배열 요소 탐색 */
var len = array.length;
for (var a=0; a<len; ++a) {
	console.log(array[a]);
}

/* for ~ in을 이용한 배열 요소 탐색 */
for (var a in array) {
	console.log(array[a]);
}

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 배열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체


배열 객체
- 여러개의 자료(값)을 한꺼번에 저장할 수 있는 자료형 객체
- 배열의 크기는 자동 관리된다. Java의 ArrayList 컬렉션과 비슷한 기능.
- 배열 저장소에 저장할 수 있는 자료는 동일한 자료형이 아니어도 된다. 숫자, 문자, 날짜, 객체 등. 다양한 자료형의 객체 저장 가능.

*/

var array = [];
array[0] = [1, 2, 3, 4];
array[1] = ["TEST","SAMPLE","JAVASCRIPT","HTML/CSS"];

console.log(array);
console.log(array[0]);
console.log(array[1]);
 
</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 배열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체


배열의 메소드
concat()	Joins two or more arrays, and returns a copy of the joined arrays
copyWithin()	Copies array elements within the array, to and from specified positions
entries()	Returns a key/value pair Array Iteration Object
every()	Checks if every element in an array pass a test
fill()	Fill the elements in an array with a static value
filter()	Creates a new array with every element in an array that pass a test
find()	Returns the value of the first element in an array that pass a test
findIndex()	Returns the index of the first element in an array that pass a test
forEach()	Calls a function for each array element
from()	Creates an array from an object
includes()	Check if an array contains the specified element
indexOf()	Search the array for an element and returns its position
isArray()	Checks whether an object is an array
join()	Joins all elements of an array into a string
keys()	Returns a Array Iteration Object, containing the keys of the original array
lastIndexOf()	Search the array for an element, starting at the end, and returns its position
map()	Creates a new array with the result of calling a function for each array element
pop()	Removes the last element of an array, and returns that element
push()	Adds new elements to the end of an array, and returns the new length
reduce()	Reduce the values of an array to a single value (going left-to-right)
reduceRight()	Reduce the values of an array to a single value (going right-to-left)
reverse()	Reverses the order of the elements in an array
shift()	Removes the first element of an array, and returns that element
slice()	Selects a part of an array, and returns the new array
some()	Checks if any of the elements in an array pass a test
sort()	Sorts the elements of an array
splice()	Adds/Removes elements from an array
toString()	Converts an array to a string, and returns the result
unshift()	Adds new elements to the beginning of an array, and returns the new length
valueOf()	Returns the primitive value of an array

*/

var array = ["TEST","SAMPLE","JAVASCRIPT","HTML/CSS"];

console.log(array);
console.log(array.toString());
console.log(array.join());
console.log(array.join("-"));

console.log("-----------");
var temp1 = array.sort();
console.log(temp1.toString());
var temp2 = array.reverse();
console.log(temp2.toString());

document.getElementById("demo").innerHTML = array.join("<br>");

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 배열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

배열 요소 정렬
- sort(), reverse() 메소드 사용
- 주의)배열의 요소 정렬시 숫자 자료형인 경우 문자형으로 정렬된다.

*/

var array1 = ["TEST","SAMPLE","JAVASCRIPT","HTML/CSS"];
var array2 = [40, 100, 1, 5, 25, 10];

console.log(array1.sort().toString());
console.log(array2.sort().toString());
console.log(array2.sort(function(a, b){return a - b}).toString());


</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 배열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

배열 요소 추가/삭제
- pop(), push(), shift(), unshift(), splice(), slice() 메소드 사용
- The pop() method removes the last element of an array, and returns that element.
- The shift() method removes the first item of an array, and returns that item.
- The splice() method adds/removes items to/from an array, and returns the removed item(s).

- 주의) 배열 요소 출력시 자바스크립트 액션이 모두 실행된 결과가 반영된다. 

*/

var array = ["TEST","SAMPLE","JAVASCRIPT","HTML/CSS"];

var temp1 = array.pop();
console.log(temp1);

var temp2 = array.shift();
console.log(temp2);

var temp3 = array.splice(1, 1);
console.log(temp3);

console.log(array);


</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 배열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

var array = ["SAMPLE","JAVASCRIPT"];

array.unshift("TEST");

array.push("HTML/CSS");

array.splice(2, 0, "JDBC");

var temp = array.slice(1,3);

console.log(array);
console.log(temp);

</script>
</body>
</html>
```



## 5. 문자열 객체

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 문자열 객체</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>

/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

문자열 객체
charAt()	Returns the character at the specified index (position)
charCodeAt()	Returns the Unicode of the character at the specified index
concat()	Joins two or more strings, and returns a new joined strings
endsWith()	Checks whether a string ends with specified string/characters
fromCharCode()	Converts Unicode values to characters
includes()	Checks whether a string contains the specified string/characters
indexOf()	Returns the position of the first found occurrence of a specified value in a string
lastIndexOf()	Returns the position of the last found occurrence of a specified value in a string
localeCompare()	Compares two strings in the current locale
match()	Searches a string for a match against a regular expression, and returns the matches
repeat()	Returns a new string with a specified number of copies of an existing string
replace()	Searches a string for a specified value, or a regular expression, and returns a new string where the specified values are replaced
search()	Searches a string for a specified value, or regular expression, and returns the position of the match
slice()	Extracts a part of a string and returns a new string
split()	Splits a string into an array of substrings
startsWith()	Checks whether a string begins with specified characters
substr()	Extracts the characters from a string, beginning at a specified start position, and through the specified number of character
substring()	Extracts the characters from a string, between two specified indices
toLocaleLowerCase()	Converts a string to lowercase letters, according to the host's locale
toLocaleUpperCase()	Converts a string to uppercase letters, according to the host's locale
toLowerCase()	Converts a string to lowercase letters
toString()	Returns the value of a String object
toUpperCase()	Converts a string to uppercase letters
trim()	Removes whitespace from both ends of a string
valueOf()	Returns the primitive value of a String object

- 주의) 문자열 탐색시 대소문자 구분한다. 정규표현식을 사용하면 대소문자 구분없이 탐색 가능.

*/

var txt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var sln = txt.length;
console.log(sln);

var str = "Please locate where 'locate' occurs!";
var pos = str.indexOf("locate");
console.log(pos);

var str = "Please locate where 'locate' occurs!";
var pos = str.indexOf("LOCATE");
console.log(pos);

var str = "Please locate where 'locate' occurs!";
var pos = str.indexOf("locate",15);
console.log(pos);

var str = "Please locate where 'locate' occurs!";
var pos = str.search("locate");
console.log(pos);

var str = "Please locate where 'locate' occurs!";
var pos = str.search(/LOCATE/i);
console.log(pos);

var str = "Apple, Banana, Kiwi";
var res = str.substring(7, 13);
console.log(res);

var str = "Apple, Banana, Kiwi";
var res = str.substr(7, 6);
console.log(res);

var str = "HELLO WORLD";
console.log(str.charAt(0));
console.log(str.charAt(1));

var str = "HELLO WORLD";
console.log(str.charCodeAt(0));
console.log(str.charCodeAt(1));

var str = "HELLO WORLD";
var temp = str.split(" ");
console.log(temp);


</script>
</body>
</html>
```



## 6. 정규표현식

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>

<div id="content">


</div>
<script>
/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체


정규표현식 객체
- 문자열 검색, 치환 시 사용하는 검색 패턴.
- 형식
/pattern/modifiers;
- search(), replace(), test(), exec() 메소드 사용 가능 
- modifiers 종류
i	Perform case-insensitive matching
g	Perform a global match (find all matches rather than stopping after the first match)
m	Perform multiline matching
- 정규표현식 패턴
[abc]	Find any of the characters between the brackets
[0-9]	Find any of the digits between the brackets
(x|y)	Find any of the alternatives separated with |
\d	Find a digit
\s	Find a whitespace character
\b	Find a match at the beginning or at the end of a word
\uxxxx	Find the Unicode character specified by the hexadecimal number xxxx
n+	Matches any string that contains at least one n
n*	Matches any string that contains zero or more occurrences of n
n?	Matches any string that contains zero or one occurrences of n
*/

/* search() */
var str = "Visit W3Schools";
var n = str.search("w3schools");
console.log(n);

var str = "Visit W3Schools";
var n = str.search(/w3schools/i);
console.log(n);


/* replace() */
var str = "Visit Microsoft!";
var res = str.replace("microsoft", "W3Schools");
console.log(res);

var str = "Visit Microsoft!";
var res = str.replace(/microsoft/i, "W3Schools");
console.log(res);


/* test(), exec() */
/* 검색 결과가 있을 때 */
var res = /best/.test("The best things in life are free!");
console.log(res);

var res = /best/.exec("The best things in life are free!");
console.log(res);


/* 검색 결과가 없을 때 */
var res = /abc/.test("The best things in life are free!");
console.log(res);

var res = /abc/.exec("The best things in life are free!");
console.log(res);


/* 010-XXXX-XXXX */
var phone = "010-1234-5678";
var pat = /010-\d{4}-\d{4}/;
var res = pat.test(phone);
console.log(res);

var phone = "010-123-5678";
var pat = /010-\d{4}-\d{4}/;
var res = pat.test(phone);
console.log(res);

</script>
</body>
</html>
```



## 7. BOM (Browser Object Model)

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>

<div id="content">


</div>
<script>
/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체


BOM(Browser Object Model)
- 자바스크립트가 실행되고 있는 브라우저 자신을 객체로 인식.
- document 객체는 브라우저에서 실행되고 있는 웹페이지 객체. window.document 또는 document로 표기.

- Window Object Properties
closed	Returns a Boolean value indicating whether a window has been closed or not
console	Returns a reference to the Console object, which provides methods for logging information to the browser's console (See Console object)
defaultStatus	Sets or returns the default text in the statusbar of a window
document	Returns the Document object for the window (See Document object)
frameElement	Returns the <iframe> element in which the current window is inserted
frames	Returns all <iframe> elements in the current window
history	Returns the History object for the window (See History object)
innerHeight	Returns the inner height of a window's content area
innerWidth	Returns the inner width of a window's content area
length	Returns the number of <iframe> elements in the current window
localStorage	Allows to save key/value pairs in a web browser. Stores the data with no expiration date
location	Returns the Location object for the window (See Location object)
name	Sets or returns the name of a window
navigator	Returns the Navigator object for the window (See Navigator object)
opener	Returns a reference to the window that created the window
outerHeight	Returns the outer height of a window, including toolbars/scrollbars
outerWidth	Returns the outer width of a window, including toolbars/scrollbars
pageXOffset	Returns the pixels the current document has been scrolled (horizontally) from the upper left corner of the window
pageYOffset	Returns the pixels the current document has been scrolled (vertically) from the upper left corner of the window
parent	Returns the parent window of the current window
screen	Returns the Screen object for the window (See Screen object)
screenLeft	Returns the horizontal coordinate of the window relative to the screen
screenTop	Returns the vertical coordinate of the window relative to the screen
screenX	Returns the horizontal coordinate of the window relative to the screen
screenY	Returns the vertical coordinate of the window relative to the screen
sessionStorage	Allows to save key/value pairs in a web browser. Stores the data for one session
scrollX	An alias of pageXOffset
scrollY	An alias of pageYOffset
self	Returns the current window
status	Sets or returns the text in the statusbar of a window
top	Returns the topmost browser window


- Window Object Methods
alert()	Displays an alert box with a message and an OK button
atob()	Decodes a base-64 encoded string
blur()	Removes focus from the current window
btoa()	Encodes a string in base-64
clearInterval()	Clears a timer set with setInterval()
clearTimeout()	Clears a timer set with setTimeout()
close()	Closes the current window
confirm()	Displays a dialog box with a message and an OK and a Cancel button
focus()	Sets focus to the current window
getComputedStyle()	Gets the current computed CSS styles applied to an element
getSelection()	Returns a Selection object representing the range of text selected by the user
matchMedia()	Returns a MediaQueryList object representing the specified CSS media query string
moveBy()	Moves a window relative to its current position
moveTo()	Moves a window to the specified position
open()	Opens a new browser window
print()	Prints the content of the current window
prompt()	Displays a dialog box that prompts the visitor for input
resizeBy()	Resizes the window by the specified pixels
resizeTo()	Resizes the window to the specified width and height
scroll()	Deprecated. This method has been replaced by the scrollTo() method.
scrollBy()	Scrolls the document by the specified number of pixels
scrollTo()	Scrolls the document to the specified coordinates
setInterval()	Calls a function or evaluates an expression at specified intervals (in milliseconds)
setTimeout()	Calls a function or evaluates an expression after a specified number of milliseconds
stop()	Stops the window from loading
*/


var w = window.innerWidth;
var h = window.innerHeight;
console.log(w);
console.log(h);
</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 BOM(Browser Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>


var myWindow = window.open("", "popup", "width=400, height=500");
myWindow.document.write("<h1>Hello, World!</h1>");

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 BOM(Browser Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>


/* window.alert("간단한 메시지 출력"); */
alert("간단한 메시지 출력");
/* 주의) 확인 버튼이 클릭되어야 다음 액션 진행 가능 */


</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 BOM(Browser Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
	<button onclick="myFunction()">Try it</button>
</div>

<script>


function myFunction()  {
	/* window.alert("간단한 메시지 출력"); */
	alert("간단한 메시지 출력");
	/* 주의) 확인 버튼이 클릭되어야 다음 액션 진행 가능 */
}

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 BOM(Browser Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
	<button onclick="myFunction()">Try it</button>
</div>

<script>

/* window.confirm("간단한 메시지 출력 및 확인 요청"); */
confirm("간단한 메시지 출력 및 확인 요청");
/* 주의) Ok, Cancel 버튼이 클릭되어야 다음 액션 진행 가능 */
	if (res) {
		// Ok 버튼 클릭시 액션 진행 코드 작성
	} else {
		// Cancel 버튼 클릭시 액션 진행 코드 작성
	}
</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
	<h1>자바스크립트 BOM(Browser Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
	<button onclick="myFunction()">Try it</button>
</div>

<script>


/* window.prompt("간단한 메시지 출력 및 외부 입력 처리"); */
var res = prompt("간단한 메시지 출력 및 외부 입력 처리","");
/* 주의) Ok, Cancel 버튼이 클릭되어야 다음 액션 진행 가능 */
console.log(res);

if(res) {
	/* 주의) 입력값이 존재하는 경우 */
	console.log("확인 버튼 클릭!");
} else {
	/* 주의) 입력값이 없는 경우, null 반환 */
	console.log("취소 버튼 클릭!");	
}
</script>
</body>
</html>



```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script>

</script>
</head>
<body>

<div id="content">
		<p>A script on this page starts this clock:</p>
		<p id="demo"></p>
		<button onclick="myStopFunction()">Stop time</button>
</div>

<script>


var myVar = setInterval(myTimer, 1000);

function myTimer() {
    var d = new Date();
    var t = d.toLocaleTimeString();
    document.getElementById("demo").innerHTML = t;
}

function myStopFunction() {
	clearInterval(myVar);
}
</script>
</body>
</html>



```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>

<div id="content">

</div>

<script>
/*
자바스크립트 내장객체

- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

BOM(Browser Object Model)
- 자바스크립트가 실행되고 있는 브라우저 자신을 객체로 인식.
- window 객체는 BOM에서 최상위 객체. 표기시 생략 가능.
- document 객체는 브라우저에서 실행되고 있는 웹페이지 객체. window.document 또는 document 로 표기.

JavaScript Cookies
- 브라우저에서 사용자 정보를 저장하기 위해서 만든 전용 저장소
- 작은 양의 정보를 일정 기간 동안 저장 가능.
- 주의) 보안 문제 때문에 쿠키 허용하지 않는 경우가 있다.
- 형식
key = value; key = value; key = value; ....
- document.cookie(window.document.cookie) property를 사용해서 쿠키 생성 및 쿠키 정보 읽어내기 가능.
- 유효기간 지정이 없으면 브라우저 종료시 쿠키 정보가 자동 삭제된다.
*/

/* Create a Cookie with JavaScript */
document.cookie = "username=John Doe";

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>

<div id="content">

</div>

<script>

/* Read a Cookie with JavaScript */
var x = document.cookie;
console.log(x);

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>

<div id="content">
	<h1>자바스크립트 BOM(Browser Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
	<button onclick="setCookie('username', 'John Smith', 1)">쿠키 생성 테스트</button>
</div>

<script>
/* A Function to Set a Cookie */
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

<script src="util.js"></script>

</head>
<body>

<div id="content">
	<h1>자바스크립트 BOM(Browser Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
	<button onclick="myFunction('username')">쿠키 정보 읽기 테스트</button>
</div>

<script>


/* Read a Cookie with JavaScript */
function myFunction(cname) {
	/* util.js */
	var x = getCookie(cname);
	document.getElementById("demo").innerHTML = x;
}


</script>
</body>
</html>
```

```js
/* util.js / 0.01 */

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {	// 공백 섞인 경우 공백 제거
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {		// "cname=cvalue"부분인 경우
            return c.substring(name.length, c.length);	// cvalue 값을 얻어온다.
        }
    }
    return "";
}

```



## 8. DOM (Document Object Model)

### 1) 엘리먼트 탐색 메소드(직접 선택자)

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>


<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>

<div id="content">
	<h1>자바스크립트 DOM(Document Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
	<p id="demo">결과 출력 예정</p>
	<p id="demo">결과 출력 예정</p>
</div>

<script>
/*
자바스크립트 내장객체
- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

DOM(Document Object Model)
- 웹페이지를 객체로 인식한다. 엘리먼트, 속성, 콘텐츠 모두가 객체가 된다.
- 특정 객체를 찾는 탐색 과정이 필요하다. 엘리먼트 이름 기준, id 식별자(속성) 기준, name 식별자(속성) 기준, class 식별자(속성) 기준

엘리먼트 탐색 메소드(직접 선택자)
1. document.getElementById(id)	Find an element by element id
2. document.getElementsByTagName(name)	Find elements by tag name
3. document.getElementsByClassName(name)	Find elements by class name
4. document.getElementsByName(name)
5. document.querySelectorAll("CSS selectors")
*/

/* id="demo" 식별자를 가진 엘리먼트 탐색*/
/* innerHTML 프로퍼티는 엘리먼트의 콘텐츠에 대한 정보 제공(get) 및 설정(set) */
/* 주의) id="demo" 식별자를 가진 첫 번째 엘리먼트만 탐색된다. */
document.getElementById("demo").innerHTML = "Hello, World!";

/* #demo {color:skyblue} */
document.getElementById("demo").style.color = "skyblue";



</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>


<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>

<div id="content">
	<h1>자바스크립트 DOM(Document Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
	<p id="demo">결과 출력 예정</p>
	<p id="demo">결과 출력 예정</p>
</div>

<script>
/*
엘리먼트 탐색 메소드(직접 선택자)
1. document.getElementById(id)	Find an element by element id
2. document.getElementsByTagName(name)	Find elements by tag name
3. document.getElementsByClassName(name)	Find elements by class name
4. document.getElementsByName(name)
5. document.querySelectorAll("CSS selectors")
*/

/* <p> 식별자를 가진 엘리먼트 탐색*/
/* innerHTML 프로퍼티는 엘리먼트의 콘텐츠에 대한 정보 제공(get) 및 설정(set) */
/* 주의) <p> 엘리먼트가 여러개인 경우 모두 탐색된다. */
/* 주의) 여러개의 객체를 반환 받은 경우 특정 객체(인덱스)만을 대상으로 액션 실행. */
 
/* document.getElementByTagName("p").innerHTML = "Hello, World!"  -->  X  */
/*document.getElementByTagName("p").style.color = "skyblue"  -->  X  */
var pList = document.getElementsByTagName("p");
var pListLen = pList.length;
for(var a=0; a<pListLen; ++a){
	pList[a].innerHTML = "Hello, World!";
	pList[a].style.color = "skyblue"
}



</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>


<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>

<div id="content">
	<h1>자바스크립트 DOM(Document Object Model)</h1>
	<p class="demo">결과 출력 예정</p>
	<p class="demo">결과 출력 예정</p>
	<p class="demo">결과 출력 예정</p>
</div>

<script>
/*
엘리먼트 탐색 메소드(직접 선택자)
1. document.getElementById(id)	Find an element by element id
2. document.getElementsByTagName(name)	Find elements by tag name
3. document.getElementsByClassName(name)	Find elements by class name
4. document.getElementsByName(name)
5. document.querySelectorAll("CSS selectors")
*/

/* class="demo" 식별자를 가진 엘리먼트 탐색 */
/* innerHTML 프로퍼티는 엘리먼트의 콘텐츠에 대한 정보 제공(get) 및 설정(set) */
/* 주의) class="demo" 식별자를 가진 엘리먼트가 여러개인 경우 모두 탐색된다. */
/* 주의) 여러개의 객체를 반환 받은 경우 특정 객체(인덱스)만을 대상으로 액션 실행. */
 
/* document.getElementByClassName("demo").innerHTML = "Hello, World!"  -->  X  */
/* document.getElementByClassName("demo").style.color = "skyblue"  -->  X  */

var pList = document.getElementsByClassName("demo");
var pListLen = pList.length;
for(var a=0; a<pListLen; ++a){
	pList[a].innerHTML = "Hello, World!";
	pList[a].style.color = "skyblue"
}
</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>


<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>
	<div id="content">
		<h1>자바스크립트 DOM(Documnet Object Model)</h1>
		<!-- <form> -->
		
		<div>Cats:  <input name="animal" type="checkbox" value="Cats"></div>
		<div>Dogs:  <input name="animal" type="checkbox" value="Dogs"></div>
		<div>Horses:  <input name="animal" type="checkbox" value="Horses"></div>
		<div>Pigs:  <input name="animal" type="checkbox" value="Pigs"></div>
		<div>Cows:  <input name="animal" type="checkbox" value="Cows"></div>
		
		<p>Click the button to check all checkboxes that have a name attribute with the value "animal".</p>
		
		<button onclick="myFunction()">Try it</button>
		<!-- </form> -->
	</div>
<script>
/*
자바스크립트 내장객체
- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

DOM(Document Object Model)
- 웹페이지를 객체로 인식한다. 엘리먼트, 속성, 콘텐츠 모두가 객체가 된다.
- 특정 객체를 찾는 탐색 과정이 필요하다. 엘리먼트 이름 기준, id 식별자(속성) 기준, name 식별자(속성) 기준, class 식별자(속성) 기준

엘리먼트 탐색 메소드(직접 선택자)
1. document.getElementById(id)	Find an element by element id
2. document.getElementsByTagName(name)	Find elements by tag name
3. document.getElementsByClassName(name)	Find elements by class name
4. document.getElementsByName(name)
5. document.querySelectorAll("CSS selectors")
*/

/* name="animal" 식별자를 가진 엘리먼트 탐색 */
/* checked 프로퍼티는 체크박스 엘리먼트에 대한 상태 정보 제공(get) 및 설정(set) */
/* 주의) name="animal" 식별자를 가진 엘리먼트가 여러개인 경우 모두 탐색된다. */
/* 주의) 여러개의 객체를 반환 받은 경우 특정 객체(인덱스)만을 대상으로 액션 실행. */
/* 주의) name="" 식별자는 form 엘리먼트에서 사용한다. */

function myFunction() {
    var x = document.getElementsByName("animal");
    var i;
    for (i = 0; i < x.length; i++) {
        if (x[i].type == "checkbox") {
            x[i].checked = true;
        }
    }
}
</script>
</body>
</html>
```

```javascript
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiyoung's Test</title>


<style>

div#content {
	width: 1080px;
	margin: auto;
}

</style>

</head>
<body>
	<div id="content" class="demo">
		<h1>자바스크립트 DOM(Documnet Object Model)</h1>

		<p>결과 출력 예정</p>
		<p class="demo">결과 출력 예정</p>
		<p class="demo">결과 출력 예정</p>
	</div>
<script>
/*
엘리먼트 탐색 메소드(직접 선택자)
1. document.getElementById(id)	Find an element by element id
2. document.getElementsByTagName(name)	Find elements by tag name
3. document.getElementsByClassName(name)	Find elements by class name
4. document.getElementsByName(name)
5. document.querySelectorAll("CSS selectors")
*/

/* CSS 선택자 조건을 만족하는 엘리먼트 탐색 */
/* innerHTML 프로퍼티는 엘리먼트의 콘텐츠에 대한 정보 제공(get) 및 설정(set) */
/* 주의) CSS 선택자 조건을 만족하는 엘리먼트가 여러개인 경우 */
/* 주의) 여러개의 객체를 반환 받은 경우 특정 객체(인덱스)만을 대상으로 액션 실행. */

var pList = document.querySelectorAll("p.demo");
var pListLen = pList.length;
for(var a=0; a<pListLen; ++a){
	pList[a].innerHTML = "Hello, World!";
	pList[a].style.color = "skyblue"
}

</script>
</body>
</html>
```

