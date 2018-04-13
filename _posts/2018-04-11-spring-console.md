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
      ((ClassPathXmlApplicationContext)context).close();
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



## Bean Definition

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
		
      ((ClassPathXmlApplicationContext)context).close();
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





## Bean Scope

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
		
		((ClassPathXmlApplicationContext)context).close();
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



## Init / Destroy

### Main.java

```java
package com.test.ex006;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		AbstractApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex006/beans.xml");

		HelloWorld obj = (HelloWorld) context.getBean("helloworld");
		obj.getMessage();
		context.registerShutdownHook();
	}
}

```



### beans.xml

```java
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<bean id="helloworld" class="com.test.ex005.HelloWorld" init-method="init" destroy-method="destroy">
		<property name="message" value="Hello World"></property>
	</bean>
	
</beans>
```



### beans.xml

```java
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd"
   default-init-method="init"
   default-destroy-method="destroy">

	<bean id="helloworld" class="com.test.ex006.HelloWorld">
		<property name="message" value="Hello World"></property>
	</bean>
	
</beans>
```



## Bean Post Processors

### HelloIndia.java

```java
package com.test.ex008;

public class HelloIndia {
	private String message;

	public void setMessage(String message) {
		this.message = message;
	}

	public void getMessage() {
		System.out.println("Your Message : " + message);
	}

}

```



### HelloWorld.java

```java
package com.test.ex008;

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
package com.test.ex008;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class Main {

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex008/beans.xml");
		
		HelloWorld hello1 = (HelloWorld) context.getBean("HelloWorld");
		hello1.getMessage();


		HelloIndia hello2 = (HelloIndia) context.getBean("HelloIndia");
		hello2.getMessage();

		((ClassPathXmlApplicationContext)context).close();
		
	}

}

```



### beans.xml

```xml
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">
	
	<bean id="beanTeamplate" abstract="true">
		<property name="message" value="Hello, World!" />
	</bean>
	<bean name="HelloWorld" class="com.test.ex008.HelloWorld" parent="beanTeamplate" />
	<bean name="HelloIndia" class="com.test.ex008.HelloIndia" parent="beanTeamplate">
		<property name="message" value="Hello, India!" />
	</bean>
	
</beans>
```



# Constructor-based Dependency Injection

### SpellChecker.java

```java
package com.test.ex009;

public class SpellChecker {
	public SpellChecker() {
		System.out.println("Inside SpellChecker constructor.");
	}

	public void checkSpelling() {
		System.out.println("Inside checkSpelling.");
	}
}

```



### TextEditor.java

```java
package com.test.ex009;

public class TextEditor {
	private SpellChecker spellChecker;

	public TextEditor() {
		
	}
	
	public TextEditor(SpellChecker spellChecker) {
		System.out.println("Inside TextEditor constructor.");
		this.spellChecker = spellChecker;
	}

	public void spellCheck() {
		spellChecker.checkSpelling();
	}
}

```



### Main.java

```java
package com.test.ex009;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex009/beans.xml");

		TextEditor te = (TextEditor) context.getBean("textEditor");
		te.spellCheck();
		
		((ClassPathXmlApplicationContext)context).close();
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

	<!-- Definition for textEditor bean -->
	<bean name="textEditor" class="com.test.ex009.TextEditor">
		<!-- 
			의존성 주입 설정 추가 
			1. 생성자 의존 주입 : constructor-arg
			2. setter 의존 주입 : property
		-->
		<constructor-arg ref="spellChecker" />
	</bean>

	<!-- Definition for spellChecker bean -->
	<bean name="spellChecker" class="com.test.ex009.SpellChecker"></bean>

</beans>
```





# Spring Setter-based Dependency Injection

### SpellChecker.java

```java
package com.test.ex010;

public class SpellChecker {
	public SpellChecker() {
		System.out.println("Inside SpellChecker constructor.");
	}

	public void checkSpelling() {
		System.out.println("Inside checkSpelling.");
	}
}

```



### TextEditor.java

```java
package com.test.ex010;

public class TextEditor {
	private SpellChecker spellChecker;

	public TextEditor() {
		
	}
	
	public void setSpellChecker(SpellChecker spellChecker) {
      	System.out.println("Inside setSpecllChecker.");
		this.spellChecker = spellChecker;
	}

	public void spellCheck() {
		spellChecker.checkSpelling();
	}
}

```



