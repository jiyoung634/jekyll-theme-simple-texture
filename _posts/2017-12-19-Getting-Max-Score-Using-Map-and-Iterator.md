---
layout: post
title: "Getting Max Score Using Map & Iterator"
description: "Getting Max Score Using Map & Iterator"
categories: [algorithm, Java]
tags: [algorithm, max score, max value, map, iterator]
redirect_from:
  - /2017/12/19/
---



```java
import java.util.*;

public class MapExample {

	public static void main(String[] args) {
		// Map<String, Integer>에서 키(아이디)는 String 자료형, 값(점수)은 Integer 자료형
		// 키는 중복 불가, 값은 중복 가능
		// properties는 <String, String>으로 제한한다. (표시x)
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("blue", 96); // int -> Integer, 암시적 형변환 지원. AutoBoxing(기본자료형을 Wrapper 클래스 형태로 감싸는 것).
		map.put("hong", new Integer(86));
		map.put("white", 92);
		map.put("park", 70);
		map.put("choi", 80);
		
		// 최고점수(아이디 포함), 평균점수, 점수합계 출력
		String name = null;
		int maxScore = 0;
		int totalScore = 0 ;
		double avgScore = 0.0;
		
		
		// 반복문 -> Iterator
		Set<String> keySet = map.keySet();
		Iterator<String> iterator =  keySet.iterator();
		while(iterator.hasNext()) {
			String key = iterator.next();
			int value = map.get(key); // ->Integer -> int, AutoUnBoxing
			
			// 최고점수	
			if (maxScore <= value) {
				maxScore = value;
				name = key;
			}
			
			// 합계
			totalScore += value;

			// 평균
			avgScore = totalScore/5.0;
			 
			};
			
			

		

		
		
		System.out.printf("최고점수: %s - %s%n", name , maxScore);
		System.out.printf("점수합계: %s%n", totalScore);
		System.out.printf("평균점수: %s%n", avgScore);
		
	}

}

```

