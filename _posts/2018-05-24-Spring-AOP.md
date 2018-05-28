---
layout: post
title: "Spring AOP"
description: "Spring AOP"
categories: [Spring, AOP]
tags: [Spring, AOP, transaction]
redirect_from:
  - /2018/05/24/
---



# 콘솔 버전

- commons-logging-1.2.jar
- pring-aop-4.1.6.RELEASE.jar
- spring-aspects-4.1.6.RELEASE.jar
- spring-beans-4.1.6.RELEASE.jar
- spring-context-4.1.6.RELEASE.jar
- spring-context-support-4.1.6.RELEASE.jar
- spring-core-4.1.6.RELEASE.jar
- spring-expression-4.1.6.RELEASE.jar
- spring-jdbc-4.1.6.RELEASE.jar
- spring-tx-4.1.6.RELEASE.jar
- mysql-connector-java-5.1.45-bin.jar
- aopalliance-1.0.jar
- aspectjweaver-1.6.8.jar



## Logging.java

```java
package com.test.ex003;

public class Logging {
	   /** 
	      * This is the method which I would like to execute
	      * before a selected method execution.
	   */
	   public void beforeAdvice(){
	      System.out.println("Going to setup student profile.");
	   }
	   
	   /** 
	      * This is the method which I would like to execute
	      * after a selected method execution.
	   */
	   public void afterAdvice(){
	      System.out.println("Student profile has been setup.");
	   }

	   /** 
	      * This is the method which I would like to execute
	      * when any method returns.
	   */
	   public void afterReturningAdvice(Object retVal) {
	      System.out.println("Returning:" + retVal.toString() );
	   }

	   /**
	      * This is the method which I would like to execute
	      * if there is an exception raised.
	   */
	   public void AfterThrowingAdvice(IllegalArgumentException ex){
	      System.out.println("There has been an exception: " + ex.toString());   
	   }
	}
```



## Student.java

```java
package com.test.ex003;

public class Student {
	   private Integer age;
	   private String name;

	   public void setAge(Integer age) {
	      this.age = age;
	   }
	   public Integer getAge() {
		  System.out.println("Age : " + age );
	      return age;
	   }
	   public void setName(String name) {
	      this.name = name;
	   }
	   public String getName() {
	      System.out.println("Name : " + name );
	      return name;
	   }
	   public void printThrowException(){
		   System.out.println("Exception raised");
	      throw new IllegalArgumentException();
	   }
	}
```



## Main.java

```java
package com.test.ex003;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex003/beans.xml");

		Student student = (Student) context.getBean("student");
		student.getName();
		student.getAge();
		//student.printThrowException();

		((ClassPathXmlApplicationContext) context).close();
	}

}

```



## beans.xml

```java
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns = "http://www.springframework.org/schema/beans"
   xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance" 
   xmlns:aop = "http://www.springframework.org/schema/aop"
   xsi:schemaLocation = "http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd 
   http://www.springframework.org/schema/aop 
   http://www.springframework.org/schema/aop/spring-aop-3.0.xsd ">

   <aop:config>
      <aop:aspect id = "log" ref = "logging">
         <aop:pointcut id = "selectAll" 
            expression = "execution(* com.test.ex003.Student.getName(..))"/>
         
	       <!--  <aop:before pointcut-ref = "selectAll" method = "beforeAdvice"/> -->
	       <!--	 <aop:after pointcut-ref = "selectAll" method = "afterAdvice"/> -->
      		 <aop:after-returning pointcut-ref = "selectAll" returning="retVal" method = "afterReturningAdvice"/>
        
      </aop:aspect>
   </aop:config>

   <!-- Definition for student bean -->
   <bean id = "student" class = "com.test.ex003.Student">
      <property name = "name" value = "Zara" />
      <property name = "age" value = "11"/>      
   </bean>

   <!-- Definition for logging aspect -->
   <bean id = "logging" class = "com.test.ex003.Logging"/> 
      
</beans>
```









# after-throwing

## Logging.java

