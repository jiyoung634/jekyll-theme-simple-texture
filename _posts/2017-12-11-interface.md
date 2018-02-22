---
layout: post
title: "Interface"
description: "Interface"
categories: [Java]
tags: [interface]
redirect_from:
  - /2017/12/11/
---



# 인터페이스(Interface)

```java


public interface Super {
 // 추상화
 /*
 - 사전적 의미: 여러 가지 사물이나 개념에서 공통되는 특성이나 속성 따위를 추출하여 파악하는 작용.
 - 예) '남자', '여자'라는 표현에서 공통적인 특성을 표현한다면 '사람'이라고 표현 가능.
 - 추상화 과정에서 추상은 구체적인 표현보다는 개념적인 표현을 사용한다.
 - 구체적 구현 전에 개념적 표현부터 정의할 때 추상화 사용.
 - 추상화 구현은 일부만 구현한 경우 추상클래스(abstract class), 전체적으로 구현한 경우 인터페이스(interface)로 구현.
 */
    	
// 인터페이스(interface)
/*	 
- 필드, 메소드(생성자, getter, setter 포함)로 구성된다.
- 추상 메소드로 구성된 추상 전용 클래스. public abstract 키워드 생략된 형태로 선언.
- 추상 메소드는 메소드 시그니처만 존재하고 구현 내용(코드 블럭 전체)이 없다. 
- 예) Cat 클래스와 Dog 클래스가 있다. 둘 다 bark() 메소드가 존재한다. Cat은 '야옹', Dog는 '멍멍'이라고 해야 한다. Animal 인터페이스에서 bark() 메소드는 추상 메소드로 선언한다. 
    	 			 		
- 형식
 public interface 인터페이스명 {
  // 상수 필드
  // 추상 메소드
  // 디폴트 메소드(자바8 이후)
  // 정적 메소드(자바8 이후)
    	 		  
  // 상수 구현(public static 생략)
    자료형 상수명 = 값;  
    	 		  
  // 추상 메소드 구현(public abstract 생략)
    반환자료형 메소드명(매개변수 리스트);
    	
  // 디폴트 메소드 구현(public 생략)
    default 반환자료형 메소드명(매개변수 리스트);
    	
  // 정적 메소드 구현(public 생략)
    static 메소드명(매개변수 리스트);
   }
    	 	
 - 주의) 자기 자신을 가지고 객체 생성 불가. 부모 클래스 역할만 한다(상속이 전제조건).
 - 인터페이스는 자식 클래스에 대한 가이드(설계도) 역할이다.
 - 자식 클래스에서 인터페이스를 상속 받을 때 전용 키워드(implements) 사용. 다중 상속 허용. 일반 상속(extends)과 같이 표기 가능.
 - 자바8 이후부터는 추상 메소드 외에 디폴트 메소드, 정적 메소드 추가 가능.
 - 자식 클래스는 인터페이스의 추상 메소드에 대한 오버라이딩 의무 사항.
*/
  }

 // 부모 역할 클래스(인터페이스)
 public interface RemoteControl {
 // 상수
    int MAX_VOLUME = 10;
    int MIN_VOLUME = 0;
    	
 // 추상 메소드
    
    void turnOn();
    void turnOff();
    void setVolume(int volume);
   }
    

 // 자식 클래스(인터페이스 구현)
  public class Television implements RemoteControl {
    
  // 전용 필드 추가
    private int volume;
    private int turnOnOff;
    
    @Override
    public void turnOn() {
    	System.out.println("TV를 켭니다");
    	this.turnOnOff = 1;
    }
    
    @Override
    public void turnOff() {
    	this.turnOnOff = 0;
    	System.out.println("TV를 끕니다");
    }
    
    @Override
    public void setVolume(int volume) {
    // TV 볼륨 조절 액션 추가
    // 주의) 최대(MAX_VOLUME) 최소 볼륨(MIN_VOLUME) 범의를 벗어날 수 없도록 설정.
    	if (this.turnOnOff == 1) {
    		if (volume > RemoteControl.MAX_VOLUME) {
    			this.volume = RemoteControl.MAX_VOLUME;
    		} else if (volume < RemoteControl.MIN_VOLUME) {
    			this.volume = RemoteControl.MAX_VOLUME;
    		} else {
    			this.volume = volume;
    		}
    			System.out.printf("현재 TV 볼륨 : %d%n", this.volume);
    		}
    	}
    }
    

```



