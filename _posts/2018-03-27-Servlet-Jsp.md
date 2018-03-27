---
layout: post
title: "Servlet & JSP"
description: "Servlet & JSP"
categories: [Servlet]
tags: [Servlet]
redirect_from:
  - /2018/03/27/
---



# doGet()

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	id="WebApp_ID" version="3.1">
	<display-name>servlet_20180327</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
	</welcome-file-list>

	<servlet>
		<servlet-name>sample001</servlet-name>
		<servlet-class>com.test.Sample001</servlet-class>
	</servlet>

	<servlet-mapping>
		<servlet-name>sample001</servlet-name>
		<url-pattern>/sample001</url-pattern>
	</servlet-mapping>
</web-app>
```

```java
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sample001 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		// Set response content type
		// 서버가 보낸 파일 타입을 브라우저가 인식하게 함
		response.setContentType("text/html");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Jiyoung's Test</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("");
		out.println("<h1>Hello, Servlet World!</h1>");
		out.println("");
		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}

```

```java
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sample002 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		//액션 추가
		int sum = 0;
		for (int i=1; i<=10; ++i) {
			sum = sum + i;
		}
		
		// Set response content type
		// 서버가 보낸 파일 타입을 브라우저가 인식하게 함
		response.setContentType("text/html; charset=UTF-8");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Jiyoung's Test</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("");
		out.println("<h1>Hello, Servlet World!</h1>");
		out.println("<p>1부터 10까지의 합은"+sum+"입니다</p>");
		out.println("");
		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}

```



# Send & Receive

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	id="WebApp_ID" version="3.1">
	<display-name>servlet_20180327</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
	</welcome-file-list>
	<servlet>
		<servlet-name>sample004</servlet-name>
		<servlet-class>com.test.Sample004</servlet-class>
	</servlet>

	<servlet-mapping>
		<servlet-name>sample004</servlet-name>
		<url-pattern>/sample004</url-pattern>
	</servlet-mapping>
</web-app>
```



```java
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sample004 extends HttpServlet {

	// init() 메소드가 최초 1회 자동호출 된다(상속 받았기 때문에)

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		// send 쪽

		// Set response content type
		response.setContentType("text/html; charset=UTF-8");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Jiyoung's Test</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("");
		out.println("<form action=\"sample004\" method=\"post\">");
		out.println("<div class=\"form-group\">");
		out.println("<label for=\"name\">이름:</label>");
		out.println("<input type=\"text\" class=\"form-control\" id=\"name\" name=\"name\">");
		out.println("</div>");
		out.println("<div class=\"form-group\">");
		out.println("<label for=\"phone\">전화번호:</label> ");
		out.println("<input type=\"text\" class=\"form-control\" id=\"phone\" name=\"phone\">");
		out.println("</div>");
		out.println("<button type=\"submit\" class=\"btn btn-default\">Submit</button>");
		out.println("</form>");
		out.println("");
		out.println("</body>");
		out.println("</html>");

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// receive 쪽
		
		request.setCharacterEncoding("UTF-8");
		StringBuilder sb = new StringBuilder();
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		// Set response content type
		response.setContentType("text/html; charset=UTF-8");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Jiyoung's Test</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("");
		out.println("<h1>Servlet Test</h1>");
		out.println("<p>데이터 수신 결과</p>"+name+" / "+phone);
		out.println("");
		out.println("</body>");
		out.println("</html>");

	}
}

```



# 구구단

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	id="WebApp_ID" version="3.1">
	<display-name>servlet_20180327</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
	</welcome-file-list>
	<servlet>
		<servlet-name>sample006</servlet-name>
		<servlet-class>com.test.Sample006</servlet-class>
	</servlet>

	<servlet-mapping>
		<servlet-name>sample006</servlet-name>
		<url-pattern>/sample006</url-pattern>
	</servlet-mapping>
