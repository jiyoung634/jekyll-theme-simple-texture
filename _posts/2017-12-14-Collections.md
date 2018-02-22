---
layout: post
title: "Collections"
description: "Collections"
categories: [Java]
tags: [collections, list, set, map]
redirect_from:
  - /2017/12/14/
---

```java
// 컬렉션 프레임워크
		/*
		 - 컬렉션(Collection)은 자바에서 객체를 수집해서 저장하는 역할을 하는 클래스들의 집합체이다.
		 - 컬렉션은 배열과 유사하지만, 배열의 단점(크기 관리, 추가, 삭제)을 해소할 수 있는 기능을 갖고 있다.
		 - List, Set, Map 인터페이스를 구현한 클래스들의 집합체이다. 
		 - java.util 패키지에 속해 있다.
		 - List 인터페이스 특징 : 값만 저장된다. 인덱스 제공. 저장 순서를 유지한다. 중복 저장 가능. 정렬 기능이 지원된다. 대표적인 구현 클래스는 ArrayList 클래스이다.
		 - Set 인터페이스 특징 : 값만 저장한다. 인덱스 제공. 저장 순서가 유지되지 않는다. 중복 저장 불가. 정렬 기능이 지원되지 않는다. 대표적인 구현 클래스는 HashSet 클래스이다.
		 - Map 인터페이스 특징 : 키와 값의 쌍으로 자료 저장. 인덱스 제공되지 않는다. 키(Set)는 중복 저장 불가. 값(List)은 중복 저장 가능. 키를 이용해서 값 접근. 대표적인 구현 클래스는 HashMap 클래스.
		 						 대표적인 구현 클래스는 HashMap 클래스.
		 */
```



# List

```java
import java.util.*;

public class Main {

	public static void main(String[] args) {	
	// List 인터페이스
	// - 값만 저장된다.
	// - 인덱스 제공.
	// - 저장 순서를 유지한다.
	// - 중복 저장 가능.
	// - 정렬 기능이 지원된다.
	// - 대표적인 구현 클래스는 ArrayList 클래스이다.

	// ArrayList 클래스를 이용한 컬렉션 저장소 준비
	// -> 메모리 상의 크기는 자동 관리된다.
	// -> 초기 크기 지정 불필요.
	// -> 컬렉션 저장소 준비할 때 제네릭 표현에 의해 저장 가능한 객체의 종류가 제한된다.
		List<String> list = new ArrayList<String>();	// 인터페이스 다형성
		
	// add() 메소드를 이용해서 자료 저장. 끝 위치에 저장.
	// 저장 순서를 유지한다.
		list.add("hong");
		list.add("park");
		list.add("choi");
		
	// get() 메소드를 이용해서 특정 자료를 꺼낼 수 있다.
	// 특정 자료를 꺼내는 경우 인덱스 사용.
		System.out.println(list.get(0));	// hong
		System.out.println(list.get(1));	// park
		System.out.println(list.get(2));	// choi
		
	// 자료 전체를 꺼내는 경우 향상된 for문 사용
	// null 자료는 자동 제외된다.
		for(String s : list) {
			System.out.println(s);
		}
		
	// 인덱스를 이용해서 일반 for문으로 전체 출력 가능
	// -> 자료 개수 파악을 위해서 size() 메소드 필요. (null 자료는 자동 제외된다.)
		for (int i=0; i<list.size(); ++i) {
			System.out.printf("index[%d]: %s%n", i, list.get(i));
		}
      
     // 특정 위치에 자료 추가 가능 (자주 쓰는 기능은 아니다. 정렬이 가능하므로.)
		list.add(1, "kim");
		System.out.println("------------");
		for(String s : list) {
			System.out.println(s);
		}
		
	// 특정 위치의 자료를 새로운 자료로 덮어쓰기 가능. 수정 액션.
		list.set(1, "lee");
		System.out.println("------------");
		for(String s : list) {
			System.out.println(s);
        }
    // 자료 검색 기능
		System.out.println("------------");
		System.out.println(list.contains("lee"));
		System.out.println(list.contains("kim"));
		System.out.println(list.indexOf("lee"));
		System.out.println(list.indexOf("kim"));
	// 자료 존재 여부 확인
		System.out.println("------------");
		System.out.println(list.isEmpty());
		
	// 자료 개수 확인
		System.out.println("------------");
		System.out.println(list.size());
		
	// 특정 자료 삭제
		System.out.println("------------");
		list.remove(1);
		list.remove("hong");
		for(String s : list) {
			System.out.println(s);
		}
		
	// 전체 자료 삭제
		System.out.println("------------");
		list.clear();
		System.out.println(list.isEmpty());
		
	// 다량의 자료 추가. 배열 자료형을 List 자료형으로 형변환.
		System.out.println("------------");
		String[] arr = {"Test", "Sample", "Java", "Collection"};
		List<String> list2 = Arrays.asList(arr);
		for(String s : list2) {
			System.out.println(s);
		}
		
	// List 자료형을 배열 자료형으로 형변환.
		System.out.println("------------");
		List<String> list3 = new ArrayList<String>();
		list3.add("1");
		list3.add("2");
		list3.add("3");
		list3.add("4");
		Object[] arr2 = list3.toArray();
		System.out.println(Arrays.toString(arr2));
		
	}
}

```

