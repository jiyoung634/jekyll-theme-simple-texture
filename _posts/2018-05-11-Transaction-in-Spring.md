---
layout: post
title: "Transaction in Spring"
description: "Transaction in Spring"
categories: [Spring, mybatis]
tags: [Spring, mybatis, Transaction, MySQL]
redirect_from:
  - /2018/05/11/
---



# 콘솔 버전

- C:\spring-lib\commons-logging-1.2.jar
- C:\spring-lib\spring-aop-4.1.6.RELEASE.jar
- C:\spring-lib\spring-aspects-4.1.6.RELEASE.jar
- C:\spring-lib\spring-beans-4.1.6.RELEASE.jar
- C:\spring-lib\spring-context-4.1.6.RELEASE.jar
- C:\spring-lib\spring-context-support-4.1.6.RELEASE.jar
- C:\spring-lib\spring-core-4.1.6.RELEASE.jar
- C:\spring-lib\spring-expression-4.1.6.RELEASE.jar
- C:\spring-lib\spring-jdbc-4.1.6.RELEASE.jar
- C:\spring-lib\spring-tx-4.1.6.RELEASE.jar
- C:\mysql_connector\mysql-connector-java-5.1.45-bin.jar



## StudentMarks.java

```java
package com.test;

public class StudentMarks {
	   private Integer age;
	   private String name;
	   private Integer id;
	   private Integer marks;
	   private Integer year;
	   private Integer sid;

	   public void setAge(Integer age) {
	      this.age = age;
	   }
	   public Integer getAge() {
	      return age;
	   }
	   public void setName(String name) {
	      this.name = name;
	   }
	   public String getName() {
	      return name;
	   }
	   public void setId(Integer id) {
	      this.id = id;
	   }
	   public Integer getId() {
	      return id;
	   }
	   public void setMarks(Integer marks) {
	      this.marks = marks;
	   }
	   public Integer getMarks() {
	      return marks;
	   }
	   public void setYear(Integer year) {
	      this.year = year;
	   }
	   public Integer getYear() {
	      return year;
	   }
	   public void setSid(Integer sid) {
	      this.sid = sid;
	   }
	   public Integer getSid() {
	      return sid;
	   }
	}
	
```



## StudentDAO.java

```java
package com.test;

import java.util.List;
import javax.sql.DataSource;

public interface StudentDAO {

   
   /** 
      * This is the method to be used to create
      * a record in the Student and Marks tables.
   */
   public void create(String name, Integer age, Integer marks, Integer year);
   
   /** 
      * This is the method to be used to list down
      * all the records from the Student and Marks tables.
   */
   public List<StudentMarks> listStudents();
}
```



## StudentJDBCTemplate.java

```java
package com.test;

import java.util.List;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

public class StudentJDBCTemplate implements StudentDAO {
   private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
   private PlatformTransactionManager transactionManager;

   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
   }
   public void setTransactionManager(PlatformTransactionManager transactionManager) {
      this.transactionManager = transactionManager;
   }
   public void create(String name, Integer age, Integer marks, Integer year){
      TransactionDefinition def = new DefaultTransactionDefinition();
      TransactionStatus status = transactionManager.getTransaction(def);

      try {
         String SQL1 = "insert into Student (name, age) values (?, ?)";
         jdbcTemplateObject.update( SQL1, name, age);

         // Get the latest student id to be used in Marks table
         String SQL2 = "select max(id) from Student";
         int sid = jdbcTemplateObject.queryForObject( SQL2, Integer.class );

         String SQL3 = "insert into Marks(sid, marks, year) " + "values (?, ?, ?)";
         jdbcTemplateObject.update( SQL3, sid, marks, year);

         System.out.println("Created Name = " + name + ", Age = " + age);
         transactionManager.commit(status);
      } 
      catch (DataAccessException e) {
         System.out.println("Error in creating record, rolling back");
         transactionManager.rollback(status);
         throw e;
      }
      return;
   }
   public List<StudentMarks> listStudents() {
      String SQL = "select * from Student, Marks where Student.id=Marks.sid";
      List <StudentMarks> studentMarks = jdbcTemplateObject.query(SQL, 
         new StudentMarksMapper());
      
      return studentMarks;
   }
}
```



## StudentMarksMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class StudentMarksMapper implements RowMapper<StudentMarks> {
   public StudentMarks mapRow(ResultSet rs, int rowNum) throws SQLException {
      StudentMarks studentMarks = new StudentMarks();
      studentMarks.setId(rs.getInt("id"));
      studentMarks.setName(rs.getString("name"));
      studentMarks.setAge(rs.getInt("age"));
      studentMarks.setSid(rs.getInt("sid"));
      studentMarks.setMarks(rs.getInt("marks"));
      studentMarks.setYear(rs.getInt("year"));

      return studentMarks;
   }
}
```



## MainApp.java

```java
package com.test;

import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.test.StudentJDBCTemplate;

public class MainApp {
   public static void main(String[] args) {
      ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/beans.xml");
      StudentJDBCTemplate studentJDBCTemplate = 
         (StudentJDBCTemplate)context.getBean("studentJDBCTemplate");
      
      System.out.println("------Records creation--------" );
      studentJDBCTemplate.create("Zara", 11, 99, 2010);
      studentJDBCTemplate.create("Nuha", 20, 97, 2010);
      studentJDBCTemplate.create("Ayan", 25, 100, 2011);

      System.out.println("------Listing all the records--------" );
      List<StudentMarks> studentMarks = studentJDBCTemplate.listStudents();
      
      for (StudentMarks record : studentMarks) {
         System.out.print("ID : " + record.getId() );
         System.out.print(", Name : " + record.getName() );
         System.out.print(", Marks : " + record.getMarks());
         System.out.print(", Year : " + record.getYear());
         System.out.println(", Age : " + record.getAge());
      }
      
      ((ClassPathXmlApplicationContext)context).close();
      
      
   }
}

```



## beans.xml

```xml
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
   http://www.springframework.org/schema/context
   http://www.springframework.org/schema/context/spring-context-3.0.xsd">

	<context:annotation-config />
	<!-- 데이터베이스 연결 정보 관리 -->
	<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="com.mysql.jdbc.Driver" />
		<property name="url" value="jdbc:mysql://211.63.89.72:3306/test03?useSSL=false" />
		<property name="username" value="test03" />
		<property name="password" value="1234" />
	</bean>

	
   <!-- Initialization for TransactionManager -->
   <bean id = "transactionManager" 
      class = "org.springframework.jdbc.datasource.DataSourceTransactionManager">
      <property name = "dataSource"  ref = "dataSource" />    
   </bean>

   <!-- Definition for studentJDBCTemplate bean -->
   <bean id = "studentJDBCTemplate" class = "com.test.StudentJDBCTemplate">
      <property name = "dataSource" ref = "dataSource" />
      <property name = "transactionManager" ref = "transactionManager" />    
   </bean>
</beans>
```







# Spring 버전

- commons-collections4-4.1.jar
- commons-fileupload-1.3.3.jar
- commons-io-2.6.jar
- commons-logging-1.2.jar
- jackson-annotations-2.8.4.jar
- jackson-core-2.8.4.jar
- jackson-databind-2.8.4.jar
- jstl-1.2.jar
- mysql-connector-java-5.1.44-bin.jar
- poi-3.17.jar
- poi-ooxml-3.17.jar
- poi-ooxml-schemas-3.17.jar
- spring-aop-4.1.6.RELEASE.jar
- spring-aspects-4.1.6.RELEASE.jar
- spring-beans-4.1.6.RELEASE.jar
- spring-context-4.1.6.RELEASE.jar
- spring-context-support-4.1.6.RELEASE.jar
- spring-core-4.1.6.RELEASE.jar
- spring-expression-4.1.6.RELEASE.jar
- spring-jdbc-4.1.6.RELEASE.jar
- spring-tx-4.1.6.RELEASE.jar
- spring-web-4.1.6.RELEASE.jar
- spring-webmvc-4.1.6.RELEASE.jar
- xmlbeans-2.6.0.jar



## StudentMarks.java

```java
package com.test;

