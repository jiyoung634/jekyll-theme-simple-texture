---
layout: post
title: "Reference type & String"
description: "Reference type & String"
categories: [Java]
tags: [Reference type, String, Java]
redirect_from:
  - /2017/11/09/
---



# 참조 타입 

```java
package com.test;

public class Sample080 {

	public static void main(String[] args) {
		
		//참조 타입
		/*
		
		실제 자료가 저장된 영역(Heap)과 자료를 참조할 수 있는 변수가 다른 영역(Stack)에 선언된 상태
		배열, 열거, 클래스(문자열)
		
		기본 타입은 Stack 영역에 변수가 저장되고, 자료가 저장된다. 생성과 소멸이 쉽게 이루어진다.
		참조 타입은 Stack 영역에 변수가 참조주소가 저장되고, 자료는 별도의 영역(Heap)에 저장된다. 참조주소를 가지고 자료를 가지고 와야 한다.
		참조 타입 자료는 크기가 일정하지 않다. 객체(Object) 단위로 관리. 객체의 생성과 소멸은 쉽게 이루어지지 않는다.
		
		참조 타입의 대표적인 자료형은 클래스이고, 클래스의 대표적인 자료형은 String(문자열 취급하는 자료형)이다.
		
		주의) 참조 타입의 변수에 객체를 할당하지 않는 경우 null 값을 가질 수 있다.
		주의) 정상적인 객체의 참조주소를 가지지 않은 참조 타입의 변수를 호출시 NullPointerException 발생.
		주의) 참조 당하지 않는 객체는 메모리에 JVM(가비지 컬렉터)에 의해 자동 제거된다.  
		
		*/
		

		//String 자료형의 변수 선언 및 초기화
		//Heap 영역에 "Hello" 문자열 생성
		//Stack 영역에 참조형 변수 a, b 생성
		//"Hello" 문자열의 참조주소를 변수 a, b에 할당
		//주의) 동일한 문자열 리터럴인 경우 동일한 String 객체를 참조한다.
		String a = "Hello";
		String b = "Hello";
		System.out.println(a.hashCode());
		System.out.println(b.hashCode());

		//== 연산자를 참조 타입에서 사용하면 참조주소를 가지고 비교연산을 한다.
		System.out.println(a == b);
		
		//"Hello"라는 값을 가지는 String 클래스의 객체 생성
		//Stack 영역에 참조형 변수 c 생성
		//객체의 참조주소를 변수 c에 할당
		//주의) 객체 생성 연산자인 new 사용시 새로운 객체 생성 및 새로운 참조주소를 가진다.
		String c = new String("Hello");
		String d = new String("Hello");
		System.out.println(c.hashCode());
		System.out.println(d.hashCode());
		
		//== 연산자를 참조 타입에서 사용하면 참조주소를 가지고 비교연산을 한다.
		System.out.println(c == d);
		//eqauls() 메소드를 이용하면 참조 타입이 가지는 자료를 비교연산할 수 있다.
		System.out.println(c.equals(d));
		
		
		//주의) 객체 생성 연산자인 new 사용시 새로운 객체 생성 및 새로운 참조주소를 가진다.
		Object e = new Object();
		Object f = new Object();
		System.out.println(e.hashCode());
		System.out.println(f.hashCode());
		
		//== 연산자를 참조 타입에서 사용하면 참조주소를 가지고 비교연산을 한다.
		System.out.println(e == f);
		
		
		//null 값 확인
		String str = null;
		System.out.println(str.toString());

	}

}

```



# String 관련 메소드

