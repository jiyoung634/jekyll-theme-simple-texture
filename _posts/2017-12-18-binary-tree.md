---
layout: post
title: "Binary Tree"
description: "TreeSet, TreeMap"
categories: [Java]
tags: [BinaryTree, TreeSet, TreeMap]
redirect_from:
  - /2017/12/18/
---

# 이진트리 기반 TreeSet

```java
import java.util.*;

public class Main {

	public static void main(String[] args) {
		// 이진 트리 기반 컬렉션
		// - TreeSet, TreeMap
		// - 검색 기능에 적합한 컬렉션
		// - 이진 트리는 여러 개의 노드가 트리 형태로 연결된 구조로, 
		//   루트 노드라고 불리는 하나의 노드에서부터 시작해서 각 노드에 최대 2개의 노드를 연결할 수 있는 구조.
		// - 이진 트리 구조에서 연결된 두 노드를 부모-자식 관계에 있다고 한다.
		// - 이진 트리가 범위 검색을 쉽게 할 수 있는 이유는 값들이 정렬되어 있어 그룹핑이 쉽기 때문이다.
		
		// 크기 비교가 가능한 객체만 취급. ex) 래퍼 클래스(Integer 등), String 클래스
		// 사용자 정의 클래스는 크기 비교를 위해서 compareTo() 메소드에 대한 오버라이딩 필요.
		TreeSet<Integer> scores = new TreeSet<Integer>();
		
		// Integer 객체를 TreeSet 컬렉션에 저장
		scores.add(new Integer(50));
		scores.add(new Integer(10));
		scores.add(new Integer(90));
		scores.add(new Integer(70));
		scores.add(new Integer(50));
		
		System.out.printf("가장 낮은 점수: %s%n", scores.first());
		System.out.printf("가장 높은 점수: %s%n", scores.last());
		System.out.printf("기준 값(%s)보다 낮은 점수:%s%n", new Integer(50), scores.lower(50));
		System.out.printf("기준 값(%s)보다 높은 점수:%s%n", new Integer(50), scores.higher(50));
		
		
		// 정렬 지원 -> 내림차순
		System.out.println("----------------");
		NavigableSet<Integer> desc = scores.descendingSet();
		for(Integer i : desc) {
			System.out.println(i);
		}
		
		  //정렬 지원: 오름차순 (똑같은 명령 한 번 더 내리면 내림->오름 순서 바뀜)
        NavigableSet<Integer> asc = desc.descendingSet();
        for (Integer i : asc) {
              System.out.println(i);
        } 
	}
}

```

​