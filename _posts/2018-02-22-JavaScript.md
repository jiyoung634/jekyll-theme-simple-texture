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

### 1) 엘리먼트 탐색 methods(직접 선택자)

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



### 2)  Document Object Properties and Methods

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

<Document Object Properties and Methods>
document.activeElement	Returns the currently focused element in the document
document.addEventListener()	Attaches an event handler to the document
document.adoptNode()	Adopts a node from another document
document.anchors	Returns a collection of all <a> elements in the document that have a name attribute
document.applets	Returns a collection of all <applet> elements in the document
document.baseURI	Returns the absolute base URI of a document
document.body	Sets or returns the document's body (the <body> element)
document.close()	Closes the output stream previously opened with document.open()
document.cookie	Returns all name/value pairs of cookies in the document
document.charset	Deprecated. Use document.characterSet instead. Returns the character encoding for the document
document.characterSet	Returns the character encoding for the document
document.createAttribute()	Creates an attribute node
document.createComment()	Creates a Comment node with the specified text
document.createDocumentFragment()	Creates an empty DocumentFragment node
document.createElement()	Creates an Element node
document.createTextNode()	Creates a Text node
document.defaultView	Returns the window object associated with a document, or null if none is available.
document.designMode	Controls whether the entire document is editable.
document.doctype	Returns the Document Type Declaration associated with the document
document.documentElement	Returns the Document Element of the document (the <html> element)
document.documentMode	Returns the mode used by the browser to render the document
document.documentURI	Sets or returns the location of the document
document.domain	Returns the domain name of the server that loaded the document
document.domConfig	Obsolete. Returns the DOM configuration of the document
document.embeds	Returns a collection of all <embed> elements the document
document.execCommand()	Invokes the specified clipboard operation (cut, copy or paste) on the element currently having focus.
document.forms	Returns a collection of all <form> elements in the document
document.getElementById()	Returns the element that has the ID attribute with the specified value
document.getElementsByClassName()	Returns a NodeList containing all elements with the specified class name
document.getElementsByName()	Returns a NodeList containing all elements with a specified name
document.getElementsByTagName()	Returns a NodeList containing all elements with the specified tag name
document.hasFocus()	Returns a Boolean value indicating whether the document has focus
document.head	Returns the <head> element of the document
document.images	Returns a collection of all <img> elements in the document
document.implementation	Returns the DOMImplementation object that handles this document
document.importNode()	Imports a node from another document
document.inputEncoding	Returns the encoding, character set, used for the document
document.lastModified	Returns the date and time the document was last modified
document.links	Returns a collection of all <a> and <area> elements in the document that have a href attribute
document.normalize()	Removes empty Text nodes, and joins adjacent nodes
document.normalizeDocument()	Removes empty Text nodes, and joins adjacent nodes
document.open()	Opens an HTML output stream to collect output from document.write()
document.querySelector()	Returns the first element that matches a specified CSS selector(s) in the document
document.querySelectorAll()	Returns a static NodeList containing all elements that matches a specified CSS selector(s) in the document
document.readyState	Returns the (loading) status of the document
document.referrer	Returns the URL of the document that loaded the current document
document.removeEventListener()	Removes an event handler from the document (that has been attached with the addEventListener() method)
document.renameNode()	Renames the specified node
document.scripts	Returns a collection of <script> elements in the document
document.strictErrorChecking	Sets or returns whether error-checking is enforced or not
document.title	Sets or returns the title of the document
document.URL	Returns the full URL of the HTML document
document.write()	Writes HTML expressions or JavaScript code to a document
document.writeln()
 */

/* Create an HTML element */
/* 주의) 동적 생성된 엘리먼트 객체를 기존에 존재하는 엘리먼트의 자식으로 등록하지 않으면 웹페이지에 보이지 않게 된다.*/
var btn = document.createElement("BUTTON");        // Create a <button> element
var t = document.createTextNode("CLICK ME");       // Create a text node
btn.appendChild(t);                                // Append the text to <button>.  <button>CLICK ME</button>
// document.body.appendChild(btn);                 // Append <button> to <body>.	<body>...<button>CLICK ME</button>...</body>

var pnode = document.getElementById("content");
pnode.appendChild(btn);
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
	</div>
<script>

/* Write into the HTML output stream */
/* write(), writeln() 메소드 사용 */

var popup = window.open("","popup","width=300, height=400");
popup.document.writeln("<div>");
popup.document.writeln("<button>Click Me</button>");
popup.document.writeln("</div>");

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
		<button onclick="myFunction('White')">White</button>
		<button onclick="myFunction('AntiqueWhite')">AntiqueWhite</button>
		<button onclick="myFunction('HoneyDew')">HoneyDew</button>
		<button onclick="myFunction('Lavender')">Lavender</button>
		<button onclick="myFunction('Thistle')">Thistle</button>
		<button onclick="myFunction('Wheat')">Wheat</button>
	</div>
<script>
/* HTML DOM body Property */
/* <body> 엘리먼트 반환하는 속성 */