### Main.java

```java
package com.test.ex010;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex010/beans.xml");

		TextEditor te = (TextEditor) context.getBean("textEditor");
		te.spellCheck();
		
		((ClassPathXmlApplicationContext)context).close();
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

	<!-- Definition for textEditor bean -->
	<bean name="textEditor" class="com.test.ex010.TextEditor">
		<!-- 
			의존성 주입 설정 추가 
			1. 생성자 의존 주입 : constructor-arg
			2. setter 의존 주입 : property
		-->
      	<!-- 참조형은 ref, 문자형 포함 기본 자료형은 value -->
		<property name="spellChecker" ref="spellChecker" />
	</bean>

	<!-- Definition for spellChecker bean -->
	<bean name="spellChecker" class="com.test.ex010.SpellChecker"></bean>

</beans>
```



# Example2 - 인터페이스 활용

## Super.java

```java
package com.test.ex011;

// 부모 역할 클래스(인터페이스)
public interface Super {
	
	// 추상 메소드(public abstract 키워드 생략)
	void method();

}

```



## SubClass01.java

```java
package com.test.ex011;

public class SubClass01 implements Super {

	public SubClass01() {
		System.out.println("Inside SubClass01 constructor.");
	}
	
	@Override
	public void method() {
		System.out.println("SubClass01의 오버라이딩 메소드");
		
	}
	

}

```





## SubClass02.java

```java
package com.test.ex011;

public class SubClass02 implements Super {

	public SubClass02() {
		System.out.println("Inside SubClass02 constructor.");
	}
	
	@Override
	public void method() {
		System.out.println("SubClass02의 오버라이딩 메소드");
		
	}

}

```





## Sample.java

```java
package com.test.ex011;

public class Sample {
	// 의존 객체를 주입하기 위한 설정 추가
	// -> 생성자 or setter
	// -> 멤버의 자료형은 Interface로 지정
	
	private Super sup;
	
	public void setSup(Super sup) {
		this.sup = sup;
		System.out.println("Inside setSup");
	}
	
	public void sup() {
		sup.method();
	}
	
}

```





## Main.java

```java
package com.test.ex011;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		// Sample 클래스의 특정 메소드 호출 과정 추가
		// -> Spring Framework
		
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex011/beans.xml");

		Sample s = (Sample) context.getBean("Sample");
		s.sup();
		
		((ClassPathXmlApplicationContext)context).close();
	}

}

```





## beans.xml

```java
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<!-- Definition for Sample bean -->
	<bean name="Sample" class="com.test.ex011.Sample">
		<!-- 
			의존성 주입 설정 추가 
			1. 생성자 의존 주입 : constructor-arg
			2. setter 의존 주입 : property
		-->
		<property name="sup" ref="Sub02" />
	</bean>

	<!-- Definition for SubClass01 bean -->
	<bean name="Sub01" class="com.test.ex011.SubClass01"></bean>

	<!-- Definition for SubClass02 bean -->
	<bean name="Sub02" class="com.test.ex011.SubClass02"></bean>
	
</beans>
```



# Inner Bean

```xml
<?xml version = "1.0" encoding = "UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<!-- outer bean -->
	<bean id="textEditor" class="com.test.ex012.TextEditor">
		<property name="spellChecker">
			<!-- inner bean -->
			<bean class="com.test.ex012.SpellChecker" />
		</property>
	</bean>

</beans>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<!-- outer beans -->
	<bean name="Sample" class="com.test.ex013.Sample">
		<constructor-arg>
			<!-- inner beans -->
			<bean class="com.test.ex013.SubClass" />
		</constructor-arg>
	</bean>

</beans>   
```



# Collection 객체를 이용한 DI

## JavaCollection.java

