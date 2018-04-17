---
layout: post
title: "Spring(ver.Console)"
description: "Spring(ver.Console)"
categories: [Spring]
tags: [Spring, console]
redirect_from:
  - /2018/04/11/
---



**※ 주의) 다음의 라이브러리 필요**

- commons-logging-1.2.jar
- spring-aop-4.1.6.RELEASE.jar
- spring-aspects-4.1.6.RELEASE.jar
- spring-beans-4.1.6.RELEASE.jar
- spring-context-4.1.6.RELEASE.jar
- spring-context-support-4.1.6.RELEASE.jar
- spring-core-4.1.6.RELEASE.jar
- spring-expression-4.1.6.RELEASE.jar
- spring-jdbc-4.1.6.RELEASE.jar
- spring-tx-4.1.6.RELEASE.jar
- mysql-connector-java-5.1.45-bin.jar





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



# Annotation - @Required

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



# Annotation - @Autowired

## SpellChecker.java

```java
package com.test.ex019;

public class SpellChecker {
	public SpellChecker() {
		System.out.println("Inside SpellChecker constructor.");
	}

	public void checkSpelling() {
		System.out.println("Inside checkSpelling.");
	}
}

```



## TextEditor.java

```java
package com.test.ex019;
import org.springframework.beans.factory.annotation.*;

public class TextEditor {
	@Autowired
	private SpellChecker spellChecker;

	public void spellCheck() {
		spellChecker.checkSpelling();
	}
}

```



## Main.java

```java
package com.test.ex019;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex019/beans.xml");

		TextEditor te = (TextEditor) context.getBean("textEditor");
		te.spellCheck();
		
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

   <context:annotation-config />

	<bean name="textEditor" class="com.test.ex019.TextEditor"></bean>

	<bean class="com.test.ex019.SpellChecker"></bean>

</beans>
```



# Annotation - @Inject

## SpellChecker.java

```java
package com.test.ex021;

public class SpellChecker {
	public SpellChecker() {
		System.out.println("Inside SpellChecker constructor.");
	}

	public void checkSpelling() {
		System.out.println("Inside checkSpelling.");
	}
}

```



## TextEditor.java

```java
package com.test.ex021;
// 주의) @Inject는 다른 라이브러리 추가 필요(javax.inject-1.jar)
import javax.inject.Inject;

public class TextEditor {
	@Inject
	private SpellChecker spellChecker;

	public void spellCheck() {
		spellChecker.checkSpelling();
	}
}

```



## Main.java

```java
package com.test.ex021;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/ex021/beans.xml");

		TextEditor te = (TextEditor) context.getBean("textEditor");
		te.spellCheck();
		
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

   <context:annotation-config />

	<bean name="textEditor" class="com.test.ex021.TextEditor"></bean>

	<bean class="com.test.ex021.SpellChecker"></bean>

</beans>
```









# Members(ver.Spring Console)

## DeptMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DeptMapper implements RowMapper<Member> {

	@Override
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
		Member d = new Member();
		d.setDeptId(rs.getString("deptId"));
		d.setDeptName(rs.getString("deptName"));
		return d;
	}

}

```



## Main.java

```java
package com.test;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		MemberService service = new MemberService();
		Scanner sc = new Scanner(System.in);
		boolean run = true;

		while (run) {
			System.out.println("---------------------------------------------------");
			System.out.println("1.회원 정보 입력 2.회원 정보 출력 3.회원 정보 검색 ");
			System.out.println("---------------------------------------------------");
			System.out.print("선택(1~2, 0 quit)?");

			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				service.memberAdd(sc);
				break;
			case 2:
				service.memberList();
				break;
			case 3:
				service.memberList(sc);
				break;
			case 0:
				run = false;
				break;
			}
		}

		System.out.println("프로그램 종료");
		sc.close(); // Java 자원이 아닌 것은 명시적 close() 필요
	}

}

```



## Member.java

```java
package com.test;

import java.time.*;

public class Member {
	// 자료형 클래스 선언시 멤버 구성은
	// 동일 자료, 동일 식별자 권장
	// -> 데이터베이스 입력, 출력 액션에서 사용한 모든 식별자(특히, 별칭 사용한 경우)를 멤버로 구성
	// -> 컬럼 구성시 사용한 컬럼명 및 자료형을 멤버로 구성
	// -> 오라클에서 NUMBER 자료형인 경우 Java에서는 int, double 자료형 사용
	// -> 오라클에서 VARCHAR2, NVARCHAR2 자료형인 경우 Java에서는 String 자료형 사용
	// -> 오라클에서 DATE 자료형인 경우 Java에서는 Date, LocalDate 자료형 사용

	// 회원번호, 이름, 전화번호, 이메일, 등록일, 부서번호, 부서명
	private String mid_;
	private String name_;
	private String phone;
	private String email;
	private LocalDate regDate;
	private String deptId;
	private String deptName;

	// getter
	public String getMid_() {
		return mid_;
	}

