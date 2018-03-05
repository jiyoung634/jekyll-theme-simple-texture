---
layout: post
title: "data type & operator"
description: "data type & operator of Java"
categories: [Java]
tags: [data type], [operator], [java]
redirect_from:
  - /2017/11/03/
---

# int

```java
package javaSE_20171103;

public class Sample001 {
	
	public static void main (String[] args) {
		// 입력 -> (처리) -> 출력
		
		// 입력 단계 ----------------------------------
		// 방법1
		// 자료형 변수;
		// 변수 = 값;
		// 주의!! 값(Literal)은 자료형과 일치해야 한다.
		int b; 
		b = 200;
		
		// 방법2
		// 자료형 변수 = 값;
		// 주의!! 값(Literal)은 자료형과 일치해야 한다.
		int a = 100;
		
		
		// 처리 단계 ----------------------------------
		// 변수 a에 100을 더하는 연산
		a += 100;
		
		
		// 출력 단계 ----------------------------------
		// 변수의 값을 읽어내서 콘솔에 출력
		System.out.println(a);
		
	}

}

```



# byte

```java
package javaSE_20171103;

public class Sample003 {

	public static void main(String[] args) {
		//정상적인 범위
		byte a = 10;
		
		//범위 초과
		//컴파일 에러 - Type mismatch: cannot convert from int to byte
		byte b = 200;
		
		

	}

}
```



# short

```java
package javaSE_20171103;

public class Sample004 {

	public static void main(String[] args) {
		short a = 100;
		short b = 200;
		
		//범위 초과
		//컴파일 에러 - Type mismatch: cannot convert from int to byte
		short c = 40000;

	}

}
```



# long

```java
package javaSE_20171103;

public class Sample005 {

	public static void main(String[] args) {
		
		long a = 100;
		
		long b = 100L;
		
		//범위 초과
		//The literal 9999999999 of type int is out of range 
		long c = 9999999999;
		
		long d = 9999999999L;

	}

}
```



# char

```java
package javaSE_20171103;

public class Sample006 {
	
	public static void main(String[] args) {
		char a = 'A';
		
		char b = '0';
		
		//int 자료형의 리터럴을 char 자료형 변수에 저장
		//-> 암시적 형변환
		
		char c = 65;
		
		
		//16진수 리터럴을 char 자료형 변수에 저장
		//65 -> 0x41
		char d = '\u0041';
		
		//범위 초과
		//컴파일 에러 - Invalid character constant
		//char e = 'AB';
		
		//잘못된 문자 표기
		//컴파일 에러 - Invalid character constant
		char f = '';
		char g = ' ';
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
	}

}

```



# double

```java
package javaSE_20171103;

public class Sample007 {

	public static void main(String[] args) {

		double b = 3.14;
		
		//int 자료형의 리터럴을 double 자료형에 저장
		//-> 암시적 형변환
		double a = 100;
		
		//접미사 D 사용 가능
		double c = 100D;
		
		//실수 리터럴 100.0
		double d = 100.0;
		
		//지수 표기 실수
		double f = 1.23e15;
		double g = 1.23e-15;
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
		System.out.println(f);
		System.out.println(g);
		
		
	}

}

```



# float

```java
package javaSE_20171103;

public class Sample008 {

	public static void main(String[] args) {
		
		//접미사 F 필수 사용
		float a = 3.14F;
		
		//double 자료형의 리터럴을 float 자료형 변수에 저장 불가
		//컴파일 에러 - Type mismatch: cannot convert from double to float
		float b = 3.14;
		
		//int 자료형의 리터럴을 float 자료형 변수에 저장 가능
		//-> 암시적 형변환
		float c = 100;
		
		//double 자료형의 리터럴을 float 자료형 변수에 저장 불가
		//컴파일 에러 - Type mismatch: cannot convert from double to float
		float d = 100.0;
		

	}

}

```



# boolean

```java
package javaSE_20171103;

public class Sample009 {

	public static void main(String[] args) {
		// 논리 연산

		// true AND true
		// true AND false

		// true OR true
		// true OR false

		boolean a = true;
		boolean b = false;

		// boolean c = 'true';
		// boolean d = "true";
		// boolean e = True;
		// boolean f = 1;
		

	}

}
```



# 형 변환