# 익명 구현 객체

```java
// 부모 역할 클래스(인터페이스)
public interface RemoteControl {
	// 상수
	int MAX_VOLUME = 10;
	int MIN_VOLUME = 0;
	
	// 추상 메소드

	void turnOn();
	void turnOff();
	void setVolume(int volume);
}
```

```java
public class Main {

	public static void main(String[] args) {
		// 익명 구현 객체
		// 인터페이스는 추상이므로 자기 자신을 가지고 객체 생성 할 수 없다.
		// 하지만, 인터페이스를 명시적으로 구현한 클래스 없이 바로 객체 생성 가능.
		// 인터페이스를 상속 받아서 일시적으로 추상 메소드를 오버라이딩 할 목적으로 사용하는 임시 객체.
		
		// 다형성 구현
		RemoteControl rc = new RemoteControl() {
			
			@Override
			public void turnOn() {
				System.out.println("TV를 켭니다");
							
			}
			
			@Override
			public void turnOff() {
				System.out.println("TV를 끕니다");
				
			}
			
			@Override
			public void setVolume(int volume) {
				System.out.println("볼륨 조절");
				
			}
		};
		
		rc.turnOn();
		rc.setVolume(10);
		rc.turnOff();
		}
}
```



# 다중 상속

```java
// 부모 역할 클래스(인터페이스)
public interface Super01 {

	// 추상 메소드(public abstract 키워드 생략)
	void method1();
}
```

```java
//부모 역할 클래스(인터페이스)
public interface Super02 {

	// 추상 메소드(public abstract 키워드 생략)
	void method2();
}
```

```java
// 다중 상속에 의한 인터페이스 구현
// 주의) 상속 받은 모든 인터페이스의 추상 메소드에 대한 오버라이딩 의무 사항
// 주의) 일반 클래스는 다중 상속을 지원하지 않는다.
// ex) 복합기(통신+인쇄)처럼, 팩스, 스캔, 프린트 기능을 동시에 가지고 있는 기기
public class SubClass implements Super01, Super02 {
	@Override
	public void method1() {
		// TODO Auto-generated method stub

	}

	@Override
	public void method2() {
		// TODO Auto-generated method stub

	}	
}
```


# 강한 결합 (권장x)

```java
public class Main {

	public static void main(String[] args) {
		// 강한 결합 설정 테스트
		
		// Sample 객체에서 사용할 SubClass01 객체 생성 -> 한국 타이어 객체라고 가정
		SubClass01 sub = new SubClass01();
		// Sample 객체에서 사용할 SubClass02 객체 생성 -> 금호 타이어 객체라고 가정 -> 현재는 사용 불가
		// SubClass02 sub = new SubClass02();
		
		// 생성자를 이용한 SubClass01 객체 전달
		Sample obj = new Sample(sub); // -> 자동차 객체라고 가정
		
		// SubClass01 객체 확인
		System.out.println(obj.getSub());
		
		// SubClass01 메소드 호출 -> Sample 클래스의 메소드를 이용한 간접 호출
		obj.method();

	}
}
```

```java
public class Sample {
	// SubClass01 또는 SubClass02 객체를 사용하는 입장 -> 포함 관계
	// 포함 관계 적용시 해당 객체를 명시적 지정하지 않고 추상 객체를 이용해서 연결하는 것을 권장 -> 약한 결합
	
	// 해당 객체를 명시적 지정 -> 강한 결합
	private SubClass01 sub;

	
	
	public Sample() {
		
	}
	
	public Sample(SubClass01 sub) {
		this.sub = sub;
	}

	
	
	public SubClass01 getSub() {
		return sub;
	}

	public void method() {
		// SubClass01의 전용 메소드 호출
		this.sub.method();
	}
	
}
```

```java
public class SubClass01 implements Super {

	@Override
	public void method() {
		System.out.println("SubClass01의 오버라이딩 메소드");
		
	}
}
```

```java
public class SubClass02 implements Super {

	@Override
	public void method() {
		System.out.println("SubClass02의 오버라이딩 메소드");
		
	}

}
```

```java
// 부모 역할 클래스(인터페이스)
public interface Super {
	
	// 추상 메소드(public abstract 키워드 생략)
	void method();

}
```