function myFunction(color){
	/* <body style="background-color:yellow"> */
	document.body.style.backgroundColor = color;
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
<script src="util.js"></script>
</head>
<body>

	<div id="content">
		<h1>자바스크립트 DOM(Document Object Model)</h1>
		<p id="demo">결과 출력 예정</p>
	</div>
<script>
/* Create a Cookie with JavaScript */
/* 쿠키 정보 반환하는 속성 */

/* util.js */

/* 식별자가 고유한 경우만 여러개 항목 저장 가능 */
setCookie("pcode/1001", "", 1);
setCookie("pcode/1002", "", 1);

/* 식별자는 같고, value만 다르면 덮어쓰기 */
setCookie("pcode", "1003", 1);
setCookie("pcode", "1004", 1);

</script>
</body>
</html>
```

```javascript
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
	</div>
<script>
/* HTML DOM documentElement Property */
/* <HTML> 엘리먼트 반환하는 속성 */
/* nodeName 속성은 노드(엘리먼트)의 이름 반환하는 속성 */
/* nodeName, nodeType, nodeValue 속성을 이용해서 노드 분석 */
var x = document.documentElement.nodeName;
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
		<h1>자바스크립트 DOM(Document Object Model)</h1>
		<p id="demo">결과 출력 예정</p>

		<form id="myCarForm">
			Favorite Car: <input type="text" name="fname" value="Volvo">
		</form>

		<form id="myColorForm">
			Favorite Color: <input type="text" name="favcolor" value="Blue">
		</form>

		<p>Click the button to display the id of the first form element
			(index 0) in the document.</p>

		<button onclick="myFunction()">Try it</button>

		<p id="demo"></p>
	</div>
<script>
/* HTML DOM forms Property */
/* <form> 엘리먼트(들) 반환하는 속성 */
/* 컬렉션 반환시 특정 form 객체 탐색을 위해서 인덱스 사용. forms[인덱스], forms.item(인덱스), forms.nameItem("이름인덱스") */
var x = document.forms[0].id;
console.log(x);

var x = document.forms.item(1).id;
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
		<h1>자바스크립트 DOM(Document Object Model)</h1>
		<p id="demo">결과 출력 예정</p>

		<img src="http://211.63.89.71:8090/resources/SampleImages/klematis_small.jpg" alt="klematis" style="width:200px">
		<img src="http://211.63.89.71:8090/resources/SampleImages/klematis2_small.jpg" alt="klematis2" style="width:200px">
		<img src="http://211.63.89.71:8090/resources/SampleImages/klematis3_small.jpg" alt="klematis3" style="width:200px">

		<p id="demo"></p>
	</div>
<script>
/* HTML DOM images Property */
/* <img> 엘리먼트(들) 반환하는 속성 */
/* 컬렉션 반환시 특정 form 객체 탐색을 위해서 인덱스 사용. images[인덱스], images.item(인덱스), images.nameItem("이름인덱스") */
var x = document.images[0].src;
console.log(x);

var imgLen = document.images.length;
for(var a=0; a<imgLen; ++a){
var x = document.images.item(a).src;
console.log(x);
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
		<p id="demo">결과 출력 예정</p>
	</div>
<script>

/* HTML DOM title Property */
/* 현재 웹페이지의 제목 (<title>제목</title>) 반환하는 속성 */

var x = document.title;
console.log(x);
</script>
</body>
</html>
```



### 3) Element Object Properties and Methods

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
<!-- 주의) 노드 탐색을 위해서 <div></div> 안에 자식 엘리먼트 추가시 줄바꿈 처리 삭제할 것 -->
	<div id="content"><h1>자바스크립트 DOM(Document Object Model)</h1><p id="demo">결과 출력 예정</p></div>
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


<Element Object Properties and Methods>
element.accessKey	Sets or returns the accesskey attribute of an element
element.addEventListener()	Attaches an event handler to the specified element
element.appendChild()	Adds a new child node, to an element, as the last child node
element.attributes	Returns a NamedNodeMap of an element's attributes
element.blur()	Removes focus from an element
element.childElementCount	Returns the number of child elements an element has
element.childNodes	Returns a collection of an element's child nodes (including text and comment nodes)
element.children	Returns a collection of an element's child element (excluding text and comment nodes)
element.classList	Returns the class name(s) of an element
element.className	Sets or returns the value of the class attribute of an element
element.click()	Simulates a mouse-click on an element
element.clientHeight	Returns the height of an element, including padding
element.clientLeft	Returns the width of the left border of an element
element.clientTop	Returns the width of the top border of an element
element.clientWidth	Returns the width of an element, including padding
element.cloneNode()	Clones an element
element.compareDocumentPosition()	Compares the document position of two elements
element.contains()	Returns true if a node is a descendant of a node, otherwise false
element.contentEditable	Sets or returns whether the content of an element is editable or not
element.dir	Sets or returns the value of the dir attribute of an element
element.firstChild	Returns the first child node of an element
element.firstElementChild	Returns the first child element of an element
element.focus()	Gives focus to an element
element.get()	Returns the specified attribute value of an element node
element.getAttributeNode()	Returns the specified attribute node
element.getElementsByClassName()	Returns a collection of all child elements with the specified class name
element.getElementsByTagName()	Returns a collection of all child elements with the specified tag name
element.getFeature()	Returns an object which implements the APIs of a specified feature
element.hasAttribute()	Returns true if an element has the specified attribute, otherwise false
element.hasAttributes()	Returns true if an element has any attributes, otherwise false
element.hasChildNodes()	Returns true if an element has any child nodes, otherwise false
element.id	Sets or returns the value of the id attribute of an element
element.innerHTML	Sets or returns the content of an element
element.insertBefore()	Inserts a new child node before a specified, existing, child node
element.isContentEditable	Returns true if the content of an element is editable, otherwise false
element.isDefaultNamespace()	Returns true if a specified namespaceURI is the default, otherwise false
element.isEqualNode()	Checks if two elements are equal
element.isSameNode()	Checks if two elements are the same node
element.isSupported()	Returns true if a specified feature is supported on the element
element.lang	Sets or returns the value of the lang attribute of an element
element.lastChild	Returns the last child node of an element
element.lastElementChild	Returns the last child element of an element
element.namespaceURI	Returns the namespace URI of an element
element.nextSibling	Returns the next node at the same node tree level
element.nextElementSibling	Returns the next element at the same node tree level
element.nodeName	Returns the name of a node
element.nodeType	Returns the node type of a node
element.nodeValue	Sets or returns the value of a node
element.normalize()	Joins adjacent text nodes and removes empty text nodes in an element
element.offsetHeight	Returns the height of an element, including padding, border and scrollbar
element.offsetWidth	Returns the width of an element, including padding, border and scrollbar
element.offsetLeft	Returns the horizontal offset position of an element
element.offsetParent	Returns the offset container of an element
element.offsetTop	Returns the vertical offset position of an element
element.ownerDocument	Returns the root element (document object) for an element
element.parentNode	Returns the parent node of an element
element.parentElement	Returns the parent element node of an element
element.previousSibling	Returns the previous node at the same node tree level
element.previousElementSibling	Returns the previous element at the same node tree level
element.querySelector()	Returns the first child element that matches a specified CSS selector(s) of an element
element.querySelectorAll()	Returns all child elements that matches a specified CSS selector(s) of an element
element.removeAttribute()	Removes a specified attribute from an element
element.removeAttributeNode()	Removes a specified attribute node, and returns the removed node
element.removeChild()	Removes a child node from an element
element.removeEventListener()	Removes an event handler that has been attached with the addEventListener() method
element.replaceChild()	Replaces a child node in an element
element.scrollHeight	Returns the entire height of an element, including padding
element.scrollIntoView()	Scrolls the specified element into the visible area of the browser window
element.scrollLeft	Sets or returns the number of pixels an element's content is scrolled horizontally
element.scrollTop	Sets or returns the number of pixels an element's content is scrolled vertically
element.scrollWidth	Returns the entire width of an element, including padding
element.setAttribute()	Sets or changes the specified attribute, to the specified value
element.setAttributeNode()	Sets or changes the specified attribute node
element.style	Sets or returns the value of the style attribute of an element
element.tabIndex	Sets or returns the value of the tabindex attribute of an element
element.tagName	Returns the tag name of an element
element.textContent	Sets or returns the textual content of a node and its descendants
element.title	Sets or returns the value of the title attribute of an element
element.toString()	Converts an element to a string
 	 
nodelist.item()	Returns the node at the specified index in a NodeList
nodelist.length	Returns the number of nodes in a NodeList
 */

/* DOM Navigation (인접 관계 선택자) 
웹페이지의 엘리먼트가 모두 부모, 자식 관계가 있으므로 관계를 이용해서 탐색하는 방법 
parentNode
childNodes[nodenumber]
firstChild
lastChild
nextSibling
previousSibling
*/

/* <div id="content"> 엘리먼트를 최상위 부모 엘리먼트로 지정 */
var parent = document.querySelector("div#content");

/* 주의) 줄바꿈 문자는 text Node로 처리된다. */
var x = parent.childNodes;
console.log(x);
console.log(x[0].nodeName);
console.log(x.item(0).nodeName);
console.log(parent.firstChild.nodeName);
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
<!-- 주의) 노드 탐색을 위해서 <div></div> 안에 자식 엘리먼트 추가시 줄바꿈 처리 삭제할 것 -->
	<div id="content">
	<h1>자바스크립트 DOM(Document Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
	</div>
<script>
/* DOM Navigation (인접 관계 선택자) 
웹페이지의 엘리먼트가 모두 부모, 자식 관계가 있으므로 관계를 이용해서 탐색하는 방법 
parentNode
childNodes[nodenumber]
firstChild
lastChild
nextSibling
previousSibling
*/

/* <div id="content"> 엘리먼트를 최상위 부모 엘리먼트로 지정 */
var parent = document.querySelector("div#content");

/* children 속성은 자식 '엘리먼트' 노드만 반환하는 속성 */
/* 주의) children 속성은 IE9 이상에서만 사용 가능. text Node는 */
var x = parent.children;
console.log(x);
console.log(x[0].nodeName);
console.log(x.item(0).nodeName);
console.log(parent.firstElementChild.nodeName);
console.log(parent.firstChild.nodeName);
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
<!-- 주의) 노드 탐색을 위해서 <div></div> 안에 자식 엘리먼트 추가시 줄바꿈 처리 삭제할 것 -->
	<div id="content">
	<h1>자바스크립트 DOM(Document Object Model)</h1>
	<p id="demo">결과 출력 예정1</p>
	<p>결과 출력 예정2</p>
	<p>결과 출력 예정3</p>
	</div>
<script>
/* DOM Navigation (인접 관계 선택자) 
웹페이지의 엘리먼트가 모두 부모, 자식 관계가 있으므로 관계를 이용해서 탐색하는 방법 
parentNode
parentElement
childNodes[nodenumber]
children
firstChild
firstElementChild
lastChild
lastElementChild
nextSibling
nextElementSibling
previousSibling
previousElementSibling

*/

/* <div id="content"> 엘리먼트를 최상위 부모 엘리먼트로 지정 */
var parent = document.querySelector("div#content");

/* nextSibling 속성은 형제 노드 반환하는 속성 */
/* 주의) 줄바꿈 문자는 text Node로 처리된다. */
/* 주의) nextElementSibling 속성은 IE9 이상에서만 사용 가능. text Node는 탐색 대상에서 제외된다. */
var x = parent.querySelector("#demo");				// 기준점
console.log(x.nextSibling.nodeName);				// text (Enter키)
console.log(x.nextSibling.nextSibling.nodeName);	// p태그
console.log(x.nextSibling.nextSibling.innerHTML);	// p태그
console.log(x.nextElementSibling.nodeName);			// p태그
console.log(x.nextElementSibling.innerHTML);		// p태그
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

</head>
<body>

<div id="content">
	<h1>자바스크립트 DOM(Document Object Model)</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>
/* DOM Navigation (인접 관계 선택자) */
/* 웹페이지의 엘리먼트가 모두 부모, 자식 관계가 있으므로 관계를 이용해서 탐색하는 방법 */
/*
parentNode
parentElement
childNodes[nodenumber]
children
firstChild
firstElementChild
lastChild
lastElementChild
nextSibling
nextElementSibling
previousSibling
previousElementSibling
*/

/* <div id="content"> 엘리먼트를 최상위 부모 엘리먼트로 지정 */
var parent = document.querySelector("div#content");

/* parentNode 속성은 부모 노드 반환하는 속성 */
/* 주의) parentNode 속성의 반환값은 부모 엘리먼트 노드이다. */
/* 주의) parentElement 속성의 반환값은 부모 엘리먼트이다. */
var x = parent.querySelector("#demo");
console.log(x.nodeName);
console.log(x.parentNode.nodeName);
console.log(x.parentElement.nodeName);


</script>
</body>
</html>
```



### 4) Attribute Object Properties and Methods

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

		<img src="http://211.63.89.71:8090/resources/SampleImages/klematis_small.jpg" alt="klematis" style="width:200px">

		<p id="demo"></p>
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
- 특정 객체를 찾는 탐색 과정이 필요하다. 엘리먼트 이름 기준, id 식별자(속성) 기준, name 식별자(속성) 기준, class 식별자(속성), CSS 선택자 기준.

<Attribute Object Properties and Methods>
attr.isId	Returns true if the attribute is of type Id, otherwise it returns false
attr.name	Returns the name of an attribute
attr.value	Sets or returns the value of the attribute
attr.specified	Returns true if the attribute has been specified, otherwise it returns false
 	 
nodemap.getNamedItem()	Returns a specified attribute node from a NamedNodeMap
nodemap.item()	Returns the attribute node at a specified index in a NamedNodeMap
nodemap.length	Returns the number of attribute nodes in a NamedNodeMap
nodemap.removeNamedItem()	Removes a specified attribute node
nodemap.setNamedItem()	Sets the specified attribute node (by name)
*/

/* <div id="content"> 엘리먼트를 최상위 부모 엘리먼트로 지정 */
var parent = document.querySelector("div#content");

/* name, value property */
/* 주의) 속성 탐색을 위해서 먼저 속성의 주인인 엘리먼트 탐색이 필요하다. */
var x = parent.querySelector("img");

/* 속성 객체 전체 반환하는 경우 */
var attr = x.attributes;	
console.log(attr);

var attrLen = attr.length;
for(var a=0; a<attrLen; ++a){
	console.log(attr[a].name + " - " + attr.item(a).value);
}

/* 값(value)만 반환하는 경우 */
console.log(x.getAttribute('src'));

</script>
</body>
</html>
```



### 5) Style Object Properties

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
- 특정 객체를 찾는 탐색 과정이 필요하다. 엘리먼트 이름 기준, id 식별자(속성) 기준, name 식별자(속성) 기준, class 식별자(속성), CSS 선택자 기준.

<Style Object Properties>
alignContent	Sets or returns the alignment between the lines inside a flexible container when the items do not use all available space	3
alignItems	Sets or returns the alignment for items inside a flexible container	3
alignSelf	Sets or returns the alignment for selected items inside a flexible container	3
animation	A shorthand property for all the animation properties below, except the animationPlayState property	3
animationDelay	Sets or returns when the animation will start	3
animationDirection	Sets or returns whether or not the animation should play in reverse on alternate cycles	3
animationDuration	Sets or returns how many seconds or milliseconds an animation takes to complete one cycle	3
animationFillMode	Sets or returns what values are applied by the animation outside the time it is executing	3
animationIterationCount	Sets or returns the number of times an animation should be played	3
animationName	Sets or returns a name for the @keyframes animation	3
animationTimingFunction	Sets or returns the speed curve of the animation	3
animationPlayState	Sets or returns whether the animation is running or paused	3
background	Sets or returns all the background properties in one declaration	1
backgroundAttachment	Sets or returns whether a background-image is fixed or scrolls with the page	1
backgroundColor	Sets or returns the background-color of an element	1
backgroundImage	Sets or returns the background-image for an element	1
backgroundPosition	Sets or returns the starting position of a background-image	1
backgroundRepeat	Sets or returns how to repeat (tile) a background-image	1
backgroundClip	Sets or returns the painting area of the background	3
backgroundOrigin	Sets or returns the positioning area of the background images	3
backgroundSize	Sets or returns the size of the background image	3
backfaceVisibility	Sets or returns whether or not an element should be visible when not facing the screen	3
border	Sets or returns borderWidth, borderStyle, and borderColor in one declaration	1
borderBottom	Sets or returns all the borderBottom* properties in one declaration	1
borderBottomColor	Sets or returns the color of the bottom border	1 
borderBottomLeftRadius	Sets or returns the shape of the border of the bottom-left corner	3
borderBottomRightRadius	Sets or returns the shape of the border of the bottom-right corner	3
borderBottomStyle	Sets or returns the style of the bottom border	1
borderBottomWidth	Sets or returns the width of the bottom border	1
borderCollapse	Sets or returns whether the table border should be collapsed into a single border, or not	2
borderColor	Sets or returns the color of an element's border (can have up to four values)	1
borderImage	A shorthand property for setting or returning all the borderImage* properties	3
borderImageOutset	Sets or returns the amount by which the border image area extends beyond the border box	3
borderImageRepeat	Sets or returns whether the image-border should be repeated, rounded or stretched	3
borderImageSlice	Sets or returns the inward offsets of the image-border	3
borderImageSource	Sets or returns the image to be used as a border	3
borderImageWidth	Sets or returns the widths of the image-border	3
borderLeft	Sets or returns all the borderLeft* properties in one declaration	1
borderLeftColor	Sets or returns the color of the left border	1
borderLeftStyle	Sets or returns the style of the left border	1
borderLeftWidth	Sets or returns the width of the left border	1
borderRadius	A shorthand property for setting or returning all the four border*Radius properties	3
borderRight	Sets or returns all the borderRight* properties in one declaration	1
borderRightColor	Sets or returns the color of the right border	1
borderRightStyle	Sets or returns the style of the right border	1
borderRightWidth	Sets or returns the width of the right border	1
borderSpacing	Sets or returns the space between cells in a table	2
borderStyle	Sets or returns the style of an element's border (can have up to four values)	1
borderTop	Sets or returns all the borderTop* properties in one declaration	1
borderTopColor	Sets or returns the color of the top border	1
borderTopLeftRadius	Sets or returns the shape of the border of the top-left corner	3
borderTopRightRadius	Sets or returns the shape of the border of the top-right corner	3
borderTopStyle	Sets or returns the style of the top border	1
borderTopWidth	Sets or returns the width of the top border	1
borderWidth	Sets or returns the width of an element's border (can have up to four values)	1
bottom	Sets or returns the bottom position of a positioned element	2
boxDecorationBreak	Sets or returns the behaviour of the background and border of an element at page-break, or, for in-line elements, at line-break.	3
boxShadow	Attaches one or more drop-shadows to the box	3
boxSizing	Allows you to define certain elements to fit an area in a certain way	3
captionSide	Sets or returns the position of the table caption	2
clear	Sets or returns the position of the element relative to floating objects	1
clip	Sets or returns which part of a positioned element is visible	2
color	Sets or returns the color of the text	1
columnCount	Sets or returns the number of columns an element should be divided into	3
columnFill	Sets or returns how to fill columns	3
columnGap	Sets or returns the gap between the columns	3
columnRule	A shorthand property for setting or returning all the columnRule* properties	3
columnRuleColor	Sets or returns the color of the rule between columns	3
columnRuleStyle	Sets or returns the style of the rule between columns	3
columnRuleWidth	Sets or returns the width of the rule between columns	3
columns	A shorthand property for setting or returning columnWidth and columnCount	3
columnSpan	Sets or returns how many columns an element should span across	3
columnWidth	Sets or returns the width of the columns	3
content	Used with the :before and :after pseudo-elements, to insert generated content	2
counterIncrement	Increments one or more counters	2
counterReset	Creates or resets one or more counters	2
cursor	Sets or returns the type of cursor to display for the mouse pointer	2
direction	Sets or returns the text direction	2
display	Sets or returns an element's display type	1
emptyCells	Sets or returns whether to show the border and background of empty cells, or not	2
filter	Sets or returns image filters (visual effects, like blur and saturation)	3
flex	Sets or returns the length of the item, relative to the rest	3
flexBasis	Sets or returns the initial length of a flexible item	3
flexDirection	Sets or returns the direction of the flexible items	3
flexFlow	A shorthand property for the flexDirection and the flexWrap properties	3
flexGrow	Sets or returns how much the item will grow relative to the rest	3
flexShrink	Sets or returns how the item will shrink relative to the rest	3
flexWrap	Sets or returns whether the flexible items should wrap or not	3
cssFloat	Sets or returns the horizontal alignment of an element	1
font	Sets or returns fontStyle, fontVariant, fontWeight, fontSize, lineHeight, and fontFamily in one declaration	1
fontFamily	Sets or returns the font family for text	1
fontSize	Sets or returns the font size of the text	1
fontStyle	Sets or returns whether the style of the font is normal, italic or oblique	1
fontVariant	Sets or returns whether the font should be displayed in small capital letters	1
fontWeight	Sets or returns the boldness of the font	1
fontSizeAdjust	Preserves the readability of text when font fallback occurs	3
fontStretch	Selects a normal, condensed, or expanded face from a font family	3
hangingPunctuation	Specifies whether a punctuation character may be placed outside the line box	3
height	Sets or returns the height of an element	1
hyphens	Sets how to split words to improve the layout of paragraphs	3
icon	Provides the author the ability to style an element with an iconic equivalent	3
imageOrientation	Specifies a rotation in the right or clockwise direction that a user agent applies to an image	3
justifyContent	Sets or returns the alignment between the items inside a flexible container when the items do not use all available space.	3
left	Sets or returns the left position of a positioned element	2
letterSpacing	Sets or returns the space between characters in a text	1
lineHeight	Sets or returns the distance between lines in a text	1
listStyle	Sets or returns listStyleImage, listStylePosition, and listStyleType in one declaration	1
listStyleImage	Sets or returns an image as the list-item marker	1
listStylePosition	Sets or returns the position of the list-item marker	1
listStyleType	Sets or returns the list-item marker type	1
margin	Sets or returns the margins of an element (can have up to four values)	1
marginBottom	Sets or returns the bottom margin of an element	1
marginLeft	Sets or returns the left margin of an element	1
marginRight	Sets or returns the right margin of an element	1
marginTop	Sets or returns the top margin of an element	1
maxHeight	Sets or returns the maximum height of an element	2
maxWidth	Sets or returns the maximum width of an element	2
minHeight	Sets or returns the minimum height of an element	2
minWidth	Sets or returns the minimum width of an element	2
navDown	Sets or returns where to navigate when using the arrow-down navigation key	3
navIndex	Sets or returns the tabbing order for an element	3
navLeft	Sets or returns where to navigate when using the arrow-left navigation key	3
navRight	Sets or returns where to navigate when using the arrow-right navigation key	3
navUp	Sets or returns where to navigate when using the arrow-up navigation key	3
opacity	Sets or returns the opacity level for an element	3
order	Sets or returns the order of the flexible item, relative to the rest	3
orphans	Sets or returns the minimum number of lines for an element that must be left at the bottom of a page when a page break occurs inside an element	2
outline	Sets or returns all the outline properties in one declaration	2
outlineColor	Sets or returns the color of the outline around a element	2
outlineOffset	Offsets an outline, and draws it beyond the border edge	3
outlineStyle	Sets or returns the style of the outline around an element	2
outlineWidth	Sets or returns the width of the outline around an element	2
overflow	Sets or returns what to do with content that renders outside the element box	2
overflowX	Specifies what to do with the left/right edges of the content, if it overflows the element's content area	3
overflowY	Specifies what to do with the top/bottom edges of the content, if it overflows the element's content area	3
padding	Sets or returns the padding of an element (can have up to four values)	1
paddingBottom	Sets or returns the bottom padding of an element	1
paddingLeft	Sets or returns the left padding of an element	1
paddingRight	Sets or returns the right padding of an element	1
paddingTop	Sets or returns the top padding of an element	1
pageBreakAfter	Sets or returns the page-break behavior after an element	2
pageBreakBefore	Sets or returns the page-break behavior before an element	2
pageBreakInside	Sets or returns the page-break behavior inside an element	2
perspective	Sets or returns the perspective on how 3D elements are viewed	3
perspectiveOrigin	Sets or returns the bottom position of 3D elements	3
position	Sets or returns the type of positioning method used for an element (static, relative, absolute or fixed)	2
quotes	Sets or returns the type of quotation marks for embedded quotations	2
resize	Sets or returns whether or not an element is resizable by the user	3
right	Sets or returns the right position of a positioned element	2
tableLayout	Sets or returns the way to lay out table cells, rows, and columns	2
tabSize	Sets or returns the length of the tab-character	3
textAlign	Sets or returns the horizontal alignment of text	1
textAlignLast	Sets or returns how the last line of a block or a line right before a forced line break is aligned when text-align is "justify"	3
textDecoration	Sets or returns the decoration of a text	1
textDecorationColor	Sets or returns the color of the text-decoration	3
textDecorationLine	Sets or returns the type of line in a text-decoration	3
textDecorationStyle	Sets or returns the style of the line in a text decoration	3
textIndent	Sets or returns the indentation of the first line of text	1
textJustify	Sets or returns the justification method used when text-align is "justify"	3
textOverflow	Sets or returns what should happen when text overflows the containing element	3
textShadow	Sets or returns the shadow effect of a text	3
textTransform	Sets or returns the capitalization of a text	1
top	Sets or returns the top position of a positioned element	2
transform	Applies a 2D or 3D transformation to an element	3
transformOrigin	Sets or returns the position of transformed elements	3
transformStyle	Sets or returns how nested elements are rendered in 3D space	3
transition	A shorthand property for setting or returning the four transition properties	3
transitionProperty	Sets or returns the CSS property that the transition effect is for	3
transitionDuration	Sets or returns how many seconds or milliseconds a transition effect takes to complete	3
transitionTimingFunction	Sets or returns the speed curve of the transition effect	3
transitionDelay	Sets or returns when the transition effect will start	3
unicodeBidi	Sets or returns whether the text should be overridden to support multiple languages in the same document	2
userSelect	Sets or returns whether the text of an element can be selected or not	2
verticalAlign	Sets or returns the vertical alignment of the content in an element	1
visibility	Sets or returns whether an element should be visible	2
whiteSpace	Sets or returns how to handle tabs, line breaks and whitespace in a text	1
width	Sets or returns the width of an element	1
wordBreak	Sets or returns line breaking rules for non-CJK scripts	3
wordSpacing	Sets or returns the spacing between words in a text	1
wordWrap	Allows long, unbreakable words to be broken and wrap to the next line	3
widows	Sets or returns the minimum number of lines for an element that must be visible at the top of a page	2
zIndex	Sets or returns the stack order of a positioned element  2
*/

/* <div id="content"> 엘리먼트를 최상위 부모 엘리먼트로 지정 */
var parent = document.querySelector("div#content");

/* Style color Property */
parent.querySelector("p#demo").style.color="red";
 
/* Style backgroundColor property */
/* 주의) CSS에서는 속성이름이 background-color이지만, Javascript에서는 backgroundColor이다. */
/* 주의) 속성 탐색을 위해서 먼저 속성의 주인인 엘리먼트 탐색이 필요하다. */
parent.querySelector("p#demo").style.padding = "20px"; 
parent.querySelector("p#demo").style.backgroundColor = "PeachPuff";

</script>
</body>
</html>
```



### 6) Events

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
		
		<!-- HTML 엘리먼트에 속성 형태로 이벤트 핸들러 등록 및 함수 지정(권장X) -->
		<button onclick="displayDate()">The time is?</button>
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
- 특정 객체를 찾는 탐색 과정이 필요하다. 엘리먼트 이름 기준, id 식별자(속성) 기준, name 식별자(속성) 기준, class 식별자(속성), CSS 선택자 기준.

Events
- 웹페이지에서 발생하는 사용자의 액션을 모두 이벤트로 받아들인다. ex) 주소 입력 후 페이지 연결, 마우스 클릭, 스크롤바 이동, 키보드 타이핑, ...
- 이벤트 발생시 사전 준비된 JavaScript code를 실행할 수 있다. 이벤트 핸들러, Javascript code(함수 형태)를 준비해야 한다.
- 함수 선언 형식
function name(parameter1, parameter2, parameter3, ...){
	code to be executed
}
- 주의) 매개변수 선언시 var 키워드 사용하지 않는다.
- 이벤트 핸들러는 이벤트명 앞에 on이 붙어있는 이름 사용. ex) click 이벤트의 이벤트 핸들러는 onclick.
- 이벤트 핸들러 등록
1. 속성
2. HTML DOM
3. addEventListener()