```java
package com.test;

public class Sample081 {

	public static void main(String[] args) {
		
		//String 클래스(문자열 자료형)
		
		/*
		
		문자는 char, 문자열은 String
		문자는 'A', 문자열은 "TEST"
		(참조 자료형) 클래스는 메소드를 지원한다.
		객체가 저장된 변수.메소드()
		
		*/

		char a = 'A';
		System.out.println(a);
		
		String b = "A";
		System.out.println(b.toString());
		
		
		//charAt() 메소드 : 특정 위치(Index) 문자 반환
		String s = "Strings are immutable";
		char result = s.charAt(8);
		System.out.println(result);
		
		
		//equals() 메소드 : 문자열 값 비교시 ==가 아니라 equals() 메소드 사용.
		String Str1 = new String("This is really not immutable!!");
		String Str2 = Str1;
		String Str3 = new String("This is really not immutable!!");
		boolean retVal;

		retVal = Str1 == Str3;
		System.out.println("Returned Value = " + retVal);

		retVal = Str1 == Str2;
		System.out.println("Returned Value = " + retVal);

		retVal = Str1.equals(Str3);
		System.out.println("Returned Value = " + retVal);
		
		
		//indexOf(String str) : 매개변수에 전달된 문자열이 시작되는 인덱스 반환. 검색 결과가 없으면 -1 반환.
		String Str = new String("Welcome to Tutorialspoint.com");
		String SubStr1 = new String("Tutorials");
		System.out.println("Found Index :" + Str.indexOf(SubStr1));
		
		
		//length() : 문자열의 길이(문자의 수)를 반환
		String Str4 = new String("Welcome to Tutorialspoint.com");
		System.out.print("String Length :");
		System.out.println(Str4.length());
		
		
		//substring(int beginIndex) : 문자열의 일부(beginIndex~)만 반환
		String Str5 = new String("Welcome to Tutorialspoint.com");
		System.out.print("Return Value :");
		System.out.println(Str5.substring(10));
		
		
		//substring(int beginIndex, int endIndex) : 문자열의 일부(beginIndex~endIndex)만 반환
		String Str6 = new String("Welcome to Tutorialspoint.com");
		System.out.print("Return Value :");
		System.out.println(Str6.substring(10, 15));
		
		
		//replace(char oldChar, char newChar) : 문자열 일부를 다른 문자열로 치환
		String Str7 = new String("Welcome to Tutorialspoint.com");
		System.out.print("Return Value :");
		System.out.println(Str7.replace('T', 't'));
		
		
		//주의) 동일한 문자열이 여러번 검색되는 경우
		String Str8 = new String("자바 JAVA 자바 JSP 오라클 자바");
		System.out.println("Found Index :" + Str8.indexOf("자바"));
		System.out.println("Return Value :" + Str8.replace("자바", "java"));
		
		
		//toLowerCase(), toUpperCase() : 문자열을 소문자로 변환, 대문자로 변환
		String Str9 = new String("Welcome to Tutorialspoint.com");
		System.out.println("Return Value :" + Str9.toLowerCase());
		System.out.println("Return Value :" + Str9.toUpperCase());
		
		//주의) 문자열 비교시 equals(), equalsIgnoreCase() 구분해서 사용.
		
		
		//trim() : 문자열의 앞뒤 공백 제거한 후 반환
		String Str10 = new String("   Welcome to Tutorialspoint.com   ");
		System.out.println("Return Value :[" + Str10 + "]");
		System.out.println("Return Value :[" + Str10.trim() + "]");
		System.out.println("Return Value :[" + Str10.replace(" ", "") + "]");
		
		
		//valueOf() : 기본 자료형의 값을 String 자료형으로 변환 후 반환
		int g = 10;
		double h = 12.123;
		System.out.println(g + 10);
		System.out.println(String.valueOf(g) + 10);
		
	}

}

```



# 서식 지정 문자열

