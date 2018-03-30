---
layout: post
title: "MVC(Upgraded)"
description: "MVC(Upgraded)"
categories: [MVC, Servlet]
tags: [MVC, Servlet]
redirect_from:
  - /2018/03/30/
---



**※ 주의) 다음의 라이브러리 필요** 

- jstl-1.2.jar

- mysql-connector-java-5.1.45-bin.jar

  ​

# com.test>

# Member.java

```java
package com.test;

import java.time.*;

public class Member {
	
	//필드 구성
	//->입력, 출력에 관여된 모든 항목
	//->동일 자료, 동일 식별자
	private String mid_, name_, phone, email, deptId, deptName;
	private LocalDate regDate;
	
	public String getMid_() {
		return mid_;
	}
	public void setMid_(String mid_) {
		this.mid_ = mid_;
	}
	public String getName_() {
		return name_;
	}
	public void setName_(String name_) {
		this.name_ = name_;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public LocalDate getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDate regDate) {
		this.regDate = regDate;
	}
	

}

```



# MemberController.java

```java
package com.test;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response) ;
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		// 사용자 요청 주소 분석
		// ->요청 URI + invoke() 메소드 기반 주소 분석
		// ->http://211.63.89.68:8090/membersMVC_20180330/member/list
		String uri = request.getRequestURI();	// /membersMVC_20180330/member/list
		System.out.println("uri:"+uri);
		uri = uri.substring(request.getContextPath().length());
		uri = uri.substring("/member/".length());

		// 주소 분석 결과 -> 특정 액션 요청
		String viewPage = "/error.jsp";
		try {
			MemberHandler handler = new MemberHandler();
			Method m = MemberHandler.class.getMethod(uri, HttpServletRequest.class, HttpServletResponse.class);
			viewPage = (String) m.invoke(handler, request, response); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(viewPage);

		// 요청 결과 -> 뷰 정보 -> 포워딩 또는 리다이렉트
		if (viewPage.contains("redirect:")) {
			response.sendRedirect(viewPage.substring("redirect:".length()));
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}

	}
}

```



# MemberDAO.java