	public String getName_() {
		return name_;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public LocalDate getRegDate() {
		return regDate;
	}

	public String getDeptId() {
		return deptId;
	}

	
	
	public String getDeptName() {
		return deptName;
	}

	// setter
	public void setMid_(String mid_) {
		this.mid_ = mid_;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRegDate(LocalDate regDate) {
		this.regDate = regDate;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	// toString() 메소드 오버라이딩
	@Override
	public String toString() {
		return String.format(" %s | %5s | %13s | %15s | %12s | %5s ", this.mid_, this.name_, this.phone, this.email, this.regDate, this.deptName);
	}
}

```



## MemberDAO.java

```java
package com.test;

import java.util.*;

public interface MemberDAO {
	public List<Member> memberList();
	
	public List<Member> memberList(String key, String value);
	
	public List<Member> deptList();
	
	public int memberAdd(Member m);
}

```



## MemberJDBCTemplate.java

```java
package com.test;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class MemberJDBCTemplate implements MemberDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	//전체 출력
	@Override
	public List<Member> memberList() {

		/*
		 * CREATE OR REPLACE VIEW membersView 
		 * AS 
		 * SELECT mid, name_, phone, email,
		 * regDate, deptName FROM members m, dept d WHERE m.deptId = d.deptId;
		 */

		String sql = "SELECT mid_, name_, phone, email, regDate, deptName FROM membersView ORDER BY mid_";
		List<Member> result = jdbcTemplateObject.query(sql, new MemberMapper());
		
		return result;
	}
	
	//검색 출력
	@Override
	public List<Member> memberList(String key, String value) {
		/*
		 * CREATE OR REPLACE VIEW membersView 
		 * AS 
		 * SELECT mid, name_, phone, email,
		 * regDate, deptName FROM members m, dept d WHERE m.deptId = d.deptId;
		 */

		String sql = "SELECT mid_, name_, phone, email, regDate, deptName FROM membersView ";
		switch (key) {
		case "All":
			break;
		case "Mid":
			sql += "WHERE mid_=? ";
			break;
		case "Name":
			sql += "WHERE INSTR(name_, ?)>0 ";
			break;
		case "Phone":
			sql += "WHERE INSTR(phone, ?)>0 ";
			break;
		case "Email":
			sql += "WHERE INSTR(email, ?)>0 ";
			break;
		case "RegDate":
			sql += "WHERE INSTR(regDate, ?)>0 ";
			break;
		case "DeptName":
			sql += "WHERE INSTR(deptName, ?)>0 ";
			break;
		}
		
		sql+="ORDER BY mid_";
		
		List<Member> result = jdbcTemplateObject.query(sql, new MemberMapper(), value);
		
		return result;
	}

	//부서 출력
	@Override
	public List<Member> deptList() {
		String sql = "SELECT deptId, deptName FROM dept ORDER BY deptId";
		List<Member> result = jdbcTemplateObject.query(sql, new DeptMapper());
		
		return result;
	}

	//입력
	@Override
	public int memberAdd(Member m) {
		String sql = "INSERT INTO members (mid_, name_, phone, email, regDate, deptId) VALUES(CONCAT('M', LPAD(SUBSTR(IFNULL((SELECT MAX(mid_) FROM members m),'M00'),2,2)+1, 2, 0)), ?, ?, ?, ?, ?)";
		int result = jdbcTemplateObject.update(sql,m.getName_(), m.getPhone(), m.getEmail(), m.getRegDate(), m.getDeptId());
		
		return result;
	}


}

```



## MemberMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MemberMapper implements RowMapper<Member> {
	// 경우의 수 별로 만들어야 한다
	
	@Override
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Member m = new Member();
		m.setMid_(rs.getString("mid_"));
		m.setName_(rs.getString("name_"));
		m.setPhone(rs.getString("phone"));
		m.setEmail(rs.getString("email"));
		m.setRegDate(rs.getDate("regDate").toLocalDate());
		m.setDeptName(rs.getString("deptName"));
		
		return m;
	}

}

```



## MemberService.java

```java
package com.test;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

// 콘솔 액션 전용 클래스
public class MemberService {
	private ApplicationContext context;
	private MemberJDBCTemplate memberJDBCTemplate;
	
	public MemberService() {
		this.context = new ClassPathXmlApplicationContext("/com/test/beans.xml");
		this.memberJDBCTemplate = (MemberJDBCTemplate) context.getBean("memberJDBCTemplate");
	}
	
	@Override
	protected void finalize() throws Throwable {
		((ClassPathXmlApplicationContext) context).close();
	}

	// 회원 정보 출력 메소드
	public void memberList() {
		List<Member> list = memberJDBCTemplate.memberList();
		System.out.printf("총: %d명%n", list.size());
		System.out.println("--------------------------------------------------------------------------");
		System.out.println(" MID | 이름  |    전화번호   |     이메일      |    등록일    |    부서  ");
		System.out.println("--------------------------------------------------------------------------");
		for (Member l : list) {
			System.out.println(l.toString());
		}

	}

	// 부서 정보 출력 메소드
	private void deptList() {
		List<Member> deptlist = memberJDBCTemplate.deptList();
		for (Member d : deptlist) {
			System.out.printf("%s-%s%n", d.getDeptId(), d.getDeptName());
		}
	}

	// 회원 정보 입력 메소드
	public void memberAdd(Scanner sc) {
		System.out.println("-------------------");
		System.out.println("   회원 정보 입력  ");
		System.out.println("-------------------");

		System.out.println("이름?");
		String name_ = sc.nextLine();

		System.out.println("전화번호?");
		String phone = sc.nextLine();

		System.out.println("이메일?");
		String email = sc.nextLine();

		System.out.println("등록일?");
		String date = sc.nextLine();
		LocalDate regDate = LocalDate.parse(date, DateTimeFormatter.ISO_LOCAL_DATE);

		this.deptList();
		System.out.println("부서번호?");
		String deptId = sc.nextLine();

		Member m = new Member();
		m.setName_(name_);
		m.setPhone(phone);
		m.setEmail(email);
		m.setRegDate(regDate);
		m.setDeptId(deptId);

		int result = memberJDBCTemplate.memberAdd(m);

		if (result == 1)
			System.out.println("회원 정보 입력이 완료되었습니다.");
	}
	

	// 회원 정보 검색 메소드(서브메뉴 운영)
	public void memberList(Scanner sc) {
		// 검색 기준(서브메뉴)과 검색값을 콘솔에서 입력 받고, 검색 진행 후 그 결과를 콘솔에 출력.
		boolean run = true;
		while (run) {
			System.out.println("--------------------------------------------------------------------------------------------");
			System.out.println("   1.회원번호 기준 2.이름 기준 3.이메일 기준 4.등록일 기준 5.부서 기준 6.전화번호 기준  ");
			System.out.println("--------------------------------------------------------------------------------------------");
			System.out.print("검색기준(1~5, 0 quit)?> ");
			int selectNo = sc.nextInt();
			sc.nextLine();
			
			switch (selectNo) {
			case 1:	this.memberList(sc, "Mid");	break;
			case 2:	this.memberList(sc, "Name");	break;
			case 3:	this.memberList(sc, "Email");	break;
			case 4:	this.memberList(sc, "RegDate");	break;
			case 5:	this.memberList(sc, "DeptName");	break;
			case 6:	this.memberList(sc, "Phone");	break;
			case 0: run = false;	break;
			}

		}
	}
	// 회원 정보 검색 메소드
	
	private void memberList(Scanner sc, String key) {
		System.out.print("검색어를 입력하세요>");
		String value = sc.nextLine();
		List<Member> list = memberJDBCTemplate.memberList(key, value);

		System.out.println("-------------------");
		System.out.println("  회원 정보 검색   ");
		System.out.println("-------------------");
		System.out.printf("총: %d명%n", list.size());

		if (list.size() > 0) {
			// 검색 결과가 존재하는 경우
			System.out.println("--------------------------------------------------------------------------");
			System.out.println(" MID | 이름  |    전화번호   |     이메일      |    등록일    |    부서  ");
			System.out.println("--------------------------------------------------------------------------");
			for (Member m : list) {
				System.out.printf(" %s | %5s | %13s | %15s | %12s | %5s %n"
						, m.getMid_(), m.getName_(), m.getPhone(), m.getEmail(), m.getRegDate(), m.getDeptName());
			}
		} else {
			// 검색 결과가 존재하지 않는 경우
			System.out.println("검색 결과가 없습니다.");
		}
		
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
	<bean id="dataSource"
		class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="com.mysql.jdbc.Driver" />
		<property name="url"
			value="jdbc:mysql://211.63.89.72:3306/test03?useSSL=false" />
		<property name="username" value="test03" />
		<property name="password" value="1234" />
	</bean>

	<bean id="memberJDBCTemplate" class="com.test.MemberJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
</beans>
```







# Employees

## Employee.java

```java
package com.test;

import java.time.LocalDate;

public class Employee {

	// 필드 구성
	private String eid, name_, ssn, phone, reg_id, dept_id, job_id, reg_name, dept_name, job_title;
	private LocalDate hiredate;
	private int basicpay, extrapay, pay;

	// 삭제 가능 여부 확인용 필드 구성
	private String deleteCheck;

	// getter
	public String getEid() {
		return eid;
	}

	public String getName_() {
		return name_;
	}

	public String getSsn() {
		return ssn;
	}

	public String getPhone() {
		return phone;
	}

	public String getReg_id() {
		return reg_id;
	}

	public String getDept_id() {
		return dept_id;
	}

	public String getJob_id() {
		return job_id;
	}

	public String getReg_name() {
		return reg_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public String getJob_title() {
		return job_title;
	}

	public LocalDate getHiredate() {
		return hiredate;
	}

	public int getBasicpay() {
		return basicpay;
	}

	public int getExtrapay() {
		return extrapay;
	}

	public String getDeleteCheck() {
		return deleteCheck;
	}

	public int getPay() {
		return pay;
	}


	// setter
	public void setEid(String eid) {
		this.eid = eid;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}

	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public void setHiredate(LocalDate hiredate) {
		this.hiredate = hiredate;
	}

	public void setBasicpay(int basicpay) {
		this.basicpay = basicpay;
	}

	public void setExtrapay(int extrapay) {
		this.extrapay = extrapay;
	}

	public void setDeleteCheck(String deleteCheck) {
		this.deleteCheck = deleteCheck;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}
	// toString() 오버라이딩

	@Override
	public String toString() {
		return String.format("%s/ %s/ %s/", this.getReg_id(), this.getDept_id(), this.getJob_id());
	}

}

```



## Login.java

```java
package com.test;

public class Login {
	private String id_, pw_;
	private int grade;


	// getter
	public String getId_() {
		return id_;
	}

	public String getPw_() {
		return pw_;
	}

	public int getGrade() {
		return grade;
	}

	// setter
	public void setId_(String id_) {
		this.id_ = id_;
	}

	public void setPw_(String pw_) {
		this.pw_ = pw_;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	// toString() 오버라이딩
	@Override
	public String toString() {
		return "Login [id_=" + id_ + ", pw_=" + pw_ + ", grade=" + grade + "]";
	}

}

```



## EmployeeDAO.java

```java
package com.test;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface EmployeeDAO {
	public List<Employee> list(String key);
	public List<Employee> list(String key, String value);
	public int add(Employee e) throws DataAccessException;
	public int remove(String value);
	
	public List<Employee> regionList();
	public int regionAdd(String value) throws DataAccessException;
	public int regionDelete(String value);

	public List<Employee> departmentList();
	public int departmentAdd(String value) throws DataAccessException;
	public int departmentDelete(String value);
	

	public List<Employee> jobList();
	public int jobAdd(String value) throws DataAccessException;
	public int jobDelete(String value);
}

```



## LoginDAO.java

```java
package com.test;

import org.springframework.dao.DataAccessException;

public interface LoginDAO {
	public Login login(Login l) throws DataAccessException;
}

```



## EmployeeJDBCTemplate.java

```java
package com.test;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class EmployeeJDBCTemplate implements EmployeeDAO {
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Employee> list(String key) {
		/*
		 * CREATE VIEW empView AS SELECT eid, name_, ssn, hiredate, phone, reg_name,
		 * dept_name, job_title, basicpay, extrapay, basicpay+extrapay AS pay FROM
		 * employees INNER JOIN regions USING(reg_id) INNER JOIN departments
		 * USING(dept_id) INNER JOIN jobs USING(job_id);
		 */
		String sql = "SELECT eid, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, basicpay, extrapay, pay FROM empView";
		switch (key) {
		case "eid":
			sql += " ORDER BY eid";
			break;
		case "name_":
			sql += " ORDER BY name_";
			break;
		case "reg_name":
			sql += " ORDER BY reg_name";
			break;
		case "dept_name":
			sql += " ORDER BY dept_name";
			break;
		case "job_title":
			sql += " ORDER BY job_title";
			break;
		}
		
		List<Employee> result = this.jdbcTemplateObject.query(sql, new EmployeeMapper());
		return result;
	}

	@Override
	public List<Employee> list(String key, String value) {
		/*
		 * CREATE VIEW empView AS SELECT eid, name_, ssn, hiredate, phone, reg_name,
		 * dept_name, job_title, basicpay, extrapay, basicpay+extrapay AS pay FROM
		 * employees INNER JOIN regions USING(reg_id) INNER JOIN departments
		 * USING(dept_id) INNER JOIN jobs USING(job_id);
		 */

		String sql = "SELECT eid, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, basicpay, extrapay, pay FROM empView";
		//검색 기준에 따른 WHERE 구문 추가
		switch (key) {
		case "eid":
			sql += " WHERE eid = ?";
			break;
		case "name_":
			sql += " WHERE INSTR(name_, ?) > 0";
			break;
		case "reg_name":
			sql += " WHERE INSTR(reg_name, ?) > 0";
			break;
		case "dept_name":
			sql += " WHERE INSTR(dept_name, ?) > 0";
			break;
		case "job_title":
			sql += " WHERE INSTR(job_title, ?) > 0";
			break;
		}
		sql += " ORDER BY eid";
		
		List<Employee> result = this.jdbcTemplateObject.query(sql, new EmployeeMapper(), value);
		return result;
	}

	@Override
	public int add(Employee e) {
		String sql = "INSERT INTO employees(eid, name_,ssn,hiredate,phone,reg_id,dept_id,job_id,basicpay,extrapay) VALUES (CONCAT('E',LPAD((SUBSTRING(IFNULL((SELECT MAX(eid) FROM employees e),'E0000'),2)+1),2,0)), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int result = this.jdbcTemplateObject.update(sql, e.getName_(), e.getSsn(), e.getHiredate().toString(),e.getPhone(), e.getReg_id(), e.getDept_id(), e.getJob_id(), e.getBasicpay(), e.getExtrapay());
		return result;
	}

	@Override
	public int remove(String value) {
		String sql = "DELETE FROM employees WHERE eid = ?";

		int result = this.jdbcTemplateObject.update(sql, value);
		return result;
	}

	// 지역 정보
	@Override
	public List<Employee> regionList() {
		String sql = "SELECT reg_id, reg_name, IF((SELECT COUNT(*) FROM employees WHERE reg_id = r.reg_id)>0, 'N', 'Y') AS deleteCheck FROM regions r ORDER BY reg_id";

		List<Employee> result = this.jdbcTemplateObject.query(sql, new RegionMapper());
		return result;
	}

	@Override
	public int regionAdd(String value) {
		String sql = "INSERT INTO regions(reg_id, reg_name) VALUES(CONCAT('REG',LPAD((SUBSTRING(IFNULL((SELECT MAX(reg_id) FROM regions r),'REG00'),4)+1),2,0)), ?)";

		int result = this.jdbcTemplateObject.update(sql, value);
		return result;
	}

	@Override
	public int regionDelete(String value) {
		String sql = "DELETE FROM regions WHERE reg_id = ?";

		int result = this.jdbcTemplateObject.update(sql, value);
		return result;
	}

	// 부서 정보
	@Override
	public List<Employee> departmentList() {
		String sql = "SELECT dept_id, dept_name, IF((SELECT COUNT(*) FROM employees WHERE dept_id = d.dept_id)>0, 'N', 'Y') AS deleteCheck FROM departments d ORDER BY dept_id";
		
		List<Employee> result = this.jdbcTemplateObject.query(sql, new DepartmentMapper());
		return result;
	}

	@Override
	public int departmentAdd(String value) {
		String sql = "INSERT INTO departments(dept_id, dept_name) VALUES(CONCAT('DEPT',LPAD((SUBSTRING(IFNULL((SELECT MAX(dept_id) FROM departments d),'DEPT00'),5)+1),2,0)),?)";

		int result = this.jdbcTemplateObject.update(sql, value);
		return result;
	}

	@Override
	public int departmentDelete(String value) {
		String sql = "DELETE FROM departments WHERE dept_id = ?";

		int result = this.jdbcTemplateObject.update(sql, value);
		return result;
	}

	// 직위 정보
	@Override
	public List<Employee> jobList() {
		String sql = "SELECT job_id, job_title, IF((SELECT COUNT(*) FROM employees WHERE job_id = j.job_id)>0, 'N', 'Y') AS deleteCheck FROM jobs j ORDER BY job_id";
		
		List<Employee> result = this.jdbcTemplateObject.query(sql, new JobMapper());
		return result;
	}

	@Override
	public int jobAdd(String value) {
		String sql = "INSERT INTO jobs(job_id, job_title) VALUES(CONCAT('JOB',LPAD((SUBSTRING(IFNULL((SELECT MAX(job_id) FROM jobs j),'JOB00'),4)+1),2,0)),?)";

		int result = this.jdbcTemplateObject.update(sql, value);
		return result;
	}

	@Override
	public int jobDelete(String value) {
		String sql = "DELETE FROM jobs WHERE job_id = ?";
		
		int result = this.jdbcTemplateObject.update(sql, value);
		return result;
	}

}

```



## LoginJDBCTemplate.java

```java
package com.test;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

public class LoginJDBCTemplate implements LoginDAO{
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Login login(Login l) throws DataAccessException{
		String sql = "SELECT id_,pw_,grade FROM login WHERE id_ = ? AND pw_ = ?";
		
		Login result = this.jdbcTemplateObject.queryForObject(sql, new LoginMapper(), l.getId_(), l.getPw_());
		return result;
	}

}

```



## EmployeeMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class EmployeeMapper implements RowMapper<Employee> {

	@Override
	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
	
		Employee e = new Employee();
		e.setEid(rs.getString("eid"));
		e.setName_(rs.getString("name_"));
		e.setSsn(rs.getString("ssn"));
		e.setHiredate(rs.getDate("hiredate").toLocalDate());
		e.setPhone(rs.getString("phone"));
		e.setReg_name(rs.getString("reg_name"));
		e.setDept_name(rs.getString("dept_name"));
		e.setJob_title(rs.getString("job_title"));
		e.setBasicpay(rs.getInt("basicpay"));
		e.setExtrapay(rs.getInt("extrapay"));
		e.setPay(rs.getInt("pay"));
		
		return e;
	}

	
}