```java
package com.test;

public class Sample010 {

	public static void main(String[] args) {
		// 형변환
		/*
		 * A 타입을 B 타입으로 변환
		 * 자동(암시적) 형변환 or 강제(명시적) 형변환
		 * 자동(암시적) 형변환은 컴파일러가 자동으로 형변환을 시켜주는 상태
		 * 작은 타입의 자료를 큰 타입의 변수에 저장하는 과정에서 발생
		 * byte -> short(2) -> int(4) -> long(8) -> float(4) -> double(8)
		 * char(2) -> int(4)
		 */
		
		byte a = 100;
		int b =2100000000;
		//byte c = 21000000;
		
		// byte 자료형의 값을 int 자료형의 변수에 넣는다
		// -> 자동(암시적) 형변환
		int d = a;
		
		
		// char 자료형의 값을 int 자료형의 변수에 넣는다
		// -> 자동(암시적) 형변환
		char e = 'A';
		int f = e;
		System.out.println(f);
		

	}

}

```

```java
package com.test;

public class Sample011 {

	public static void main(String[] args) {
		// 형변환
		/*
		 * A 타입을 B 타입으로 변환
		 * 자동(암시적) 형변환 or 강제(명시적) 형변환
		 * 
		 * 강제(명시적) 형변환은 사용자가 직접 형변환을 시켜주는 상태
		 * 큰 타입의 자료를 작은 타입의 변수에 저장하는 과정에서 발생
		 * byte <- short(2) <- int(4) <- long(8) <- float(4) <- double(8)
		 * char(2) <- int(4)
		 * 
		 * 작은 타입 변수 = (작은 타입) 큰 타입 자료;
		 * 
		 * 주의) 자료 손실 발생
		 */
		
		byte a = 100;
		int b =2100000000;
		
		
		// 강제(명시적) 형변환
		// -> 자료 손실 발생
		byte c = (byte)b;
		System.out.println(c);
		
		// 강제(명시적) 형변환
		// -> 자료 손실 발생하지 않는 경우도 있다
		int d = 100;
		byte f = (byte)d;
		System.out.println(f);
		
		//int 자료형의 값을 char 자료형의 변수에 저장
		//-> 강제(명시적) 형변환
		int g = 65;
		char h = (char)g;
		System.out.println(h);
		
		//double 자료형의 값을 int 자료형의 변수에 저장...실수 부분을 버리고 정수 부분만 취함
		//-> 강제(명시적) 형변환
		double i = 123.456;
		int j = (int)i;
		System.out.println(j);
	}

}

```



# 상수(constants)

```java
package com.test;

public class Sample012 {

	public static void main(String[] args) {
		// 상수(Constants)
		// 미리 정해진 값을 표현하는 방법
		// 대표적인 상수로 PI는 3.141592...
		// 기본자료형은 모두 최소값, 최대값 상수를 가지고 있다
		// int -> Integer.MIN_VALUE, Integer.MAX_VALUE
		// double -> Double.MIN_VALUE, Double.MAX_VALUE
		
		System.out.println(Math.PI);
		System.out.println(Integer.MIN_VALUE);
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Double.MIN_VALUE);
		System.out.println(Double.MAX_VALUE);
		
		int a = Integer.MAX_VALUE;
		System.out.println(a); // 2147483647
		
		int b = Integer.MAX_VALUE + 1;
		System.out.println(b); // 2147483647 + 1 => 2147483648(예상) => -2147483648
		
		



	}

}

```



# 대입 연산자

```java
package com.test;

public class Sample013 {

	public static void main(String[] args) {
		// 대입 연산자
		// 자료형 변수 = 값 또는 표현식;
		
		int a = 10;
		int b = 10, c = 20;
		
		int d, e, f;
		d = e = f = 10;
		
		
		
		int g = 10;
		System.out.println(g);

		g = g + 10; // 나 자신이 갖고 있는 값에 연산을 수행한 후, 그 결과를 나 자신에게 덮어쓰기 하시오
		System.out.println(g);
		
		// 10.0(double 자료형)을 g(int 자료형)에 넣으려 하기 때문에 컴파일 에러
		// ->강제(명시적) 형변환 필요
		g = g + 10.0;

	}

}

```



# 산술 연산자

```java
package com.test;

public class Sample015 {

	public static void main(String[] args) {
		// 산술 연산자
		// +, -, *, /, %, ++, --
		// 주의) 나누기 연산에서 정수 나누기 정수는 정수 결과(몫)
		// 주의) 나누기 연산에서 실수 결과를 얻기를 원하면 실수 항목이 포함되어야 한다(최소 둘 중 하나)

		int a = 10;
		int b = 20;
		int c = 25;
		int d = 25;

		// (이항 연산자)
		// int 자료 + int 자료 => int 결과
		// 문자열(String) 자료 + 임의의 자료 => 문자열 결과
	
		System.out.println("a + b = " + (a + b));
		System.out.println("a - b = " + (a - b));
		System.out.println("a * b = " + (a * b));
		
		// int 자료 / int 자료 => int 자료(몫 연산)
		System.out.println("b / a = " + (b / a));
		System.out.println("c / a = " + (c / a));
		
		// 강제(명시적) 형변환 포함
		System.out.println("c / a = " + (c /(double) a));
		System.out.println("c / a = " + ((double)c / a));
		System.out.println("c / a = " + ((double)c / (double)a));
		
		// int 자료 % int 자료 => int 자료(나머지 연산)
		System.out.println("b % a = " + (b % a));
		System.out.println("c % a = " + (c % a));
		
		
		// (단항 연산자) 증감 연산자
		// 현재 변수의 값을 +1, -1 연산
		// 주의) 전위형, 후위형
		System.out.println("(a++)   = " + (a++));
		System.out.println("++a   = " + ++a);
		System.out.println("a++   = " + a++);
		System.out.println("(b--)   = " + (b--));
		System.out.println("--b   = " + --b);
		System.out.println("b--   = " + b--);

		
	}

}

```