```java
package com.test;

import java.sql.*;
import java.util.*;
import java.time.*;

public class MemberDAO {

	// 전체 명단 출력용 메소드
	public List<Member> list() {
		List<Member> result = new ArrayList<Member>();

		/*
		 * CREATE VIEW membersView AS SELECT mid_, name_, phone, email, regDate,
		 * deptName FROM members INNER JOIN dept USING(deptID) ORDER BY mid_;
		 */

		String sql = "SELECT mid_, name_, phone, email, regDate, deptName FROM membersView ORDER BY mid_";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = MySQLConnection.connect();

			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				String mid_ = rs.getString("mid_");
				String name_ = rs.getString("name_");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				LocalDate regDate = rs.getDate("regDate").toLocalDate();
				String deptName = rs.getString("deptName");

				Member m = new Member();

				m.setMid_(mid_);
				m.setName_(name_);
				m.setPhone(phone);
				m.setEmail(email);
				m.setRegDate(regDate);
				m.setDeptName(deptName);

				result.add(m);

			}
			rs.close();

		} catch (SQLException se) {
			System.out.print(se.getMessage());
		} catch (Exception e) {
			System.out.print(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				MySQLConnection.close();
			} catch (SQLException se) {
				System.out.print(se.getMessage());
			}
		}

		return result;
	}


	// 전체 출력 및 검색 결과 출력용 메소드
	public List<Member> list(String key, String value) {
		List<Member> result = new ArrayList<Member>();

		/*
		 * CREATE VIEW membersView AS SELECT mid_, name_, phone, email, regDate,
		 * deptName FROM members INNER JOIN dept USING(deptID) ORDER BY mid_;
		 */

		String sql = "SELECT mid_, name_, phone, email, regDate, deptName FROM membersView";
		
		//key, value를 이용한 검색 조건 지정
		//->key가 "ALL"인 경우는 전체 출력.
        switch (key) {
        case "ALL": sql += ""; break;
        case "mid_": sql += " WHERE mid_ = ?"; break;
        case "name_": sql += " WHERE INSTR(LOWER(name_), LOWER(?))"; break;
        case "phone": sql += " WHERE INSTR(phone, ?)"; break;
        case "email": sql += " WHERE INSTR(email, ?)"; break;
        case "regDate": sql += " WHERE INSTR(regDate, ?)"; break;
        case "deptName": sql += " WHERE INSTR(deptName, ?)"; break;
        }
		sql += " ORDER BY mid_";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = MySQLConnection.connect();

			pstmt = conn.prepareStatement(sql);
			
            if(!key.equals("ALL")) {
                pstmt.setString(1, value);
            }
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				String mid_ = rs.getString("mid_");
				String name_ = rs.getString("name_");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				LocalDate regDate = rs.getDate("regDate").toLocalDate();
				String deptName = rs.getString("deptName");

				Member m = new Member();

				m.setMid_(mid_);
				m.setName_(name_);
				m.setPhone(phone);
				m.setEmail(email);
				m.setRegDate(regDate);
				m.setDeptName(deptName);

				result.add(m);

			}
			rs.close();

		} catch (SQLException se) {
			System.out.print(se.getMessage());
		} catch (Exception e) {
			System.out.print(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				MySQLConnection.close();
			} catch (SQLException se) {
				System.out.print(se.getMessage());
			}
		}

		return result;
	}
	
	
	
	// 회원정보 입력용 메소드
	public int memberAdd(Member m) {
		int result = 0;

		String sql = "INSERT INTO members (mid_, name_, phone, email, regDate, deptId) VALUES ((SELECT * FROM (SELECT CONCAT('M', LPAD(IFNULL(SUBSTRING(MAX(mid_), 2), 0) + 1, 2, 0)) AS newMid FROM members) m) , ?, ?, ?, ?, ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = MySQLConnection.connect();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getName_());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getRegDate().toString());
			pstmt.setString(5, m.getDeptId());

			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				MySQLConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return result;
	}
	
	
	//부서 정보 읽기용 메소드
	public List<Member> deptList() {
		List<Member> result = new ArrayList<Member>();

		String sql = "SELECT deptId, deptName FROM dept ORDER BY deptId";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = MySQLConnection.connect();

			pstmt = conn.prepareStatement(sql);
			// 외부데이터 바인딩 과정 추가하는 위치
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				String deptId = rs.getString("deptId");
				String deptName = rs.getString("deptName");

				Member m = new Member();
				m.setDeptId(deptId);
				m.setDeptName(deptName);
				result.add(m);

			}
			rs.close();

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				MySQLConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;

	}
	
	
	//전체 인원수 확인용 메소드
	public int totalCount() {
		int result = 0;

		String sql = "SELECT COUNT(*) AS totalCount FROM membersView";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = MySQLConnection.connect();

			pstmt = conn.prepareStatement(sql);
			// 외부데이터 바인딩 과정 추가하는 위치
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				result = rs.getInt("totalCount");
			}
			rs.close();

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				MySQLConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}		
		
		return result;
	}
	
	
	//회원 정보 삭제 메소드
	public int memberRemove(String mid_) {
		int result = 0;
		
		String sql = "DELETE FROM members WHERE mid_=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = MySQLConnection.connect();

			pstmt = conn.prepareStatement(sql);
			// 외부데이터 바인딩 과정 추가하는 위치
			pstmt.setString(1, mid_);
			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				MySQLConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}	
		
		return result;
	}
	

	// 회원정보 수정 액션 메소드
	public int memberModify(Member m) {
		int result=0;
		
		String sql = "UPDATE members SET name_=?, phone=?, email=?, regDate=?, deptId=? WHERE mid_=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getName_());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getRegDate().toString());
			pstmt.setString(5, m.getDeptId());
			pstmt.setString(6, m.getMid_());
			
			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				MySQLConnection.close();
			} catch (SQLException se) {
				System.out.println(se.getMessage());
			}
		}		
		return result;
	}
}

```



# MemberHandler.java