```java
package com.test.ex003;

public class Logging {
	   /** 
	      * This is the method which I would like to execute
	      * before a selected method execution.
	   */
	   public void beforeAdvice(){
	      System.out.println("Going to setup student profile.");
	   }
	   
	   /** 
	      * This is the method which I would like to execute
	      * after a selected method execution.
	   */
	   public void afterAdvice(){
	      System.out.println("Student profile has been setup.");
	   }

	   /** 
	      * This is the method which I would like to execute
	      * when any method returns.
	   */
	   public void afterReturningAdvice(Object retVal) {
	      System.out.println("Returning:" + retVal.toString() );
	   }

	   /**
	      * This is the method which I would like to execute
	      * if there is an exception raised.
	   */
	   public void AfterThrowingAdvice(IllegalArgumentException ex){
	      System.out.println("There has been an exception: " + ex.toString());   
	   }
	}
```



## Student.java

```java
package com.test.ex003;

public class Student {
	   private Integer age;
	   private String name;

	   public void setAge(Integer age) {
	      this.age = age;
	   }
	   public Integer getAge() {
		  System.out.println("Age : " + age );
	      return age;
	   }
	   public void setName(String name) {
	      this.name = name;
	   }
	   public String getName() {
	      System.out.println("Name : " + name );
	      return name;
	   }
	   public void printThrowException(){
		   System.out.println("Exception raised");
	      throw new IllegalArgumentException();
	   }
	}
```



## Main.java

```java
package com.test.ex003;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex003/beans.xml");

		Student student = (Student) context.getBean("student");
		student.getName();
		student.getAge();
		student.printThrowException();

		((ClassPathXmlApplicationContext) context).close();
	}

}

```



## beans.xml

```java
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns = "http://www.springframework.org/schema/beans"
   xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance" 
   xmlns:aop = "http://www.springframework.org/schema/aop"
   xsi:schemaLocation = "http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd 
   http://www.springframework.org/schema/aop 
   http://www.springframework.org/schema/aop/spring-aop-3.0.xsd ">

   <aop:config>
      <aop:aspect id = "log" ref = "logging">
         <aop:pointcut id = "selectAll" 
            expression = "execution(* com.test.ex004.Student.printThrowException(..))"/>
         
         <!-- <aop:after-returning pointcut-ref = "selectAll" returning="retVal" method = "afterReturningAdvice"/> -->
         <aop:after-throwing pointcut-ref = "selectAll" throwing="ex" method = "AfterThrowingAdvice"/>
        
      </aop:aspect>
   </aop:config>

   <!-- Definition for student bean -->
   <bean id = "student" class = "com.test.ex004.Student">
      <property name = "name" value = "Zara" />
      <property name = "age" value = "11"/>      
   </bean>

   <!-- Definition for logging aspect -->
   <bean id = "logging" class = "com.test.ex004.Logging"/> 
      
</beans>
```





# aroundAdvice

## Logging.java

```java
package com.test.ex006;

import org.aspectj.lang.ProceedingJoinPoint;

public class Logging {
	   /** 
	      * This is the method which I would like to execute
	      * before a selected method execution.
	   */
	   public void beforeAdvice(){
	      System.out.println("Going to setup student profile.");
	   }
	   
	   /** 
	      * This is the method which I would like to execute
	      * after a selected method execution.
	   */
	   public void afterAdvice(){
	      System.out.println("Student profile has been setup.");
	   }

	   /** 
	      * This is the method which I would like to execute
	      * when any method returns.
	   */
	   public void afterReturningAdvice(Object retVal) {
	      System.out.println("Returning:" + retVal.toString() );
	   }

	   /**
	      * This is the method which I would like to execute
	      * if there is an exception raised.
	   */
	   public void AfterThrowingAdvice(IllegalArgumentException ex){
	      System.out.println("There has been an exception: " + ex.toString());   
	   }
	   
	   public String aroundAdvice(ProceedingJoinPoint jp) throws Throwable{
		      System.out.println("Around advice");
		      Object[] args = jp.getArgs();
		      if(args.length>0){
		         System.out.print("Arguments passed: " );
		         for (int i = 0; i < args.length; i++) {
		            System.out.print("arg "+(i+1)+": "+args[i]);
		         }
		      }

		      Object result = jp.proceed(args);
		      System.out.println("Returning " + result);
		      return result.toString();
		   }   
	}
```



## Student.java

```java
package com.test.ex006;

public class Student {
	   private Integer age;
	   private String name;

	   public void setAge(Integer age) {
	      this.age = age;
	   }
	   public Integer getAge() {
		  System.out.println("Age : " + age );
	      return age;
	   }
	   public void setName(String name) {
	      this.name = name;
	   }
	   public String getName() {
	      System.out.println("Name : " + name );
	      return name;
	   }
	   public void printThrowException(){
		   System.out.println("Exception raised");
	      throw new IllegalArgumentException();
	   }
	}
```