public class StudentMarks {
	private Integer age;
	private String name;
	private Integer id;
	private Integer marks;
	private Integer year;
	private Integer sid;

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getAge() {
		return age;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	public Integer getMarks() {
		return marks;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getYear() {
		return year;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getSid() {
		return sid;
	}
}

```



## StudentDAO.java

```java
package com.test;

import java.util.List;
import javax.sql.DataSource;

public interface StudentDAO {
   /** 
      * This is the method to be used to initialize
      * database resources ie. connection.
   */
   public void setDataSource(DataSource ds);
   
   /** 
      * This is the method to be used to create
      * a record in the Student and Marks tables.
   */
   public void create(String name, Integer age, Integer marks, Integer year);
   
   /** 
      * This is the method to be used to list down
      * all the records from the Student and Marks tables.
   */
   public List<StudentMarks> listStudents();
}
```



## StudentJDBCTemplate.java

```java
package com.test;

import java.util.List;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

public class StudentJDBCTemplate implements StudentDAO {
	
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	private PlatformTransactionManager transactionManager;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public void setTransactionManager(PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}

	public void create(String name, Integer age, Integer marks, Integer year) {
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);

		try {
			String SQL1 = "insert into Student (name, age) values (?, ?)";
			jdbcTemplateObject.update(SQL1, name, age);

			// Get the latest student id to be used in Marks table
			String SQL2 = "select max(id) from Student";
			int sid = jdbcTemplateObject.queryForObject(SQL2, Integer.class);

			String SQL3 = "insert into Marks(sid, marks, year) values (?, ?, ?)";
			jdbcTemplateObject.update(SQL3, sid, marks, year);

			System.out.println("Created Name = " + name + ", Age = " + age);
			transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in creating record, rolling back");
			transactionManager.rollback(status);
			throw e;
		}
		return;
	}

	public List<StudentMarks> listStudents() {
		String SQL = "select * from Student, Marks where Student.id=Marks.sid";
		List<StudentMarks> studentMarks = jdbcTemplateObject.query(SQL, new StudentMarksMapper());

		return studentMarks;
	}
}

```



## StudentMarksMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class StudentMarksMapper implements RowMapper<StudentMarks> {
	public StudentMarks mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		StudentMarks studentMarks = new StudentMarks();
		studentMarks.setId(rs.getInt("id"));
		studentMarks.setName(rs.getString("name"));
		studentMarks.setAge(rs.getInt("age"));
		studentMarks.setSid(rs.getInt("sid"));
		studentMarks.setMarks(rs.getInt("marks"));
		studentMarks.setYear(rs.getInt("year"));

		return studentMarks;
	}
}
```



## StudentController.java

```java
package com.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentJDBCTemplate studentJDBCTemplate;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<StudentMarks> list =  this.studentJDBCTemplate.listStudents();
		
		model.addAttribute("list", list);
		
		return "student"; ///WEB-INF/views/student.jsp
	}

	@RequestMapping("/insert")
	public String insert(StudentMarks st) {
		
		this.studentJDBCTemplate.create(st.getName(), st.getAge(), st.getMarks(), st.getYear());
		
		return "redirect:/student/list";
	}
	
}

```



## student.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

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

		<div class="panel page-header" style="text-align:center;">
			<h1 style="font-size:xx-large;">
				<a href="${pageContext.request.contextPath}/student/list"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="sist_logo.png"> </a>
				트랜잭션 <small>v2.0</small> 
			</h1>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">입력</div>
			<div class="panel-body">

				<form action="${pageContext.request.contextPath}/student/insert" method="post">
				
					<div class="form-group">
						<label for="name">Name:</label> <input type="text"
							class="form-control" id="name" name="name" required>
					</div>
					<div class="form-group">
						<label for="age">Age:</label> <input type="text"
							class="form-control" id="age" name="age" required>
					</div>
					<div class="form-group">
						<label for="marks">Marks:</label> <input type="text"
							class="form-control" id="marks" name="marks">
					</div>
					
					<div class="form-group">
						<label for="year">Year:</label> <input type="text"
							class="form-control" id="year" name="year">
					</div>
				
					<button type="submit" class="btn btn-default">Submit</button>
					
					<c:if test="${param.success==1}">
					<div class="alert alert-success alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Success!</strong> 요청한 작업이 처리되었습니다. </div>
					</c:if>
					<c:if test="${param.success==0}">
					<div class="alert alert-danger alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Fail!</strong> 요청한 작업 처리가 실패했습니다. </div>
					</c:if>
					
				</form>
			</div>
		</div>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">출력</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Marks</th>
							<th>Year</th>
							<th>Age</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.id}</td>
							<td>${m.name}</td>
							<td>${m.marks}</td>
							<td>${m.year}</td>
							<td>${m.age}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
								
