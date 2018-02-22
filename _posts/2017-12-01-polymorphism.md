---
layout: post
title: "polymorphism"
description: "It's about polymorphism"
categories: [Java]
tags: [random, polymorphism]
redirect_from:
  - /2017/12/01/
---



# 다형성(polymorphism)

```
- 사전적 의미 : 같은 종(種)의 생물이면서도 어떤 형태나 형질이 다양하게 나타나는 현상.
- OOP 의미 : 같은 자료형이면서도 형질(객체)이 다양하게 나타나는 현상.
- IS-A 관계인 경우 자식 객체를 조상 객체의 자료형 변수에 저장할 수 있다.
- 예) 남자or여자라는 개념을 사람이라는 상위 개념으로 묶어서 표현할 수 있다.
- 상위 개념의 변수에 하위 개념을 저장시 자동(암시적) 타입 변환이 일어난다.
- 하위 개념의 변수에 상위 개념을 저장시 강제(명시적) 타입 변환이 필요하다.
- 객체의 부품화 구현 가능. 타이어 자료형에 한국타이어 객체 또는 금호타이어 객체를 선택적으로 대입할 수 있다.
 - 주의) 상위 개념의 변수에 하위 개념의 객체 저장시 상위 개념의 능력 범위만큼만 사용 가능하다.(-> 부모 메소드만 호출) 단, 오버라이딩(Overriding) 상태인 경우는 자식 메소드가 호출될 수 있다.
```



```java
	// 객체의 자료형과 변수의 자료형이 일치
	SuperClass sup1 = new SuperClass();
	// 객체의 자료형과 변수의 자료형이 불일치
	// -> 자동 타입 변환
	// -> IS-A 관계인 경우만 허용
	// -> 다형성
	// -> 객체의 부품화
	// -> 하위 자료형의 객체를 상위 자료형의 변수에 대입 가능
	SuperClass sup2 = new SubClass01();
	SuperClass sup3 = new SubClass02();
	
	// sup2, sup3 변수는 자료형이 SuperClass 이지만
	// 내부적으로 하위 자료형 객체를 저장하고 있다.
	System.out.println(sup2.toString()); //SubClass01
	System.out.println(sup3.toString()); //SubClass02
	
	// 상위 자료형의 객체를 하위 자료형 변수에 저장 불가
	// SubClass02 sub1 = new SuperClass();	//예) 동물은 사람이다(X)
	
	// sup2, sup3 변수는 자료형이 SuperClass 이지만 내부적으로 하위 자료형 객체를 저장하고 있다.
	// SuperClass 자료형 변수에 저장된 하위 자료형 객체를 원래의 자료형 변수에 저장 가능
	// -> 강제(명시적) 형변환
	SubClass01 sub1 = (SubClass01)sup2;
	
	// 원래의 자료형 변수가 아닌 다른 자료형 변수에는 저장 불가
	SubClass02 sub2 = (SubClass02)sup2; //ClassCastException
	
	// 하위 자료형의 객체를 최상위 자료형의 변수(Object)에 대입 가능
	// 예측이 불가능할 때 Obj를 사용하기도 한다.
	Object obj1 = new SubClass01();
	Object obj2 = new SubClass02();
```

# 다형성 - 주의사항

```java
public class Main {
	public static void main(String[] args) {
    // 자식 클래스의 객체 생성 및 멤버 확인
	SubClass01 sub1 = new SubClass01();
	sub1.method1();		// method1(): SuperClass의 메소드
	sub1.method2();		// method2(): SubClass의 메소드

	// 다형성 구현 및 멤버 확인
	// -> 부모 클래스의 메소드만 접근 가능
	SuperClass sub2 = new SubClass01();
	sub2.method1();
	sub2.method2();		// 컴파일 에러

	// 다형성 구현 및 멤버 확인
	// -> 부모 클래스의 메소드만 접근 가능
	Object sub3 = new SubClass01();
	sub3.method1();		// 컴파일 에러
	sub3.method2();		// 컴파일 에러
	
	// 상위 자료형 변수에 저장된 하위 자료형 객체를 원래 자료형으로 변환
	// -> 강제(명시적) 형변환
	// -> 하위 자료형 클래스의 메소드 접근 가능
	SubClass01 sub4 = (SubClass01)sub3;
	sub4.method1();
	sub4.method2();
	}
}
```
# 다형성 이용하기

### - 배열에는 같은 자료형만 넣을 수 있다

```java
public class SubClass {
	
	// 필드 구성
	// Number 클래스는 다양한 숫자 자료형(정수, 실수)의 부모 클래스
	private Number[] arr = new Number[5];
	
	// 인덱스 관리 전용 변수
	private int idx;
	
	public void add(Number n) {
		arr[idx] = n;
		++idx;
	}
	
	public String list() {
		StringBuilder result = new StringBuilder();

		// [값1, 값2, ...]
		result.append("[");
		for(int i=0; i<arr.length; ++i) {
			if(i<arr.length-1) {
				result.append(String.format("%s, ", arr[i]));
			} else {
				result.append(String.format("%s", arr[i]));
			}
		}
		result.append("]");
		return result.toString();
	}
}
```

```java
public class Main {

	public static void main(String[] args) {
		/*
		Number[] arr2 = new Number[5];
		arr2[0] = 10;
		arr2[1] = 12.34;
		for(Number a : arr2) {
			System.out.println(a);
		}
		*/
		
		SubClass sub = new SubClass();
		sub.add(10); // 정수(int)
		sub.add(12.34); // 실수(double)
		sub.add(100L);	// long
		sub.add(34.56F);	// float
		
		byte a = new Byte("10");
		sub.add(a);	// byte
		
		System.out.println(sub.list()); // [값1, 값2, ...]

	}
}

```
### - OO instanceof XX(참조형) = OO는 XX(참조형)객체입니까?

```java
//부모 역할 클래스
class Animal {
	public void move() {
		System.out.println("Animals can move");
	}
}

// 자식 역할 클래스
class Dog extends Animal {

	// 부모 메소드에 대한 오버라이딩(Overriding)
	@Override
	public void move() {
		System.out.println("Dogs can walk and run");
	}

	// 자식 클래스의 전용 메소드
	public void bark() {
		System.out.println("Dogs can bark");
	}

}

// 자식 역할 클래스
class Cat extends Animal {

	// 부모 메소드에 대한 오버라이딩(Overriding)
	@Override
	public void move() {
		System.out.println("Cats can walk and run");
	}

}

// 실행 테스트 클래스
public class TestDog {

	public static void main(String args[]) {

		// 다형성 구현 및 멤버 확인
		// ->여러개의 Dog, Cat 객체 준비
		// ->Animal 자료형의 배열에 저장

		Animal[] ani = new Animal[5];
		ani[0] = new Dog();
		ani[1] = new Dog();
		ani[2] = new Dog();
		ani[3] = new Cat();
		ani[4] = new Cat();

		for (Animal a : ani) {

			// move() 메소드는 오버라이딩(Overriding) 상태이므로 Dog, Cat 전용 move()가 호출된다.
			a.move();

			// Animal 변수 a에 저장된 객체(Dog 객체, Cat 객체)를 Dog 자료형으로 변환.
			// ->Cat 객체를 Dog 자료형으로 변환하는 경우 오류. ClassCastException
			// ->Dog 객체인지 검사하는 과정 필요
			// ->instanceof 연산자 사용
			if (a instanceof Dog) {
				// Dog 객체인 경우만 형변환 시도
				Dog d = (Dog) a;
				// Dog 클래스의 bark() 메소드 호출
				d.bark();
			}

		}

	}
}
```

​