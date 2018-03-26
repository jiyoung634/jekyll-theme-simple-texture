---
layout: post
title: "Interpark Book Search API"
description: "Interpark Book Search API"
categories: [JSP, API, Ajax, JSONP]
tags: [JSP, API, Interpark , Book, Search, Ajax, JSONP ]
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



# ★Fianl★ Interpark Book Search (Paging Process Completed)

## interparkbook.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder sb = new StringBuilder();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

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

	});
</script>
</head>
<body>

	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="interparkbook.jsp"><img
					src="<%=contextRoot%>/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 인터파크 도서 검색 <small>v2.0</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">도서 검색</div>
			<div class="panel-body">

				<!-- 스크립트에서 객체 접근을 위한 식별자 추가 -->
				<form class="form-inline" id="myForm" onsubmit="return false;">
					<select class="form-control" id="key" name="key">
						<option value="title">Title</option>
						<option value="author">Author</option>
						<option value="publisher">Publisher</option>
						<option value="isbn">ISBN</option>
					</select> <input type="text" class="form-control" id="value" name="value"
						placeholder="Search" style="width: 30%">

					<!-- Ajax 요청을 위한 일반 버튼 설정 -->
					<button class="btn btn-default" type="button"
						onclick="clickButton('new')">
						<i class="glyphicon glyphicon-search"></i><span>Search</span>
					</button>


				</form>
			</div>
		</div>


		<div class="panel panel-default" id="output">
			<div class="panel-heading">도서 검색 결과</div>

			<!-- 도서 검색 결과를 Ajax 응답 결과를 가지고 출력 -->
			<div class="panel-body book-list-box">
				<button type="button" class="btn btn-default" id="totalResults"
					name="totalResults">
					totalResults <span class="badge">0</span>
				</button>
				<span style="font-size: small; color: #777777;">결과는 최대
					100건까지만 출력됩니다.</span>

				<div id="demo"></div>
				<!-- 더보기 버튼 추가 -->
			</div>
			<div class="panel-footer">
				<button type="button" class="btn btn-default btn-block" id="btnMore"
					name="btnMore" value="1" onclick="clickMore(this.value)"
					disabled="disabled">더보기</button>

			</div>
		</div>

	</div>

	<script>
		function clickButton(str) {
			if (str == "new") {
				document.querySelector("button#btnMore").removeAttribute(
						"disabled");
				document.querySelector("button#btnMore").value = "1";
				document.getElementById("demo").innerHTML = "";
			}
			var key = document.querySelector("select#key").value;
			var value = document.querySelector("input#value").value;
			var start = document.querySelector("button#btnMore").value;

			var obj = {
				"key" : key,
				"value" : value,
				"start" : start
			};
			var param = JSON.stringify(obj);
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					//서버로부터 Ajax 응답받은 XML 문서에 대한 파싱 및 동적 태그 생성
					var xmlDoc = this.responseXML;
					console.log(xmlDoc);
					var txt = "";
					var items = xmlDoc.getElementsByTagName("item");
					var totalResults = xmlDoc.getElementsByTagName("totalResults")[0].textContent;	//querySelector()나 querySelectorAll()을 쓸 수도 있다.
					var startIndex = xmlDoc.getElementsByTagName("startIndex")[0].textContent;
					var maxResults = xmlDoc.getElementsByTagName("maxResults")[0].textContent;
					var itemsPerPage = xmlDoc.getElementsByTagName("itemsPerPage")[0].textContent;
										
					// 더보기 버튼에 대한 활성/비활성 결정
					if (parseInt(itemsPerPage) < parseInt(maxResults)) {
						document.querySelector("button#btnMore").setAttribute(
								"disabled", "disabled");
					} else {
						document.querySelector("button#btnMore")
								.removeAttribute("disabled");
					}

					if (totalResults != 0) {
						txt = "<br>";
						for (var i = 0; i < items.length; ++i) {
							txt += "<div class=\"row\" style=\"margin-top:30px; border-top:1px dashed #e5e5e5; padding-top:20px;\">";
							txt += "<div class=\"col-sm-1\">"+ ((startIndex - 1) * (maxResults) + i + 1)+ "</div>";
							txt += "<div class=\"col-sm-2\"><img src=\""+ xmlDoc.getElementsByTagName("coverLargeUrl")[i].textContent+ "\" alt=\""+ xmlDoc.getElementsByTagName("coverLargeUrl")[i].textContent+ "\"></div>";
							txt += "<div  class=\"col-sm-7\">";
							txt += "<ul><li><strong>title</strong>"+ xmlDoc.getElementsByTagName("title")[i].textContent;
							txt += "</li><li><strong>description</strong>"+ xmlDoc.getElementsByTagName("description")[i].textContent;
							txt += "</li><li><strong>publisher</strong>"+ xmlDoc.getElementsByTagName("publisher")[i].textContent;
							txt += "</li><li><strong>author</strong>"+ xmlDoc.getElementsByTagName("author")[i].textContent;
							txt += "</li><li><strong>priceStandard</strong>"+ xmlDoc.getElementsByTagName("priceStandard")[i].textContent;
							txt += "</li><li><strong>isbn</strong>"+ xmlDoc.getElementsByTagName("isbn")[i].textContent;
							txt += "</li><li><strong>pubDate</strong>"+ xmlDoc.getElementsByTagName("pubDate")[i].textContent;
							txt += "</li></ul></div>";
							txt += "<div class=\"col-sm-2\">";
							txt += "<button type=\"button\" class=\"btn btn-default btn-xs\" onclick=\"window.open('"+ xmlDoc.getElementsByTagName("link")[i].textContent+ "')\">인터파크 상세보기</button>";
							txt += "</div></div>";
						}

						// 서버로부터 받은 응답을 누적 출력한다.
						document.getElementById("demo").innerHTML += txt;
						document.getElementById("totalResults").querySelector("span").innerHTML = totalResults;

					} else {
						txt += "<div class=\"row\" style=\"margin-top:30px; border-top:1px dashed #e5e5e5; padding-top:20px;\">";
						txt += "<div  class=\"col-sm-7\">검색 결과가 없습니다</div>";
						document.getElementById("totalResults").querySelector("span").innerHTML = totalResults;
						document.getElementById("demo").innerHTML = txt;
					}
				}
			};

			/* 		
			xmlhttp.open("GET", "getBookList.jsp?key=값&value=값", true);
			xmlhttp.send(); 
			 */
			xmlhttp.open("POST", "getBookList.jsp", true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("x=" + param);
		}

		// 더보기 버튼 눌렀을 때
		function clickMore(start) {
			// 기존 key, value와 함께 start만 새로운 페이지 요청
			start++;
			document.querySelector("button#btnMore").value = start;
			clickButton();

		}
	</script>