```java
package com.test;

public class Sample016 {

	public static void main(String[] args) {
		// 산술연산자 주의사항
		// 오버플로우(overflow)... 결과가 자료형의 범위를 초과할 때
		
		int a = Integer.MAX_VALUE;
		int b = 1;
		
		// 2147483647 + 1 -> 2147483648 (예상) => -2147483648 (실제)
		// -> 안전한 산술연산을 하려면 오버플로우 감지하는 과정 필요
		int c = a + b ;
		System.out.println(c);

		
	}

}

```

```java
package com.test;

public class Sample017 {

	public static void main(String[] args) {
		// 산술연산자 주의사항
		// 부동소수점수 연산시 부정확한 결과

		int a = 1;
		double b = 0.1;
		int c = 7;

		// 1 - (0.1*7) => 0.3 (예상) => 0.299999999999(실제)
		double result = a - (b * c);
		System.out.println(result);

		// 부동소수점수를 정수로 표현한 후 연산
		// ((1 * 10) - 7)/ 10.0 => (10 - 7)/10.0 => 3 / 10.0 => 0.3(실제)
		double d = ((a * 10) - c) / 10.0;
		System.out.println(d);
		

	}
}
```

```java
package com.test;

public class Sample018 {

	public static void main(String[] args) {
		// 산술연산자 주의사항
		// 피연산자가 0인 경우 나누기, 나머지 연산 불가
		
		int a = 1;
		int b = 0;
		double c = 0.0;
		
		//어떤 값을 0으로 나누기 시도하면 예외발생
		//java.lang.ArithmeticException: / by zero
		//System.out.println( a / b);
		
		//어떤 값을 0.0으로 나누기 시도하면 무한대 결과
		//Infinity
		System.out.println(a / c);
	}

}

```

```java
package com.test;

public class Sample019 {

	public static void main(String[] args) {
		// 산술연산자 주의사항
		// NaN : Not a Number
		
		int a = 10;
		double b = 0.0;
		
		// 어떤 값을 0.0으로 나머지 연산 시도하면 NaN 결과
		System.out.println(a%b); 
		
		
		String c = "100";
		int d = 100;
		
		// String + int => String
		System.out.println(c + d);
		
		// int + int => int
		System.out.println(Integer.valueOf(c)+d);
		
		String f = "NaN";
		// NaN + 어떤 값 => NaN
		System.out.println(Double.valueOf(f)+d);

	}

}

```



# String

```java
package com.test;

public class Sample020 {
	public static void main(String[] args) {
		// String 자료형(Reference 타입)
		// 문자열 연결(결합) 연산자
		// 문자열 + 문자열 => 문자열
		// 문자열 + 다른 자료 => 문자열

		String a = "A";
		String b = "B";
		int c = 10;
		int d = 20;

		System.out.println(a + b);
		System.out.println(a + c);
		System.out.println(a + c + d);
		System.out.println(a + (c + d));
		System.out.println(c + d + a);
		System.out.println((c + d) + a);

	}

}
```



# 비교 연산자

```java
package com.test;

public class Sample021 {

	public static void main(String[] args) {
		// 비교 연산자
		// ==, !=, >, <, >=, <=
		// -> 결과는 반드시 true or false
		
		int a = 10;
		int b = 20;
		
		System.out.println(a == b);
		System.out.println(a != b);
		System.out.println(a > b);
		System.out.println(a < b);
		System.out.println(a >= b);
		System.out.println(a <= b);
		

	}

}

```

```java
package com.test;

public class Sample022 {

	public static void main(String[] args) {
		// 비교 연산자 주의사항
		// double과 float 자료형의 비교
		
		float a = 0.1F;
		double b = 0.1D;
		
		System.out.println(a);
		System.out.println(b);
		System.out.println(a == b);
		System.out.println(a != b);
		
		//float과 double 자료 비교시 float로 강제 형변환 후 비교
		System.out.println((float)a == (float)b);

	}

}

```