- 이벤트 종류
<Mouse Events>
onclick	The event occurs when the user clicks on an element	2
oncontextmenu	The event occurs when the user right-clicks on an element to open a context menu	3
ondblclick	The event occurs when the user double-clicks on an element	2
onmousedown	The event occurs when the user presses a mouse button over an element	2
onmouseenter	The event occurs when the pointer is moved onto an element	2
onmouseleave	The event occurs when the pointer is moved out of an element	2
onmousemove	The event occurs when the pointer is moving while it is over an element	2
onmouseover	The event occurs when the pointer is moved onto an element, or onto one of its children	2
onmouseout	The event occurs when a user moves the mouse pointer out of an element, or out of one of its children	2
onmouseup	The event occurs when a user releases a mouse button over an element	2

<Keyboard Events>
onkeydown	The event occurs when the user is pressing a key	2
onkeypress	The event occurs when the user presses a key	2
onkeyup	The event occurs when the user releases a key	2

<Frame/Object Events>
onabort	The event occurs when the loading of a resource has been aborted	2
onbeforeunload	The event occurs before the document is about to be unloaded	2
onerror	The event occurs when an error occurs while loading an external file	2
onhashchange	The event occurs when there has been changes to the anchor part of a URL	3
onload	The event occurs when an object has loaded	2
onpageshow	The event occurs when the user navigates to a webpage	3
onpagehide	The event occurs when the user navigates away from a webpage	3
onresize	The event occurs when the document view is resized	2
onscroll	The event occurs when an element's scrollbar is being scrolled	2
onunload	The event occurs once a page has unloaded (for <body>)	2

