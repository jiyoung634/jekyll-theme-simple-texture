---
layout: post
title: "Members(ver.Spring MVC)"
description: "Members(ver.Spring MVC)"
categories: [Spring, MVC]
tags: [Spring, MVC, members]
redirect_from:
  - /2018/04/20/
---



# Spring MVC Example2 - Members

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/screenshots/members.png?raw=true">

### Member.java

```java
package com.test;

import java.time.*;

public class Member {
	
	//필드 구성
	//->입력, 출력에 관여된 모든 항목
	//->동일 자료, 동일 식별자
	private String mid_, name_, phone, email, deptId, deptName, regDate;
	
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	

}

```



### MemberController.java

```java
package com.test;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	//의존 주입(DI)
	@Autowired
	private MemberJDBCTemplate memberJDBCTemplate;
	
	@RequestMapping("/list")
	public String list(Model model, String key, String value) {
		if(key==null) {
			key="ALL";
			value="";
		}
		List<Member> list = this.memberJDBCTemplate.list(key, value);
		List<Member> deptList = this.memberJDBCTemplate.deptList();
		int totalCount = this.memberJDBCTemplate.totalCount();
		int count = list.size();
		
		model.addAttribute("list", list);
		model.addAttribute("deptList", deptList);
		model.addAttribute("count", count);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		
		return "member";
	}
	
	
	@RequestMapping("/insert")
	public String insert(Member m) {
		int result = this.memberJDBCTemplate.memberInsert(m);
		return "redirect:/member/list?success="+result;
	}
	
	@RequestMapping("/delete")
	public String delete(String mid_) {
		int result = this.memberJDBCTemplate.memberDelete(mid_);
		return "redirect:/member/list?success="+result;
	}

	@RequestMapping("/update")
	public String update(Member m) {
		int result = this.memberJDBCTemplate.memberUpdate(m);
		return "redirect:/member/list?success="+result;
	}

}

```



### MemberDAO.java

```java
package com.test;

import java.util.*;

public interface MemberDAO {
	// 전체 명단 출력용 메소드
	public List<Member> list();

	// 전체 출력 및 검색 결과 출력용 메소드
	public List<Member> list(String key, String value);

	// 부서 정보 읽기용 메소드
	public List<Member> deptList();

	// 전체 인원수 확인용 메소드
	public int totalCount();
	
	// 회원정보 입력용 메소드
	public int memberInsert(Member m);

	// 회원 정보 삭제 메소드
	public int memberDelete(String mid_);

	// 회원정보 수정 액션 메소드
	public int memberUpdate(Member m);
}

```



### MemberJDBCTemplate.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MemberJDBCTemplate implements MemberDAO {

	private JdbcTemplate jdbcTemplate;

	// setter를 통한 의존 주입(DI)
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Member> list() {
		/*
		 * CREATE VIEW membersView AS SELECT mid_, name_, phone, email, regDate,
		 * deptName FROM members INNER JOIN dept USING(deptID) ORDER BY mid_;
		 */
		String sql = "SELECT mid_, name_, phone, email, regDate, deptName FROM membersView ORDER BY mid_";
		List<Member> result = this.jdbcTemplate.query(sql, new MemberMapper());

		return result;
	}

	@Override
	public List<Member> list(String key, String value) {
		/*
		 * CREATE VIEW membersView AS SELECT mid_, name_, phone, email, regDate,
		 * deptName FROM members INNER JOIN dept USING(deptID) ORDER BY mid_;
		 */

		String sql = "SELECT mid_, name_, phone, email, regDate, deptName FROM membersView";

		// key, value를 이용한 검색 조건 지정
		// ->key가 "ALL"인 경우는 전체 출력.
		switch (key) {
		case "ALL":
			sql += "";
			break;
		case "mid_":
			sql += " WHERE mid_ = ?";
			break;
		case "name_":
			sql += " WHERE INSTR(LOWER(name_), LOWER(?))";
			break;
		case "phone":
			sql += " WHERE INSTR(phone, ?)";
			break;
		case "email":
			sql += " WHERE INSTR(email, ?)";
			break;
		case "regDate":
			sql += " WHERE INSTR(regDate, ?)";
			break;
		case "deptName":
			sql += " WHERE INSTR(deptName, ?)";
			break;
		}
		sql += " ORDER BY mid_";

		List<Member> result;

		if (key.equals("ALL")) {
			result = this.jdbcTemplate.query(sql, new MemberMapper());
		} else {
			result = this.jdbcTemplate.query(sql, new MemberMapper(), value);
		}
		return result;
	}

	@Override
	public List<Member> deptList() {
		String sql = "SELECT deptId, deptName FROM dept ORDER BY deptId";
		// DeptMapper를 따로 만드는 대신 익명구현객체를 만든다.
		List<Member> result = this.jdbcTemplate.query(sql, new RowMapper<Member>() {

			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member m = new Member();
				m.setDeptId(rs.getString("deptId"));
				m.setDeptName(rs.getString("deptName"));
				return m;
			}

		});
		return result;
	}

	@Override
	public int totalCount() {
		String sql = "SELECT COUNT(*) AS totalCount FROM membersView";
		// 쿼리의 결과가 1개이고 int형으로 반환 받고 싶을 때 - queryForObject()
		int result = this.jdbcTemplate.queryForObject(sql, Integer.class);
		return result;
	}

	@Override
	public int memberInsert(Member m) {
		String sql = "INSERT INTO members (mid_, name_, phone, email, regDate, deptId) VALUES ((SELECT * FROM (SELECT CONCAT('M', LPAD(IFNULL(SUBSTRING(MAX(mid_), 2), 0) + 1, 2, 0)) AS newMid FROM members) m) , ?, ?, ?, ?, ?)";
		int result = 0;
		try {
			result = this.jdbcTemplate.update(sql, m.getName_(), m.getPhone(), m.getEmail(), m.getRegDate(),
					m.getDeptId());
		} catch (DataAccessException d) {

		}
		return result;
	}

	@Override
	public int memberDelete(String mid_) {
		String sql = "DELETE FROM members WHERE mid_=?";
		int result = 0;
		try {
			result = this.jdbcTemplate.update(sql, mid_);
		} catch (DataAccessException d) {

		}
		return result;
	}

	@Override
	public int memberUpdate(Member m) {
		String sql = "UPDATE members SET name_=?, phone=?, email=?, regDate=?, deptId=? WHERE mid_=?";
		int result = 0;
		try {
			result = this.jdbcTemplate.update(sql, m.getName_(), m.getPhone(), m.getEmail(), m.getRegDate(),
					m.getDeptId(), m.getMid_());
		} catch (DataAccessException d) {

		}
		return result;
	}

}