			</div>
		</div>

	</div>

</body>
</html>
```



## dispatcher-servlet.xml

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
	<bean id="dataSource"
		class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="com.mysql.jdbc.Driver" />
		<property name="url"
			value="jdbc:mysql://211.63.89.72:3306/test03?useSSL=false" />
		<property name="username" value="id" />
		<property name="password" value="pw" />
	</bean>

	<!-- Initialization for TransactionManager -->
	<bean id="transactionManager"
		class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource" />
	</bean>

	<!-- Definition for studentJDBCTemplate bean -->
	<bean id="studentJDBCTemplate" class="com.test.StudentJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
		<property name="transactionManager" ref="transactionManager" />
	</bean>
	
	<mvc:annotation-driven /> 
	<mvc:resources location="/resources/" mapping="/resources/**" />

</beans> 
```



## web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>transaction_20180511</display-name>
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
		<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
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









# Spring MyBatis 버전

- 라이브러리 - pom.xml 참고



## StudentMarks.java

```java
package com.test.domain;

public class StudentMarks {
	private Integer age;
	private String name;
	private Integer id;
	private Integer marks;
	private Integer year;
	private Integer sid;

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getAge() {
		return age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	public Integer getMarks() {
		return marks;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getYear() {
		return year;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getSid() {
		return sid;
	}
}

```



## StudentDAO.java

```java
package com.test.persistence;

import java.util.List;

import com.test.domain.StudentMarks;

public interface StudentDAO {

   public List<StudentMarks> list();
   public void studentAdd(StudentMarks st);
   public void marksAdd(StudentMarks st);
   public Integer maxID();

}
```



## StudentDAOImpl.java

```java
package com.test.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.StudentMarks;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<StudentMarks> list() {
		return this.sqlSession.selectList("com.test.mapper.StudentMapper.list");
	}

	@Override
	public void studentAdd(StudentMarks st) {
		this.sqlSession.insert("com.test.mapper.StudentMapper.studentAdd", st);
	}

	@Override
	public void marksAdd(StudentMarks st) {
		this.sqlSession.insert("com.test.mapper.StudentMapper.marksAdd", st);
	}

	@Override
	public Integer maxID() {
		return this.sqlSession.selectOne("com.test.mapper.StudentMapper.maxID");
	}

}

```



## studentMapper.xml

```html
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.test.mapper.StudentMapper">

	<select id="list" resultType="com.test.domain.StudentMarks">
		select id, name, age, marks, year from Student, Marks where Student.id=Marks.sid
	</select>
	
	<insert id="studentAdd">
		insert into Student (name, age) values (#{name}, #{age})
	</insert>

	<select id="maxID" resultType="Integer">
		select max(id) from Student
	</select>

	<insert id="marksAdd">
		insert into Marks(sid, marks, year) values (#{sid}, #{marks}, #{year})
	</insert>

</mapper>  
```





## StudentService.java

```java
package com.test.service;

import java.util.List;

import com.test.domain.StudentMarks;

public interface StudentService {

	 public List<StudentMarks> list();
	 public void create(StudentMarks st);
	 
}

```





## StudentServiceImpl.java

```java
package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.domain.StudentMarks;
import com.test.persistence.StudentDAO;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Inject
	private StudentDAO studentDAO;

	@Override
	public List<StudentMarks> list() {
		return this.studentDAO.list();
	}

	@Transactional
	@Override
	public void create(StudentMarks st) {
		this.studentDAO.studentAdd(st);
		int sid = this.studentDAO.maxID();
		st.setSid(sid);
		this.studentDAO.marksAdd(st);
	}

}

```



## StudentController.java

```java
package com.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.domain.StudentMarks;
import com.test.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<StudentMarks> list =  this.studentService.list();
		
		model.addAttribute("list", list);
		
		return "student"; ///WEB-INF/views/student.jsp
	}

	@RequestMapping("/insert")
	public String insert(StudentMarks st) {
		
		this.studentService.create(st);
		
		return "redirect:/student/list";
	}
	
}

```



## student.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

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