```java
package com.test.ex014;

import java.util.*;

public class JavaCollection {
   private List<String> addressList;
   private Set<String>  addressSet;
   private Map<String, String>  addressMap;
   private Properties addressProp;

   // a setter method to set List
   public void setAddressList(List<String> addressList) {
      this.addressList = addressList;
   }
   
   // prints and returns all the elements of the list.
   public List<String> getAddressList() {
      System.out.println("List Elements :"  + addressList);
      return addressList;
   }
   
   // a setter method to set Set
   public void setAddressSet(Set<String> addressSet) {
      this.addressSet = addressSet;
   }
   
   // prints and returns all the elements of the Set.
   public Set<String> getAddressSet() {
      System.out.println("Set Elements :"  + addressSet);
      return addressSet;
   }
   
   // a setter method to set Map
   public void setAddressMap(Map<String, String> addressMap) {
      this.addressMap = addressMap;
   }
   
   // prints and returns all the elements of the Map.
   public Map<String, String> getAddressMap() {
      System.out.println("Map Elements :"  + addressMap);
      return addressMap;
   }
   
   // a setter method to set Property
   public void setAddressProp(Properties addressProp) {
      this.addressProp = addressProp;
   }
   
   // prints and returns all the elements of the Property.
   public Properties getAddressProp() {
      System.out.println("Property Elements :"  + addressProp);
      return addressProp;
   }
}
```



## Main.java

```java
package com.test.ex014;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {
	
   public static void main(String[] args) {
	   
      ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex014/beans.xml");
      JavaCollection jc=(JavaCollection)context.getBean("javaCollection");

      jc.getAddressList();
      jc.getAddressSet();
      jc.getAddressMap();
      jc.getAddressProp();
      
      ((ClassPathXmlApplicationContext)context).close();
   }
}
```



## beans.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<bean name="javaCollection" class="com.test.ex014.JavaCollection">
		<property name="addressList">
			<!-- List 컬렉션 객체를 이용한 의존 주입 -->
			<list>
				<value>INDIA</value>
				<value>Pakistan</value>
				<value>USA</value>
				<value>USA</value>
			</list>
		</property>
		<property name="addressSet">
			<!-- Set 컬렉션 객체를 이용한 의존 주입 -->
			<list>
				<value>INDIA</value>
				<value>Pakistan</value>
				<value>USA</value>
				<value>USA</value>
			</list>
		</property>
		<property name="addressMap">
			<map>
				<entry key="1" value="INDIA" />
				<entry key="2" value="Pakistan" />
				<entry key="3" value="USA" />
				<entry key="4" value="USA" />
			</map>
		</property>
		<property name="addressProp">
			<props>
				<prop key="one">INDIA</prop>
				<prop key="two">Pakistan</prop>
				<prop key="three">USA</prop>
				<prop key="four">USA</prop>
			</props>
		</property>
	</bean>

</beans>   
```



# Autowire

## byName

```java
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<bean name="textEditor" class="com.test.ex015.TextEditor" autowire="byName">
		<!-- <property name="spellChecker" ref="spellChecker" /> -->
	</bean>

	<bean name="spellChecker" class="com.test.ex015.SpellChecker"></bean>

</beans>
```



## byType

```java
<?xml version = "1.0" encoding = "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd">

	<bean name="textEditor" class="com.test.ex016.TextEditor" autowire="byType">
		<!-- <property name="spellChecker" ref="spellChecker" /> -->
	</bean>

	<bean class="com.test.ex016.SpellChecker"></bean>

</beans>
```



# Annotation

## @required

## Student.java

```java
package com.test.ex018;
// import 필수
import org.springframework.beans.factory.annotation.Required;

public class Student {
   private Integer age;
   private String name;

   @Required
   public void setAge(Integer age) {
      this.age = age;
   }
   public Integer getAge() {
      return age;
   }
   
   @Required
   public void setName(String name) {
      this.name = name;
   }
   public String getName() {
      return name;
   }
}
```



## Main.java

```java
package com.test.ex018;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
	      ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex018/beans.xml");
	      
	      Student student = (Student) context.getBean("student");
	      System.out.println("Name : " + student.getName() );
	      System.out.println("Age : " + student.getAge() );

	      ((ClassPathXmlApplicationContext)context).close();
	}

}

```



## beans.xml

```xml
<?xml version = "1.0" encoding = "UTF-8"?>

<beans xmlns = "http://www.springframework.org/schema/beans"
   xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context = "http://www.springframework.org/schema/context"
   xsi:schemaLocation = "http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
   http://www.springframework.org/schema/context
   http://www.springframework.org/schema/context/spring-context-3.0.xsd">
 
   <!-- 환경설정 추가 -->
   <context:annotation-config />

   <!-- Definition for student bean -->
   <bean id = "student" class = "com.test.ex018.Student">
      <property name = "name" value = "Zara" />

      <!-- try without passing age and check the result -->
      <!-- property name = "age"  value = "11"-->
   </bean>

</beans>
```

