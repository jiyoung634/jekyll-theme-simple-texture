---
layout: post
title: "Factorization"
description: "Factorization"
categories: [algorithm, Java]
tags: [algorithm, factorization]
redirect_from:
  - /2018/04/02/
---



# 소인수분해(Factorization)

```java
package com.test2;

import java.util.*;
public class Main3 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("입력혀 (2~1000)");
			int N = sc.nextInt();
			if (N == 0)
				break;
			int i = 2;
			int idx = 0;
			int[] arr = new int[20];
			if (N > 2) {
				while (true) {
					if (N % i == 0) {
						arr[idx] = i;
						idx++;
						N = N / i;
						if (N == 1)
							break;
					} else {
						++i;
					}
				}
			}
			if (idx == 1) {
				System.out.println("소!!수!!");
			} else {
				for (int j = 0; j < idx; ++j) {
					System.out.print(arr[j] + "/");
				}
				System.out.println("");
			}
		}
		sc.close();
	}
}
```