```java
package com.test;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberHandler {
	// 사용자 요청 주소별로 메소드 작성
	// 주의) 요청 주소 작성시 절대주소 표기법 사용
	// 주의) 주소와 메소드 이름을 서로 같은 이름 사용
	
	// member/list
	public String list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 액션
		// request.setCharacterEncoding("UTF-8");
		// -> com.util.CharactorEncodingFilter 클래스로 대체
		String key = request.getParameter("key");
		String value = request.getParameter("value");
		if(key==null){
			key="ALL";
			value="";
		}
		
		// 전체 인원수 확인 기능
		MemberDAO dao = new MemberDAO();
		int totalCount = dao.totalCount();
		
		// 출력
		List<Member> list = dao.list(key, value);
		int count = list.size();
		
		// 부서명 출력
		List<Member> deptList = dao.deptList();

		// 결과 -> request 객체에 저장
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("deptList", deptList);
		request.setAttribute("key", key);
		request.setAttribute("value", value);
		
		return "/WEB-INF/views/member.jsp";		// 맨 앞에 '/'를 넣어야 한다. contextRoot 기준.
	}
	
	// member/insert
	public String insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 액션
		// 데이터 수신(request 객체)
		String name_ = request.getParameter("name_");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		LocalDate regDate = LocalDate.parse(request.getParameter("regDate"));
		String deptId = request.getParameter("deptId");
		
		Member m = new Member();
		m.setName_(name_);
		m.setPhone(phone);
		m.setEmail(email);
		m.setRegDate(regDate);
		m.setDeptId(deptId);
		
		MemberDAO dao = new MemberDAO();
		int result = dao.memberAdd(m);
		
		return String.format("redirect:%s/member/list?success=%s", request.getContextPath(), result);
	}
	
	// member/update
	public String update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 액션
		//데이터 수신(request 내장 객체)
		String name_=request.getParameter("name_");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String deptId = request.getParameter("deptId");
		String regDate = request.getParameter("regDate");
		String mid_=request.getParameter("mid_");

		//->DAO 클래스로 정보 전달 -> Member
	 	Member m = new Member();
		m.setName_(name_);
		m.setPhone(phone);
		m.setEmail(email);
		m.setDeptId(deptId);
		m.setRegDate(LocalDate.parse(regDate));
		m.setMid_(mid_);

		
		//-> memberModify() 호출
		MemberDAO dao = new MemberDAO();
		int result=dao.memberModify(m);
		
		return String.format("redirect:%s/member/list?success=%s", request.getContextPath(), result);
	}
	
	// member/delete
	public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//액션
		//데이터 수신(request 내장 객체)
		String mid_ = request.getParameter("mid_");

		//->DAO 클래스로 정보 전달 -> Member
		//-> memberRemove() 호출
		MemberDAO dao = new MemberDAO();
		int result = dao.memberRemove(mid_);
		
		return String.format("redirect:%s/member/list?success=%s", request.getContextPath(), result);
	}
}

```



# MySQLConnection.java

```java
package com.test;

import java.sql.*;

//데이터베이스 연결 정보 관리 클래스
public class MySQLConnection {
	
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://211.63.89.72:3306/test03?useSSL=false";

	// Database credentials
	static final String USER = "id";
	static final String PASS = "pw";	
	
	private static Connection conn;
	
	//데이테베이스 커넥션 객체 생성 메소드
	public static Connection connect() throws ClassNotFoundException, SQLException {
		
		// STEP 2: Register JDBC driver
		Class.forName(JDBC_DRIVER);
		// STEP 3: Open a connection
		conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		return conn;
	}
	
	//데이테베이스 커넥션 객체 소멸 메소드
	public static void close() throws SQLException {
		if (conn != null) {
			conn.close();
		}
	}
	
}
```



# com.util>

# CharactorEncodingFilter.java

```java
package com.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharactorEncodingFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response); 		// 여러 개의 필터를 연결해서 실행
	}

	@Override
	public void init(FilterConfig config) throws ServletException {

	}
	

	@Override
	public void destroy() {

	}

}

```





# WebContent> WEB-INF>