## Main.java

```java
package com.test.ex006;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex006/beans.xml");

		Student student = (Student) context.getBean("student");
		student.getName();
		student.getAge();
		//student.printThrowException();

		((ClassPathXmlApplicationContext) context).close();
	}

}

```



## beans.xml

```java
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns = "http://www.springframework.org/schema/beans"
   xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance" 
   xmlns:aop = "http://www.springframework.org/schema/aop"
   xsi:schemaLocation = "http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd 
   http://www.springframework.org/schema/aop 
   http://www.springframework.org/schema/aop/spring-aop-3.0.xsd ">

   <aop:config>
      <aop:aspect id = "log" ref = "logging">
        <!-- <aop:pointcut id = "selectAll" 
            expression = "execution(* com.test.ex006.Student.getName(..))"/> -->
         
         <aop:around pointcut-ref="selectAll" method="aroundAdvice" />
        
      </aop:aspect>
   </aop:config>

   <!-- Definition for student bean -->
   <bean id = "student" class = "com.test.ex006.Student">
      <property name = "name" value = "Zara" />
      <property name = "age" value = "11"/>      
   </bean>

   <!-- Definition for logging aspect -->
   <bean id = "logging" class = "com.test.ex006.Logging"/> 
      
</beans>
```









# AOP & Transaction

### MainApp.java

```java
package com.test;

import java.util.List;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/beans.xml");
		StudentDAO studentJDBCTemplate = (StudentDAO) context.getBean("studentJDBCTemplate");

		System.out.println("------Records creation--------");
		studentJDBCTemplate.create("Zara", 11, 99, 2010);
		studentJDBCTemplate.create("Nuha", 20, 97, 2010);
		studentJDBCTemplate.create("Ayan", 25, 100, 2011);

		System.out.println("------Listing all the records--------");
		List<StudentMarks> studentMarks = studentJDBCTemplate.listStudents();

		for (StudentMarks record : studentMarks) {
			System.out.print("ID : " + record.getId());
			System.out.print(", Name : " + record.getName());
			System.out.print(", Marks : " + record.getMarks());
			System.out.print(", Year : " + record.getYear());
			System.out.println(", Age : " + record.getAge());
		}

		((ClassPathXmlApplicationContext) context).close();

	}

}

```



### StudentDAO.java

```java
package com.test;

import java.util.List;

public interface StudentDAO {

	public void create(String name, Integer age, Integer marks, Integer year);

	public List<StudentMarks> listStudents();
	
}
```



### StudentJDBCTemplate.java

```java
package com.test;

import java.util.List;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

public class StudentJDBCTemplate implements StudentDAO {

	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public void create(String name, Integer age, Integer marks, Integer year) {
		try {
			String SQL1 = "insert into Student (name, age) values (?, ?)";
			jdbcTemplateObject.update(SQL1, name, age);

			// Get the latest student id to be used in Marks table
			String SQL2 = "select max(id) from Student";
			int sid = jdbcTemplateObject.queryForObject(SQL2, Integer.class);

			String SQL3 = "insert into Marks(sid, marks, year) " + "values (?, ?, ?)";
			jdbcTemplateObject.update(SQL3, sid, marks, year);

			System.out.println("Created Name = " + name + ", Age = " + age);

			// to simulate the exception.
			//throw new RuntimeException("simulate Error condition");
		} catch (DataAccessException e) {
			System.out.println("Error in creating record, rolling back");
			throw e;
		}
	}

	public List<StudentMarks> listStudents() {
		String SQL = "select * from Student, Marks where Student.id=Marks.sid";
		List<StudentMarks> studentMarks = jdbcTemplateObject.query(SQL, new StudentMarksMapper());

		return studentMarks;
	}
}

```



### StudentMarksMapper.java

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



### StudentMarks.java

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



