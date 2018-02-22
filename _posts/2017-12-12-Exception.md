---
layout: post
title: "Exception"
description: "Exception"
categories: [Java]
tags: [exception]
redirect_from:
  - /2017/12/12/
---



# 예외(Exception) 처리

```java
public class Sample001 {
	public static void main(String[] args) {
	
	// 예외(Exception) 및 예외처리
	/*
	  - 예외는 사용자의 잘못된 조작이나, 개발자의 잘못된 코딩으로 인해 발생하는 프로그램 오류.
	  - 예외 발생시 비정상적인 프로그램 종료를 일으킨다. 예외 처리를 통해서 정상적인 프로그램 진행을 유지할 수 있다.
	  - 예외 종류 두 가지. Checked Exceptions, Unchecked Exceptions(Runtime Exceptions).
	  - Checked Exceptions는 컴파일 과정에 발견 가능. Runtime Exceptions는 실행 과정에서 발견 가능.
	  - Runtime Exceptions는 실행 과정에서만 발견되기 때문에 사전에 예외를 대비해야 한다. 예외처리는 try~catch 또는 throws 구문을 이용한다.
	  - try~catch 구문 형식
		
		  try {
		  		// 예외발생 가능한 구문
		  } catch(예외종류1 변수) {
		  		// 예외처리 구문
		  } catch(예외종류2 변수) {
		  		// 예외처리 구문
		  } catch(예외종류3 변수) {
		  		// 예외처리 구문
		  }
		  
		  또는
		  
		  try {
		  		// 예외발생 가능한 구문
		  } catch(예외종류1 | 예외종류2 | 예외종류3 변수) {
		  		// 예외처리 구문
		  }
		  		  
	  	주의) 예외 종류가 여러개인 경우 상속 계층 구조에 맞춰서 작성해야 한다. (자식 먼저, 부모 나중)
	  	주의) 예외 종류를 잘 모르는 경우 'Exception' 클래스 지정시 모든 예외 catch 가능.
	  	주의) catch(예외종류1 | 예외종류2 | 예외종류3 변수) 형식은 자바7 이후에만 사용 가능
	  	주의) main() 메소드 내에 있는 액션인 경우 try~catch 구문으로 예외 처리.
	  	주의) 사용자 정의 메소드 내에 있는 액션인 경우 throws 구문으로 예외 처리.
	  	
	  
	  - throws 구문 형식
	  	
	  	접근제한자 반환자료형 메소드이름(매개변수 리스트) throws 예외종류1, 예외종류2, ... {
	  			// 예외발생 가능한 구문
	  	}
	 */
	
	
	// 정상적인 자료 준비한 경우
	// String a = "TEST";
		
	// NullPointerException
	// -> 참조 자료형 변수에 정상적인 값이 없는 경우
	String a = null;
	
	// 예외 발생 가능 구문
	// -> 참조 자료형 변수에 null이 있는 상태에서 하위 멤버 접근(. 연산자) 시도하면 예외 발생.
	// -> 예외 발생시 프로그램 비정상 종료.
	// -> 예외 처리 구문 추가
	try {
		System.out.println(a.toString());
	} catch (NullPointerException e) {
		// e.printStackTrace();
		// System.out.println(e.getMessage());
		System.out.println(e.toString());
	}

	// 예외처리를 적용했기 때문에 이 부분은 정상 실행된다.
	System.out.println("프로그램 정상 종료.");
	}
}
```



# try~catch 와 throws

```java
public class Calc {
	public static int mod(int a, int b) throws ArithmeticException {
		int result = 0;
		
		// 몫 연산 과정 추가
		// 주의) ArithmeticException 발생 가능 -> throws 예외 처리 구문 사용
		

			result = a/b;
		
		
		return result;
    }
}
```

```java
public class Sample006 {

	public static void main(String[] args) {
		// throws 구문
		// 예외 처리 방법 두 가지. try~catch 또는 throws.
		// throws 구문은 예외 발생시 자체 처리하지 않고 내보내기 한다.

		// 정상적인 경우
		// int a = 10;
		// int b = 5;
		
		// 비정상적인 경우
		int a = 10;
		int b = 0;
		
		
		// 예외 발생 가능 구문
		// 호출하는 메소드에 throws 구문이 있다면 메소드 시그니처에 나타난다.
		// -> try~catch 구문 추가
		try {
			System.out.printf("몫 연산 결과: %d%n", Calc.mod(a,b));
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		
		// 위에서 예외처리를 적용했기 때문에 이 부분은 정상 실행된다.
		System.out.println("프로그램 정상 종료");
	}
}
```



# try~catch~finally

```java
import java.util.Scanner;

public class Sample008 {

	public static void main(String[] args) {
		// try~catch~finally 구문 형식
		/*
		  try {
		  		// 예외발생 가능한 구문
		  } catch(예외종류 변수) {
		  		// 예외처리 구문
		  } finally {
		  		// 예외 발생 유무와 관계없이 마무리 액션 처리
		  		// 외부 자원 이용시 close() 메소드 호출시 사용
		  }
		 */
		
		// 주의) catch 액션만 잘 처리한다면 finally 구문은 없어도 close() 메소드 호출 가능.
		// 주의) try-with-resources 기능(자바7 이후에서만 사용 가능 & AutoCloseable 인터페이스 구현 클래스)을 이용하면 close() 메소드에 대한 자동 호출 가능.
		
		Scanner sc = new Scanner(System.in);
		
		// 예외 발생 가능 구문
		// -> try~catch~finally 구문 추가
		try {
			System.out.println("숫자?");
			int a = sc.nextInt();
			System.out.println(a);
		} catch(Exception e) {
			System.out.println(e.toString());
		} finally {
			// 이 구문은 예외 발생 유무와 관계없이 실행되어야 한다.
			sc.close();
			System.out.println("프로그램 정상 종료");
		}
	}

}
```


