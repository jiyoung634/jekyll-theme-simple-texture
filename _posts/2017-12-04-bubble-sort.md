---
layout: post
title: "Bubble Sort"
description: "Bubble Sort"
categories: [Java]
tags: [bubble sort]
redirect_from:
  - /2017/12/04/
---



# 버블정렬(Bubble Sort)

```java
		public static void main(String[] args) {
		// 배열 요소 정렬
		
		// 정렬 : 요소를 크기순으로 나열하는 행위 (오름차순/내림차순)
		// 정렬 알고리즘(Bubble) - 두 인접한 원소를 검사하여 정렬하는 방법을 적용한 정렬
		
		/*
		 1. 배열 요소에 정렬되지 않은 기본자료형 요소 준비 -> 5개
		 2. 두 인접한 요소를 비교
		 3. (오름차순인 경우)왼쪽 요소가 크고, 오른쪽 요소가 작은 경우 교환. 그렇지 않은 경우 통과
		 4. 비교와 교환 액션을 배열 요소 전체에 대해서 적용할 때까지 반복. 0-1, 1-2, 2-3, 3-4, ...
		 5. 배열 요소 전체에 대한 비교, 교환 액션 한 번 진행한 상태를 1회전이라 한다
		 6. 배열 요소 중에서 가장 큰 값이 가장 오른쪽에 위치한다.
		 7. 2번~6번 과정을 반복. 단, 정렬이 끝난 요소는 제외
		 8. 비교 대상이 없어지면 반복 종료
		 */
		
		int[] arr = {2, 3, 5, 1, 4};
		// 정렬 전 출력
		System.out.print("정렬전: ");
		for(int a: arr) {
			System.out.printf("%d " , a);
			}
		
		System.out.println();
		
		// 정렬 과정
		
		// 아래 액션을 여러번 반복. 단, 정렬이 끝난 요소는 제외
		// n은 0, 1, 2, 3, ... 마지막값(배열요소의 개수-2)으로 진행하기 위해 반복문 사용
		// 비교 및 교환(치환) 액션
		/* 
		 if(arr[n] > arr[n+1]) {
		 	int temp = arr[n+1];
		 	arr[n+1] = arr[n];
		 	arr[n] = temp;
		 	}
		 */
		
		for (int j = 1; j < arr.length; j++) {
			for (int i = 0; i < arr.length - j; i++) {
				if (arr[i] > arr[i + 1]) {
					int temp = arr[i + 1];
					arr[i + 1] = arr[i];
					arr[i] = temp;
				}
			}
		}

		// 정렬 후 출력
		System.out.print("정렬후: ");
		for(int a: arr) {
		System.out.printf("%d " , a);
		}
		System.out.println();
		
	}

}
```
