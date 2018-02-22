---
layout: post
title: "JDBC - divided into classes"
description: "JDBC - divided into classes"
categories: [JDBC]
tags: [JDBC - divided into classes]
redirect_from:
  - /2018/01/18/
---

# DBConnection Class

```java
package com.test;

import java.sql.*;

//데이터베이스 연결 정보 관리 클래스
public class DBConnection {
	
	// JDBC driver name and database URL
	private static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String DB_URL = "jdbc:oracle:thin:@211.63.89.71:1521:xe";

	// Database credentials
	private static final String USER = "practice3";
	private static final String PASS = "1234";	
	
	private static Connection conn;
	
	//데이터베이스 커넥션 객체 생성 메소드
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

# Test Class

```java
package com.test;

// 자료형 클래스 선언
// -> 클래스명 지정시 테이블명과 동일하게 작성
public class Test {
	// 자료형 클래스 선언시 멤버 구성은
	// 동일 자료, 동일 식별자 권장
	// -> 데이터베이스 입력, 출력 액션에서 사용한 모든 식별자(특히, 별칭 사용한 경우)를 멤버로 구성
	// -> 컬럼 구성시 사용한 컬럼명 및 자료형을 멤버로 구성
	// -> 오라클에서 NUMBER 자료형인 경우 Java에서는 int, double 자료형 사용
	// -> 오라클에서 VARCHAR2, NVARCHAR2 자료형인 경우 Java에서는 String 자료형 사용
	// -> 오라클에서 DATE 자료형인 경우 Java에서는 Date, LocalDate 자료형 사용
	private int id_, age_;
	private String first_, last_;
	
	// 기본 생성자 & 매개변수 있는 생성자 추가
	public Test() {
		
	}

	public Test(int id_, int age_, String first_, String last_) {
		this.id_ = id_;
		this.age_ = age_;
		this.first_ = first_;
		this.last_ = last_;
	}
		
	
	// getter
	public int getId_() {
		return id_;
	}
	
	public int getAge_() {
		return age_;
	}
	public String getFirst_() {
		return first_;
	}
	public String getLast_() {
		return last_;
	}
	
	// setter
	public void setId_(int id_) {
		this.id_ = id_;
	}
	public void setAge_(int age_) {
		this.age_ = age_;
	}
	public void setFirst_(String first_) {
		this.first_ = first_;
	}
	public void setLast_(String last_) {
		this.last_ = last_;
	}
	
	
	// toString() 메소드 오버라이딩
	// -> 출력 서식 지정

	@Override
	public String toString() {
		return String.format("%d | %3d | %7s | %7s|", id_, age_, first_, last_);
	}
	

}

```

# TestDAO Class

```java
package com.test;

import java.sql.*;
import java.util.*;

//자료 저장소(데이터베이스) 액션 전용 클래스
public class TestDAO {