</body>
</html>
```



## getBookList.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page
	import="java.io.*, javax.xml.transform.dom.*, javax.xml.transform.stream.*, javax.xml.parsers.*, javax.xml.transform.*, org.json.*, org.w3c.dom.*, org.xml.sax.*, java.net.*"%>
<%!// 'XML 문서'를 '문자열'로 반환하는 메소드
	// javax.xml.transform.dom.*, javax.xml.transform.stream.* 필요
	private String convertDocumentToString(Document doc) {
		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer transformer;
		try {
			transformer = tf.newTransformer();
			// below code to remove XML declaration
			// transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
			StringWriter writer = new StringWriter();
			transformer.transform(new DOMSource(doc), new StreamResult(writer));
			String output = writer.getBuffer().toString();
			return output;
		} catch (TransformerException e) {
			e.printStackTrace();
		}

		return null;
	}%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder sb = new StringBuilder();

	//사용자 요청 수신 및 분석
 	String x = request.getParameter("x");
	JSONObject jobj = new JSONObject(x);
	String key = jobj.getString("key");
	String value = jobj.getString("value");
	String start = jobj.getString("start");


	System.out.println(key + value + start);
	
	//인터파크 사이트에서 도서 요청
	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	DocumentBuilder builder = factory.newDocumentBuilder();
	Document xmlObj = null;
	String str = String.format(
			"http://book.interpark.com/api/search.api?key=7D000600C2E163DE162954A0168941F3F3509861765F0AFFE7CFDF915EF1F418&inputEncoding=utf-8&query=%s&queryType=%s&maxResults=20&start=%s",
			URLEncoder.encode(value, "UTF-8"), key, start);
	URL url = new URL(str);

	InputSource is = new InputSource(url.openStream());
	xmlObj = builder.parse(is);

	//인터파크로부터 전달받은 응답을 가지고 동적으로 XML 문자열 생성.	
	String xmlStr = convertDocumentToString(xmlObj);
	//System.out.println(xmlStr);

	//Ajax 응답 -> XML 포맷 문자열로 반환
	response.setContentType("text/xml; charset=UTF-8");
	response.getWriter().println(xmlStr);
%>
```





# 참고

