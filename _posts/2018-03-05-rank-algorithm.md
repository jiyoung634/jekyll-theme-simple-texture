---
layout: post
title: "(test)rank algorithm using JSP"
description: "rank algorithm using JSP"
categories: [algorithm, JSP]
tags: [rank, JSP, algorithm]
redirect_from:
  - /2018/03/05/
---





# JSP를 이용한 석차 알고리즘

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//JSP code
	
	//배열 요소 정렬
		
		/*
		문제) 석차 알고리즘 적용 결과 출력. names, scores, ranks 배열 준비.
		출력예)
		이름 점수 석차
		hong 100  1
		park 90   3
		choi 95   2
		kim  80   5
		lee  85   4
		*/
		
		StringBuilder sb = new StringBuilder();
		
		String[] names = {"hong", "park", "choi", "kim", "lee"};
		int[] scores = new int[5];
		int[] ranks = new int[5];
		
		// 같은 값 채울 경우는 java.util.Arrays.fill(ranks, 1);
		for(int i=0; i<scores.length; ++i) {
			scores[i] = (int)(Math.random()*101);
			ranks[i] = 1;
		}
		
		for(int i=0; i<scores.length; ++i) {
			for(int j=0; j<scores.length; ++j){
				if(scores[i]<scores[j]){
					ranks[i]+=1;
				}
			}
		}
		
		sb.append("<table class='table'><tr><th>이름</th><th>점수</th><th>석차</th></tr>");
		for(int i=0; i<scores.length; ++i){
			sb.append(String.format("<tr><td>%s</td><td>%s</td><td>%s</td></tr>", names[i], scores[i], ranks[i]));
		}
		sb.append("</table>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
$(document).ready(function(){

	   // jQuery methods go here...

});
</script>
</head>
<body>

<div class="container">



<h2>문제) 석차 알고리즘 적용 결과 출력. names, scores, ranks 배열 준비.<br></h1>
	



<p><%= sb.toString()%></p>

</div>

</body>
</html>
```