# 약한 결합

```java
public class Main {

	public static void main(String[] args) {
		// 약한 결합 설정 테스트
		
		// Sample 객체에서 사용할 SubClass01 객체 생성 -> 한국 타이어 객체라고 가정
		// SubClass01 sub = new SubClass01();
		// Sample 객체에서 사용할 SubClass02 객체 생성 -> 금호 타이어 객체라고 가정 -> 현재는 사용 가능
		SubClass02 sub = new SubClass02();
		
		// 생성자를 이용한 SubClass01 객체 전달 또는 SubClass02 객체 전달
		// 주의) Super인터페이스를 구현한 모든 자식 클래스를 자식 객체로 전달 가능
		Sample obj = new Sample(sub); // -> 자동차 객체라고 가정
		
		// SubClass01 객체 확인
		System.out.println(obj.getSub());
		
		// SubClass01 메소드 호출 -> Sample 클래스의 메소드를 이용한 간접 호출
		obj.method();

	}

}
```

```java
public class Sample {
	// SubClass01 또는 SubClass02 객체를 사용하는 입장 -> 포함 관계
	// 포함 관계 적용시 해당 객체를 명시적 지정하지 않고 추상 객체를 이용해서 연결하는 것을 권장 -> 약한 결합
	
	// 해당 객체를 추상적 객체(인터페이스)로 지정 -> 약한 결합
	// SubClass01 또는 SubClass02 객체의 부모 역할 인터페이스 -> Super
	private Super sub;

	
	
	public Sample() {
		
	}
	// 매개변수에 의한 다형성 구현
	public Sample(Super sub) {
		this.sub = sub;
	}

	
	
	public Super getSub() {
		return sub;
	}

	public void method() {
		// 인터페이스 Super의 자식 클래스(SubClass01 또는 SubClass02)에 대한 오버라이딩 메소드 호출
		this.sub.method();
	}
	
}
```

```java
public class SubClass01 implements Super {

	@Override
	public void method() {
		System.out.println("SubClass01의 오버라이딩 메소드");
		
	}
}
```

```java
public class SubClass02 implements Super {

	@Override
	public void method() {
		System.out.println("SubClass02의 오버라이딩 메소드");
		
	}

}

```

```java
// 부모 역할 클래스(인터페이스)
public interface Super {
	
	// 추상 메소드(public abstract 키워드 생략)
	void method();

}
```



# 디폴트 메소드

```java
public class Main {

	public static void main(String[] args) {
		
		// 인터페이스의 디폴트 메소드 확인
		
		// 디폴트 메소드 -> 인터페이스를 구현한 모든 자식 객체의 공통 메소드
		// 자식 객체를 부모 자료형 변수에 저장 가능 -> 다형성
		Super sub01 = new SubClass01();	
		sub01.method();
		
		Super sub02 = new SubClass02();
		sub02.method();
		
		// 주의) 다형성 구현시 부모 객체의 멤버만 접근 가능
		// sub02.method2();
		SubClass02 sub03 = (SubClass02)sub02;
		sub03.method2();
		sub03.method();
	
	}
}
```

```java
public class SubClass01 implements Super {
	
	// 인터페이스의 기본 메소드가 포함된 상태

	void method1() {
		System.out.println("SubClass01의 전용 메소드");
	}
}
```

```java
public class SubClass02 implements Super {

	// 인터페이스의 기본 메소드가 포함된 상태

	void method2() {
		System.out.println("SubClass02의 전용 메소드");
	}
}
```

```java
public interface Super {
	 // 디폴트 메소드
	 // 주의) 자바8 이후에만 사용 가능
	
	 /*
	 - 형식
	 public interface 인터페이스명 {
	 	// 디폴트 메소드 구현(public 생략)
	 	default 반환자료형 메소드명(매개변수 리스트);{
	 	}
	}
	*/
	 
	// 주의) 인터페이스는 객체 생성 할 수 없기 때문에 디폴트 메소드를 자식 객체를 통해서 사용해야 한다.
	// 인터페이스를 구현하는 구현 객체가 기본으로 가지는 메소드. 오버라이딩 가능.
	
	default void method() {
		System.out.println("인터페이스의 디폴트 메소드 호출");
	}
}
```

​