- Vector 클래스는  ArrayList 클래스와 동일한 내부 구조를 가지고 있다. Vector 클래스는 멀티스레드 환경에서 Thread Safe 기능을 제공한다.

- 빈번한 삭제, 추가 작업 진행시 ArrayList는 구성 요소를 재구성하는 과정이 필요하다. LinkedList는 인접한 링크에 대한 재구성만 하면 된다.


# Set

```java
import java.util.*;

public class Main {

	public static void main(String[] args) {
		// Set 인터페이스
		// - 값만 저장된다.
		// - 저장 순서가 유지되지 않는다.
		// - 중복 저장 불가.
		// - 정렬 기능이 지원되지 않는다.
		// - 대표적인 구현 클래스는 HashSet 클래스이다.

		// HashSet 클래스를 이용한 컬렉션 저장소 준비
		// -> 메모리 상의 크기는 자동 관리된다.
		// -> 초기 크기 지정 불필요.
		// -> 컬렉션 저장소 준비할 때 제네릭 표현에 의해 저장 가능한 객체의 종류가 제한된다.
		Set<String> set = new HashSet<String>();

		// add() 메소드를 이용해서 자료 저장.
		// 저장 순서가 유지되지 않는다. 중복 저장 불가.
		set.add("hong");
		set.add("park");
		set.add("choi");
		set.add("hong"); // 저장 제외. 중복 저장 불가. 내부적으로 equals() 메소드를 이용해서 비교.
		
		// get() 메소드를 이용해서 특정 위치의 자료를 꺼낼 수 없다.
		// System.out.println(set.get(0)); // 
		
		// 자료 전체를 꺼내는 경우 Iterator(반복자) 사용
		Iterator<String> iterator = set.iterator();
		while(iterator.hasNext()) {		// 존재합니까?
			String temp = iterator.next();		// 존재한다면 꺼내주세요.
			System.out.println(temp);
		}
		
		// 자료 전체를 꺼내는 경우 향상된 for문 사용.
		for(String s : set) {
			System.out.println(s);
		}
		
		// 자료 검색
		System.out.println("-------------");
		System.out.println(set.contains("hong"));
		System.out.println(set.contains("test"));
		
		// 특정 자료 삭제
		// 주의) 특정 위치를 이용한 자료 삭제 액션 불가
		System.out.println("-------------");
		set.remove("hong");
		for(String s : set) {
			System.out.println(s);
		}
		
		// 전체 자료 삭제
		System.out.println("-------------");
		set.clear();
	}
	}
```



# Set을 List로 바꿔서 정렬하는 액션 코드