# web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	id="WebApp_ID" version="3.1">
	<display-name>membersMVC_20180329</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
	</welcome-file-list>
	
	<servlet>
		<servlet-name>MemberController</servlet-name>
		<servlet-class>com.test.MemberController</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>MemberController</servlet-name>
		<url-pattern>/member/*</url-pattern>
	</servlet-mapping>
	
	<filter>
		<filter-name>encodingFilter</filter-name>
		<filter-class>com.util.CharactorEncodingFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>encodingFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
</web-app>
```



# WebContent>WEB-INF>views

# member.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

		//검색
		var key = "${key}";
		var value = "${value}";
        $("select#key > option[value='"+key+"']").attr("selected","selected");
        $("input#value").val(value);
        
        //삭제
        $("button.btnDelete").on("click", function() {
        	if (confirm("현재 선택한 자료를 삭제할까요?")) {
             	location.assign("${pageContext.request.contextPath}/member/delete?mid_=" + $(this).val());
         	}
        });
        
  
        
        //수정
        $("button.btnUpdate").on("click", function() {
        	$("div#input .panel-heading").text("회원관리 수정");
        	$("div#input form").attr("action", "${pageContext.request.contextPath}/member/update");
			var mid_ = $(this).parents("tr").children().eq(0).text();
			$("div#input form").prepend('<div class="form-group"> <label for="mid_">Mid:</label> <input type="text"	class="form-control" id="mid_" name="mid_" value="'+mid_+'" readonly> </div>');
        	$("div#input input#name_").val($(this).parents("tr").children().eq(1).text());
        	$("div#input input#phone").val($(this).parents("tr").children().eq(2).text());
        	$("div#input input#email").val($(this).parents("tr").children().eq(3).text());
        	$("div#input input#regDate").val($(this).parents("tr").children().eq(4).text());
        	$("div#input select#deptId option:contains('" + $(this).parents("tr").children().eq(5).text() + "')").attr("selected", "selected");
        	$("div#output button.btnUpdate").attr("disabled", "disabled");
        });
        
	});


</script>
</head>
<body>
	<div class="container">

		<div class="panel page-header" style="text-align:center;">
			<h1 style="font-size:xx-large;">
				<a href="${pageContext.request.contextPath}/member/list"><img src="${pageContext.request.contextPath}/img/sist_logo.png" alt="sist_logo.png"> </a>
				회원관리 <small>v4.2</small> <span style="font-size:small; color: #777777;">A website that manages personal information for members</span>
			</h1>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">회원관리 입력</div>
			<div class="panel-body">

				<form action="${pageContext.request.contextPath}/member/insert" method="post">
				
					<div class="form-group">
						<label for="name_">Name:</label> <input type="text"
							class="form-control" id="name_" name="name_" placeholder="max:20" required>
					</div>
					<div class="form-group">
						<label for="phone">Phone:</label> <input type="text"
							class="form-control" id="phone" name="phone" placeholder="max:20" required>
					</div>
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" id="email" name="email" placeholder="max:50">
					</div>
					
					<div class="form-group">
						<label for="regDate">RegDate:</label> <input type="date"
							class="form-control" id="regDate" name="regDate">
					</div>
										
					<div class="form-group">
					  <label for="deptId">DeptName:</label>
					  <select class="form-control" id="deptId" name="deptId">
					  	<c:forEach var="m" items="${deptList}">
					  	<option value ="${m.deptId}">${m.deptName}</option>
					   	</c:forEach>
					  </select>
					</div>					
					<button type="submit" class="btn btn-default">Submit</button>
					<c:if test="${param.success==1}">
						<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>성공했습니다</div>
					</c:if>
					<c:if test="${param.success==0}">
						<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다</div>"
					</c:if>
					
				</form>
			</div>
		</div>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">회원관리 출력</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Mid</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>RegDate</th>
							<th>DeptName</th>
							<th>Update/Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${count==0}">
						<tr><td colspan="7" style="text-align:center;"> <strong>출력 대상이 없습니다.</strong> </td></tr>
						</c:if>
						<c:if test="${count>0}">
						<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.mid_}</td>
							<td>${m.name_}</td>
							<td>${m.phone}</td>
							<td>${m.email}</td>
							<td>${m.regDate}</td>
							<td>${m.deptName}</td>
							<td><div class="btn-group"><button type="button" class="btn btn-default btn-xs btnUpdate">Update</button><button type="button" class="btn btn-default btn-xs btnDelete" value="${m.mid_}">Delete</button></div></td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>

				<form class="form-inline" method="post">
					<div class="form-group">
						<button type="button" class="btn btn-default">TotalCount <span class="badge">${totalCount}</span></button>
						<button type="button" class="btn btn-default">Count <span class="badge">${count}</span></button>
						<button	type="button" class="btn btn-default" ><span class="glyphicon glyphicon-step-backward"></span> Previous</button>
						<button	type="button" class="btn btn-default" >Next <span class="glyphicon glyphicon-step-forward"></span></button>
						
						<select class="form-control" id="key" name="key">
							<option value="mid_">Mid</option>
							<option value="name_">Name</option>
							<option value="phone">Phone</option>
							<option value="email">Email</option>
							<option value="regDate">RegDate</option>
							<option value="deptName">DeptName</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search" >

						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
								
			</div>
		</div>

	</div>

</body>
</html>
```



# error.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h1>잘못된 요청 주소입니다.</h1>
</div>

</body>
</html>
```

