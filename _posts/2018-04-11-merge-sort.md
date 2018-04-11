---
layout: post
title: "Merge Sort"
description: "Merge Sort"
categories: [algorithm, Java]
tags: [algorithm, Merge sort]
redirect_from:
  - /2018/04/11/
---



# 병합정렬(Merge Sort)

```java
package com.test;

import java.util.Arrays;

public class Main {

	public static void main(String[] args) {
		int[] A = { 1,5,7,9,13,16,28,32,38,40 };
		int[] B = { 39, 37, 33, 30, 26, 24, 19, 13, 11, 9, 5, 3, 1, 0 };
		int[] C = new int[A.length + B.length];

		int a = 0, b = B.length - 1, c = 0;
		int done = 0;

		// done 개수가 2미만일 때까지만
		while (done<2) {
			// B가 더 작을 경우
			if (A[a] >= B[b]) {
				C[c] = B[b];
				--b;
				++c;
				// A가 더 작을 경우
			} else {
				C[c] = A[a];
				++a;
				++c;
			}

			// 한 쪽 배열을 완료한 경우
			if (a == A.length) {
				++done;
				--a;
				A[a] = 999999;
			}
			if (b == -1) {
				++done;
				++b;
				B[b] = 999999;
			}

		}
		System.out.println(Arrays.toString(C));
	}

}

```