### beans.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:tx="http://www.springframework.org/schema/tx" xmlns:aop="http://www.springframework.org/schema/aop"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
   http://www.springframework.org/schema/context
   http://www.springframework.org/schema/context/spring-context-3.0.xsd
   http://www.springframework.org/schema/tx
   http://www.springframework.org/schema/tx/spring-tx-3.0.xsd
   http://www.springframework.org/schema/aop
   http://www.springframework.org/schema/aop/spring-aop-3.0.xsd">

	<context:annotation-config />

	<!-- 데이터베이스 연결 정보 관리 -->
	<bean id="dataSource"
		class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="com.mysql.jdbc.Driver" />
		<property name="url"
			value="jdbc:mysql://211.63.89.72:3306/test03?useSSL=false" />
		<property name="username" value="test03" />
		<property name="password" value="1234" />
	</bean>

	<tx:advice id="txAdvice" transaction-manager="transactionManager">
		<tx:attributes>
			<tx:method name="create" />
		</tx:attributes>
	</tx:advice>

	<aop:config>
		<aop:pointcut id="createOperation"
			expression="execution(* com.test.StudentJDBCTemplate.create(..))" />
		<aop:advisor advice-ref="txAdvice" pointcut-ref="createOperation" />
	</aop:config>
	
	<!-- Initialization for TransactionManager -->
	<bean id="transactionManager"
		class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource" />
	</bean>

	<!-- Definition for studentJDBCTemplate bean -->
	<bean id="studentJDBCTemplate" class="com.test.StudentJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>


</beans>
```



### 결과

```java
------Records creation--------
Created Name = Zara, Age = 11
Created Name = Nuha, Age = 20
Created Name = Ayan, Age = 25
------Listing all the records--------
ID : 7, Name : Zara, Marks : 99, Year : 2010, Age : 11
ID : 8, Name : Nuha, Marks : 97, Year : 2010, Age : 20
ID : 9, Name : Ayan, Marks : 100, Year : 2011, Age : 25
```







# MyBatis 버전

## com.test.aop>Logging.java

```java
package com.test.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Logging {

	@Before("execution(* com.test.service.StudentService*.*(..))")
	public void beforeAdvice(JoinPoint jp) {
		System.out.println("Going to setup student profile.");
		System.out.println("--------------------");
	}
	
	@After("execution(* com.test.service.StudentService*.*(..))")
	public void afterAdvice(JoinPoint jp) {
		System.out.println("Student profile has been setup.");
		System.out.println("--------------------");
	}
	
	@Around("execution(* com.test.service.StudentService*.*(..))")
	public Object aroundAdvice(ProceedingJoinPoint jp) throws Throwable {
		
		long startTime = System.currentTimeMillis();
		System.out.println(startTime);
		System.out.println("--------------------");
		
		Object result = jp.proceed();
		
		long endTime = System.currentTimeMillis();
		System.out.println(endTime);
		System.out.println("--------------------");
		
		System.out.println(jp.getSignature() + " : " + (endTime - startTime));
		System.out.println("--------------------");
		
		return result;
	}

}

```



## com.test.domain>StudentMarks.java

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



## com.test.persistence>StudentDAO.java

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



## com.test.persistence>StudentDAOImpl.java

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



## com.test.service>StudentService.java

```java
package com.test.service;

import java.util.List;

import com.test.domain.StudentMarks;

public interface StudentService {

	 public List<StudentMarks> list();
	 public void create(StudentMarks st);
	 
}

```



## com.test.service>StudentServiceImpl.java

```java
package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

	@Override
	public void create(StudentMarks st) {
		this.studentDAO.studentAdd(st);
		int sid = this.studentDAO.maxID();
		st.setSid(sid);
		this.studentDAO.marksAdd(st);
	}

}

```



## com.test.controller>StudentController.java

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



## studentMapper.xml

```xml
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



## pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.test</groupId>
	<artifactId>sts</artifactId>
	<name>springAOP_20180525</name>
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

		<!-- Spring AOP 라이브러리 설정 추가 -->
		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjtools</artifactId>
			<version>${org.aspectj-version}</version>
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
	
	<!-- Spring AOP 설정 추가 -->
	<aop:aspectj-autoproxy />

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

	<!-- Spring AOP 설정 추가 -->
	<context:component-scan base-package="com.test.aop" />

	<!-- 트랜잭션 설정 추가 -->
	<bean id="transactionManager"
		class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource" />
	</bean>
	<tx:annotation-driven/>
	
</beans>

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



## 결과

```java
1527469349580
--------------------
Going to setup student profile.
--------------------
1527469349978
--------------------
List com.test.service.StudentService.list() : 398
--------------------
Student profile has been setup.
--------------------
```