```java
package com.test;

public class Sample084 {

	public static void main(String[] args) {
		
		//서식 지정 문자열
		//System.out.printf("서식 포함 문자열", 대상, ...)
		//String.format("서식 포함 문자열", 대상,...)
		
		// %[argument_index$][flags][width][.precision]conversion
		// 정수 관련 서식 -> %d
		// 실수 관련 서식 -> %f
		// 범용(문자열) 관련 서식 -> %s
		// 줄바꿈 문자 관련 서식 -> %n
		
		int a = 10;
		System.out.printf("[%d]%n", a);
		System.out.printf("[%10d]%n", a);
		System.out.printf("[%-10d]%n", a);
		System.out.printf("[%10d] [%10d] %n", a, a);
		System.out.printf("[%1$10d] [%1$10d] %n", a);
		
		double b = 1234.567890123456789;
		System.out.printf("[%f]%n", b);
		System.out.printf("[%.1f]%n", b);
		System.out.printf("[%10.1f]%n", b);
		System.out.printf("[%-10.1f]%n", b);
		System.out.printf("[%1$f] [%1$f]%n", b);
		System.out.printf("[%.20f]%n", b);
		
		String c = "TEST";
		System.out.printf("[%s]%n", c);
		System.out.printf("[%10s]%n", c);
		System.out.printf("[%-10s]%n", c);
		System.out.printf("[%s]%n", a);
		System.out.printf("[%s]%n", b);
		
		
		//16진수 서식
		System.out.printf("%1$d -> %1$H(16)%n", 255);
		System.out.printf("%1$s -> %1$H(16)%n", "A");
		
		//Boolean 서식
		System.out.printf("%1$d -> %1$B%n", 255);
		System.out.printf("%1$s -> %1$B%n", "A");
		System.out.printf("%1$s -> %1$B%n", null);
		
		//문자 서식
		System.out.printf("%1$d -> %1$c%n", 97);
		
		//16진수 서식
		System.out.printf("%1$d -> %1$X%n", 255);
		
		//지수 서식
		System.out.printf("%1$f -> %1$E%n", 1234.56);
		System.out.printf("%1$f -> %1$E%n", 0.00001234);

		//grouping separators(,) 서식
		System.out.printf("%1$d -> %1$,d%n", 1234567);
		
		//zero-pad(0) 서식
		System.out.printf("%1$d -> %1$05d%n", 12);
		
	}

}

```





# 서식 지정 클래스

```java
package com.test;

import java.text.DecimalFormat;
import java.text.MessageFormat;

public class Sample085 {

	public static void main(String[] args) {
		
		//서식 지정 클래스
		//DecimalFormat, SimpleDateFormat, MessageFormat 클래스
		//java.text 패키지 등록 필요 -> import 구문
		
		double a = 123456.7890;
		
		DecimalFormat df = new DecimalFormat("0");
		System.out.println(df.format(a));
		
		System.out.println(new DecimalFormat("0.00").format(a));
		System.out.println(new DecimalFormat("0.0000000").format(a));
		System.out.println(new DecimalFormat("#").format(a));
		System.out.println(new DecimalFormat("#.##").format(a));
		System.out.println(new DecimalFormat("#.#######").format(a));
		System.out.println(new DecimalFormat("0,000").format(a));
		System.out.println(new DecimalFormat("#,###").format(a));
		System.out.println(new DecimalFormat("0.000E0").format(a));
		
		
		String name = "홍길동";
		String phone = "010-1234-1234";
		String email = "hong123@naver.com";
		System.out.println(name + ", " + phone + ", " + email);
		System.out.printf("%s, %s, %s %n", name, phone, email);
		System.out.println(String.format("%s, %s, %s", name, phone, email));
		System.out.println(MessageFormat.format("{0}, {1}, {2}", name, phone, email));
		
		Object[] myInfo = {"홍길동", "010-1234-1234", "hong123@naver.com"};
		System.out.println(MessageFormat.format("{0}, {1}, {2}", myInfo));

	}

}

```



# StringBuilder 클래스

```java
package com.test;

public class Sample086 {

	public static void main(String[] args) {
		
		//StringBuilder 클래스
		//일반적인 String 클래스를 이용한 문자열 결합 연산은 메모리에 쓰레기 객체를 많이 발생시킨다.
		//문자열의 불변 특성 때문이다.
		//예를 들어, "ABC" + "DEF" => "ABCDEF" 연산 수행시 "ABC" 문자열은 쓰레기 객체가 되고, "ABCDEF" 객체가 반환된다.
		//-> StringBuilder 클래스의 append() 메소드를 이용하는 것을 권장.
		
		//여러개의 문자열을 하나의 문자열로 결합하는 액션
		String[] books = { "이것이 자바다", "자바의 정석", "JSP 웹프로그래밍"
				, "스프링 웹프로젝트", "안드로이드 프로그래밍"
				, "오라클 SQL과 PL/SQL" };
		
		//+ 연산자
		String result = "";
		for (int a=0; a<books.length; ++a) {
			result += String.format("%d) %s%n", (a+1), books[a]);
		}
		System.out.println(result);
		
		//append() 메소드
		StringBuilder sb = new StringBuilder();
		for (int a=0; a<books.length; ++a) {
			sb.append(String.format("%d) %s%n", (a+1), books[a]));
		}
		System.out.println(sb.toString());

	}

}

```