<Form Events>
onblur	The event occurs when an element loses focus	2
onchange	The event occurs when the content of a form element, the selection, or the checked state have changed (for <input>, <select>, and <textarea>)	2
onfocus	The event occurs when an element gets focus	2
onfocusin	The event occurs when an element is about to get focus	2
onfocusout	The event occurs when an element is about to lose focus	2
oninput	The event occurs when an element gets user input	3
oninvalid	The event occurs when an element is invalid	3
onreset	The event occurs when a form is reset	2
onsearch	The event occurs when the user writes something in a search field (for <input="search">)	3
onselect	The event occurs after the user selects some text (for <input> and <textarea>)	2
onsubmit	The event occurs when a form is submitted	2

<Drag Events>
ondrag	The event occurs when an element is being dragged	3
ondragend	The event occurs when the user has finished dragging an element	3
ondragenter	The event occurs when the dragged element enters the drop target	3
ondragleave	The event occurs when the dragged element leaves the drop target	3
ondragover	The event occurs when the dragged element is over the drop target	3
ondragstart	The event occurs when the user starts to drag an element	3
ondrop	The event occurs when the dragged element is dropped on the drop target	3

<Clipboard Events>
oncopy	The event occurs when the user copies the content of an element	 
oncut	The event occurs when the user cuts the content of an element	 
onpaste	The event occurs when the user pastes some content in an element	 