```



## DepartmentMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DepartmentMapper implements RowMapper<Employee> {

	@Override
	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Employee e = new Employee();	
		e.setDept_id(rs.getString("dept_id"));
		e.setDept_name(rs.getString("dept_name"));
		e.setDeleteCheck(rs.getString("deleteCheck"));
		
		return e;
	}

}

```



## JobMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class JobMapper implements RowMapper<Employee> {

	@Override
	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		Employee e = new Employee();
		e.setJob_id(rs.getString("job_id"));
		e.setJob_title(rs.getString("job_title"));
		e.setDeleteCheck(rs.getString("deleteCheck"));
		
		return e;
	}

	
}

```



## RegionMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RegionMapper implements RowMapper<Employee> {

	@Override
	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
		Employee e = new Employee();
		e.setReg_id(rs.getString("reg_id"));
		e.setReg_name(rs.getString("reg_name"));
		e.setDeleteCheck(rs.getString("deleteCheck"));
		
		return e;
	}

	
}

```



## LoginMapper.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class LoginMapper implements RowMapper<Login> {

	@Override
	public Login mapRow(ResultSet rs, int rowNum) throws SQLException {
	
		Login l = new Login();
		l.setId_(rs.getString("id_"));
		l.setPw_(rs.getString("pw_"));
		l.setGrade(rs.getInt("grade"));
		
		return l;
	}

}

