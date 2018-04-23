---
layout: post
title: "Students(ver.Spring MVC)"
description: "Students(ver.Spring MVC)"
categories: [Spring, MVC]
tags: [Spring, MVC, students]
redirect_from:
  - /2018/04/20/
---



# Spring MVC Example1 - Students

### DB Query

```sql
SELECT * FROM student;

CREATE TABLE student(
	id int,
    name_ varchar(10),
    age int
    );
    
INSERT INTO student VALUES (1, 'hong', 28);
INSERT INTO student VALUES (2, 'choi', 24);
```



### Student.java

```java
package com.test;

public class Student {

	private Integer id, age;
	private String name_;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getName_() {
		return name_;
	}
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	
}

```



### StudentDAO.java

```java
package com.test;

import java.util.List;

public interface StudentDAO {
	
	public List<Student> studentList();
	
	public int studentAdd(Student s);

}

```



### StudentJDBCTemplate.java

```java
package com.test;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class StudentJDBCTemplate implements StudentDAO {

	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Student> studentList() {
		String sql = "SELECT id, name_, age FROM student";
		List<Student> result = this.jdbcTemplateObject.query(sql, new StudentMapper());
		return result;
	}

	@Override
	public int studentAdd(Student s) {
		
		String sql = "INSERT INTO student (name_, age) VALUES (?, ?)";
		int result = this.jdbcTemplateObject.update(sql, s.getName_(), s.getAge());
		System.out.println("Created Record Name = " + s.getName_() + " Age = " + s.getAge());
		return result;
		
	}

}

```



### StudentMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class StudentMapper implements RowMapper<Student> {

	@Override
	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Student s = new Student();
		s.setId(rs.getInt("id"));
		s.setName_(rs.getString("name_"));
		s.setAge(rs.getInt("age"));
		
		return s;
	}

}

```



### StudentController.java

```java
package com.test;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//Spring JDBC -> Spring MVC를 위해 추가한 클래스 

@Controller
public class StudentController {
	
	// StudentJDBCTemplate 변수 선언 후 의존 주입 (Autowired를 통한 자동 연결)
	@Autowired
	private StudentJDBCTemplate jdbcTemplate;
	
	@RequestMapping("/list")
	public String list(Model model) {	
		// jdbcTemplate.studentList() 실행 후 반환받은 List를 넘겨주기 위해 Model 객체를 매개변수로 받는다
		List<Student> list = this.jdbcTemplate.studentList();
		model.addAttribute("list", list);
		return "list";
	}
}

```



### dispatcher-servlet.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="
   http://www.springframework.org/schema/beans     
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
   http://www.springframework.org/schema/context 
   http://www.springframework.org/schema/context/spring-context-3.0.xsd">

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
		<property value="id" name="username" />
		<property value="pw" name="password" />
	</bean>
	
	<bean class="com.test.StudentJDBCTemplate" id="studentJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
</beans>

```



### web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>springmvc_20180419</display-name>
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
  
</web-app>
```



### list.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	});


</script>
</head>
<body>
	<div class="container">
		<h1> 회원 명단 </h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>id</th>
					<th>name_</th>
					<th>age</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${list}">
					<tr>
						<td>${s.id}</td>
						<td>${s.name_}</td>
						<td>${s.age}</td>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>
```