		<div class="panel page-header" style="text-align:center;">
			<h1 style="font-size:xx-large;">
				<a href="${pageContext.request.contextPath}/student/list"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="sist_logo.png"> </a>
				트랜잭션 <small>v3.0</small> 
			</h1>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">입력</div>
			<div class="panel-body">

				<form action="${pageContext.request.contextPath}/student/insert" method="post">
				
					<div class="form-group">
						<label for="name">Name:</label> <input type="text"
							class="form-control" id="name" name="name" required>
					</div>
					<div class="form-group">
						<label for="age">Age:</label> <input type="text"
							class="form-control" id="age" name="age" required>
					</div>
					<div class="form-group">
						<label for="marks">Marks:</label> <input type="text"
							class="form-control" id="marks" name="marks">
					</div>
					
					<div class="form-group">
						<label for="year">Year:</label> <input type="text"
							class="form-control" id="year" name="year">
					</div>
				
					<button type="submit" class="btn btn-default">Submit</button>
					
					<c:if test="${param.success==1}">
					<div class="alert alert-success alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Success!</strong> 요청한 작업이 처리되었습니다. </div>
					</c:if>
					<c:if test="${param.success==0}">
					<div class="alert alert-danger alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Fail!</strong> 요청한 작업 처리가 실패했습니다. </div>
					</c:if>
					
				</form>
			</div>
		</div>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">출력</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Marks</th>
							<th>Year</th>
							<th>Age</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.id}</td>
							<td>${m.name}</td>
							<td>${m.marks}</td>
							<td>${m.year}</td>
							<td>${m.age}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
								
			</div>
		</div>

	</div>

</body>
</html>
```



## servlet-context.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans:beans xmlns="http://www.springframework.org/schema/mvc"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:beans="http://www.springframework.org/schema/beans"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd">

	<!-- DispatcherServlet Context: defines this servlet's request-processing 
		infrastructure -->

	<!-- Enables the Spring MVC @Controller programming model -->
	<annotation-driven />

	<!-- Handles HTTP GET requests for /resources/** by efficiently serving 
		up static resources in the ${webappRoot}/resources directory -->
	<resources mapping="/resources/**" location="/resources/" />

	<!-- Resolves views selected for rendering by @Controllers to .jsp resources 
		in the /WEB-INF/views directory -->
	<beans:bean
		class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<beans:property name="prefix" value="/WEB-INF/views/" />
		<beans:property name="suffix" value=".jsp" />
	</beans:bean>

	<!-- XXXXController 클래스에 대한 스프링 빈 등록 설정 추가 -->
	<context:component-scan base-package="com.test.controller" />


</beans:beans>

```



## root-context.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:jdbc="http://www.springframework.org/schema/jdbc"
	xmlns:mybatis-spring="http://mybatis.org/schema/mybatis-spring"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xsi:schemaLocation="http://www.springframework.org/schema/jdbc http://www.springframework.org/schema/jdbc/spring-jdbc-4.3.xsd
		http://mybatis.org/schema/mybatis-spring http://mybatis.org/schema/mybatis-spring-1.2.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd
		http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-4.3.xsd
		http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-4.3.xsd">

	<!-- Root Context: defines shared resources visible to all other web components -->

	<!-- 데이터베이스 연결 정보 관리 -->
	<!-- MyBatis에 대한 로깅 처리 설정 추가 -->
	<bean id="dataSource"
		class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy" />
		<property name="url"
			value="jdbc:log4jdbc:mysql://211.63.89.72:3306/test03?useSSL=false" />
		<property name="username" value="test03" />
		<property name="password" value="1234" />
	</bean>

	<!-- MyBatis 설정 추가 -->
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="dataSource" />
		<property name="configLocation" value="classpath:/mybatis-config.xml"></property>
		<property name="mapperLocations" value="classpath:mappers/**/*Mapper.xml"></property>
	</bean>
	<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate"
		destroy-method="clearCache">
		<constructor-arg name="sqlSessionFactory" ref="sqlSessionFactory"></constructor-arg>
	</bean>

	<!-- XXXXDAOImpl 클래스에 대한 스프링 빈 등록 설정 추가 -->
	<context:component-scan base-package="com.test.persistence" />

	<!-- XXXXServiceImpl 클래스에 대한 스프링 빈 등록 설정 추가 -->
	<context:component-scan base-package="com.test.service" />

	<!-- 트랜잭션 설정 추가 -->
	<bean id="transactionManager"
		class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource" />
	</bean>
	<tx:annotation-driven/>
	