```



## EmployeeService.java

```java
package com.test;

import java.time.LocalDate;
import java.util.*;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DataAccessException;

public class EmployeeService {
	private EmployeeJDBCTemplate employeeJDBCTemplate;

	public EmployeeService() {

	}

	public EmployeeService(ApplicationContext context) {
		this.employeeJDBCTemplate = (EmployeeJDBCTemplate) context.getBean("employeeJDBCTemplate");
	}

	//직원관리v2.0 MySQL > 1.직원관리
		public void menu_1(Scanner sc) {
			//메뉴 액션
			boolean run = true;
			while (run) {
				System.out.println("-------------------------------");
				System.out.println("직원관리v2.0 MySQL > 1.직원관리");
				System.out.println("-------------------------------");
				System.out.println("1.직원입력  2.직원전체출력  3.직원검색  4.직원삭제");
				System.out.print("선택(1~4, 0 quit)?");

				int m = sc.nextInt();
				sc.nextLine();

				switch (m) {
				case 0:	run = false; break;
				case 1: this.menu_11(sc); break;
				case 2: this.menu_12(sc); break;
				case 3: this.menu_13(sc); break;
				case 4: this.menu_14(sc); break;
				}

			}	
		}

		//직원관리v2.0 MySQL > 1.직원관리 > 1.직원입력
		private void menu_11(Scanner sc) {
			
			//이름, 주민번호, ... 등의 항목을 콘솔 입력 받는다.
			//주의) 지역, 부서, 직위는 번호 입력을 받기 전에 번호의 범위를 출력한다. FK 제약.
			//주의) 입력시 특정 패턴을 벗어나거나, 입력 범위를 벗어나는 경우 예외 발생.
			
			System.out.print("이름:");
			String name_ = sc.nextLine();
			if (name_.equals("0")) return;
			System.out.print("주민번호(YYMMDD-NNNNNNN):");
			String ssn = sc.nextLine();
			if (ssn.equals("0")) return;
			System.out.print("입사일(YYYY-MM-DD):");
			String hiredate = sc.nextLine();
			if (hiredate.equals("0")) return;
			System.out.print("전화번호(XXX-XXXX-XXXX):");
			String phone = sc.nextLine();
			if (phone.equals("0")) return;
			
			//지역 번호 범위를 벗어나는 경우 확인하는 과정
			List<Employee> regionList = employeeJDBCTemplate.regionList();
			System.out.println("----------------");
			System.out.println("지역번호/ 지역명");
			for(Employee e : regionList) {
				System.out.printf("%s/ %s%n", e.getReg_id(), e.getReg_name());
			}
			String reg_id = "";
			while(true) {
				System.out.print("지역번호:");
				reg_id = sc.nextLine();
				
				//입력 중단
				if (reg_id.equals("0")) {
					//메소드 액션 진행에 대한 중단
					return;
				}
				
				//범위 검사 진행 -> 결과에 따라서 반복문 탈출
				//주의) Employee 클래스에서 toString() 오버라이딩 메소드 추가 필요
				//"[REG01/null/null/REG02/...]"
				boolean result = regionList.toString().contains(reg_id);
				if (result) {
					break;
				} else {
					System.out.println("잘못된 범위의 값입니다.");
				}
			}
			
			//부서 번호 범위를 벗어나는 경우 확인하는 과정
			List<Employee> departmentList = employeeJDBCTemplate.departmentList();
			System.out.println("----------------");
			System.out.println("부서번호/ 부서명");
			for(Employee e : departmentList) {
				System.out.printf("%s/ %s%n", e.getDept_id(), e.getDept_name());
			}
			String dept_id = "";
			while(true) {
				System.out.print("부서번호:");
				dept_id = sc.nextLine();
				
				//입력 중단
				if (dept_id.equals("0")) {
					//메소드 액션 진행에 대한 중단
					return;
				}
				
				//범위 검사 진행 -> 결과에 따라서 반복문 탈출
				//주의) Employee 클래스에서 toString() 오버라이딩 메소드 추가 필요
				//"[null/DEPT01/null/null/DEPT02/...]"
				boolean result = departmentList.toString().contains(dept_id);
				if (result) {
					break;
				} else {
					System.out.println("잘못된 범위의 값입니다.");
				}
			}

			//직위 번호 범위를 벗어나는 경우 확인하는 과정
			List<Employee> jobList = employeeJDBCTemplate.jobList();
			System.out.println("----------------");
			System.out.println("직위번호/ 직위명");
			for(Employee e : jobList) {
				System.out.printf("%s/ %s%n", e.getJob_id(), e.getJob_title());
			}
			String job_id = "";
			while(true) {
				System.out.print("직위번호:");
				job_id = sc.nextLine();
				
				//입력 중단
				if (job_id.equals("0")) {
					//메소드 액션 진행에 대한 중단
					return;
				}
				
				//범위 검사 진행 -> 결과에 따라서 반복문 탈출
				//주의) Employee 클래스에서 toString() 오버라이딩 메소드 추가 필요
				//"[null/null/JOB01/null/null/JOB02/...]"
				boolean result = jobList.toString().contains(job_id);
				if (result) {
					break;
				} else {
					System.out.println("잘못된 범위의 값입니다.");
				}
			}

			
			System.out.print("기본급:");
			String basicpay = sc.nextLine();
			if (basicpay.equals("0")) return;
			System.out.print("수당:");
			String extrapay = sc.nextLine();
			if (extrapay.equals("0")) return;
			
			Employee emp = new Employee();
			emp.setName_(name_);
			emp.setSsn(ssn);
			emp.setHiredate(LocalDate.parse(hiredate));
			emp.setPhone(phone);
			emp.setReg_id(reg_id);
			emp.setDept_id(dept_id);
			emp.setJob_id(job_id);
			emp.setBasicpay(Integer.parseInt(basicpay));
			emp.setExtrapay(Integer.parseInt(extrapay));
			
			try{
				employeeJDBCTemplate.add(emp);
				System.out.println("1개의 행이 추가되었습니다.");
			} catch(DataAccessException d) {
				System.out.println("입력에 실패했습니다.");
			}
		}

		
		//직원관리v2.0 MySQL > 1.직원관리 > 2.직원전체출력
		private void menu_12(Scanner sc) {
			//메뉴 액션
			boolean run = true;
			while (run) {
				System.out.println("-------------------------------------------------");
				System.out.println("직원관리v2.0 MySQL > 1.직원관리 > 2.직원전체출력");
				System.out.println("-------------------------------------------------");
				System.out.println("1.사번정렬  2.이름정렬  3.지역정렬  4.부서정렬  5.직위정렬");
				System.out.print("선택(1~5, 0 quit)?");

				int m = sc.nextInt();
				sc.nextLine();

				switch (m) {
				case 0:	run = false; break;
				case 1: this.menu_121(sc); break;
				case 2: this.menu_122(sc); break;
				case 3: this.menu_123(sc); break;
				case 4: this.menu_124(sc); break;
				case 5: this.menu_125(sc); break;
				}

			}	
		}
		