<Print Events>
onafterprint	The event occurs when a page has started printing, or if the print dialogue box has been closed	3
onbeforeprint	The event occurs when a page is about to be printed	3

<Media Events>
onabort	The event occurs when the loading of a media is aborted	3
oncanplay	The event occurs when the browser can start playing the media (when it has buffered enough to begin)	3
oncanplaythrough	The event occurs when the browser can play through the media without stopping for buffering	3
ondurationchange	The event occurs when the duration of the media is changed	3
onemptied	The event occurs when something bad happens and the media file is suddenly unavailable (like unexpectedly disconnects)	3
onended	The event occurs when the media has reach the end (useful for messages like "thanks for listening")	3
onerror	The event occurs when an error occurred during the loading of a media file	3
onloadeddata	The event occurs when media data is loaded	3
onloadedmetadata	The event occurs when meta data (like dimensions and duration) are loaded	3
onloadstart	The event occurs when the browser starts looking for the specified media	3
onpause	The event occurs when the media is paused either by the user or programmatically	3
onplay	The event occurs when the media has been started or is no longer paused	3
onplaying	The event occurs when the media is playing after having been paused or stopped for buffering	3
onprogress	The event occurs when the browser is in the process of getting the media data (downloading the media)	3
onratechange	The event occurs when the playing speed of the media is changed	3
onseeked	The event occurs when the user is finished moving/skipping to a new position in the media	3
onseeking	The event occurs when the user starts moving/skipping to a new position in the media	3
onstalled	The event occurs when the browser is trying to get media data, but data is not available	3
onsuspend	The event occurs when the browser is intentionally not getting media data	3
ontimeupdate	The event occurs when the playing position has changed (like when the user fast forwards to a different point in the media)	3
onvolumechange	The event occurs when the volume of the media has changed (includes setting the volume to "mute")	3
onwaiting	The event occurs when the media has paused but is expected to resume (like when the media pauses to buffer more data)	3

<Animation Events>
animationend	The event occurs when a CSS animation has completed	3
animationiteration	The event occurs when a CSS animation is repeated	3
animationstart	The event occurs when a CSS animation has started	3

<Transition Events>
transitionend	The event occurs when a CSS transition has completed	3

<Server-Sent Events>
onerror	The event occurs when an error occurs with the event source	 
onmessage	The event occurs when a message is received through the event source	 
onopen	The event occurs when a connection with the event source is opened	 

<Misc Events>
onmessage	The event occurs when a message is received through or from an object (WebSocket, Web Worker, Event Source or a child frame or a parent window)	3
onmousewheel	Deprecated. Use the onwheel event instead	 
ononline	The event occurs when the browser starts to work online	3
onoffline	The event occurs when the browser starts to work offline	3
onpopstate	The event occurs when the window's history changes	3
onshow	The event occurs when a <menu> element is shown as a context menu	3
onstorage	The event occurs when a Web Storage area is updated	3
ontoggle	The event occurs when the user opens or closes the <details> element	3
onwheel	The event occurs when the mouse wheel rolls up or down over an element	3

<Touch Events>
ontouchcancel	The event occurs when the touch is interrupted	 
ontouchend	The event occurs when a finger is removed from a touch screen	 
ontouchmove	The event occurs when a finger is dragged across the screen	 
ontouchstart	The event occurs when a finger is placed on a touch screen


- 이벤트 객체
<MouseEvent Object>
altKey	Returns whether the "ALT" key was pressed when the mouse event was triggered	2
button	Returns which mouse button was pressed when the mouse event was triggered	2
buttons	Returns which mouse buttons were pressed when the mouse event was triggered	3
clientX	Returns the horizontal coordinate of the mouse pointer, relative to the current window, when the mouse event was triggered	2
clientY	Returns the vertical coordinate of the mouse pointer, relative to the current window, when the mouse event was triggered	2
ctrlKey	Returns whether the "CTRL" key was pressed when the mouse event was triggered	2
detail	Returns a number that indicates how many times the mouse was clicked	2
metaKey	Returns whether the "META" key was pressed when an event was triggered	2
pageX	Returns the horizontal coordinate of the mouse pointer, relative to the document, when the mouse event was triggered	 
pageY	Returns the vertical coordinate of the mouse pointer, relative to the document, when the mouse event was triggered	 
relatedTarget	Returns the element related to the element that triggered the mouse event	2
screenX	Returns the horizontal coordinate of the mouse pointer, relative to the screen, when an event was triggered	2
screenY	Returns the vertical coordinate of the mouse pointer, relative to the screen, when an event was triggered	2
shiftKey	Returns whether the "SHIFT" key was pressed when an event was triggered	2
which	Returns which mouse button was pressed when the mouse event was triggered	2

<KeyboardEvent Object>
altKey	Returns whether the "ALT" key was pressed when the key event was triggered	2
ctrlKey	Returns whether the "CTRL" key was pressed when the key event was triggered	2
charCode	Returns the Unicode character code of the key that triggered the onkeypress event	2
key	Returns the key value of the key represented by the event	3
keyCode	Returns the Unicode character code of the key that triggered the onkeypress event, or the Unicode key code of the key that triggered the onkeydown or onkeyup event	2
location	Returns the location of a key on the keyboard or device	3
metaKey	Returns whether the "meta" key was pressed when the key event was triggered	2
shiftKey	Returns whether the "SHIFT" key was pressed when the key event was triggered	2
which	Returns the Unicode character code of the key that triggered the onkeypress event, or the Unicode key code of the key that triggered the onkeydown or onkeyup event