</beans>

```



## web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="2.5" xmlns="http://java.sun.com/xml/ns/javaee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd">

	<!-- The definition of the Root Spring Container shared by all Servlets 
		and Filters -->
	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>/WEB-INF/spring/root-context.xml</param-value>
	</context-param>

	<!-- Creates the Spring Container shared by all Servlets and Filters -->
	<listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>

	<!-- Processes application requests -->
	<servlet>
		<servlet-name>appServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>/WEB-INF/spring/appServlet/servlet-context.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>

	<servlet-mapping>
		<servlet-name>appServlet</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>

	<!-- 인코딩 필터 설정 추가 -->
	<filter>
		<filter-name>encoding</filter-name>
		<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
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



## pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.test</groupId>
	<artifactId>sts</artifactId>
	<name>membersMVC_20180510</name>
	<packaging>war</packaging>
	<version>1.0.0-BUILD-SNAPSHOT</version>
	<properties>
		<!-- JAVA 버전 수정 -->
		<java-version>1.8</java-version>
		<!-- 스프링 프레임워크 버전 수정 -->
		<org.springframework-version>4.3.8.RELEASE</org.springframework-version>
		<org.aspectj-version>1.6.10</org.aspectj-version>
		<org.slf4j-version>1.6.6</org.slf4j-version>
	</properties>
	<dependencies>
		<!-- Spring -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>${org.springframework-version}</version>
			<exclusions>
				<!-- Exclude Commons Logging in favor of SLF4j -->
				<exclusion>
					<groupId>commons-logging</groupId>
					<artifactId>commons-logging</artifactId>
				</exclusion>
			</exclusions>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>

		<!-- AspectJ -->
		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjrt</artifactId>
			<version>${org.aspectj-version}</version>
		</dependency>

		<!-- Logging -->
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-api</artifactId>
			<version>${org.slf4j-version}</version>
		</dependency>
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>jcl-over-slf4j</artifactId>
			<version>${org.slf4j-version}</version>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-log4j12</artifactId>
			<version>${org.slf4j-version}</version>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>1.2.15</version>
			<exclusions>
				<exclusion>
					<groupId>javax.mail</groupId>
					<artifactId>mail</artifactId>
				</exclusion>
				<exclusion>
					<groupId>javax.jms</groupId>
					<artifactId>jms</artifactId>
				</exclusion>
				<exclusion>
					<groupId>com.sun.jdmk</groupId>
					<artifactId>jmxtools</artifactId>
				</exclusion>
				<exclusion>
					<groupId>com.sun.jmx</groupId>
					<artifactId>jmxri</artifactId>
				</exclusion>
			</exclusions>
			<scope>runtime</scope>
		</dependency>

		<!-- @Inject -->
		<dependency>
			<groupId>javax.inject</groupId>
			<artifactId>javax.inject</artifactId>
			<version>1</version>
		</dependency>

		<!-- 서블릿 설정 수정 -->
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>javax.servlet-api</artifactId>
			<version>3.1.0</version>
			<scope>provided</scope>
		</dependency>

		<!-- JSP 설정 수정 -->
		<dependency>
			<groupId>javax.servlet.jsp</groupId>
			<artifactId>javax.servlet.jsp-api</artifactId>
			<version>2.3.0</version>
		</dependency>


		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>

		<!-- Test -->
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.12</version>
			<scope>test</scope>
		</dependency>


		<!-- MySQL 라이브러리 추가 -->
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>5.1.41</version>
		</dependency>


		<!-- MyBatis 라이브러리 추가 -->
		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis-spring</artifactId>
			<version>1.3.0</version>
		</dependency>
		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis</artifactId>
			<version>3.4.1</version>
		</dependency>

		<!-- Spring JDBC 라이브러리 추가 -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-jdbc</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>

		<!-- Spring TEST 라이브러리 추가 -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-test</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>

		<!-- json 라이브러리 설정 추가 -->
		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-databind</artifactId>
			<version>2.8.4</version>
		</dependency>

		<!-- MyBatis에 대한 로깅 처리 라이브러리 설정 추가 -->
		<dependency>
			<groupId>org.bgee.log4jdbc-log4j2</groupId>
			<artifactId>log4jdbc-log4j2-jdbc4</artifactId>
			<version>1.16</version>
		</dependency>

		<!-- 파일 업로드 라이브러리 설정 추가 -->
		<dependency>
			<groupId>commons-fileupload</groupId>
			<artifactId>commons-fileupload</artifactId>
			<version>1.3.3</version>
		</dependency>

		<!-- 엑셀 다운로드 라이브러리 설정 추가 -->
		<dependency>
			<groupId>org.apache.poi</groupId>
			<artifactId>poi</artifactId>
			<version>3.16</version>
		</dependency>
		<dependency>
			<groupId>org.apache.poi</groupId>
			<artifactId>poi-ooxml</artifactId>
			<version>3.16</version>
		</dependency>


		<!-- 트랜잭션 처리 라이브러리 설정 추가 -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-aop</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-tx</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>
		
		
	</dependencies>
	<build>
		<plugins>
			<plugin>
				<artifactId>maven-eclipse-plugin</artifactId>
				<version>2.9</version>
				<configuration>
					<additionalProjectnatures>
						<projectnature>org.springframework.ide.eclipse.core.springnature</projectnature>
					</additionalProjectnatures>
					<additionalBuildcommands>
						<buildcommand>org.springframework.ide.eclipse.core.springbuilder</buildcommand>
					</additionalBuildcommands>
					<downloadSources>true</downloadSources>
					<downloadJavadocs>true</downloadJavadocs>
				</configuration>
			</plugin>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>2.5.1</version>
				<configuration>
					<source>1.6</source>
					<target>1.6</target>
					<compilerArgument>-Xlint:all</compilerArgument>
					<showWarnings>true</showWarnings>
					<showDeprecation>true</showDeprecation>
				</configuration>
			</plugin>
			<plugin>
				<groupId>org.codehaus.mojo</groupId>
				<artifactId>exec-maven-plugin</artifactId>
				<version>1.2.1</version>
				<configuration>
					<mainClass>org.test.int1.Main</mainClass>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>

```