		//직원관리v2.0 MySQL > 1.직원관리 > 2.직원전체출력 > 1.사번정렬
		private void menu_121(Scanner sc) {
			this.employeesList("eid");
		}
		
		//직원관리v2.0 MySQL > 1.직원관리 > 2.직원전체출력 > 2.이름정렬
		private void menu_122(Scanner sc) {
			this.employeesList("name_");
		}
		
		//직원관리v2.0 MySQL > 1.직원관리 > 2.직원전체출력 > 3.지역정렬
		private void menu_123(Scanner sc) {
			this.employeesList("reg_name");
		}
		
		//직원관리v2.0 MySQL > 1.직원관리 > 2.직원전체출력 > 4.부서정렬
		private void menu_124(Scanner sc) {
			this.employeesList("dept_name");
		}
		
		//직원관리v2.0 MySQL > 1.직원관리 > 2.직원전체출력 > 5.직위정렬
		private void menu_125(Scanner sc) {
			this.employeesList("job_title");
		}
		
		//정렬 지원되는 전체 출력 액션 메소드
		private void employeesList(String key) {
			List<Employee> list = employeeJDBCTemplate.list(key);
			System.out.printf("총: %d명%n", list.size());
			System.out.println("----------------------------------------------------------------------------------");
			System.out.println("사번/ 이름/ 주민번호/ 입사일/ 전화번호/ 지역명/ 부서명/ 직위명/ 기본급/ 수당/ 급여");
			for (Employee e : list) {
				System.out.printf("%s/ %s/ %s/ %s/ %s/ %s/ %s/ %s/ %s/ %s%n"
						, e.getEid(), e.getName_(), e.getHiredate(), e.getPhone(), e.getReg_name()
						, e.getDept_name(), e.getJob_title(), e.getBasicpay(), e.getExtrapay(), e.getPay());
			}
		}
		