```



### MemberMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MemberMapper implements RowMapper<Member> {

	@Override
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
		Member m = new Member();
		m.setMid_(rs.getString("mid_"));
		m.setName_(rs.getString("name_"));
		m.setPhone(rs.getString("phone"));
		m.setEmail(rs.getString("email"));
		m.setRegDate(rs.getString("regDate"));
		m.setDeptName(rs.getString("deptName"));
		
		return m;
	}

}

```



### member.jsp

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
				<a href="${pageContext.request.contextPath}/member/list"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="sist_logo.png"> </a>
				회원관리 <small>v5.0</small> <span style="font-size:small; color: #777777;">A website that manages personal information for members</span>
			</h1>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">회원관리 입력</div>
			<div class="panel-body">

				<form name="Member" action="${pageContext.request.contextPath}/member/insert" method="post">
				
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
						<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다</div>
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



### dispatcher-servlet.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="
   http://www.springframework.org/schema/beans     
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
   http://www.springframework.org/schema/context 
   http://www.springframework.org/schema/context/spring-context-3.0.xsd 
   http://www.springframework.org/schema/mvc 
   http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd">

	<!-- Spring MVC - Annotation Controller Example -->
	<context:component-scan base-package="com.test" />

	<!-- Spring MVC - Internal Resource View Resolver Example -->
	<bean
		class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/views/" />
		<property name="suffix" value=".jsp" />
	</bean>

	<!-- 데이터베이스 연결 정보 관리 -->
	<bean class="org.springframework.jdbc.datasource.DriverManagerDataSource"
		id="dataSource">
		<property value="com.mysql.jdbc.Driver" name="driverClassName" />
		<property value="jdbc:mysql://211.63.89.72:3306/test03?useSSL=false" name="url" />
		<property value="test03" name="username" />
		<property value="1234" name="password" />
	</bean>

	<bean class="com.test.MemberJDBCTemplate" id="memberJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
	<mvc:annotation-driven /> 
	<mvc:resources location="/resources/" mapping="/resources/**" />

</beans> 
```



### web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>membersMVC_20180420</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.htm</welcome-file>
    <welcome-file>default.jsp</welcome-file>
  </welcome-file-list>
  
   <servlet>
      <servlet-name>dispatcher</servlet-name>
      <servlet-class>
         org.springframework.web.servlet.DispatcherServlet
      </servlet-class>
      <load-on-startup>1</load-on-startup>
   </servlet>

   <servlet-mapping>
      <servlet-name>dispatcher</servlet-name>
      <url-pattern>/</url-pattern>
   </servlet-mapping>  
  
  <!-- 인코딩 필터 설정 추가 -->
    <filter>
        <filter-name>encoding</filter-name>
        <filter-class>
            org.springframework.web.filter.CharacterEncodingFilter
        </filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
      </filter> 
      <filter-mapping>
          <filter-name>encoding</filter-name>
          <url-pattern>/*</url-pattern>
      </filter-mapping> 

</web-app>
```