## log4j.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE log4j:configuration PUBLIC "-//APACHE//DTD LOG4J 1.2//EN" "log4j.dtd">
<log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/">

	<!-- Appenders -->
	<appender name="console" class="org.apache.log4j.ConsoleAppender">
		<param name="Target" value="System.out" />
		<layout class="org.apache.log4j.PatternLayout">
			<param name="ConversionPattern" value="%-5p: %c - %m%n" />
		</layout>
	</appender>
	
	<!-- 3rdparty Loggers -->
	<logger name="org.springframework.core">
		<level value="info" />
	</logger>
	
	<logger name="org.springframework.beans">
		<level value="info" />
	</logger>
	
	<logger name="org.springframework.context">
		<level value="info" />
	</logger>

	<logger name="org.springframework.web">
		<level value="info" />
	</logger>

	<!-- Root Logger -->
	<root>
		<priority value="warn" />
		<appender-ref ref="console" />
	</root>
	
</log4j:configuration>

```



## log4jdbc.log4j2.properties

```properties
log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator


```



## logback.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xml>
<configuration>
	<include resource="org/springframework/boot/logging/logback/base.xml" />

	<!-- log4jdbc-log4j2 -->
	<logger name="jdbc.sqlonly" level="DEBUG" />
	<logger name="jdbc.sqltiming" level="INFO" />
	<logger name="jdbc.audit" level="WARN" />
	<logger name="jdbc.resultset" level="ERROR" />
	<logger name="jdbc.resultsettable" level="ERROR" />
	<logger name="jdbc.connection" level="INFO" />
	
</configuration>



```



## mybatis-config.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	
</configuration>

```

