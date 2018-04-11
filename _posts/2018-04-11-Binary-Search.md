---
layout: post
title: "Binary Search"
description: "Binary Search"
categories: [algorithm, Java]
tags: [algorithm, binary search]
redirect_from:
  - /2018/04/11/
---



# 재귀함수를 이용한 이진검색(Binary Search)

## BinarySearch.java

```java
package com.test;

public class BinarySearch {
	public int binary(int[] arr, int L, int H, int K) {
		int M = (L + H) / 2;

		// Key값이 중앙값보다 작을 때
		if (arr[M] > K) {
			H = M - 1;
			// 끝까지 찾았는데 답이 없는 경우
			if (L > H) {
				M = -99;
				return M;
			}
			M = binary(arr, L, H, K);

			// Key값이 중앙값보다 클 때
		} else if (arr[M] < K) {
			L = M + 1;
			// 끝까지 찾았는데 답이 없는 경우
			if (L > H) {
				M = -99;
				return M;
			}
			M = binary(arr, L, H, K);
		}
		return M;
	}
}

```



## Main.java

```java
package com.test;

public class Main {

	public static void main(String[] args) {
		int[] arr = {5, 9, 12, 16, 17, 23, 27, 31, 33, 38, 41};
		int L = 0;
		int H = arr.length-1;
		int M = (L+H)/2;
		int K = 16;
		
		BinarySearch b = new BinarySearch();
		M=b.binary(arr,L,H,K);
		System.out.println("결과: "+(M+1) + "번째");
	}
	
}

```

