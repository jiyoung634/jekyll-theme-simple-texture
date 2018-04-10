---
layout: post
title: "Custom Tag"
description: "Custom Tag"
categories: [HTML, JSP]
tags: [HTML, JSP, Custom]
redirect_from:
  - /2018/04/10/
---



# WEB-INF> tags> now.tag

```jsp
<%@ tag body-content="empty" pageEncoding="utf-8"%>
<%@ tag import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance();
%>
<%=cal.get(Calendar.YEAR)%>년
<%=cal.get(Calendar.MONTH) + 1%>월
<%=cal.get(Calendar.DATE)%>일

```



# WEB-INF> tags> header.tag

```jsp
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="level" type="java.lang.Integer" %>
<%
	String headStartTag = null;
	String headEndTag = null;
	if (level == null) {
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	} else if (level == 1) {
		headStartTag = "<h1>";
		headEndTag = "</h1>";
	} else if (level == 2) {
		headStartTag = "<h2>";
		headEndTag = "</h2>";
	} else if (level == 3) {
		headStartTag = "<h3>";
		headEndTag = "</h3>";
	}
%>
<%= headStartTag %>
${title}
<%= headEndTag %>
```



# sample001.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

</style>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

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
	<h1>Custom Tag Test</h1>
	<div><ct:now /></div>
	<div><ct:hello /></div>
	<div>
		<ct:header title="header tag" />
		<ct:header title="header tag" level="1"/>
		<ct:header title="header tag" level="2"/>
		<ct:header title="header tag" level="3"/>
	</div>
</div>

</body>
</html>
```



# dynamic-attributes

## WEB-INF> tags> select.tag

```jsp
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ tag dynamic-attributes="optionMap" %>
<%@ attribute name="name" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select name="${name}">
	<c:forEach items="${optionMap}" var="option">
		<option value="${option.key}">${option.value}</option>
	</c:forEach>
</select>
```



## sample002.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

</style>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

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
	<h1>Custom Tag Test</h1>
	<div><ct:select name="code" B001="이것이 Java다" B002="이것이 Oracle이다" B003="이것이 HTML/CSS다"/></div>
</div>

</body>
</html>
```



# 게시판 활용 (pre)

## pre.tag

```jsp
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" type="java.lang.String" required="true"%>
<%
	value = value.replace("&", "&amp;");
	value = value.replace("<", "&lt;");
	value = value.replace(">", "&gt;");
	value = value.replace(" ", "&nbsp;");
	value = value.replace("\n", "\n<br>");
%>
<%=value%>
```



## sample003.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<%
	String text="<html><head></head><body><h1>\n테스트                                 중입니다\n테스트중입니다\n</h1></body></html>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

</style>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

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
	<h1>Custom Tag Test</h1>
	<div>
		<h3>1. Not Custom Tag</h3>
		<p><%=text%></p>
		
		<h3>2. Custom Tag</h3>
		<ct:pre value="<%=text%>" />
	</div>
</div>

</body>
</html>
```



**※pre 태그로는 부족한 부분이 있다. 따라서 custom tag를 이용해야 더욱 안전하다.**