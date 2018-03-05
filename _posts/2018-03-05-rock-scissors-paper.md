---
layout: post
title: "rock, scissors, paper game using JSP"
description: "rock, scissors, paper game using JSP"
categories: [algorithm, JSP]
tags: [rock, scissors, paper, JSP, algorithm]
redirect_from:
  - /2018/03/05/
---



# JSP를 이용한 가위, 바위, 보

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//JSP code
	/*
	문제) 가위, 바위, 보 게임
	난수로 발생된 1~3의 숫자를 가지고 가위, 바위, 보 출력하고, 승자가 누구인지 출력.
	무한 반복하되, user1, user2가 비긴 경우가 발생하면 반복 중단.
	
	user1:가위, user2:바위 -> user2 승!
	...
	user1:가위, user2:가위 -> 비겼습니다.
	프로그램 종료.
	
	*/
	

	
	StringBuilder sb = new StringBuilder();
	String result="";
	boolean run = true;
	while (run) {
		// 1-가위, 2-바위, 3-보
		int user1 = (int)(Math.random()*3)+1;
		int user2 = (int)(Math.random()*3)+1;
		
		String[] array = {"","가위","바위","보"};
		sb.append(String.format("user1: %s, user2: %s -> ", array[user1], array[user2]));
		if ((user1 == user2 + 1) || (user2 - user1 == 2)) {
			result="user1 승!<br>";
		} else if ((user2 == user1 + 1) || (user1 - user2 == 2)) {
			result="user2 승!<br>";
		} else if (user1 == user2) {
			result="비겼습니다.<br>프로그램 종료.";
			run = false;
		}
		
		sb.append(result);
	}
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
<%= sb.toString() %>
</div>

</body>
</html>
```