		//직원관리v2.0 MySQL > 1.직원관리 > 3.직원검색
		private void menu_13(Scanner sc) {
			//메뉴 액션
			boolean run = true;
			while (run) {
				System.out.println("--------------------------------------------");
				System.out.println("직원관리v2.0 MySQL > 1.직원관리 > 3.직원검색");
				System.out.println("--------------------------------------------");
				System.out.println("1.사번기준  2.이름기준  3.지역기준  4.부서기준  5.직위기준");
				System.out.print("선택(1~5, 0 quit)?");

				int m = sc.nextInt();
				sc.nextLine();

				switch (m) {
				case 0:	run = false; break;
				case 1: this.menu_131(sc); break;
				case 2: this.menu_132(sc); break;
				case 3: this.menu_133(sc); break;
				case 4: this.menu_134(sc); break;
				case 5: this.menu_135(sc); break;
				}
			}	
		}
		
		//직원관리v2.0 MySQL > 1.직원관리 > 3.직원검색 > 1.사번기준
		private int menu_131(Scanner sc) {
			int result = 0;
			String key = "eid";
			System.out.print("검색할 사번:");
			String value = sc.nextLine();
			result = this.employeesSearch(key, value);
			return result;
		}

		//직원관리v2.0 MySQL > 1.직원관리 > 3.직원검색 > 2.이름기준
		private int menu_132(Scanner sc) {
			int result = 0;
			String key = "name_";
			System.out.print("검색할 이름:");
			String value = sc.nextLine();
			result = this.employeesSearch(key, value);
			return result;
		}

		//직원관리v2.0 MySQL > 1.직원관리 > 3.직원검색 > 3.지역기준
		private int menu_133(Scanner sc) {
			int result = 0;
			String key = "reg_name";
			System.out.print("검색할 지역명:");
			String value = sc.nextLine();
			result = this.employeesSearch(key, value);
			return result;
		}

		//직원관리v2.0 MySQL > 1.직원관리 > 3.직원검색 > 4.부서기준
		private int menu_134(Scanner sc) {
			int result = 0;
			String key = "dept_name";
			System.out.print("검색할 부서명:");
			String value = sc.nextLine();
			result = this.employeesSearch(key, value);
			return result;
		}

		//직원관리v2.0 MySQL > 1.직원관리 > 3.직원검색 > 5.직위기준
		private int menu_135(Scanner sc) {
			int result = 0;
			String key = "job_title";
			System.out.print("검색할 직위명:");
			String value = sc.nextLine();
			result = this.employeesSearch(key, value);
			return result;
		}
		
		//검색 지원되는 전체 출력 액션 메소드
		private int employeesSearch(String key, String value) {
			int result = 0;
			List<Employee> list = employeeJDBCTemplate.list(key, value);
			result = list.size();
			System.out.printf("총: %d명%n", result);
			if (result > 0) {
				System.out.println("----------------------------------------------------------------------------------");
				System.out.println("사번/ 이름/ 주민번호/ 입사일/ 전화번호/ 지역명/ 부서명/ 직위명/ 기본급/ 수당/ 급여");
				for (Employee e : list) {
					System.out.printf("%s/ %s/ %s/ %s/ %s/ %s/ %s/ %s/ %s/ %s%n"
							, e.getEid(), e.getName_(), e.getHiredate(), e.getPhone(), e.getReg_name()
							, e.getDept_name(), e.getJob_title(), e.getBasicpay(), e.getExtrapay(), e.getPay());
				}
			} else {
				System.out.println("검색 결과가 없습니다.");
			}
			return result;
		}
		
		
		//직원관리v2.0 MySQL > 1.직원관리 > 4.직원삭제
		private void menu_14(Scanner sc) {
			//이름 검색을 먼저 진행하고
			//검색 결과 출력
			//결과가 존재하는 경우 삭제할 사번을 물어본다.
			//사번을 기준으로 삭제 진행
			//결과 메시지 출력
			
			int result = this.menu_132(sc);
			if (result > 0) {
				System.out.printf("삭제할 사번:");
				String eid = sc.nextLine();
				int count = employeeJDBCTemplate.remove(eid);
				System.out.printf("%d개의 행이 삭제되었습니다.%n", count);
			}
			
		}

	// -------------------------------------------------------------------------------------------------------------------------

