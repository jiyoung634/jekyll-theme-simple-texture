---
layout: post
title: "Spring(ver.Console)"
description: "Spring(ver.Console)"
categories: [Spring]
tags: [Spring, console]
redirect_from:
  - /2018/04/11/
---



# Spring - Console Version

## Example1

### HelloWorld.java

```java
package com.test.ex001;

public class HelloWorld {
	private String message;

	public void setMessage(String message) {
		this.message = message;
	}

	public void getMessage() {
		System.out.println("Your Message : " + message);
	}
}

```



### Main.java

```java
package com.test.ex001;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// Spring Framework 준비
		// -> Ioc Container
		// -> 객체 관리 -> 메타데이터(xml)
		// -> 사용자 요청 -> 의존 주입(DI) -> 객체 제공

		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex001/beans.xml");	// 내가 코딩하지 않는다 -> new() 없음
		HelloWorld obj = (HelloWorld) context.getBean("helloWorld");	// Object 형으로 반환되므로 형 변환 필요
		
		obj.getMessage();
	}

}

```



### beans.xml

```xml
<?xml version = "1.0" encoding = "UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<bean id="helloWorld" class="com.test.ex001.HelloWorld">
		<property name="message" value="Hello World" />
	</bean>

</beans>
```



## Example2 - bean definition

### Member.java

```java
package com.test.ex003;

// 데이터 모델링 테스트 클래스
public class Member {
	
	// 데이터 모델링
	// 현실 세계의 자료를 클래스로 표현. ex) 개인정보(이름, 전화번호, 이메일)
	// -> 이름, 전화번호, 이메일 항목을 개인정보 클래스로 그룹화
	// -> 사용자 정의 자료형인 클래스를 이용하면 원하는대로 구성 가능
	// -> 항목 구성은 필드로 한다. private 접근제한자 권장
	// -> 필드 당 getter, setter 구성 추가
	
	private String name;
	private String id;
	private String password;
	private int age;
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getID() {
		return this.id;
	}
	
	public void setID(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getAge() {
		return this.age;
	}
	
	public void setAge(int age) {
		this.age= age;
	}
		
	// 개인정보 전체 출력 전용 메소드 추가
	public String memberinfo() {
		return String.format("%s,%s,%s,%s%n", this.name, this.id, this.password, this.age);
	}


}
	

```



### Main.java

```java
package com.test.ex003;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// Spring Framework 준비
		// -> Ioc Container
		// -> 객체 관리 -> 메타데이터(xml)
		// -> 사용자 요청 -> 의존 주입(DI) -> 객체 제공

		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex003/beans.xml");	// 내가 코딩하지 않는다 -> new() 없음
		
		Member m1 = (Member) context.getBean("m1");	
		System.out.println(m1.memberinfo());
		
		Member m2 = (Member) context.getBean("m2");	
		System.out.println(m2.memberinfo());
		
		Member m3 = (Member) context.getBean("m3");	
		System.out.println(m3.memberinfo());
		
	}

}

```



### beans.xml

```xml
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<bean id="m1" class="com.test.ex003.Member" />
	<bean id="m2" class="com.test.ex003.Member">
		<property name="name" value="Hong" />
		<property name="ID" value="hong123" />
		<property name="password" value="1234" />
		<property name="age" value="28" />
	</bean>
	<bean id="m3" class="com.test.ex003.Member">
		<property name="name" value="Park" />
		<property name="ID" value="parkyou" />
		<property name="password" value="1111" />
		<property name="age" value="25" />
	</bean>
</beans>
```





## Example3 - bean scope

### Member.java

```java
package com.test.ex003;

// 데이터 모델링 테스트 클래스
public class Member {
	
	// 데이터 모델링
	// 현실 세계의 자료를 클래스로 표현. ex) 개인정보(이름, 전화번호, 이메일)
	// -> 이름, 전화번호, 이메일 항목을 개인정보 클래스로 그룹화
	// -> 사용자 정의 자료형인 클래스를 이용하면 원하는대로 구성 가능
	// -> 항목 구성은 필드로 한다. private 접근제한자 권장
	// -> 필드 당 getter, setter 구성 추가
	
	private String name;
	private String id;
	private String password;
	private int age;
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getID() {
		return this.id;
	}
	
	public void setID(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getAge() {
		return this.age;
	}
	
	public void setAge(int age) {
		this.age= age;
	}
		
	// 개인정보 전체 출력 전용 메소드 추가
	public String memberinfo() {
		return String.format("%s,%s,%s,%s%n", this.name, this.id, this.password, this.age);
	}


}
	

```



### Main.java

```java
package com.test.ex004;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// Spring Framework 준비
		// -> Ioc Container
		// -> 객체 관리 -> 메타데이터(xml)
		// -> 사용자 요청 -> 의존 주입(DI) -> 객체 제공

		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex004/beans.xml");	// 내가 코딩하지 않는다 -> new() 없음
		
		Member m1 = (Member) context.getBean("member");
		// Default값이 Singleton이므로 하나의 객체(같은 객체)만 만들어진다. (따라서, m1만 변화시켜도 m2까지 변화한다)
		m1.setName("Hong");
		System.out.println(m1.memberinfo());
		
		Member m2 = (Member) context.getBean("member");	
		System.out.println(m2.memberinfo());
		
		
	}

}

```



### beans.xml

```xml
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

  	<!-- scope의 default 값은 singleton이다. scope="prototype" 지정하면 새로운 객체 여러 개를 만들 수 있다. -->
	<bean name="member" class="com.test.ex004.Member" />
	
</beans>
```





