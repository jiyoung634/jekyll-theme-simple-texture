---
layout: post
title: "Calculate Day of the Week"
description: "Calculate Day of the Week"
categories: [algorithm, Java]
tags: [algorithm, Weekday, Day of Week]
redirect_from:
  - /2018/04/13/
---



# 요일 계산 알고리즘

```java
package com.test;

import java.util.Scanner;

public class Main6 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("월을 입력하세요");
			int M = sc.nextInt();

			System.out.println("일을 입력하세요");
			int D = sc.nextInt();
			if(D==0)
				break;

			int[] MD = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
			String[] WD = { "수", "목", "금", "토", "일", "월", "화" };

			int DAL = M - 1;
			int NAL = D - 1;

			for (int i = 1; i <= DAL; ++i) {
				NAL += MD[i];
			}

			int W = NAL % 7;

			String day = WD[W];

			System.out.println(day+"요일입니다");
		}

	}

}

```