```java
Set<Member>set = new HashSet<Member>();
List<Member> list = new ArrayList<Member>(set);
Collections.sort(list, new Comparator<Member>(){
		@Override
		public int compare(Member o1, Member o2) {
		return o1.getName().compareTo(o2.getName());
			}
		}); 
```

​

# Map

```java
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
public class Main {

	public static void main(String[] args) {
		// Map 인터페이스 특징
		// - 키와 값의 쌍으로 자료 저장. 
		// - 인덱스 제공되지 않는다. 
		// - 키(Set)는 중복 저장 불가. 
		// - 값(List)은 중복 저장 가능. 
		// - 키를 이용해서 값 접근. 
		// - 대표적인 구현 클래스는 HashMap 클래스.
		
		// 제네릭 표현시 <키, 값> 자료형 표기 필요
		// 키는 주로 Integer, String 자료형을 사용한다.
		Map<String, String> map = new HashMap<String, String>();
		
		// put(키, 값) 형태로 자료 입력
		// 키는 중복 불가, 값은 중복 가능
		map.put("A001", "TEST");
		map.put("A002", "SAMPLE");
		map.put("A003", "JAVA");
		map.put("A004", "ORACLE");
		
		// get() 메소드를 이용해서 특정 자료를 꺼낼 수 있다.
		// 특정 자료를 꺼내는 경우 키 사용.
		System.out.println("---------------");
		System.out.println(map.get("A001"));
		System.out.println(map.get("A002"));
		System.out.println(map.get("A003"));
		System.out.println(map.get("A004"));
		
		// 주의) 자료 전체를 꺼내는 경우 향상된 for문 사용 불가.
		
		// 자료 전체를 꺼내는 경우 Iterator(반복자) 사용
		// -> 키들의 집합(set)을 가지고 반복문 진행하고, 각각의 키별로 값 접근.
		// 주의) 키들의 집합체는 Set 컬렉션이므로 순서대로 출력되지 않는다.
		System.out.println("---------------");
		Set<String> keySet = map.keySet();
		Iterator<String> iterator = keySet.iterator();
		while(iterator.hasNext()) {
			String key = iterator.next();
			System.out.printf("%s, %s%n", key, map.get(key));
		}
		
		// 문제) 키들을 정렬시켜서 출력하도록 코드 작성.
		/*
		 A001, TEST
		 A002, SAMPLE
		 A003, JAVA
		 A004, ORACLE
		 */
		
		
	
		// "정렬" -> list
		List<String> list = new ArrayList<String>(keySet);
		Collections.sort(list, new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				return o1.compareTo(o2); // 숫자 비교는 - 연산, 문자 비교는 compareTo()
			}
		});
		
		System.out.println("-------------");
		for (String key : list) {
			System.out.printf("%s, %s%n", key, map.get(key));
		}
		
		// 자료 검색
		System.out.println("-------------");
		System.out.println(map.containsKey("A001"));
		System.out.println(map.containsKey("A000"));
		System.out.println(map.containsValue("TEST"));
		System.out.println(map.containsValue("Jsp"));
		
		// 자료 존재 여부
		System.out.println("------------");
		System.out.println(map.isEmpty());
		
		// 자료 개수 확인
		System.out.println("------------");
		System.out.println(map.size());
		
		// Map 컬렉션에서 자료들의 집합체를 반환 받을 수 있다.
		Collection<String> collections = map.values(); // Collection<값 자료형>
		for(String c : collections) {
			System.out.println(c);
		}
		// 특정 자료 삭제
		// 주의) 특정 키를 이용한 자료 삭제 액션
		System.out.println("-------------");
		map.remove("A001");
		Set<String> keySet2 = map.keySet();
		Iterator<String> iterator2 = keySet2.iterator();
			while(iterator2.hasNext()) {
				String key = iterator2.next();
				System.out.printf("%s, %s%n", key, map.get(key));
			}
		

		// 전체 자료 삭제
		System.out.println("-------------");
		map.clear(); 
	}

}
```

​