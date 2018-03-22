---
layout: post
title: "Interpark Book Search API"
description: "Interpark Book Search API"
categories: [JSP, API]
tags: [JSP, API, Interpark , Book, Search ]
redirect_from:
  - /2018/03/22/
---



# Interpark Book Search (Not Completed Yet!!)

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page
	import="javax.xml.parsers.*, org.w3c.dom.*, org.xml.sax.*, javax.xml.xpath.*, java.net.*"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder head = new StringBuilder();
	
	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	DocumentBuilder builder = factory.newDocumentBuilder();
	Document xmlObj = null;

	String searchKey = request.getParameter("searchKey");
	int count=Integer.parseInt((request.getParameter("count")==null)?"10":request.getParameter("count"));
	int pageNum=Integer.parseInt((request.getParameter("pageNum")==null)?"1":request.getParameter("pageNum"));
	int prev=pageNum-1;
	int next=pageNum+1;
	int totalRows =0;
	int totalPageNum=0;
	
	if (searchKey != null) {
		String str = String.format("http://book.interpark.com/api/search.api?key=7D000600C2E163DE162954A0168941F3F3509861765F0AFFE7CFDF915EF1F418&inputEncoding=utf-8&query=%s&start=%s&maxResults=%s", URLEncoder.encode(searchKey, "UTF-8"), pageNum, count);
		URL url = new URL(str);
		
		InputSource is = new InputSource(url.openStream());
		xmlObj = builder.parse(is);
		
		// ROOT 엘리먼트 접근
		Element root = xmlObj.getDocumentElement();
		
		// XPath에 의한 XML 엘리먼트 탐색
		XPath xPath = XPathFactory.newInstance().newXPath();

		// 책 제목
		NodeList itemList = (NodeList)xPath.compile("channel/item").evaluate(xmlObj, XPathConstants.NODESET);
		
		totalRows = Integer.parseInt(xPath.compile("channel/totalResults").evaluate(xmlObj));
		if(totalRows==0){
			count = 0;
			head.append("검색 결과가 없습니다");
		}else{
			totalPageNum=(totalRows/count) +1;
		}
		
		for(int i=1;i<=itemList.getLength();++i){
			String coverLargeUrl = xPath.compile(String.format("channel/item[%d]/coverLargeUrl",i)).evaluate(xmlObj);
			String title = xPath.compile(String.format("channel/item[%d]/title",i)).evaluate(xmlObj);
			String description = (xPath.compile(String.format("channel/item[%d]/description",i)).evaluate(xmlObj));
			if(description.length()>100){
				description = description.substring(0,100)+ "...";
					}
			String publisher = xPath.compile(String.format("channel/item[%d]/publisher",i)).evaluate(xmlObj);
			String author = xPath.compile(String.format("channel/item[%d]/author",i)).evaluate(xmlObj);
			String priceStandard = xPath.compile(String.format("channel/item[%d]/priceStandard",i)).evaluate(xmlObj);
			String isbn = xPath.compile(String.format("channel/item[%d]/isbn",i)).evaluate(xmlObj);
			String pubDate = xPath.compile(String.format("channel/item[%d]/pubDate",i)).evaluate(xmlObj);
			String link = xPath.compile(String.format("channel/item[%d]/link",i)).evaluate(xmlObj);
			
			head.append("<div id=\"book\">");
			head.append(String.format("<div id=\"number\">%d</div>",i));
			head.append(String.format("<div id=\"picture\"><img src=\"%s\" alt=\"%s\"></div>",coverLargeUrl, coverLargeUrl));
			head.append("<div id=\"instruction\">");
			head.append(String.format("<ul><li><strong>title</strong> %s</li><li><strong>description</strong> %s</li><li><strong>publisher</strong> %s</li><li><strong>author</strong> %s</li><li><strong>priceStandard</strong> %s</li><li><strong>isbn</strong> %s</li><li><strong>pubDate</strong> %s</li></ul>",
					title, description, publisher, author, priceStandard, isbn, pubDate));
			head.append("</div>");
			head.append("<div id=\"detail\">");
			head.append(String.format("<button type=\"button\" class=\"btn btn-default btn-xs\" onclick=\"window.open('%s')\">인터파크 상세보기</button>", link));
			head.append("</div></div>");
		}
		
	} else {
		head.append("검색 결과가 없습니다");
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
div#book{
	border-top :1px solid LightGray;
	border-bottom : 1px solid LightGray;
	padding-top : 30px;
	padding-bottom : 30px;
}

div#number{
	display: inline-block;
	width: 5%;
	padding: 10px;
}

div#picture {
	display: inline-block;
	width: 30%;
	padding: 10px;
}

div#instruction {
	display: inline-block;
	width: 30%;
	padding: 10px;
}

div#detail {
	display: inline-block;
	width: 20%;
	padding: 10px;
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
		// 검색값과 선택한 count수 유지
		var searchKey = "<%=searchKey%>";
		var count ="<%=count%>";
		var prev = "<%=prev%>";
		var next = "<%=next%>";
		var totalPageNum="<%=totalPageNum%>";
		
		
		$("input#searchKey").val()=searchKey;
		$("input[value='"+count+"']").attr("checked", "checked");

		// 페이지 미작동ㅠㅠ
 		// 첫 페이지, 마지막 페이지의 previous, next 버튼 disabled 상태로 만들기
		if(prev==0){
			$("button#prev").attr("disabled", "disabled");
		}
		if(next > totalPageNum){
			$("button#next").attr("disabled", "disabled");
		}
		// previous, next 버튼 클릭시 이동
		$("button#prev").on("click", function(){
			location.assign("?pageNum="+prev+"&searchKey="+searchKey+"&count=" +count);
		});
		
		$("button#next").on("click", function(){
			location.assign("?pageNum="+next+"&searchKey="+searchKey+"&count=" +count);
		});

	});
</script>
</head>
<body>

	<div class="container">
		<h2>
			<a href="sample002.jsp"><img
				src="<%=contextRoot%>/resources/img/sist_logo.png"
				alt="sist_logo.png"></a>인터파크 도서 검색<small>v1.0</small>
		</h2>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">도서 검색</div>
			<div class="panel-body">
				<form class="form-inline" method="post">
					<input type="text" class="form-control" id="searchKey" name="searchKey" placeholder="Search"
						style="width: 30%">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i><span>Search</span>
					</button>
					<input type="radio" name="count" value="10">
					10개씩 보기 <input type="radio" name="count" value="20"> 20개씩
					보기 <input type="radio" name="count" value="30"> 30개씩 보기
				</form>
			</div>
		</div>


		<div class="panel panel-default" id="output">
			<div class="panel-heading">
				<button type="button" class="btn btn-default">
					TotalRows<span class="badge"><%=totalRows%></span>
				</button>
				<button type="button" class="btn btn-default" id="prev">
					<i class="glyphicon glyphicon-chevron-left"></i>Previous
				</button>
				<button type="button" class="btn btn-default" id="next">
					Next<i class="glyphicon glyphicon-chevron-right"></i>
				</button>
			</div>
			<div class="panel-body">
					<%=head.toString()%>
			</div>
		</div>
	</div>

</body>
</html>
```



참고: http://www.weather.go.kr/weather/lifenindustry/sevice_rss.jsp