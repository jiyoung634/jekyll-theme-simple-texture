---
layout: post
title: "Paper Money Counting"
description: "Paper Money Counting"
categories: [algorithm, Java]
tags: [algorithm, Paper Money Counting]
redirect_from:
  - /2018/04/12/
---



# 급여 계산/ 지폐 매수 계산 알고리즘

```java
package com.test;

public class Main5 {

	public static void main(String[] args) {
		String[] members = { "홍길동", "김철수", "이순신", "STOP" };
		int[] salary = { 532263, 307349, 152830, 0 };
		int[][] counts = new int[members.length-1][9];
		int idx = 0;
		int sum=0;


		while (!members[idx].equals("STOP")) {
			int M = 10000; // 화폐 단위
			int SW = 1; // SW=1일 때 1/2, SW=-1일 때 1/5
			int S =salary[idx]; // 다음 멤버의 급여 불러오기
			int K = 0; // 임시변수
	
			for (int i = 0; i < counts[idx].length; ++i) {
				K = S / M; // 몇 장 필요한가
				counts[idx][i] = K; // 몇 장 줘야 되는지 계산해서 배열에 집어넣기
				S -= K * M; // 금액 차감
				if (SW == 1) {
					M /= 2;
				} else {
					M /= 5; // 화폐 단위 전환
				}
				SW *= -1; // 스위치
			}
			
			++idx;
		}
		
		System.out.println("  성명  출장비   만원 오천원 천원 오백원 백원 오십원 십원 오원 일원");
		System.out.println("-------------------------------------------------------------------");
		for(int i=0; i<counts.length; ++i) {
			System.out.printf("%3s %6d ", members[i], salary[i]);
			for(int j=0; j<counts[i].length; ++j) {
				System.out.printf("%5d ",counts[i][j]);
			}
			System.out.println();
		}

		System.out.println("-------------------------------------------------------------------");
		System.out.print("전체화폐매수 ");
		for(int i=0; i<counts[0].length; ++i) {
			sum=0;
			for(int j=0; j<counts.length;++j){
				sum+=counts[j][i];
			}
			System.out.printf(" %5d", sum);
		}
	}
}

```

