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