```
1. 인터파크 회원가입 및 로그인

2. 인증키 발급 절차 진행
- http://book.interpark.com/blog/html/bookpinionTop.html
- 북피니언 발급
- 인터파크 북피니언 이용약관 동의
- 북피니언 개설 정보 입력
- 인증키 발급 바로가기 선택
- 오픈업 관리 선택
- 인증키 이용약관 동의
- 인증키 발급
- 인증키 복사 (D9314BE03...........................62E4BC7)
- 샘플 요청 테스트




책 제목으로 검색('삼국지')
http://book.interpark.com/api/search.api?key=인증키&query=삼국지&inputEncoding=utf-8

ISBN으로 검색하기('만화 삼국지 1~30 완결세트')
http://book.interpark.com/api/search.api?key=인증키&query=9788987103150&queryType=isbn
 
페이지 설정하여 검색하기
http://book.interpark.com/api/search.api?key=인증키&query=삼국지&start=1&maxResults=10


3. 결과값 종류 및 의미
title	문자열	검색 결과 페이지의 제목을 표시함니다.
link	문자열(URL)	검색 결과를 확인 할 수 있는 페이지 주소(URL)을 표시합니다.
imageUrl	문자열(URL)	제공자의 이미지 주소(URL)을 표시합니다.
language	문자열	겸색 결과의 언어를 표시합니다.
copyright	문자열	API 제공자의 Copyright를 표시합니다.
pubDate	날짜	검색 결과를 생성한 시간을 표시합니다.. (GMT 기준시)
totalResults	숫자	총 검색 결과의 개 수를 표시합니다.
startIndex	숫자 현재의 페이지 번호를 표시합니다.
itemsPerPage	숫자	한 페이지당 표시되는 검색 결과 개수를 표시합니다.
maxResults	숫자	검색을 요청한 페이지당 결과 개수를 표시합니다.
query	문자열	검색을 요청한 쿼리(검색어)를 표시합니다.
searchCategoryId	숫자	검색 결과를 요청한 카테고리의 아이디값을 표시합니다.
searchCategoryName	문자열	검색 결과를 요청한 카테고리의 이름을 표시합니다.
returnCode	숫자	오류메시지의 코드를 표시합니다.
returnMessage	문자열	오류메시지를 표시합니다.
item < itemId	숫자	검색 상품의 고유번호를 표시합니다.(상품번호)
item < title	문자열	검색 상품의 이름을 표시함니다.
item < isbn	문자열	검색 상품의 ISBN을 표시합니다.
item < link	문자열(URL)	검색 상품의 주소(URL)을 표시합니다. 
item < author	문자열	검색 상품의 저자(음악일 경우 가수, DVD일 경우 감독)를 표시합니다.
item < translator	문자열	검색 상품의 역자(DVD일 경우 배우)를 표시합니다.
item < description	문자열	검색 상품의 설명을 표시합니다. (HTML 제외)
item < priceStandard	숫자(통화)	검색 상품의 정가를 표시합니다.
item < priceSales	숫자(통화)	검생 상품의 판매가를 표시합니다. (수시로 변동 될 수 있습니다.)
item < discountRate	숫자	검색 상품의 할인율을 표시합니다. (단위 %)
item < saleStatus	문자열	검색 상품의 판매 상태를 표시합니다.
item < mileage	숫자(통화)	검색 상품의 상품 구매시 지급되는 마일리지를 표시합니다.
item < mileageRate	숫자	검색 상품의 상품 구매시 지급되는 마일리지율을 표시합니다.(단위 %)
item < coverSmallUrl	문자열(URL)	검색 상품의 작은 사이즈 이미지를 표시합니다.
item < coverLargeUrl	문자열(URL)	검색 상품의 큰 사이즈 아미지를 표시합니다.
item < categoryId	숫자	검색 상품이 속한 카테고리의 아이디값을 표시합니다.
item < categoryName	문자열	검색 상품이 속한 카테고리의 이름을 표시합니다.
item < publisher	문자열	검색 상품의 출판사(제작사)를 표시합니다.
item < pubDate	문자열	검색 상품의 출간일(등록일)을 표시합니다.


4. 검색 결과 XML 샘플 ('openapi' 검색)
<?xml version="1.0" encoding="UTF-8"?>
<channel>
  <title>인터파크도서검색결과</title>
  <link>http://bsearch.interpark.com/dsearch/book.jsp?query=openapi&amp;sch=book&amp;order_tp=accuracy&amp;contextCheckboxUseYn=N&amp;filter_disp_no=028&amp;titleCheckboxUseYn=N&amp;personCheckboxUseYn=N&amp;entrNmCheckboxUseYn=N&amp;isbnCheckboxUseYn=N</link>
  <language>ko</language>
  <copyright>Copyright ⓒ 2009 INTERPARK INT All rights reserved.</copyright>
  <pubDate>9 Nov 2015 13:08:13 GMT</pubDate>
  <imageUrl>http://bimage.interpark.com/renewPark/topGnb/logo.jpg</imageUrl>
  <totalResults>3</totalResults>
  <startIndex>1</startIndex>
  <itemsPerPage>3</itemsPerPage>
  <maxResults>10</maxResults>
  <queryType>title</queryType>
  <query>openapi</query>
  <searchCategoryId>100</searchCategoryId>
  <searchCategoryName>국내도서</searchCategoryName>
  <returnCode>000</returnCode>
  <returnMessage>정상</returnMessage>
  <item>
    <itemId>210880645</itemId>
    <title><![CDATA[페이스북 openAPI 프로그래밍]]></title>
    <description><![CDATA[페이스북 openAPI 프로그래밍[페이스북 OpenAPI 프로그래밍]은 개발 플랫폼의 관점에서 페이스북을 분석하면서 페이스북 OpenAPI 활용에 필요한 모든 기술과 지식들을 독자들에게 설명한다. 또한 최근 대세를 이룬 스마트폰이나 다른 웹서비스와의 연동에도 주목해 모든 영역의 개발자들에게 애플리케이션 및 서비스 구현에 필요한 노하우와 영감(insight)을 제공하는 데 중점을 뒀다.Part 01│페이스북 플랫폼의 이해페이스북 애플리케이션 프로그래밍에 앞서 페이스북에 대한 개괄적인 정보와 기본 기능, 타임라인과 같은 애플리케이션을 소개하고, 나아가 계정 생성 방법과 화면 구성을 비롯한 페이스북 플랫폼의 주요 특성을 차례로 살펴본다.Part 02│페이스북 프로그래밍 준비페이스북 계정 생성과 애플리케이션 운영 ...]]></description>
    <pubDate>20120725</pubDate>
    <priceStandard>20000</priceStandard>
    <priceSales>20000</priceSales>
    <discountRate>0</discountRate>
    <saleStatus>품절</saleStatus>
    <mileage>3000</mileage>
    <mileageRate>15</mileageRate>
    <coverSmallUrl>http://bimage.interpark.com/goods_image/0/6/4/5/210880645h.jpg</coverSmallUrl>
    <coverLargeUrl>http://bimage.interpark.com/goods_image/0/6/4/5/210880645s.jpg</coverLargeUrl>
    <categoryId>122</categoryId>
    <categoryName><![CDATA[국내도서]]></categoryName>
    <publisher><![CDATA[웰북]]></publisher>
    <customerReviewRank>0.0</customerReviewRank>
    <reviewCount>0</reviewCount>
    <author><![CDATA[신종호]]></author>
    <translator />
    <isbn>9788901147994</isbn>
    <link>http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=210880645&amp;refererType=8303&amp;bookblockname=bpmain_in&amp;booklinkname=wg_search_D9314BE0338D72B344BEA106C30A5C2022B19DDC23EE7939887710C0062E4BC7</link>
    <mobileLink>http://m.book.interpark.com/view.html?PRD_NO=210880645&amp;SHOP_NO=0000400000</mobileLink>
    <additionalLink>http://book.interpark.com/gate/ippgw.jsp?goods_no=210880645&amp;biz_cd=</additionalLink>
  </item>
  <item>
    <itemId>210641638</itemId>
    <title><![CDATA[jQuery Mobile inside]]></title>
    <description><![CDATA[네이티브 앱을 대채하기 위해서 각광받고 있는 웹앱 기술."웹"이라는 주제가 분명 Java나 Object-C같은 네이티브 개발 기술보다는 쉽게 생각되어 질 수도 있지만, 막상 뚜껑을 열어보면 그렇지만은 않다.HTML5, CSS3, JavaScript 등 새롭게 받아들여야 하는 기술들이 많기 때문이다. 이러한 새로움에 좀 더 쉽게 익숙해 지기 위해서 jQuery Mobile은 HTML5나 CSS3와 같은 새로운 기술을 전혀 모르더라도 모바일 웹앱을 손쉽게 만들 수 있도록 도와준다.이 책에서는 그러한 jQuery Mobile에 대한 전반적인 내용을 필자의 다년간의 강의 경험에 맞추어서 체계적으로 정리하고 있다.이 책은 실제로 실무자나 취업을 앞두고 있는 개발자, 퍼블리셔, 웹 디자이너들을 대상으로jQuery Mo...]]></description>
    <pubDate>20120630</pubDate>
    <priceStandard>36000</priceStandard>
    <priceSales>32400</priceSales>
    <discountRate>10</discountRate>
    <saleStatus>판매중</saleStatus>
    <mileage>1800</mileage>
    <mileageRate>6</mileageRate>
    <coverSmallUrl>http://bimage.interpark.com/goods_image/1/6/3/8/210641638h.jpg</coverSmallUrl>
    <coverLargeUrl>http://bimage.interpark.com/goods_image/1/6/3/8/210641638s.jpg</coverLargeUrl>
    <categoryId>122</categoryId>
    <categoryName><![CDATA[국내도서]]></categoryName>
    <publisher><![CDATA[스마트미디어]]></publisher>
    <customerReviewRank>10.0</customerReviewRank>
    <reviewCount>1</reviewCount>
    <author><![CDATA[이광호,주영아]]></author>
    <translator />
    <isbn>9788981360122</isbn>
    <link>http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=210641638&amp;refererType=8303&amp;bookblockname=bpmain_in&amp;booklinkname=wg_search_D9314BE0338D72B344BEA106C30A5C2022B19DDC23EE7939887710C0062E4BC7</link>
    <mobileLink>http://m.book.interpark.com/view.html?PRD_NO=210641638&amp;SHOP_NO=0000400000</mobileLink>
    <additionalLink>http://book.interpark.com/gate/ippgw.jsp?goods_no=210641638&amp;biz_cd=</additionalLink>
  </item>
  <item>
    <itemId>243043915</itemId>
    <title><![CDATA[KT ucloud biz를 활용한 서비스별 클라우드 구축 가이드]]></title>
    <description><![CDATA[다양한 사례로 알아보는 서비스별 클라우드 구축 가이드클라우드 컴퓨팅은 차세대 컴퓨팅 자원의 유틸리티 서비스로서, 누구나 한번쯤 들어보았거나 알게 모르게 이미 클라우드 기술을 사용하고 있을 것이다. 물론 모두가 클라우드 컴퓨팅의 상세 기술이나 특장점에 대해 깊이 있게 파악하기는 어렵다. 따라서 국내 사용자와 기업이 클라우드 환경을 도입하는 현시점에서 각자의 비즈니스 모델에 따라 클라우드 컴퓨팅을 언제 어떻게 사용할 수 있는지에 대한 구체적인 가이드 라인이 필요하다.[KT ucloud biz를 활용한 서비스별 클라우드 구축 가이드]는 KT ucloud biz 서비스 주요 내용과 도입 방법에 대해 다루고, 서비스 종류에 따른 설계 방법과 사례를 소개한다. 이 책은 필자가 KT 클라우드를 사용하는 대기업, 공공기관...]]></description>
    <pubDate>20150828</pubDate>
    <priceStandard>18000</priceStandard>
    <priceSales>16200</priceSales>
    <discountRate>10</discountRate>
    <saleStatus>판매중</saleStatus>
    <mileage>900</mileage>
    <mileageRate>6</mileageRate>
    <coverSmallUrl>http://bimage.interpark.com/goods_image/3/9/1/5/243043915h.jpg</coverSmallUrl>
    <coverLargeUrl>http://bimage.interpark.com/goods_image/3/9/1/5/243043915s.jpg</coverLargeUrl>
    <categoryId>122</categoryId>
    <categoryName><![CDATA[국내도서]]></categoryName>
    <publisher><![CDATA[한빛미디어]]></publisher>
    <customerReviewRank>0.0</customerReviewRank>
    <reviewCount>0</reviewCount>
    <author><![CDATA[김인정,김경화]]></author>
    <translator />
    <isbn>9788968487804</isbn>
    <link>http://book.interpark.com/blog/integration/product/itemDetail.rdo?prdNo=243043915&amp;refererType=8303&amp;bookblockname=bpmain_in&amp;booklinkname=wg_search_D9314BE0338D72B344BEA106C30A5C2022B19DDC23EE7939887710C0062E4BC7</link>
    <mobileLink>http://m.book.interpark.com/view.html?PRD_NO=243043915&amp;SHOP_NO=0000400000</mobileLink>
    <additionalLink>http://book.interpark.com/gate/ippgw.jsp?goods_no=243043915&amp;biz_cd=</additionalLink>
  </item>
</channel>


```