	// 직원관리v2.0 > 2.기초정보관리
	public void menu_2(Scanner sc) {
		boolean run = true;
		while (run) {
			System.out.println("---------------------------");
			System.out.println("직원관리v2.0 > 2.기초정보관리");
			System.out.println("---------------------------");
			System.out.println("1.지역관리 2.부서관리 3.직위관리");
			System.out.print("선택(1~3, 0 quit)?");
			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				menu_21(sc);
				break;
			case 2:
				menu_22(sc);
				break;
			case 3:
				menu_23(sc);
				break;
			case 0:
				run = false;
				break;
			}
		}

	}

	// -------------------------------------------------------------------------------------------------------------------------
	// 직원관리v2.0 > 2.기초정보관리 > 1.지역관리
	private void menu_21(Scanner sc) {
		boolean run = true;
		while (run) {
			System.out.println("-------------------------------------------");
			System.out.println("직원관리v2.0 > 2.기초정보관리> 1.지역관리");
			System.out.println("------------------------------------------");
			System.out.println("1.지역입력  2.지역출력  3.지역삭제");
			System.out.print("선택(1~3, 0 quit)?");
			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				menu_211(sc);
				break;
			case 2:
				menu_212(sc);
				break;
			case 3:
				menu_213(sc);
				break;
			case 0:
				run = false;
				break;
			}
		}

	}

	// 직원관리v2.0 > 2.기초정보관리 > 1.지역관리 > 1.지역입력
	private void menu_211(Scanner sc) {
		// 지역 정보 입력
		System.out.print("지역이름(0 quit)?");
		String reg_name = sc.nextLine();

		// 입력 요청
		try{
			employeeJDBCTemplate.regionAdd(reg_name);
			System.out.println("성공적으로 입력되었습니다.");
		} catch(DataAccessException d){
			System.out.println("지역 정보 입력에 실패했습니다.");
		}
	}

	// 직원관리v2.0 > 2.기초정보관리 > 1.지역관리 > 2.지역출력
	private void menu_212(Scanner sc) {
		// 지역 정보 출력
		List<Employee> list = employeeJDBCTemplate.regionList();

		System.out.println("지역번호 | 지역명");
		System.out.println("-----------------");
		for (Employee e : list) {
			System.out.printf(" %s  |  %s  %n", e.getReg_id(), e.getReg_name());
		}

	}

	// 직원관리v2.0 > 2.기초정보관리 > 1.지역관리 > 3.지역삭제
	private void menu_213(Scanner sc) {
		// 지역 정보 출력 -> 삭제 가능 여부 출력
		List<Employee> list = employeeJDBCTemplate.regionList();

		System.out.println("지역번호 | 지역명 | 삭제가능 여부");
		System.out.println("---------------------------------");
		for (Employee e : list) {
			System.out.printf(" %s  |  %s  | %s%n", e.getReg_id(), e.getReg_name(), e.getDeleteCheck());
		}

		// 삭제하고자 하는 지역번호 입력
		System.out.print("삭제할 지역번호(0 quit)?");
		String reg_id = sc.nextLine();

		// 삭제 요청
		int result = employeeJDBCTemplate.regionDelete(reg_id);

		// 삭제 결과 분석 및 메시지 출력
		if (result > 0) {
			System.out.println("성공적으로 삭제 완료되었습니다.");
		} else {
			System.out.println("지역 정보 삭제에 실패했습니다.");
		}

	}

	// -------------------------------------------------------------------------------------------------------------------------

	// 직원관리v2.0 > 2.기초정보관리 > 2.부서관리
	private void menu_22(Scanner sc) {
		boolean run = true;
		while (run) {
			System.out.println("-------------------------------------------");
			System.out.println("직원관리v2.0 > 2.기초정보관리> 2.부서관리");
			System.out.println("------------------------------------------");
			System.out.println("1.부서입력  2.부서출력  3.부서삭제");
			System.out.print("선택(1~3, 0 quit)?");
			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				menu_221(sc);
				break;
			case 2:
				menu_222(sc);
				break;
			case 3:
				menu_223(sc);
				break;
			case 0:
				run = false;
				break;
			}
		}

	}

	// 직원관리v2.0 > 2.기초정보관리 > 2.부서관리> 1.부서입력
	private void menu_221(Scanner sc) {
		// 부서 정보 입력
		System.out.print("부서이름(0 quit)?");
		String dept_name = sc.nextLine();

		// 입력 요청
		try{
			employeeJDBCTemplate.departmentAdd(dept_name);
			System.out.println("성공적으로 입력되었습니다.");
			
		} catch(DataAccessException d) {
			System.out.println("부서 정보 입력에 실패했습니다.");
		}
	}

	// 직원관리v2.0 > 2.기초정보관리 > 2.부서관리> 2.부서출력
	private void menu_222(Scanner sc) {
		// 부서 정보 출력
		List<Employee> list = employeeJDBCTemplate.departmentList();

		System.out.println("부서번호 | 부서명");
		System.out.println("-----------------");
		for (Employee e : list) {
			System.out.printf(" %s |  %s  %n", e.getDept_id(), e.getDept_name());
		}
	}

	// 직원관리v2.0 > 2.기초정보관리 > 2.부서관리> 3.부서삭제
	private void menu_223(Scanner sc) {
		// 부서 정보 출력 -> 삭제 가능 여부 출력
		List<Employee> list = employeeJDBCTemplate.departmentList();

		System.out.println("부서번호 | 부서명 | 삭제가능 여부");
		System.out.println("---------------------------------");
		for (Employee e : list) {
			System.out.printf(" %s |  %s  | %s%n", e.getDept_id(), e.getDept_name(), e.getDeleteCheck());
		}

		// 삭제하고자 하는 부서번호 입력
		System.out.print("삭제할 부서번호(0 quit)?");
		String dept_id = sc.nextLine();

		// 삭제 요청
		int result = employeeJDBCTemplate.departmentDelete(dept_id);

		// 삭제 결과 분석 및 메시지 출력
		if (result > 0) {
			System.out.println("성공적으로 삭제 완료되었습니다.");
		} else {
			System.out.println("부서 정보 삭제에 실패했습니다.");
		}
	}

	// -------------------------------------------------------------------------------------------------------------------------
	// 직원관리v2.0 > 2.기초정보관리 > 3.직위관리
	private void menu_23(Scanner sc) {
		boolean run = true;
		while (run) {
			System.out.println("-------------------------------------------");
			System.out.println("직원관리v2.0 > 2.기초정보관리> 3.직위관리");
			System.out.println("------------------------------------------");
			System.out.println("1.직위입력  2.직위출력  3.직위삭제");
			System.out.print("선택(1~3, 0 quit)?");
			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				menu_231(sc);
				break;
			case 2:
				menu_232(sc);
				break;
			case 3:
				menu_233(sc);
				break;
			case 0:
				run = false;
				break;
			}
		}

	}

	// 직원관리v2.0 > 2.기초정보관리 > 3.직위관리> 1.직위입력
	private void menu_231(Scanner sc) {
		// 직위 정보 입력
		System.out.print("직위이름(0 quit)?");
		String job_title = sc.nextLine();

		// 입력 요청
		try{
			employeeJDBCTemplate.jobAdd(job_title);
			System.out.println("성공적으로 입력되었습니다.");
			
		} catch(DataAccessException d) {
			System.out.println("직위 정보 입력에 실패했습니다.");
		}
	}

	// 직원관리v2.0 > 2.기초정보관리 > 3.직위관리> 2.직위출력
	private void menu_232(Scanner sc) {
		// 직위 정보 출력
		List<Employee> list = employeeJDBCTemplate.jobList();

		System.out.println("직위번호 | 부서명");
		System.out.println("-----------------");
		for (Employee e : list) {
			System.out.printf(" %s |  %s  %n", e.getJob_id(), e.getJob_title());
		}
	}

	// 직원관리v2.0 > 2.기초정보관리 > 3.직위관리> 3.직위삭제
	private void menu_233(Scanner sc) {
		// 직위 정보 출력 -> 삭제 가능 여부 출력
		List<Employee> list = employeeJDBCTemplate.jobList();

		System.out.println("직위번호 | 직위명 | 삭제가능 여부");
		System.out.println("---------------------------------");
		for (Employee e : list) {
			System.out.printf(" %s |  %s  | %s%n", e.getJob_id(), e.getJob_title(), e.getDeleteCheck());
		}

		// 삭제하고자 하는 직위번호 입력
		System.out.print("삭제할 직위번호(0 quit)?");
		String job_id = sc.nextLine();

		// 삭제 요청
		int result = employeeJDBCTemplate.jobDelete(job_id);

		// 삭제 결과 분석 및 메시지 출력
		if (result > 0) {
			System.out.println("성공적으로 삭제 완료되었습니다.");
		} else {
			System.out.println("직위 정보 삭제에 실패했습니다.");
		}
	}

}

