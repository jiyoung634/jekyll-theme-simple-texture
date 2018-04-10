---
layout: post
title: "Insertion Sort"
description: "Insertion Sort"
categories: [algorithm, Java]
tags: [algorithm, Insertion sort]
redirect_from:
  - /2018/04/10/
---



# 삽입정렬(Insertion Sort)

```java
package com.test;

import java.util.Arrays;

public class Main3 {

	public static void main(String[] args) {
		int[] arr = { 30, 50, 20, 80, 70, 40, 20, 50,50, 60, 90, 100};
		int temp = 0;

		for (int i = 1; i < arr.length; ++i) {
			// key를 임시로 빼놓기
			temp = arr[i];
			for (int j = i - 1; j >= 0; --j) {
				// key와 비교하는 숫자가 key보다 큰 경우 
				if(temp<arr[j]) {
					arr[j+1]=arr[j];
					// key와 비교하는 모든 숫자가 key보다 커서 index가 0까지 내려간 경우
					if(j==0) {
						arr[j]=temp;
					}
				// key와 비교하는 숫자가 key보다 작은경우 
				} else {
					arr[j+1]=temp;
					break;
				}
			}
		}
		
		System.out.println(Arrays.toString(arr));
	}
}

```