	// 출력 액션 메소드
	// -> 반환 자료형을 컬렉션 객체로 지정
	public List<Test> list() {
		// 데이터베이스 액션 처리
		// ->결과(데이터 집합)는 컬렉션 객체에 저장 및 반환
		List<Test> result = new ArrayList<Test>();

		// 주의) 문장 끝에 ; 가 있으면 안된다.
		String sql = "SELECT id_, age_, first_, last_ FROM test01 ORDER BY id_";

		// 준비된 SELECT 쿼리 실행 액션 코드 작성
		// ->결과를 컬렉션 객체에 저장
		// ->SELECT 쿼리의 결과는 레코드의 집합체이다.
		// Java에서 집합 자료형은 컬렉션이므로 레코드의 집합체를 Java 자료형으로 받으려면 컬렉션을 사용한다.
		// 레코드의 집합체를 일괄적으로 형변환하는 것은 불가능하고, 레코드 단위로 읽어내서 그 결과를 컬렉션에 순차적으로 추가해야 한다.
		Connection conn = null;

		//Statement stmt = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.connect();
			
			//stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);
			
			//외부데이터 바인딩 과정 추가하는 위치
			
			//ResultSet rs = stmt.executeQuery(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				
				int id_ = rs.getInt("id_");
				int age_ = rs.getInt("age_");
				String first_ = rs.getString("first_");
				String last_ = rs.getString("last_");
				
				Test t = new Test(id_, age_, first_, last_);
				result.add(t);
				
			}
			rs.close();

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//if (stmt != null)
				//	stmt.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				DBConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
		return result;
	}

	// 입력 액션 메소드
	// ->입력에 필요한 데이터는 외부에서 전달 받는다.
	// ->매개변수 Test t
	// ->age_, first_, last_ 항목을 모두 가지고 있다.
	// -> 주의) id_ 컬럼(PK)의 값은 외부에서 전달 받지 않고, 서브쿼리에 의해 자동 관리 예정.
	public int add(Test t) {
		int result = 0;

		// 데이터베이스 액션 처리

		// 외부에서 전달된 자료를 INSERT 쿼리에서 컬럼과 매핑시켜야 한다.
		// 주의) 서식 문자열 사용시 숫자 자료형인 경우 ' 없이 작성하고, 문자 자료형인 경우 ' 를 붙여서 작성한다.
		// 주의) 문장 끝에 ; 가 있으면 안된다.
		// -> PK 제약이 있는 컬럼인 경우 동일한 자료를 두 번 입력 시도하면 오류 발생. 자동 관리 액션 처리 필요.
		
		//String sql = String.format("INSERT INTO test01 (id_, age_, first_, last_)  VALUES ((SELECT NVL(MAX(id_), 0) + 1 FROM test01), %s, '%s', '%s')"
		//		, t.getAge_(), t.getFirst_(), t.getLast_());
		//외부 데이터를 쿼리에 바인딩 하는 과정 추가 필요.
		//-> 바인딩 전용 기호인 ? 사용
		String sql = "INSERT INTO test01 (id_, age_, first_, last_)  VALUES ((SELECT NVL(MAX(id_), 0) + 1 FROM test01), ?, ?, ?)";

		// 준비된 INSERT 쿼리 실행 액션 코드 작성
		Connection conn = null;
		
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.connect();
			
			//stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);

			//외부 데이터를 쿼리에 바인딩 하는 과정 추가 필요.
			//->setXXX(인덱스, 데이터) 메소드
			//->주의) 인덱스는 1부터 시작된다.
			//->쿼리 문자열의 ? 기호를 외부 데이터와 바인딩
			pstmt.setInt(1, t.getAge_());
			pstmt.setString(2, t.getFirst_());
			pstmt.setString(3, t.getLast_());
			
			//주의) DML문 실행시 AutoCommit 상태이므로 COMMIT 명령을 추가로 실행하지 않아도 된다.
			//result = stmt.executeUpdate(sql);
			result = pstmt.executeUpdate();
			

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//if (stmt != null)
				//	stmt.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				DBConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
		return result;
	}
	
	
	//삭제 액션 메소드
	//->외부에서 PK 컬럼(id_)의 값을 전달 받는다.
	//->반환값 분석을 위해서 반환자료형을 int로 지정한다.
	public int remove(int id_) {
		int result = 0;
		
		// 주의) 서식 문자열 사용시 숫자 자료형인 경우 ' 없이 작성하고, 문자 자료형인 경우 ' 를 붙여서 작성한다.
		// 주의) 문장 끝에 ; 가 있으면 안된다.
		//String sql = String.format("DELETE FROM test01 WHERE id_ = %s", id_);
		//외부 데이터를 쿼리에 바인딩 하는 과정 추가 필요.
		//-> 바인딩 전용 기호인 ? 사용
		String sql = "DELETE FROM test01 WHERE id_ = ?";
		
		Connection conn = null;
		
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.connect();
			
			//stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);
			
			//외부 데이터를 쿼리에 바인딩 하는 과정 추가 필요.
			//->setXXX(인덱스, 데이터) 메소드
			//->주의) 인덱스는 1부터 시작된다.
			//->쿼리 문자열의 ? 기호를 외부 데이터와 바인딩
			pstmt.setInt(1, id_);
			
			//주의) DML문 실행시 AutoCommit 상태이므로 COMMIT 명령을 추가로 실행하지 않아도 된다.
			//주의) DELETE 쿼리인 경우 반환값 분석 필요하다.
			//result = stmt.executeUpdate(sql);
			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//if (stmt != null)
				//	stmt.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException se) {
			}
			try {
				DBConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
		return result;
	}
}

```

# TestService Class

```java
package com.test;

import java.util.*;

// 콘솔 액션 전용 클래스
public class TestService {
	private TestDAO dao = new TestDAO();
	
	// 출력 액션 메소드
	public void list() {
		// 콘솔 액션 처리
		// -> TestDAO의 특정 메소드로부터 반환받은 컬렉션 객체를
		// 	  원하는 서식에 맞춰서 콘솔 출력
			
		List<Test> list = dao.list();
		
		System.out.println("ID  | AGE |  FIRST  |  LAST  |");
		System.out.println("----|-----|---------|--------|");
		for(Test t : list) {
			System.out.println(t.toString());
			// 혹은 직접 서식 지정
			// System.out.printf("%s, %s, %s, %s", t.getId_(), t.getAge_(), t.getFirst_(), t.getLast_());
		}
		
	}
		
	// 입력 액션 메소드
	public void add(Scanner sc) {
		// 콘솔 액션 처리
		// -> 특정 항목의 자료를 콘솔로부터 입력 받고,
		//	  TestDAO의 특정 메소드에 전달
		System.out.print("first name: ");
		String first = sc.nextLine();
		
		System.out.print("last name: ");
		String last = sc.nextLine();
		
		System.out.print("age: ");
		int age = sc.nextInt();
		sc.nextLine();
		
		Test t = new Test(0, age, first, last);
		dao.add(t);
		
		System.out.println("Inserted records into the table...");
	}
	
	// 삭제 액션 메소드
	public void remove(Scanner sc) {
		// 콘솔 액션 처리
		// -> 특정 항목(PK 제약이 지정된 id_)의 자료를 콘솔로부터 입력 받고,
		// 	  TestDAO의 특정 메소드에 전달
		// -> 결과 메시지("n개 행이 삭제되었습니다.") 출력
		System.out.print("id: ");
		int id_ = sc.nextInt();
		sc.nextLine();
		
		int result = dao.remove(id_);
		
		System.out.printf("%d개 행이 삭제되었습니다.", result);
		
	}

}

```

# Main Class

```java
package com.test;

import java.util.*;

public class Main {

	public static void main(String[] args) {
		
		
		// TestDAO 클래스의 list(), add() 메소드 테스트
		// -> TestService 클래스의 list() 메소드 호출로 대체할 수 있다.
		Scanner sc = new Scanner(System.in);
		TestService service = new TestService();
		
		// 입력 메소드 테스트
		service.add(sc);

		// 출력 메소드 테스트
		service.list();
		
		// 삭제 메소드 테스트
		service.remove(sc);
		
		sc.close();
	}
}

```

