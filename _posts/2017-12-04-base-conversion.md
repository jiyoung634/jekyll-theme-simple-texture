---
layout: post
title: "Base Conversion"
description: "Base Conversion"
categories: [algorithm, Java]
tags: [algorithm, base conversion]
redirect_from:
  - /2017/12/04/
---



# 진법변환(Base Conversion)

```java
// 10진 -> 2진
String decToBin(int dec) {
	int a = 0;
	StringBuilder result = new StringBuilder();
	while (true) {
		a = dec % 2;
		dec = dec / 2;
		result.insert(0, a);
		if (dec == 0)
			break;
	}
	return result.toString();

}

// 10진 -> 16진
String decToHex(int dec) {
	int a = 0;
	StringBuilder result = new StringBuilder();
	String[] arr = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" };
	while (true) {
		a = dec % 16;
		dec = dec / 16;
		result.insert(0, arr[a]);
		if (dec == 0)
			break;
	}
	return result.toString();
}

// 2진 -> 10진
int binToDec(String bin) {
	int result = 0;
	for (int i = 0; i < bin.length(); i++) {
		String a = bin.substring(i, i + 1);
		int b = Integer.parseInt(a);
		if (b == 0)
			continue;
		result += b * (int) (Math.pow(2, bin.length() - i - 1));
	}
	return result;

}

// 16진 -> 10진
int hexToDec(String hex) {
	int result = 0;
	String[] arr = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" };
	for (int i = 0; i < hex.length(); i++) {
		String a = hex.substring(i, i + 1);
		int b = Arrays.binarySearch(arr, a);
		if (b == 0)
			continue;
		result += b * (int) (Math.pow(16, hex.length() - i - 1));
	}
	return result;

}
```