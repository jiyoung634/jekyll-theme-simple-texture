---
layout: post
title: "Regular Expressions"
description: "Regular Expressions"
categories: [Java]
tags: [regular expressions]
redirect_from:
  - /2017/12/14/
---



# 정규식 표현(Regular Expressions)

```java
public class Main {
    public static void main(String[] args) {
    	// 정규표현식을 이용한 문자열 패턴 검사
    	// 정규표현식을 만들 수 있는 전용 특수문자를 이용해서 패턴식을 만들어야 한다.
    	// ex) "010-1234-1234"와 같은 전화번호 문자열인 경우, "010"으로 시작하는 문자열인지 검사할 수 있다.
    		
    	// () - 그룹핑
    	// | - or 연산
    	// \d - 숫자 전용
    	// {n} - 고정 자릿수 지정
    	// {n, m} - 자릿수 범위 지정
    	// 기타 나머지 문자 - 고정 문자열
    	String phonePattern = "010-\\d{4}-\\d{4}";
    		
    	String sample1 = "010-1234-1234";
    	String sample2 = "02-1234-1234";
    		
    	System.out.println(Pattern.matches(phonePattern, sample1));
    	System.out.println(Pattern.matches(phonePattern, sample2));
    	}
    }
```