*/


function displayDate() {
	/* <div id="content"> 엘리먼트를 최상위 부모 엘리먼트로 지정 */
	var parent = document.querySelector("div#content");
	document.getElementById("demo").innerHTML = Date();
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
		<p id="demo">결과 출력 예정</p>

		<!-- HTML 엘리먼트에 속성 형태로 이벤트 핸들러 등록을 위한 식별자 추가 -->
		<button id="myBtn">The time is?</button>
	</div>
<script>

/* 특정 객체에 대해서 이벤트 핸들러 등록 - 익명함수 */
/*
document.getElementById("myBtn").onclick = function(){
	document.getElementById("demo").innerHTML = Date();
};
*/	

/* 특정 객체에 대해서 이벤트 핸들러 등록 - 함수명 */
/* 주의) displayDate() - X */
document.getElementById("myBtn").onclick = displayDate; 
	
	
function displayDate() {
	/* <div id="content"> 엘리먼트를 최상위 부모 엘리먼트로 지정 */
	var parent = document.querySelector("div#content");
	document.getElementById("demo").innerHTML = Date();
}


</script>
</body>
</html>
```



**주의) 스크립트 코드는 코드 위치에 따라서 실행 순서가 결정된다.**

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

<script>
/* 현재 위치의 스크립트 코드는 HTML 엘리먼트가 로딩되기 전이므로 객체 탐색 불가 */
document.getElementById("content").style.backgroundColor = "SpringGreen"
</script>

</head>
<body>
	<div id="content">
		<h1>자바스크립트 DOM(Document Object Model)</h1>
		<p id="demo">결과 출력 예정</p>
	</div>
<script>
/* onload Event */
/* 브라우저에 페이지 로딩이 끝나고, 페이지 출력이 마무리 되면 발생하는 이벤트 */
/* 주의) 스크립트 코드는 코드 위치에 따라서 실행 순서가 결정된다. */
 
/* 현재 위치의 스크립트 코드는 HTML 엘리먼트가 로딩된 후이므로 객체 탐색 가능 */ 
document.getElementById("content").style.backgroundColor = "SpringGreen";

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
function myFunction() {
	/* 현재 위치의 스크립트 코드는 HTML 엘리먼트가 로딩된 후이므로 객체 탐색 가능 */
	document.getElementById("content").style.backgroundColor = "yellow";
}
</script>

</head>
<body onload="myFunction()">

<div id="content">
	<h1>자바스크립트 이벤트(Events)</h1>
	<p id="demo">결과 출력 예정</p>
</div>
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
  
window.onload = function () {
	/* 현재 위치의 스크립트 코드는 HTML 엘리먼트가 로딩된 후이므로 객체 탐색 가능 */
	document.getElementById("content").style.backgroundColor = "yellow";
}

</script>

</head>
<body>

<div id="content">
	<h1>자바스크립트 이벤트(Events)</h1>
	<p id="demo">결과 출력 예정</p>
</div>
</body>
</html>
```



### 7) event listener

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
		<button id="myBtn">Try it</button>
</div>
<script>
/* The addEventListener() method */
/* 특정 객체에 이벤트를 연결해주는 메소드 */
/* 주의) 등록된 이벤트를 취소할 수 있다. The removeEventListener() method. */
/* 주의) 하나의 객체에 두 개 이상의 이벤트 연결 가능 */
/* element.addEventListener(event, function, useCapture); */

document.getElementById("myBtn").addEventListener("click", displayDate);

function displayDate() {
    document.getElementById("demo").innerHTML = Date();
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
		<p id="demo">결과 출력 예정</p>

		<button id="myBtn">Try it</button>

</div>
<script>

/* The addEventListener() method */
/* 특정 객체에 이벤트를 연결해주는 메소드 */
/* 주의) 등록된 이벤트를 취소할 수 있다. The removeEventListener() method. */
/* 주의) 하나의 객체에 두 개 이상의 이벤트 연결 가능 */
/* element.addEventListener(event, function, useCapture); */

/* 주의) event listener는 하나의 객체에 두 개 이상의 이벤트 연결 가능 (단, 최신 브라우저) */
document.getElementById("myBtn").addEventListener("click", function(){
	console.log("클릭이벤트1");
});

document.getElementById("myBtn").addEventListener("click", function(){
	console.log("클릭이벤트2");
});
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

		<button id="myBtn1">addEventListener</button>
		<button id="myBtn2">removeEventListener</button>
		<br><br>
		
		------------------------------------------------------------------------------------------------------
		
		<div id="myDIV" style="background-color:PowderBlue">
		<p id="demo2">결과 출력 예정2</p>
		<button onclick="removeHandler()" id="myBtn3">Try it</button>
		</div>
</div>
<script>

/* The removeEventListener() method. */


document.getElementById("myBtn1").addEventListener("click", addEvent);

document.getElementById("myBtn2").addEventListener("click", removeEvent);

function addEvent(){
	console.log("클릭이벤트 등록");
}

function removeEvent(){
	document.getElementById("myBtn1").removeEventListener("click", addEvent);
	console.log("클릭이벤트 제거");
}

////////////////////////////////////////////////////////////////////////

document.getElementById("myDIV").addEventListener("mousemove", myFunction);

function myFunction() {
    document.getElementById("demo2").innerHTML = Math.random();
}

function removeHandler() {
    document.getElementById("myDIV").removeEventListener("mousemove", myFunction);
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

div .test {
background-color: OrangeRed ;
    border: 1px solid;
    padding: 50px;
}

div .sample {
background-color: coral;
    border: 1px solid;
    padding: 50px;
}

div .sample p {
background-color: MistyRose;
    border: 1px solid;
    padding: 50px;
}

</style>

</head>
<body>

<div id="content">
		<h1>자바스크립트 DOM(Document Object Model)</h1>
		<p id="demo">결과 출력 예정</p>
		
		<div id="myOuterDiv" class="test">
			<div id="myDiv" class="sample">
				<p id="myP">Click this paragraph, I am Bubbling.</p>
			</div>
		</div>
		<br><br><br><br>

		<div id="myOuterDiv2" class="test">
			<div id="myDiv2" class="sample">
				<p id="myP2">Click this paragraph, I am Capturing.</p>
			</div>
		</div>
</div>
<script>
/* The addEventListener(event, function, useCapture) method */
/* Event Bubbling or Even Capturing */
/* 이벤트 발생하는 객체의 영역이 겹쳐 있는 경우 하나의 이벤트가 여러 객체에 영향을 줄 수 있다. */
/* Event Bubbling 상태는 겹쳐있는 객체 중 '앞'에 있는 객체가 먼저 이벤트 처리되는 상태. (기본값) */
/* Event Capturing 상태. 겹쳐있는 객체 중 '뒤'에 있는 객체가 먼저 이벤트 처리되는 상태. */




/* false -> bubbling 상태 */
/* p -> div -> div(outer) */
document.getElementById("myP").addEventListener("click", function() {
    alert("You clicked the P element!");
}, false);

document.getElementById("myOuterDiv").addEventListener("click", function() {
    alert("You clicked the DIV(Outer) element!");
}, false);

document.getElementById("myDiv").addEventListener("click", function() {
    alert("You clicked the DIV element!");
}, false);




/* true -> capturing 상태 */
/* div(outer) -> div -> p -> */
document.getElementById("myP2").addEventListener("click", function() {
    alert("You clicked the P element!");
}, true);

document.getElementById("myOuterDiv2").addEventListener("click", function() {
    alert("You clicked the DIV(Outer) element!");
}, true);

document.getElementById("myDiv2").addEventListener("click", function() {
    alert("You clicked the DIV element!");
}, true);

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
		
		<form>
			<!-- keydown 이벤트는 키보드 키가 눌러진 상태에서 발생하는 이벤트 -->
			keyup test: <input type="text" size="50" onkeyup="myFunction(event)"> 
		</form>
		
		<form>
			<!-- keydown 이벤트는 키보드 키가 눌러진 상태에서 발생하는 이벤트 -->
			keydown test: <input type="text" size="50" onkeydown="myFunction(event)"> 
		</form>



</div>
<script>

/* KeyboardEvent Object */

function myFunction(event) {
	/* 	key 속성은 키보드 이벤트에서 어떤 키가 이벤트를 발생시켰는지에 대한 정보 제공하는 속성 */
    var x = event.keyCode;

    if (x == 27) {  // 27 is the ESC key
        alert ("You pressed the Escape key!");
    } else if (x>=65 && x<91) {
    	alert ("You pressed the " + String.fromCharCode(x) + " key!");
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

div .sample {
background-color: coral;
    border: 1px solid;
    padding: 50px;
}

</style>

</head>
<body>

<div id="content">
		<h1>자바스크립트 이벤트</h1>
		
		<div id="myDiv" class="sample" onclick="myFunction(event)" style="position:absolute;">
			<p>Mouse Event Objects</p>
			<p id="demo"> 결과 출력 예정 </p>
		</div>
		

</div>
<script>
/* KeyboardEvent Object */

function myFunction(event) {
	/* 	layer X, layer Y 속성은 position 속성 지정된 요소 기준 */
	var x = event.layerX;
	var y = event.layerY;
	var coor = "X cords: " + x + ", Y cords: " + y ;
	document.getElementById("demo").innerHTML = coor;
}



</script>
</body>
</html>
```





# 함수(Functions)

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
		<button onclick="mySample()"> CLICK </button>

</div>
<script>

/* 자바스크립트 함수(Function) 
  
- 함수 : 자바스크립트 코드의 집합체.
- 함수 형식
function functionName(parameters) {
	  code to be executed
	}
	
- 자바스크립트 코드의 마지막에 return 구문 추가 가능. 반환값 처리 가능.
- 함수의 매개변수는 필요시 선언 가능. var 키워드는 사용하지 않는다.
- 함수 선언 위치에 관계없이 호출 가능. (작성 순서의 영향을 받지 않는다.)
- 함수 선언 결과를 변수에 저장 가능. 익명 함수. 이벤트 처리시 익명 함수 사용.
var 변수 = function(parameters) {
	  code to be executed
	};
	
- 함수는 호출시에만 실행 가능.
- 호출 방법
1. 자바스크립트 내에서 호출
2. 이벤트 발생시 호출
 */
 
 
 function mySample(){
	 var x = myFunction(4,3);
	 document.getElementById("demo").innerHTML = x;
 }
 
 function myFunction(p1, p2) {
	 return p1 * p2;             
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
		<button onclick="mySample()"> CLICK </button>

</div>
<script>
 
 // 다른 배경색 지정을 위한 배열 객체 준비
 var color = ["OrangeRed", "Tomato", "Coral", "DarkOrange", "Orange", "DarkOrange", "Coral", "Tomato"];
 
 // 전역 변수 선언
 var idx = 0;
 
 function mySample(){
	 // 버튼 클릭시마다 다른 배경색(배열 객체) 지정하는 액션 작성.    
	 var myColor = color[idx];
	 ++idx;
	 
	 // idx 변수의 값이 배열의 크기를 벗어나는 경우 초기화
	if(idx==color.length){
		idx=0;
	}
	
	// 스타일 객체 적용
	 document.getElementById("content").style.backgroundColor = myColor;
	 
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
		<button onclick="mySample1()"> CLICK </button>
		<button onclick="mySample2()"> CLICK </button>

</div>
<script>
 
 /* Function Expressions */
 function mySample1(){
	 var x = function(){
		console.log("Function Expressions!");
	}; 
	
	x();
}


function mySample2(){
	function myFunction(){
		console.log("Function Declarations!");
	}; 
	
	myFunction();
}


</script>
</body>
</html>
```



## 1. 생성자를 통한 function 생성

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
		<button onclick="mySample()"> CLICK </button>

</div>
<script>
 /* Function Constructor */
 function mySample(){
	var x = new Function("console.log('Function Constructor');");
	x();
}




</script>
</body>
</html>
```



## 2. Function Hoisting

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
		<button onclick="mySample1()"> CLICK </button>
		<button onclick="mySample2()"> CLICK </button>
</div>
<script>
 
 /* Function Hoisting */
 /* 변수 또는 함수 선언이 코드 중간에 있어도 실행 전에 스코프 가장 꼭대기 위치로 이동시켜준다. */


 function mySample1(){
	// 함수 선언
	function myFunction(){
		console.log("Function Declarations!");
	}; 
	
	// 함수 호출
	myFunction();
}


function mySample2(){
	// 함수 호출
	myFunction();
	
	// 함수 선언
	function myFunction(){
		console.log("Function Declarations!");
	}; 
	
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
		<button onclick="mySample1()"> CLICK </button>
		<button onclick="mySample2()"> CLICK </button>
</div>
<script> 
 /* Function Hoisting */
 /* 변수 또는 함수 선언이 코드 중간에 있어도 실행 전에 스코프 가장 꼭대기 위치로 이동시켜준다. */


 function mySample1(){
	// 함수 호출 -> 변수 x의 선언은 Hoisting(끌어올리기) 되지만, 할당은 안 된다. undefined 상태이다.
	x();
	
	// 함수 선언 -> 변수 선언 및 함수 할당
	var x = function(){
		console.log("Function Expressions!");
	}; 
}


function mySample2(){
	var x;	// undefined
	x();	// X
	
	// 함수 선언 -> 변수 선언 및 함수 할당
	var x = function(){
		console.log("Function Expressions!");
	}; 
}

</script>
</body>
</html>
```



## 3. Self-Invoking Functions

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
		<button onclick="mySample1()"> CLICK </button>
		<button onclick="mySample2()"> CLICK </button>
</div>
<script>

 /* Self-Invoking Functions */
 /* 선언 및 호출이 같이 실행되는 함수 */


 function mySample1(){
	// 함수 선언
	function myFunction(){
		console.log("Self-Invoking Functions");
	}
	
	// 함수 호출
	myFunction();
}


function mySample2(){
	// 함수 선언 및 호출 -> Self-Invoking Functions
	(function(){console.log("Self-Invoking Functions");})();
}


</script>
</body>
</html>
```



## 4. Function Parameters and Arguments

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
		<button onclick="mySample()"> CLICK </button>
</div>
<script>

/* 자바스크립트 함수(Function) 

- 함수 : 자바스크립트 코드의 집합체.
- 함수 형식
function functionName(parameters) {
	  code to be executed
	}
	
- 자바스크립트 코드의 마지막에 return 구문 추가 가능. 반환값 처리 가능.
- 함수의 매개변수는 필요시 선언 가능. var 키워드는 사용하지 않는다.
- 함수 선언 위치에 관계없이 호출 가능. (작성 순서의 영향을 받지 않는다.)
- 함수 선언 결과를 변수에 저장 가능. 익명 함수. 이벤트 처리시 익명 함수 사용.
var 변수 = function(parameters) {
	  code to be executed
	};
	
- 함수는 호출시에만 실행 가능.
- 호출 방법
1. 자바스크립트 내에서 호출
2. 이벤트 발생시 호출
 */
 
 
 /* Function Parameters and Arguments */
 /* 함수의 매개변수는 함수 호출시 전달되는 값과 불일치해도 된다. 기본값 할당. */


function mySample(){
	// 매개변수 선언과 전달되는 값이 일치하는 경우
	myFunction1(10, 20);
	
	// 매개변수 선언과 전달되는 값이 일치하지 않는 경우
	myFunction2(10);
	
	// 매개변수 선언과 전달되는 값이 일치하지 않는 경우
	myFunction2(10, 20, 30);
	
	// 매개변수 선언이 되지 않은 경우
	myFunction3(10, 20, 30, 40, 50, 60, 70, 80);
}


function myFunction1(a, b){
	console.log(a);
	console.log(b);
}

function myFunction2(a, b){
	console.log(a);
	console.log(b);
}

function myFunction3(){
	// arguments 객체를 이용하면 매개변수에 전달되는 값 분석 가능
	console.log(arguments.length);
	for(var i=0;i<arguments.length;++i){
		console.log(arguments[i]);
	}
}



</script>
</body>
</html>
```



## 5. this keyword

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
		
		<!-- 엘리먼트의 콘텐츠 접근은 innerHTML 속성 이용 -->
		<button onclick="mySample(this)"> CLICK </button>
		<button onclick="mySample(this)"> TEST </button>
</div>
<script>
 
 /* this keyword */
 /* 이벤트가 발생한 객체의 참조주소 반환하는 키워드 */


function mySample(obj){
	// ojb 변수에는 button 객체의 참조주소가 전달된다.
	console.log(typeof obj);
	console.log(obj.innerHTML);
	
	
	if(obj.style.backgroundColor==""){
		obj.style.backgroundColor="MediumPurple";
	} else {
		obj.style.backgroundColor= "";
	}
}


</script>
</body>
</html>
```



## 6. 지역변수 / 전역변수 / use strict

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
		
		<button onclick="mySample1()"> CLICK </button>
		<button onclick="mySample2()"> CLICK </button>
</div>
<script>

 /* 지역 변수 or 전역 변수 */
 /* 함수 내부에서 선언된 변수는 지역 변수이고, 외부에서 선언된 변수는 전역 변수이다.*/

 
 // 전역 변수
 var a = 10;

function mySample1() {
	// 지역 변수 선언
	var a = 20;
	
	// 전역 변수 선언 -> var 키워드 사용하지 않고 변수 선언시 '전역 변수'로 인정(권장x)
	b=30;
	
	// 지역 변수 사용
	console.log(a);		// 20
	console.log(b);		// 30
}

function mySample2() {
	// 전역 변수 사용
	console.log(a);		// 10
	console.log(b);		// 30
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
		<p id="demo">결과 출력 예정</p>		
		
		<button onclick="mySample1()"> CLICK </button>
		<button onclick="mySample2()"> CLICK </button>
</div>
<script>
"use strict";

 /* The "use strict" Directive */
 /* 잘못된 변수 선언을 체크해주는 기능. 스코프의 가장 꼭대기에 선언. */

 // 전역 변수
 var a = 10;

function mySample1() {
	// 지역 변수 선언
	var a = 20;
	
	// 전역 변수 할당
	// b=30;	// Uncaught ReferenceError: b is not defined
	var b = 30;
	
	// 지역 변수 사용
	console.log(a);		// 20
	console.log(b);		// 30
}

function mySample2() {
	// 전역 변수 사용
	console.log(a);		// 10
	console.log(b);		// 30
}
 
</script>
</body>
</html>
```



# Object

## 1. 형식

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

</div>
<script>
/* 
자바스크립트 사용자 정의 객체(JavaScript Object)
- 사용자가 직접 정의한 객체
- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

- 형식
1. Object Literal
2. Keyword new
3. Constructor

- 프로퍼티 접근 형식
1. objectName.property          // person.age
2. objectName["property"]       // person["age"]
3. objectName[expression]       // x = "age"; person[x]

- 메소드 형식
- 사용자 정의 객체에 메소드 추가시 프로퍼티 value 부분에 익명함수 지정.
- 예를 들어, function() {return this.firstName + " " + this.lastName;}

주의) 프로퍼티는 동적 추가, 삭제 가능
 */
 
 
 /* Using an Object Literal */
 /* {key:value, ...} */
 /* key는 식별자로 작성되며 property가 된다. value는 primitive data type(String, number, boolean, null, undefined) 사용 */
 /* 하위 항목 접근은 .(dot) 연산자 사용 */
 
 /* Object 객체 */
 var person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
 console.log(typeof person);
 console.log(person);
 console.log(person.firstName);
 console.log(person.lastName);
 console.log(person.age);
 console.log(person.eyeColor);
 
 /* 배열 객체 */
 var personArray = ["John", "Doe", 50, "blue"];
 console.log(typeof personArray);
 console.log(personArray);
 for(var a=0; a<personArray.length; ++a){
	 console.log(personArray[a]);
 }
 
 
 document.getElementById("demo").innerHTML = person.firstName + " " + person.lastName + "<br>" + person.age + "<br>" + person.eyeColor;
 
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

</div>
<script>
 /* Using the JavaScript Keyword new */
 /* new Object() */
 
 /* Object 객체 */
 var person = new Object();
 
 /* 객체의 프로퍼티는 읽기, 쓰기 가능 */
 person.firstName = "John";
 person.lastName = "Doe";
 person.age = 50;
 person.eyeColor = "blue";
 console.log(typeof person);
 console.log(person);
 console.log(person.firstName);
 console.log(person.lastName);
 console.log(person.age);
 console.log(person.eyeColor);

 
 
 document.getElementById("demo").innerHTML = person.firstName + " " + person.lastName + "<br>" + person.age + "<br>" + person.eyeColor;
 

 /* 프로퍼티 동적 추가 */
 person.nationality = "English";
 
  /* 프로퍼티 동적 삭제 */
delete person.age; 

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

</div>
<script>
 var person = {
		    firstName: "John",
		    lastName : "Doe",
		    id       : 5566,
		    fullName : function() {
		       return this.firstName + " " + this.lastName;
		    }
		};
 
 console.log(person);
 console.log(person.firstName);
 console.log(person.lastName);
 console.log(person.id);
 console.log(person.fullName);
 console.log(person.fullName());
 
 /* 메소드 동적 추가 */
 person.name = function(){return this.firstName + " + " + this.lastName};
 
 /* 메소드 동적 삭제 */
 delete person.fullName;

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

</div>
<script>
 /* JavaScript Object Constructors */
 /* 구조(항목 구성)가 동일한 객체를 생성할 수 있는 생성자 준비 */
 /* new 키워드로 동일한 구조를 가진 여러개의 객체 생성 가능 */
  
 /* 식별자 첫 글자를 대문자로 표기 */
 /* 매개변수에 외부에서 전달받을 값에 대한 변수 지정 */
 function Person(first, last, age, eye) {
		/* (프로퍼티) 멤버에 대한 초기화 과정 */
	    this.firstName = first;
	    this.lastName = last;
	    this.age = age;
	    this.eyeColor = eye;
	}
	
 /* 준비된 생성자를 이용해서 객체 생성 */
var myPerson = new Person('Jiyoung', 'Yoon', '26', 'brown');
console.log(myPerson.firstName);
console.log(myPerson.lastName);
console.log(myPerson.age);
console.log(myPerson.eyeColor);


var yourPerson = new Person('Siwan', 'Lim', '29', 'black');


console.log(myPerson);
console.log(yourPerson);

 /* 주의) 프로퍼티 구성에 대해 동적 추가, 삭제 가능 */
 
</script>
</body>
</html>
```



## 2. prototypes

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

</div>
<script>
/* 
자바스크립트 사용자 정의 객체(JavaScript Object)
- 사용자가 직접 정의한 객체
- 객체는 자바스크립트 프로그램의 대상이다.
- 내장 객체는 자바스크립트가 기본적으로 제공하는 객체이다.
- BOM(Browser Object Model)은 브라우저를 객체로 인식하고, 브라우저 자신을 프로그램으로 통제하는 방법. 예를 들어, 창 열기, 창 닫기.
- DOM(Document Object Model)은 현재 메모리에 로딩되어 있는 웹페이지를 객체로 인식하고, 웹페이지 자신을 프로그램으로 통제하는 방법. 예를 들어, 페이지 내의 특정 콘텐츠에 대한 수정, 삭제 등.
- 사용자 정의 객체

- 형식
1. Object Literal
2. Keyword new
3. Constructor

 */
 
 /* JavaScript Object Constructors */
 /* 구조(항목 구성)가 동일한 객체를 생성할 수 있는 생성자 준비 */
 /* new 키워드로 동일한 구조를 가진 여러개의 객체 생성 가능 */
 
 /* 식별자 첫 글자를 대문자로 표기 */
 /* 매개변수에 외부에서 전달받을 값에 대한 변수 지정 */
 function Person(first, last) {
		/* (프로퍼티) 멤버에 대한 초기화 과정 */
	    this.firstName = first;
	    this.lastName = last;
	}
	
var myPerson1 = new Person("John", "Doe");
console.log(myPerson1);

var myPerson2 = new Person("Sally", "Rally");

/* 프로퍼티 동적 추가 */
 myPerson2.nationlality = "English";
 console.log(myPerson2);
 
 
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

</div>
<script>
          
 function Person(first, last) {
		/* (프로퍼티) 멤버에 대한 초기화 과정 */
	    this.firstName = first;
	    this.lastName = last;
	}


/* 프로퍼티 정적 추가 */
 Person.prototype.nationality = "English";
 
 
 var myPerson1 = new Person("John", "Doe");
 var myPerson2 = new Person("Sally", "Rally");
 
 console.log(myPerson1);
 console.log(myPerson2);
 console.log(myPerson1.nationality);
 
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
	<h1>자바스크립트 Objects</h1>
	<p id="demo">결과 출력 예정</p>
</div>

<script>
/* JavaScript Object Prototypes */
/* 객체의 원형 정보를 반환하는 프로퍼티 */
/* 객체를 상속 받아서 프로퍼티, 메소드에 대한 정적 추가 가능 */

var txt = "Test";
console.log(txt);
console.log(txt.toString());
console.log(txt.toUpperCase());
console.log(txt.toLowerCase());

/* String 객체에 메소드 정적 추가 */
String.prototype.test = function() { return "[" + this.toString() + "]"; };
console.log(txt.test());

</script>
</body>
</html>
```

