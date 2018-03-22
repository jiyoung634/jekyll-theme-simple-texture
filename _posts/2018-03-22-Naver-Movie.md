---
layout: post
title: "Naver Movie API"
description: "Naver Movie API"
categories: [JSP, API]
tags: [JSP, API, Naver, Movie, Search]
redirect_from:
  - /2018/03/22/
---



# Naver Movie Search

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.*, java.net.*, java.util.*, org.json.*"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder sb = new StringBuilder();

	String clientId = "8uvVzvBzulAlcGq9LMq4";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "R8ILau6rQ0";//애플리케이션 클라이언트 시크릿값";

	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");

	if (searchKey == null) {
		searchKey = "title";
	}

	if (searchValue == null) {
		searchValue = "";
		sb.append("<tr><td colspan=\"5\" style =\"text-align: center;\">검색어를 입력해 주세요.</td></tr>");

	} else {
		String apiURL = String.format(
				"https://openapi.naver.com/v1/search/movie.json?query=%s&display=10&start=1",
				URLEncoder.encode(searchValue, "UTF-8")); // json 결과
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuilder response2 = new StringBuilder();
		while ((inputLine = br.readLine()) != null) {
			response2.append(inputLine);
		}
		br.close();

		// JSON 텍스트
		String json = response2.toString();
		System.out.println(json);

		// JSON parsing
		JSONObject jobj = new JSONObject(json);
		JSONArray jarray = jobj.getJSONArray("items");

		for (int i = 0; i < jarray.length(); ++i) {
			JSONObject temp = jarray.getJSONObject(i);
			String title = temp.getString("title");
			String link = temp.getString("link");
			String image = temp.getString("image");
			String subtitle = temp.getString("subtitle");
			String pubDate = temp.getString("pubDate");
			String director2 = temp.getString("director");
			String actor = temp.getString("actor");
			String userRating = temp.getString("userRating");

			sb.append(String.format("<tr><td>%s<br>%s<br><a href='%s'><button type='button' class='btn btn-default btn-xs'>상세보기</button></a></td><td><img src='%s'></td><td>%s</td><td><strong>감독</strong> %s <br><strong>주연</strong> %s </td><td>%s</td></tr>",title, subtitle, link, image, pubDate, director2, actor, userRating));
		}
		/*
		title	string	검색 결과 영화의 제목을 나타낸다. 제목에서 검색어와 일치하는 부분은 태그로 감싸져 있다.
		link	string	검색 결과 영화의 하이퍼텍스트 link를 나타낸다.
		image	string	검색 결과 영화의 썸네일 이미지의 URL이다. 이미지가 있는 경우만 나타난다.
		subtitle	string	검색 결과 영화의 영문 제목이다.
		pubDate	date	검색 결과 영화의 제작년도이다.
		director	string	검색 결과 영화의 감독이다.
		actor	string	검색 결과 영화의 출연 배우이다.
		userRating	integer	검색 결과 영화에 대한 유저들의 평점이다.
		*/
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

		// jQuery methods go here...

	});
</script>
</head>
<body>

	<div class="container">
		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="<%=contextRoot%>/movies.jsp"><img
					src="<%=contextRoot%>/resources/img/sist_logo.png"
					alt="sist_logo.png"> </a> 네이버 영화 검색
			</h1>
		</div>
		<div class="panel panel-default" id="input">
			<div class="panel-heading">검색</div>
			<div class="panel-body">
				<form class="form-inline" method="post">
					<select class="form-control" id="searchKey" name="searchKey">
						<option value="title">Title(default)</option>
						<option value="director">Director</option>
						<option value="actor">Actor</option>
						<option value="all">All</option>
					</select> <input type="text" class="form-control" id="searchValue"
						name="searchValue" placeholder="Search" style="width: 30%">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i><span>Search</span>
					</button>
					<input type="radio" name="count" value="10" checked="checked">
					10개씩 보기 <input type="radio" name="count" value="20"> 20개씩
					보기 <input type="radio" name="count" value="30"> 30개씩 보기
				</form>
			</div>
		</div>
		<div class="panel panel-default" id="output">
			<div class="panel-heading">검색</div>
			<div class="panel-body">
				<table class='table table-striped'>
					<thead>
						<tr>
							<th>제목</th>
							<th>포스터</th>
							<th>개봉일</th>
							<th>감독, 배우</th>
							<th>평점</th>
						</tr>
					</thead>
					<tbody>
						<%=sb.toString()%>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>
```



참고: https://developers.naver.com/docs/search/blog/