```java
package com.test;

public class Sample023 {

	public static void main(String[] args) {
		// 비교 연산자 주의사항
		// char와 int 자료형의 비교
		
		char a  = 'A';
		int b = 65;
		char c = 'a';
		
		// char vs int => int vs int
		System.out.println(a == b);
		
		// 문자도 크기 비교 가능
		// -> 유니코드
		System.out.println(a < c);

	}

}

```

```java
package com.test;

public class Sample024 {

	public static void main(String[] args) {
		// 비교 연산자 주의사항
		// boolean 자료형의 비교
		
		boolean a = true;
		boolean b = false;
		boolean c = true;
		
		System.out.println(a == b);
		System.out.println(a != b);
		
		//boolean 자료형은 크기 비교 불가
		System.out.println(a > b);
		System.out.println(a < b);

	}

}

```



# 논리 연산자

```java
package com.test;

public class Sample025 {

	public static void main(String[] args) {
		// 논리 연산자
		// &&(and), ||(or), !(not)
		// 참 AND 참 => 참
		// 참 AND 거짓 => 거짓
		// 참 OR 참 => 참
		// 참 OR 거짓 => 참
		
		boolean a = true;
		boolean b = false;
		boolean c = true;
		
		System.out.println(a && b);
		System.out.println(a || b);
		System.out.println(!(a && b));
		System.out.println(!(a || b));
		System.out.println(!a && b);
		System.out.println(!a || b);
		
		int d = 10;
		int e = 20;
		System.out.println((d == e) && (d < e));
		System.out.println((d == e) || (d < e));
		
		int f = 14;
		// 2의 배수(짝수)
		System.out.println((f%2) == 0);
		// 2의 배수가 아닌 수(홀수)
		System.out.println((f%2) == 1);
		// 3의 배수
		System.out.println((f%3) == 0);
		// 5의 배수
		System.out.println((f%5) == 0);
		// 2와 3의 공배수
		System.out.println((f%2==0)&&(f%3==0));
		// 2와 7의 공배수
		System.out.println((f%2==0)&&(f%7==0));

	}

}

```



# 비트 연산자

```java
package com.test;

public class Sample026 {

	public static void main(String[] args) {
		// 비트 단위 연산자
		// 비트 단위로 비교 연산 수행
		// &, |, ^, ~, <<, >>, >>>
		// 1 & 1 => 1
		// 1 & 0 => 0
		// 1 | 1 => 1
		// 1 | 0 => 1
		
		byte a = 45; //00101101
		byte b = 25; //00011001
		
		System.out.println(a & b); //00001001 => 9
		System.out.println(a | b); //00111101 => 61
		System.out.println(a >> 1); //00010110 => 22
		System.out.println(a << 1); //01011010 => 90
		

	}

}

```



# 복합 대입 연산자

```java
package com.test;

public class Sample027 {

	public static void main(String[] args) {
		// 복합 대입 연산자
		// +=, -=, *=, /=, %=,&=, !=, ^=, <<=, >>=, >>>= 
		// 논리 연산자는 복합 대입 연산자가 안 된다(&&, || 등등..)
		// 산술 연산의 결과를 자기 자신에게 다시 대입
		
		int a = 20;
		int b = 5;
		
		a += b;
		System.out.println(a);
		System.out.println(b);
		
		a -= b;
		System.out.println(a);
		
		a *= b;
		System.out.println(a);
		
		a /= b;
		System.out.println(a);
		
		// 다음 세 문장은 모두 같은 의미
		a = a + 1; 
		a += 1;
		++a;
		System.out.println(a);
		
	}

}

```



# 삼항 연산자

```java
package com.test;

public class Sample028 {

	public static void main(String[] args) {
		// 삼항(조건) 연산자
		// variable x = (expression) ? value if true : value if false
		
		// 짝수 -> 어떤 수를 2로 나눈 나머지가 0인 상태의 수
		int a = 20;
		System.out.println(( a % 2 == 0 ) ? "짝수" : "홀수");
		
		// 60점 이상 => 합격
		// 60점 미만 => 불합격
		int b = 60;
		System.out.println(( b >= 60) ? "합격" : "불합격");
		
		// 세 개의 임의의 수 중에서 가장 큰 수를 얻는 과정
		int d = 30;
		int e = 40;
		int f = 10;
		
		int temp = (d > e) ? d : e ;
		int max = (temp > f) ? temp : f ;
		System.out.println(max);
		
		int g = 30;
		int h = 40;
		int i = 10;
		
		int temp2 = (g < h) ? g : h ;
		int min = (temp2 < i) ? temp2 : i;
		System.out.println(min);

	}

}

```