</web-app>
```



```java
package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sample006 extends HttpServlet {

	/*
	 * 문제) 구구단 출력(non-Javadoc)
	 * 1단부터 9단까지의 버튼 중에 하나를 클릭하면 구구단이 출력되도록 한다.
	 * 전송 방식은 Post 방식	 
	 */

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//사용자 정의 메소드
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		
		//사용자 정의 메소드
		process(request, response);
	}
	
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// receive 쪽
		
		request.setCharacterEncoding("UTF-8");
		StringBuilder sb = new StringBuilder();

		String num = request.getParameter("num");
		if (num == null) {
			num = "1";
		}
		
		for (int a=1; a<=9; ++a) {
			sb.append(String.format("%s * %s = %s<br>", num, a, (Integer.parseInt(num) * a)));
		}
		
		String eq = String.valueOf(Integer.parseInt(num) - 1);
		

		// Set response content type
		response.setContentType("text/html; charset=UTF-8");

		// Actual logic goes here.
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Jiyoung's Test</title>");
		out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">");
		out.println("<style></style>");
		out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>");
		out.println("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>");
		out.println("<script>");
		out.println("$(document).ready(function() {");
		out.println("$(\"button\").on(\"click\", function() {");
		out.println("$(\"input#num\").val($(this).index() + 1);");
		out.println("$(\"form#myForm\").submit();	});");
		out.println("$(\"button\").eq("+eq+").addClass(\"active\"); });");
		out.println("</script>");
		out.println("</head>");
		out.println("<body>");
		out.println("");

		out.println("<div class=\"container\">");
		out.println("<h1>Query String를 이용한 구구단 출력</h1>");
		out.println("<div class=\"btn-group\" style=\"margin-top: 20px;\">");
		out.println("<button type=\"button\" class=\"btn btn-default\">1단</button>");
		out.println("<button type=\"button\" class=\"btn btn-default\">2단</button>");
		out.println("<button type=\"button\" class=\"btn btn-default\">3단</button>");
		out.println("<button type=\"button\" class=\"btn btn-default\">4단</button>");
		out.println("<button type=\"button\" class=\"btn btn-default\">5단</button>");
		out.println("<button type=\"button\" class=\"btn btn-default\">6단</button>");
		out.println("<button type=\"button\" class=\"btn btn-default\">7단</button>");
		out.println("<button type=\"button\" class=\"btn btn-default\">8단</button>");
		out.println("<button type=\"button\" class=\"btn btn-default\">9단</button>");
		out.println("</div>");
		out.println("<div>");
		out.println("<h3>");
		out.println(sb.toString());
		out.println("</h3>");
		out.println("</div>");
		out.println("</div>");
		out.println("<form method=\"post\" id=\"myForm\">");
		out.println("<input type=\"hidden\" id=\"num\" name=\"num\" value=\"\">");
		out.println("</form>");
		
		out.println("");
		out.println("</body>");
		out.println("</html>");
	}
}

```



# URL 패턴 매핑 규칙

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	id="WebApp_ID" version="3.1">
	<display-name>servlet_20180327</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
	</welcome-file-list>

	<!-- Sample007.java에 새로운 주소 이름 주기: http://211.63.89.70:8090/servlet_20180327/test -->
	<servlet>
		<servlet-name>test</servlet-name>
		<servlet-class>com.test.Sample007</servlet-class>
	</servlet>

	<servlet-mapping>
		<servlet-name>test</servlet-name>
		<url-pattern>/test</url-pattern>
	</servlet-mapping>


	<!-- Sample007.java을 실행하기 위해서 어떤 주소든 상관 없음: http://211.63.89.70:8090/servlet_20180327/(뭐든지) -->
	<servlet>
		<servlet-name>all</servlet-name>
		<servlet-class>com.test.Sample007</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>all</servlet-name>
		<url-pattern>/*</url-pattern>
	</servlet-mapping>
	

	<!-- Sample008.java에 확장자 부여: http://211.63.89.70:8090/servlet_20180327/(뭐든지).do -->
	<servlet>
		<servlet-name>ext</servlet-name>
		<servlet-class>com.test.Sample008</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>ext</servlet-name>
		<url-pattern>*.do</url-pattern>
	</servlet-mapping>

</web-app>
```