```



## LoginService.java

```java
package com.test;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;

public class LoginService {
	private LoginJDBCTemplate loginJDBCTemplate;

	public LoginService() {
		
	}
	public LoginService(ApplicationContext context) {
		this.loginJDBCTemplate = (LoginJDBCTemplate) context.getBean("loginJDBCTemplate");
	}
	
	//아이디, 패스워드 입력받고, 로그인 검증하는 메소드
	public Login login(Scanner sc) {
		Login result = null;
		
		//로그인 검증 절차 진행
		//성공하면 Login 객체 반환
		//실패하면 NULL 반환
		System.out.print("아이디:");
		String id_ = sc.nextLine();
		System.out.print("패스워드:");
		String pw_ = sc.nextLine();
		
		Login l = new Login();
		l.setId_(id_);
		l.setPw_(pw_);
		
		result = loginJDBCTemplate.login(l);
		
		return result;
	}
}

```



## Main.java

```java
package com.test;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/test/beans.xml");
		Scanner sc = new Scanner(System.in);
		boolean run = true;
		LoginService service = new LoginService(context);

		// 로그인 메뉴 구성
		// 로그인 성공 여부에 따라서 전용 메뉴로 이동
		while (run) {
			System.out.println("--------------");
			System.out.println("직원관리v2.0");
			System.out.println("--------------");
			System.out.println("1.로그인");
			System.out.print("선택(1, 0 quit)?");

			int selectNo = sc.nextInt();
			sc.nextLine();

			if (selectNo == 1) {
				// 로그인 메뉴 호출 및 로그인 결과 분석
				try {
					Login result = service.login(sc);

					// 로그인 성공
					// 로그인 성공한 경우, 등급에 따른 전용 메뉴로 이동
					String id_ = result.getId_();
					int grade = result.getGrade();
					if (grade == 0) {
						// 관리자 전용 메인 메뉴
						new EmployeeMain().main(sc, id_, context);
					} else if (grade == 1) {
						// 강사 전용 메인 메뉴
						new InstructorMain().main(sc, id_, context);
					} else if (grade == 2) {
						// 수강생 전용 메인 메뉴
						new StudentMain().main(sc, id_, context);
					} else {
						System.out.println("잘못된 등급 정보입니다.");
					}
				} catch (DataAccessException d) {
					// 로그인 실패
					System.out.println("로그인에 실패했습니다.");
				}

			} else if (selectNo == 0) {
				run = false;
			}

		}
		sc.close();
		System.out.println("프로그램 종료");
		((ClassPathXmlApplicationContext) context).close();
	}

}

```



## EmployeeMain.java

```java
package com.test;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;

public class EmployeeMain {
	// (관리자용) 메인 메뉴 구성
		
		public void main(Scanner sc, String id_, ApplicationContext context) {
			EmployeeService service = new EmployeeService(context);
			
			boolean run = true;
			while (run) {
				System.out.println("---------------------------");
				System.out.printf("직원관리v2.0 (사용자:%s)%n", id_);
				System.out.println("---------------------------");
				System.out.println("1.직원관리  2. 기초정보관리");
				System.out.print("선택(1~2, 0 quit)?");
				int selectNo = sc.nextInt();
				sc.nextLine();

				switch (selectNo) {
				case 1:
					service.menu_1(sc);
					break;
				case 2:
					service.menu_2(sc);
					break;
				case 0:
					run = false;
					break;
				}
			}
			System.out.println("로그아웃 되었습니다.");
		}
}

```



## InstructorMain.java

```java
package com.test;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;

public class InstructorMain {
	// (강사용) 메인 메뉴 구성
	public void main(Scanner sc, String id_, ApplicationContext context) {
		boolean run = true;
		while (run) {
			System.out.println("---------------------------");
			System.out.printf("직원관리v2.0 (사용자:%s)%n", id_);
			System.out.println("---------------------------");
			System.out.println("강사 전용 화면입니다");
			System.out.print("선택(1~2, 0 quit)?");
			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				break;
			case 2:
				break;
			case 0:
				run = false;
				break;
			}
		}
		System.out.println("로그아웃 되었습니다.");
	}

}

```



## StudentMain.java

```java
package com.test;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;

public class StudentMain {

	// (수강생용) 메인 메뉴 구성
	public void main(Scanner sc, String id_, ApplicationContext context) {
		boolean run = true;
		while (run) {
			System.out.println("---------------------------");
			System.out.printf("직원관리v2.0 (사용자:%s)%n", id_);
			System.out.println("---------------------------");
			System.out.println("수강생 전용 화면입니다");
			System.out.print("선택(1~2, 0 quit)?");
			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				break;
			case 2:
				break;
			case 0:
				run = false;
				break;
			}
		}
		System.out.println("로그아웃 되었습니다.");
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

	<bean id="employeeJDBCTemplate" class="com.test.EmployeeJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
	<bean id="loginJDBCTemplate" class="com.test.LoginJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
</beans>
```