# try-with-resources 기능

```java
import java.util.Scanner;

public class Sample009 {

	public static void main(String[] args) {
		// try-with-resources 기능
		/*
		  try(객체 생성 구문) {
		  		// 예외발생 가능한 구문
		  } catch(예외종류 변수) {
		  		// 예외처리 구문
		  } 
		 */
		
		// 주의) try-with-resources 기능(자바7 이후에서만 사용 가능 & AutoCloseable 인터페이스 구현 클래스)을 이용하면 close() 메소드에 대한 자동 호출 가능.
		
		
		
		// 객체 생성 구문을 try() 구문에 지정. close() 메소드 자동 호출.
		try(Scanner sc = new Scanner(System.in)) {
			// 예외 발생 가능 구문
			// -> try~catch~finally 구문 추가
			System.out.println("숫자?");
			int a = sc.nextInt();
			System.out.println(a);
		} catch(Exception e) {
			System.out.println(e.toString());
		} 
		System.out.println("프로그램 정상 종료");		
	}
}
```


# throw

```java
public class Calc2 {

	// throws 키워드에 의해서 발생한 예외 객체를 밖으로 내보내기 한다.
	public static int mod(int a, int b) throws Exception {
		int result = 0;

		// 예외 발생시키기
		// 주의) 변수 b에 0이 전달된다면 Exception 예외 발생 -> throw 키워드 사용
		if (b == 0) {
			// throw 키워드에 의해서 준비된 예외 객체가 발생된다.
			// 메시지가 있는 예외 객체
			throw new Exception("0으로 나누기 시도.");
			// 메시지가 없는 예외 객체 -> 상황 분석이 어려울 수도 있다. -> 사용자 정의 예외 객체를 만들면 클래스 이름에 예외 상황을 표현할 수
			// 있다.
			// throw new Exception();
		}

		result = a / b;

		return result;
	}

}
```

```java
public class Sample010 {

	public static void main(String[] args) {
		// 예외 발생시키기
		/*
		 - 사용자가 임의로 예외 객체를 생성하고, 외부로 내보내기 하는 상태.
		 - throw, throws 키워드 사용
		 - 기본 형식
		 	접근 제한자 반환자료형 메소드이름(매개변수 리스트) throws 예외 종류 {
		 		// 상황에 맞는 예외객체 선택
		 		throw new 예외객체("메시지");
		 		
		 */
		
		// 정상적인 경우
		// int a= 10;
		// int b = 5;
		
		// 비정상적인 경우
		int a = 10;
		int b = 0;
		
		// Calc2 클래스의 mod()메소드가 checked exception 상태이므로
		// 컴파일 단계에서 예외 확인 가능
		// try~catch 필수
		try {
			//예외 발생 가능 구문
			System.out.printf("몫 연산 결과:%d%n", Calc2.mod(a, b));
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println(e.toString());
		}
		
		System.out.println("프로그램 정상 종료.");
	}

}
```

​

# throw - 사용자 정의 예외 처리

```java
public class Calc3 {

	// throws 키워드에 의해서 발생한 사용자 정의 예외 객체를 밖으로 내보내기 한다.
	public static int mod(int a, int b) throws DividedByZeroException {
		int result = 0;

		// 예외 발생시키기
		// 주의) 변수 b에 0이 전달된다면 사용자 정의 예외 객체 발생 -> throw 키워드 사용
		if (b == 0) {
			// throw 키워드에 의해서 준비된 사용자 정의 예외 객체가 발생된다.
			throw new DividedByZeroException();
		}

		result = a / b;

		return result;
	}

}

```

```java
//사용자 정의 예외 클래스 선언
//->Exception 클래스에 대한 상속 지정 필수
//->checked exception 상태가 된다.
//주의) 클래스명 작성시 예외 상황을 표현할 수 있는 이름 사용할 것.
public class DividedByZeroException extends Exception {
	
	//메시지가 없는 예외 객체 생성시 사용
	public DividedByZeroException() {
		
	}
	
	//메시지가 있는 예외 객체 생성시 사용
	public DividedByZeroException(String message) {
		//부모 클래스(Exception)의 매개변수 있는 생성자 호출
		super(message);
	}

}
```

```java
public class Sample011 {

	public static void main(String[] args) {
		
		//예외 발생시키기
		/*
		
		- 사용자가 임의로 예외 객체를 생성하고, 외부로 내보내기 하는 상태.
		- throw, throws 키워드 사용
		- 기본 형식
		접근제한자 반환자료형 메소드이름(매개변수 리스트) throws 예외종류 {
		
			//상황에 맞는 예외객체 선택
			throw new 예외객체("메시지");
		
		}
		
		*/
		
		//정상적인 경우
		/*
		int a = 10;
		int b = 5;
		*/
		
		//비정상적인 경우
		int a = 10;
		int b = 0;

		//Calc3 클래스의 mod() 메소드가 checked exception 상태이므로
		//컴파일 단계에서 예외 확인 가능
		//->try~catch 필수
		try {
			//사용자 정의 예외 발생 가능 구문
			System.out.printf("몫 연산 결과:%d%n", Calc3.mod(a, b));
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println(e.toString());
		}
		
		System.out.println("프로그램 정상 종료.");

	}

}
```

​