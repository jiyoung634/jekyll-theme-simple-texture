---
layout: post
title: "Comparable/Comparator Interface"
description: "Comparable/Comparator Interface"
categories: [Java]
tags: [Comparable, Comparator]
redirect_from:
  - /2017/12/18/
---

# Comparable

```java
//Comparable 인터페이스 구현 클래스
public class Member implements Comparable<Member> {

	private String name;
	private String phone;

	public Member() {
	}

	public Member(String name, String phone) {
		this.name = name;
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	@Override
	public int compareTo(Member o) {
		
		// 정렬 액션에 사용할 기준 제시
		// 결과값이 0이면 동일한 상태, 양수 또는 음수이면 나와 상대 객체의 비교 결과
		// -> 값(항목) 비교
		
		// 문자열 비교시 compareto() 메소드 사용
		return this.name.compareTo(o.getName());
	}
  
  @Override

  	public String toString() {

  		return String.format("%s, %s", this.name, this.phone);

  	}

  	// 컬렉션 저장소 운영에서 객체 삭제 기준을 제시하기 위한 오버라이딩 구현

  	// Object 클래스에서 equals() 메소드는 참조주소 비교

  	// Member 클래스에서는 equals() 메소드가 이름 항목을 비교하려고 한다.

  	@Override

  	public boolean equals(Object obj) {

  		boolean result = false;

  		if(obj instanceof Member) {

  			Member m = (Member)obj;

  			if(this.name.equals(m.getName())) {

  				result = true;

  			}

  		}
      		return result;
    }
}
```






  ```java

  	
import java.util.*;

  public class Main {

  	public static void main(String[] args) {
  		// - 사용자 정의 객체가 저장된 컬렉션에 대한 정렬 지원
  		// - 사용자 정의 객체는 기본적으로 정렬이 되지 않는다. 내부적으로 참고 주소만을 비교하기 때문이다.
  		// - Comparable 인터페이스 구현 또는 Comparator 인터페이스 

  		Member m1 = new Member("hong", "010-1234-1234");
  		Member m2 = new Member("park", "010-4567-4576");
  		Member m3 = new Member("choi", "010-6543-4321");
  		
  		// 컬렉션 저장소 준비 및 자료 저장
  		List<Member> list = new ArrayList<Member>();
  		list.add(m1);
  		list.add(m2);
  		list.add(m3);
  		
  		// 이름 기준 정렬
  		Collections.sort(list);
  		
  		// 전체 출력
  		for(Member m :list) {
  			System.out.println(m);
  		}
  	}
  }
  ```

  ​

# Comparator

```java
public class Member  {

	private String name;
	private String phone;

	public Member() {
	}

	public Member(String name, String phone) {
		this.name = name;
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}
  @Override

  	public String toString() {

  		return String.format("%s, %s", this.name, this.phone);

  	}

  	// 컬렉션 저장소 운영에서 객체 삭제 기준을 제시하기 위한 오버라이딩 구현

  	// Object 클래스에서 equals() 메소드는 참조주소 비교

  	// Member 클래스에서는 equals() 메소드가 이름 항목을 비교하려고 한다.

  	@Override

  	public boolean equals(Object obj) {

  		boolean result = false;

  		if(obj instanceof Member) {

  			Member m = (Member)obj;

  			if(this.name.equals(m.getName())) {

  				result = true;

  			}

  		}
      		return result;
    }
}
```


  ```java

 
  import java.util.*;

  public class Main {

  	public static void main(String[] args) {
  		// - 사용자 정의 객체가 저장된 컬렉션에 대한 정렬 지원
  		// - 사용자 정의 객체는 기본적으로 정렬이 되지 않는다. 내부적으로 참고 주소만을 비교하기 때문이다.
  		// - Comparable 인터페이스 구현 또는 Comparator 인터페이스 

  		Member m1 = new Member("hong", "010-1234-1234");
  		Member m2 = new Member("park", "010-4567-4576");
  		Member m3 = new Member("choi", "010-6543-4321");
  		
  		// 컬렉션 저장소 준비 및 자료 저장
  		List<Member> list = new ArrayList<Member>();
  		//저장소 크기 관리, 인덱스 관리가 자동으로 진행된다.
  		list.add(m1);
  		list.add(m2);
  		list.add(m3);
  		
  		// 정렬 기준 제시 필요
  		// 익명 구현 객체 내부에서 사용될 변수인 경우, final 특성을 가지는 변수여야 한다.
  		// 자바8 이후부터는 final 키워드 생략 가능
  		String key = "phone";
  		Collections.sort(list, new Comparator<Member>() {
  			@Override
  			public int compare(Member o1, Member o2) {
  				int result =0;
  				if(key.equals("name")) {
  					// 이름 기준(오름차순) 정렬
  					// 내림차순 정렬인 경우 o2, o1 순으로 비교
  					result = o1.getName().compareTo(o2.getName());
  				} else if (key.equals("phone")) {
  					// 전화번호 기준(오름차순) 정렬
  					result = o1.getPhone().compareTo(o2.getPhone());
  				}
  				return result;
  			}
  		});
  		
  		// 전체 출력
  		for(Member m :list) {
  			System.out.println(m);
  		}
  	}
  }
  ```

  ​