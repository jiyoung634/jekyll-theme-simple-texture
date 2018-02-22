---
layout: post
title: "JDBC Practice - Employees Managing"
description: "JDBC Practice - Employees Managing"
categories: [JDBC]
tags: [JDBC, Employees Managing]
redirect_from:
  - /2018/01/29/
---



# DB Connection

```java
package com.test;

import java.sql.*;

//데이터베이스 연결 정보 관리 클래스
public class MySQLConnection {

	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://211.63.89.72:3306/test03?useSSL=false"; // 연결문자열(포트번호까지 작성)

	// Database credentials
	static final String USER = "test03";
	static final String PASS = "1234";

	private static Connection conn;

	// 데이터베이스 커넥션 객체 생성 메소드
	public static Connection connect() throws ClassNotFoundException, SQLException {

		// STEP 2: Register JDBC driver
		Class.forName(JDBC_DRIVER);
		// STEP 3: Open a connection
		conn = DriverManager.getConnection(DB_URL, USER, PASS);

		return conn;
	}

	// 데이테베이스 커넥션 객체 소멸 메소드
	public static void close() throws SQLException {
		if (conn != null) {
			conn.close();
		}
	}

}
```



# 로그인 클래스

```java
package com.test;

// 자료형 클래스
public class Login {
	private String id_, pw_;
	private int grade;

	// 생성자
	public Login() {

	}

	public Login(String id_, String pw_) {
		super();
		this.id_ = id_;
		this.pw_ = pw_;
	}
	
	public Login(String id_, int grade) {
		super();
		this.id_ = id_;
		this.grade = grade;
	}
	
	public Login(String id_, String pw_, int grade) {
		super();
		this.id_ = id_;
		this.pw_ = pw_;
		this.grade = grade;
	}

	

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

```java
package com.test;

import java.sql.*;

public class LoginDAO {
	
	// 로그인 검증 메소드
	public Login login(Login l) {
		Login result = null;
		
		// 로그인 확인 절차 진행
		// 성공하면 Login 객체 반환. id_, grade 정보 저장
		// 실패하면 NULL 반환
		String sql = "SELECT id_,pw_,grade FROM login WHERE id_ = ? AND pw_ = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, l.getId_());
			pstmt.setString(2, l.getPw_());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String id_ = rs.getString("id_");
				String pw_ = rs.getString("pw_");
				int grade = rs.getInt("grade");

				result = new Login(id_, grade);
			}
			rs.close();

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

```java
package com.test;
import java.util.*;

// 콘솔 액션 클래스
public class LoginService {
	
	private LoginDAO dao = new LoginDAO();
	
	// 아이디, 패스워드 입력받고, 로그인 검증하는 메소드
	public Login login(Scanner sc) {
		Login result = null;
		
		// 로그인 검증 절차 진행
		// 성공하면 Login 객체 반환
		// 실패하면 아이디 반환
		System.out.print("아이디?");
		String id_ = sc.nextLine();
		System.out.println("패스워드?");
		String pw_ = sc.nextLine();
		
		Login l = new Login(id_, pw_);
		result = dao.login(l);		// 사용자가 입력한 아이디와 패스워드를 Login 객체로 포장해서 DAO로 넘김
		
		return result;
	}
}

```



# 자료형 클래스

```java
package com.test;

import java.time.*;

// 자료형 클래스 선언
public class Employees {

	// 직원 정보를 위한 필드 구성
	private String eid, name_, ssn, phone;
	private LocalDate hiredate;
	private int basicpay, extrapay, pay;

	// 지역 정보를 위한 필드 구성
	private String reg_id, reg_name;

	// 부서 정보를 위한 필드 구성
	private String dept_id, dept_name;
	
	// 직위 정보를 위한 필드 구성
	private String job_id, job_title;
	
	// 삭제 가능 여부 확인용 필드 구성
	private String deleteCheck;

	// 생성자
	public Employees() {

	}

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
	
	public int getPay() {
		return pay;
	}
	
	public String getDeleteCheck() {
		return deleteCheck;
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
	
	public void setPay (int pay) {
		this.pay = pay;
	}

	public void setDeleteCheck(String deleteCheck) {
		this.deleteCheck = deleteCheck;
	}
	
	// toString() 오버라이딩 - 지역, 부서, 직위 번호 범위 검색

	@Override
	public String toString() {
		return String.format(" %s / %s  / %s /", this.getReg_id(), this.getDept_id(), this.getJob_id());
	}

}

```



# DAO 클래스

```java
package com.test;

import java.sql.*;
import java.time.*;
import java.util.*;

// 자료 저장소(MySQL)에 대한 액션 클래스
public class EmployeesDAO {
	
	// 직원 정보 정렬 출력 메소드
	// -> 전체 출력시 사번, 이름 등 기준으로 정렬 지원
	public List<Employees> list(String key) {
		List<Employees> result = new ArrayList<Employees>();
		/*
		 * CREATE VIEW empView AS SELECT eid, name_, ssn, hiredate, phone, reg_name,
		 * dept_name, job_title, basicpay, extrapay, basicpay+extrapay AS pay FROM
		 * employees INNER JOIN regions USING(reg_id) INNER JOIN departments
		 * USING(dept_id) INNER JOIN jobs USING(job_id);
		 */

		/*
		 * SELECT eid, name_, ssn, hiredate, phone, reg_name, dept_name, job_title,
		 * basicpay, extrapay, pay FROM empView;
		 */

		String sql = "SELECT eid, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, basicpay, extrapay, pay FROM empView";
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 정렬 기준에 따른 ORDER BY 구문 추가F
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
			
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String eid = rs.getString("eid");
				String name_ = rs.getString("name_");
				String ssn = rs.getString("ssn");
				LocalDate hiredate = rs.getDate("hiredate").toLocalDate();
				String phone = rs.getString("phone");
				String reg_name = rs.getString("reg_name");
				String dept_name = rs.getString("dept_name");
				String job_title = rs.getString("job_title");
				int basicpay = rs.getInt("basicpay");
				int extrapay = rs.getInt("extrapay");
				int pay = rs.getInt("pay");

				Employees e = new Employees();
				e.setEid(eid);
				e.setName_(name_);
				e.setSsn(ssn);
				e.setHiredate(hiredate);
				e.setPhone(phone);
				e.setReg_name(reg_name);
				e.setDept_name(dept_name);
				e.setJob_title(job_title);
				e.setBasicpay(basicpay);
				e.setExtrapay(extrapay);
				e.setPay(pay);
				result.add(e);
			}
			rs.close();

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

	// 직원 정보 검색 출력 메소드
	// -> 사번, 이름 등 기준으로 검색하고 사번 정렬된 상태로 출력
	public List<Employees> list(String key, String value) {
		List<Employees> result = new ArrayList<Employees>();
		/*
		 * CREATE VIEW empView AS SELECT eid, name_, ssn, hiredate, phone, reg_name,
		 * dept_name, job_title, basicpay, extrapay, basicpay+extrapay AS pay FROM
		 * employees INNER JOIN regions USING(reg_id) INNER JOIN departments
		 * USING(dept_id) INNER JOIN jobs USING(job_id);
		 */

		/*
		 * SELECT eid, name_, ssn, hiredate, phone, reg_name, dept_name, job_title,
		 * basicpay, extrapay, pay FROM empView;
		 */

		String sql = "SELECT eid, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, basicpay, extrapay, pay FROM empView";
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 정렬 기준에 따른 ORDER BY 구문 추가
			switch (key) {
			case "eid":
				sql += " WHERE eid=?";
				break;
			case "name_":
				sql += " WHERE INSTR(name_,?) > 0";
				break;
			case "reg_name":
				sql += " WHERE INSTR(reg_name,?) > 0";
				break;
			case "dept_name":
				sql += " WHERE INSTR(dept_name,?) > 0";
				break;
			case "job_title":
				sql += " WHERE INSTR(job_title,?) > 0";
				break;
			}
			
			sql +=  " ORDER BY eid";
			
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, value);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String eid = rs.getString("eid");
				String name_ = rs.getString("name_");
				String ssn = rs.getString("ssn");
				LocalDate hiredate = rs.getDate("hiredate").toLocalDate();
				String phone = rs.getString("phone");
				String reg_name = rs.getString("reg_name");
				String dept_name = rs.getString("dept_name");
				String job_title = rs.getString("job_title");
				int basicpay = rs.getInt("basicpay");
				int extrapay = rs.getInt("extrapay");
				int pay = rs.getInt("pay");

				Employees e = new Employees();
				e.setEid(eid);
				e.setName_(name_);
				e.setSsn(ssn);
				e.setHiredate(hiredate);
				e.setPhone(phone);
				e.setReg_name(reg_name);
				e.setDept_name(dept_name);
				e.setJob_title(job_title);
				e.setBasicpay(basicpay);
				e.setExtrapay(extrapay);
				e.setPay(pay);
				result.add(e);
			}
			rs.close();

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

	// 직원 정보 입력 메소드
	public int add(Employees e) {
		int result = 0;

		String sql = "INSERT INTO employees(eid, name_,ssn,hiredate,phone,reg_id,dept_id,job_id,basicpay,extrapay) VALUES (CONCAT('E',LPAD((SUBSTRING(IFNULL((SELECT MAX(eid) FROM employees e),'E0000'),2)+1),2,0)), ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, e.getName_());
			pstmt.setString(2, e.getSsn());
			pstmt.setString(3, e.getHiredate().toString());
			pstmt.setString(4, e.getPhone());
			pstmt.setString(5, e.getReg_id());
			pstmt.setString(6, e.getDept_id());
			pstmt.setString(7, e.getJob_id());
			pstmt.setInt(8, e.getBasicpay());
			pstmt.setInt(9, e.getExtrapay());

			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
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

	// 직원 정보 삭제 메소드
	public int remove(String value) {
		int result = 0;

		String sql = "DELETE FROM employees WHERE eid = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, value);

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

	// -------------------------------------------------------------------------------------------------------------------------
	// 지역 정보 입력 메소드
	public int regionAdd(String value) {
		int result = 0;

		String sql = "INSERT INTO regions(reg_id, reg_name) VALUES(CONCAT('REG',LPAD((SUBSTRING(IFNULL((SELECT MAX(reg_id) FROM regions r),'REG00'),4)+1),2,0)), ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, value);

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
	

	// 지역 정보 출력 메소드 -> 삭제 가능 여부 포함
	public List<Employees> regionList() {
		List<Employees> result = new ArrayList<Employees>();

		String sql = "SELECT reg_id, reg_name, IF((SELECT COUNT(*) FROM employees WHERE reg_id = r.reg_id)>0, 'N', 'Y') AS deleteCheck FROM regions r ORDER BY reg_id";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String reg_id = rs.getString("reg_id");
				String reg_name = rs.getString("reg_name");
				String deleteCheck = rs.getString("deleteCheck");

				Employees e = new Employees();
				e.setReg_id(reg_id);
				e.setReg_name(reg_name);
				e.setDeleteCheck(deleteCheck);
				result.add(e);
			}
			rs.close();

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

	// 지역 정보 삭제 메소드
	public int regionDelete(String value) {
		int result = 0;

		String sql = "DELETE FROM regions WHERE reg_id = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, value);

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

	// -------------------------------------------------------------------------------------------------------------------------

	// 부서 정보 입력 메소드
	public int departmentAdd(String value) {
		int result = 0;

		String sql = "INSERT INTO departments(dept_id, dept_name) VALUES(CONCAT('DEPT',LPAD((SUBSTRING(IFNULL((SELECT MAX(dept_id) FROM departments d),'DEPT00'),5)+1),2,0)),?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, value);

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

	// 부서 정보 출력 메소드 -> 삭제 가능 여부 포함
	public List<Employees> departmentList() {
		List<Employees> result = new ArrayList<Employees>();

		String sql = "SELECT dept_id, dept_name, IF((SELECT COUNT(*) FROM employees WHERE dept_id = d.dept_id)>0, 'N', 'Y') AS deleteCheck FROM departments d ORDER BY dept_id";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String dept_id = rs.getString("dept_id");
				String dept_name = rs.getString("dept_name");
				String deleteCheck = rs.getString("deleteCheck");

				Employees e = new Employees();
				e.setDept_id(dept_id);
				e.setDept_name(dept_name);
				e.setDeleteCheck(deleteCheck);
				result.add(e);
			}
			rs.close();

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

	// 부서 정보 삭제 메소드
	public int departmentDelete(String value) {
		int result = 0;

		String sql = "DELETE FROM departments WHERE dept_id = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, value);

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
	// -------------------------------------------------------------------------------------------------------------------------

	// 직위 정보 입력 메소드
	public int jobAdd(String value) {
		int result = 0;

		String sql = "INSERT INTO jobs(job_id, job_title) VALUES(CONCAT('JOB',LPAD((SUBSTRING(IFNULL((SELECT MAX(job_id) FROM jobs j),'JOB00'),4)+1),2,0)),?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, value);

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

	// 직위 정보 출력 메소드 -> 삭제 가능 여부 포함
	public List<Employees> jobList() {
		List<Employees> result = new ArrayList<Employees>();

		String sql = "SELECT job_id, job_title, IF((SELECT COUNT(*) FROM employees WHERE job_id = j.job_id)>0, 'N', 'Y') AS deleteCheck FROM jobs j ORDER BY job_id";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String job_id = rs.getString("job_id");
				String job_title = rs.getString("job_title");
				String deleteCheck = rs.getString("deleteCheck");

				Employees e = new Employees();
				e.setJob_id(job_id);
				e.setJob_title(job_title);
				e.setDeleteCheck(deleteCheck);
				result.add(e);
			}
			rs.close();

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

	// 직위 정보 삭제 메소드
	public int jobDelete(String value) {
		int result = 0;

		String sql = "DELETE FROM jobs WHERE job_id = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, value);

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
	// -------------------------------------------------------------------------------------------------------------------------
}

```



# Service 클래스

```java
package com.test;

import java.time.LocalDate;
import java.util.*;

// 콘솔 액션 클래스
public class EmployeesService {

	private EmployeesDAO dao = new EmployeesDAO();

	// 직원관리v2.0 > 1.직원관리
	public void menu_1(Scanner sc) {
		boolean run = true;
		while (run) {
			System.out.println("--------------------------");
			System.out.println("직원관리v2.0 > 1.직원관리");
			System.out.println("--------------------------");
			System.out.println("1.직원입력  2.직원전체출력  3.직원검색  4.직원삭제");
			System.out.print("선택(1~3, 0 quit)?");

			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				menu_11(sc);
				break;
			case 2:
				menu_12(sc);
				break;
			case 3:
				menu_13(sc);
				break;
			case 4:
				menu_14(sc);
				break;
			case 0:
				run = false;
				break;
			}
		}

	}

	// -------------------------------------------------------------------------------------------------------------------------
	// 직원관리v2.0 > 1.직원관리> 1.직원입력
	private void menu_11(Scanner sc) {
		// 이름, 주민번호, ... 등의 항목을 콘솔 입력 받는다.
		// 주의) 지역, 부서, 직위는 번호 입력을 받기 전에 번호의 범위를 출력한다. FK 지정
		// 주의) 입력시 특정 패턴을 벗어나거나, 입력 범위를 벗어나는 경우 예외처리
		System.out.println("**입력 항목에서 0 입력시 입력 취소됨.");

		System.out.print("이름?");
		String name_ = sc.nextLine();
		// 입력 중단
		if (name_.equals("0")) {
			// 메소드 액션 진행에 대한 중단
			return;
		}

		System.out.print("주민등록번호(YYMMDD-NNNNNNN))?");
		String ssn = sc.nextLine();
		if (ssn.equals("0")) {
			return;
		}

		String date = "";
		LocalDate hiredate = null;
		while (true) {
			System.out.print("입사일(YYYY-MM-DD))?");
			date = sc.nextLine();
			if (date.equals("0")) {
				return;
			}
			try {
				hiredate = LocalDate.parse(date);
				break;
			} catch (Exception e) {
				System.out.println("날짜 형식이 틀렸습니다.");
			}
		}

		System.out.print("전화번호(010-XXXX-XXXX))?");
		String phone = sc.nextLine();
		if (phone.equals("0")) {
			return;
		}

		// 지역번호 확인
		List<Employees> regionList = dao.regionList();
		System.out.println("지역번호 | 지역명");
		System.out.println("-----------------");
		for (Employees e : regionList) {
			System.out.printf(" %s  |  %s  %n", e.getReg_id(), e.getReg_name());
		}
		// 지역번호 범위를 벗어나는 경우 확인하는 과정
		String reg_id = "";
		while (true) {
			System.out.print("지역번호?");
			reg_id = sc.nextLine();
			if (reg_id.equals("0")) {
				return;
			}
			// 범위 검사 진행 -> 결과에 따라서 반복문 탈출
			// 주의) Employees 클래스에서 toString() 메소드 오버라이딩 추가 필요
			// "[객체1, 객체2, ...]"
			// "[REG01/null/null/Reg02/...]"
			boolean result = regionList.toString().contains(reg_id);
			if (result && reg_id.length()==5) {
				break;
			} else {
				System.out.println("잘못된 범위의 값입니다.");
			}
		}

		// 부서번호 확인
		List<Employees> departmentList = dao.departmentList();
		System.out.println("부서번호 | 부서명");
		System.out.println("-----------------");
		for (Employees e : departmentList) {
			System.out.printf(" %s  |  %s  %n", e.getDept_id(), e.getDept_name());
		}
		// 부서번호 범위를 벗어나는 경우 확인하는 과정
		String dept_id = "";
		while (true) {
			System.out.print("부서번호?");
			dept_id = sc.nextLine();
			if (dept_id.equals("0")) {
				return;
			}
			boolean result = departmentList.toString().contains(dept_id);
			if (result && dept_id.length()==6) {
				break;
			} else {
				System.out.println("잘못된 범위의 값입니다.");
			}
		}
		// 직위번호 확인
		List<Employees> jobList = dao.jobList();
		System.out.println("직위번호 | 직위명");
		System.out.println("-----------------");
		for (Employees e : jobList) {
			System.out.printf(" %s  |  %s  %n", e.getJob_id(), e.getJob_title());
		}
		String job_id = "";
		while (true) {
			System.out.print("직위번호?");
			job_id = sc.nextLine();
			if (job_id.equals("0")) {
				return;
			}
			boolean result = jobList.toString().contains(job_id);
			if (result && job_id.length()==5) {
				break;
			} else {
				System.out.println("잘못된 범위의 값입니다.");
			}
		}

		System.out.print("기본급?");
		int basicpay = sc.nextInt();
		sc.nextLine();
		if (basicpay == 0) {
			return;
		}

		System.out.print("수당?");
		int extrapay = sc.nextInt();
		sc.nextLine();
		if (extrapay == 0) {
			return;
		}

		Employees e = new Employees();
		e.setName_(name_);
		e.setSsn(ssn);
		e.setHiredate(hiredate);
		e.setPhone(phone);
		e.setReg_id(reg_id);
		e.setDept_id(dept_id);
		e.setJob_id(job_id);
		e.setBasicpay(basicpay);
		e.setExtrapay(extrapay);

		dao.add(e);
		System.out.println("1개의 행이 입력되었습니다.");
	}

	// -------------------------------------------------------------------------------------------------------------------------
	// 직원관리v2.0 > 1.직원관리> 2.직원전체출력
	private void menu_12(Scanner sc) {
		boolean run = true;
		while (run) {
			System.out.println("-------------------------------------------");
			System.out.println("직원관리v2.0 > 1.직원관리 > 2.직원전체출력");
			System.out.println("-------------------------------------------");
			System.out.println("1.사번정렬  2.이름정렬  3.지역정렬  4.부서정렬  5.직위정렬");
			System.out.print("선택(1~5, 0 quit)?");
			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				this.menu_121();
				break;
			case 2:
				this.menu_122();
				break;
			case 3:
				this.menu_123();
				break;
			case 4:
				this.menu_124();
				break;
			case 5:
				this.menu_125();
				break;
			case 0:
				run = false;
				break;
			}
		}
	}

	// 직원관리v2.0 > 1.직원관리> 2.직원전체출력> 1.사번정렬
	private void menu_121() {
		this.employeesList("eid");
	}

	// 직원관리v2.0 > 1.직원관리> 2.직원전체출력> 2.이름정렬
	private void menu_122() {
		this.employeesList("name_");
	}

	// 직원관리v2.0 > 1.직원관리> 2.직원전체출력> 3.지역정렬
	private void menu_123() {
		this.employeesList("reg_name");
	}

	// 직원관리v2.0 > 1.직원관리> 2.직원전체출력> 4.부서정렬
	private void menu_124() {
		this.employeesList("dept_name");
	}

	// 직원관리v2.0 > 1.직원관리> 2.직원전체출력> 5.직위정렬
	private void menu_125() {
		this.employeesList("job_title");
	}

	// 정렬 지원되는 전체 출력 액션
	private void employeesList(String key) {
		List<Employees> result = dao.list(key);
		System.out.printf("전체 인원: %d%n", result.size());
		if (result.size() > 0) {
			System.out.println(
					"----------------------------------------------------------------------------------------------------------------------------");
			System.out.println(
					"사번 |  이름  |    주민번호    |     입사일    |    전화번호 	| 지역명 |  부서명 | 직위명 |  기본급  |   수당   |  급여  ");
			System.out.println(
					"----------------------------------------------------------------------------------------------------------------------------");
			for (Employees e : result) {
				System.out.printf("%s  |  %s  | %s |   %s  |  %s |  %s  | %s | %s  | %s|  %s| %s %n", e.getEid(),
						e.getName_(), e.getSsn(), e.getHiredate(), e.getPhone(), e.getReg_name(), e.getDept_name(),
						e.getJob_title(), e.getBasicpay(), e.getExtrapay(), e.getPay());
			}
		} else {
			System.out.println("입력된 정보가 없습니다.");
		}
	}

	// -------------------------------------------------------------------------------------------------------------------------
	// 직원관리v2.0 > 1.직원관리> 3.직원검색
	private void menu_13(Scanner sc) {
		boolean run = true;
		while (run) {
			System.out.println("---------------------------------------");
			System.out.println("직원관리v2.0 > 1.직원관리 > 3.직원검색");
			System.out.println("---------------------------------------");
			System.out.println("1.사번검색  2.이름검색  3.지역검색  4.부서검색  5.직위검색");
			System.out.print("선택(1~5, 0 quit)?");
			int selectNo = sc.nextInt();
			sc.nextLine();

			switch (selectNo) {
			case 1:
				this.menu_131(sc);
				break;
			case 2:
				this.menu_132(sc);
				break;
			case 3:
				this.menu_133(sc);
				break;
			case 4:
				this.menu_134(sc);
				break;
			case 5:
				this.menu_135(sc);
				break;
			case 0:
				run = false;
				break;
			}
		}
	}

	// 직원관리v2.0 > 1.직원관리> 3.직원검색> 1.사번검색
	private int menu_131(Scanner sc) {
		System.out.print("사번?");
		String value = sc.nextLine();
		int result = this.employeesSearch("eid", value);
		return result;
	}

	// 직원관리v2.0 > 1.직원관리> 3.직원검색> 2.이름검색
	private int menu_132(Scanner sc) {
		System.out.print("이름?");
		String value = sc.nextLine();
		int result = this.employeesSearch("name_", value);
		return result;
	}

	// 직원관리v2.0 > 1.직원관리> 3.직원검색> 3.지역검색
	private int menu_133(Scanner sc) {
		System.out.print("지역?");
		String value = sc.nextLine();
		int result = this.employeesSearch("reg_name", value);
		return result;
	}

	// 직원관리v2.0 > 1.직원관리> 3.직원검색> 4.부서검색
	private int menu_134(Scanner sc) {
		System.out.print("부서?");
		String value = sc.nextLine();
		int result = this.employeesSearch("dept_name", value);
		return result;
	}

	// 직원관리v2.0 > 1.직원관리> 3.직원검색> 5.직위검색
	private int menu_135(Scanner sc) {
		System.out.print("직위?");
		String value = sc.nextLine();
		int result = this.employeesSearch("job_title", value);
		return result;
	}

	// 검색 출력 액션
	private int employeesSearch(String key, String value) {
		List<Employees> result = dao.list(key, value);
		int result2 = result.size();

		System.out.printf("전체 인원: %d%n", result.size());
		if (result.size() > 0) {
			System.out.println(
					"----------------------------------------------------------------------------------------------------------------------------");
			System.out.println(
					"사번 |  이름  |    주민번호    |     입사일    |    전화번호 	| 지역명 |  부서명 | 직위명 |  기본급  |   수당   |  급여  ");
			System.out.println(
					"----------------------------------------------------------------------------------------------------------------------------");
			for (Employees e : result) {
				System.out.printf("%s  |  %s  | %s |   %s  |  %s |  %s  | %s | %s  | %s|  %s| %s %n", e.getEid(),
						e.getName_(), e.getSsn(), e.getHiredate(), e.getPhone(), e.getReg_name(), e.getDept_name(),
						e.getJob_title(), e.getBasicpay(), e.getExtrapay(), e.getPay());
			}
		} else {
			System.out.println("검색 결과가 없습니다.");
		}
		return result2;
	}

	// -------------------------------------------------------------------------------------------------------------------------
	// 직원관리v2.0 > 1.직원관리> 4.직원삭제
	private void menu_14(Scanner sc) {
		// 이름 검색을 먼저 진행하고, 검색 결과 출력
		int nameSearchResult = this.menu_132(sc);

		// 결과가 존재하는 경우 삭제할 사번을 물어본다.
		if (nameSearchResult > 0) {
			System.out.print("삭제할 사번?");
			String eid = sc.nextLine();

			// 사번을 기준으로 삭제 진행
			int result = dao.remove(eid);

			// 결과 메시지 출력
			if (result > 0) {
				System.out.println("삭제가 완료되었습니다.");
			} else {
				System.out.println("삭제에 실패했습니다.");
			}
		}
	}

	// =========================================================================================================================

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

	// -------------------------------------------------------------------------------------------------------
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
				menu_212();
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
		int result = dao.regionAdd(reg_name);

		// 지역 정보 입력 결과 분석 및 메시지 출력
		if (result > 0) {
			System.out.println("성공적으로 입력되었습니다.");
		} else {
			System.out.println("지역 정보 입력에 실패했습니다.");
		}

	}

	// 직원관리v2.0 > 2.기초정보관리 > 1.지역관리 > 2.지역출력
	private void menu_212() {
		// 지역 정보 출력
		List<Employees> list = dao.regionList();

		System.out.println("지역번호 | 지역명");
		System.out.println("-----------------");
		for (Employees e : list) {
			System.out.printf(" %s  |  %s  %n", e.getReg_id(), e.getReg_name());
		}

	}

	// 직원관리v2.0 > 2.기초정보관리 > 1.지역관리 > 3.지역삭제
	private void menu_213(Scanner sc) {
		// 지역 정보 출력 -> 삭제 가능 여부 출력
		List<Employees> list = dao.regionList();

		System.out.println("지역번호 | 지역명 | 삭제가능 여부");
		System.out.println("---------------------------------");
		for (Employees e : list) {
			System.out.printf(" %s  |  %s  | %s%n", e.getReg_id(), e.getReg_name(), e.getDeleteCheck());
		}

		// 삭제하고자 하는 지역번호 입력
		System.out.print("삭제할 지역번호(0 quit)?");
		String reg_id = sc.nextLine();

		// 삭제 요청
		int result = dao.regionDelete(reg_id);

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
				menu_222();
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
		int result = dao.departmentAdd(dept_name);

		// 부서 정보 입력 결과 분석 및 메시지 출력
		if (result > 0) {
			System.out.println("성공적으로 입력되었습니다.");
		} else {
			System.out.println("부서 정보 입력에 실패했습니다.");
		}

	}

	// 직원관리v2.0 > 2.기초정보관리 > 2.부서관리> 2.부서출력
	private void menu_222() {
		// 부서 정보 출력
		List<Employees> list = dao.departmentList();

		System.out.println("부서번호 | 부서명");
		System.out.println("-----------------");
		for (Employees e : list) {
			System.out.printf(" %s |  %s  %n", e.getDept_id(), e.getDept_name());
		}
	}

	// 직원관리v2.0 > 2.기초정보관리 > 2.부서관리> 3.부서삭제
	private void menu_223(Scanner sc) {
		// 부서 정보 출력 -> 삭제 가능 여부 출력
		List<Employees> list = dao.departmentList();

		System.out.println("부서번호 | 부서명 | 삭제가능 여부");
		System.out.println("---------------------------------");
		for (Employees e : list) {
			System.out.printf(" %s |  %s  | %s%n", e.getDept_id(), e.getDept_name(), e.getDeleteCheck());
		}

		// 삭제하고자 하는 부서번호 입력
		System.out.print("삭제할 부서번호(0 quit)?");
		String dept_id = sc.nextLine();

		// 삭제 요청
		int result = dao.departmentDelete(dept_id);

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
				menu_232();
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
		int result = dao.jobAdd(job_title);

		// 직위 정보 입력 결과 분석 및 메시지 출력
		if (result > 0) {
			System.out.println("성공적으로 입력되었습니다.");
		} else {
			System.out.println("직위 정보 입력에 실패했습니다.");
		}
	}

	// 직원관리v2.0 > 2.기초정보관리 > 3.직위관리> 2.직위출력
	private void menu_232() {
		// 직위 정보 출력
		List<Employees> list = dao.jobList();

		System.out.println("직위번호 | 부서명");
		System.out.println("-----------------");
		for (Employees e : list) {
			System.out.printf(" %s |  %s  %n", e.getJob_id(), e.getJob_title());
		}
	}

	// 직원관리v2.0 > 2.기초정보관리 > 3.직위관리> 3.직위삭제
	private void menu_233(Scanner sc) {
		// 직위 정보 출력 -> 삭제 가능 여부 출력
		List<Employees> list = dao.jobList();

		System.out.println("직위번호 | 직위명 | 삭제가능 여부");
		System.out.println("---------------------------------");
		for (Employees e : list) {
			System.out.printf(" %s |  %s  | %s%n", e.getJob_id(), e.getJob_title(), e.getDeleteCheck());
		}

		// 삭제하고자 하는 직위번호 입력
		System.out.print("삭제할 직위번호(0 quit)?");
		String job_id = sc.nextLine();

		// 삭제 요청
		int result = dao.jobDelete(job_id);

		// 삭제 결과 분석 및 메시지 출력
		if (result > 0) {
			System.out.println("성공적으로 삭제 완료되었습니다.");
		} else {
			System.out.println("직위 정보 삭제에 실패했습니다.");
		}
	}

	

}

```



# Main 클래스

```java
package com.test;

import java.util.*;

// 콘솔 액션 클래스(관리자 전용)
public class EmployeesMain {
	// (관리자용) 메인 메뉴 구성
	EmployeesService service = new EmployeesService();
	
	public void main(Scanner sc, String id_) {
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

```java
package com.test;

import java.util.Scanner;

// 콘솔 액션 클래스(강사 전용)
public class InstructorMain {
	// (강사용) 메인 메뉴 구성
	public void main(Scanner sc, String id_) {
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

```java
package com.test;

import java.util.Scanner;

// 콘솔 액션 클래스(수강생 전용)
public class StudentMain {

	// (수강생용) 메인 메뉴 구성
	public void main(Scanner sc, String id_) {
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

```java
package com.test;

import java.util.*;

//콘솔 액션 클래스
public class Main {
	// 로그인 화면 구성
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		boolean run = true;
		LoginService service = new LoginService();

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
			
			if(selectNo == 1) {
				// 로그인 메뉴 호출 및 로그인 결과 분석
				Login result = service.login(sc);
			
				if(result == null) {
					// 로그인 실패
					System.out.println("로그인에 실패했습니다.");
				} else {
					// 로그인 성공
					// 로그인 성공한 경우, 등급에 따른 전용 메뉴로 이동
					String id_ = result.getId_();
					int grade = result.getGrade();
					if(grade==0) {
						// 관리자 전용 메인 메뉴
						new EmployeesMain().main(sc, id_);
					} else if(grade==1) {
						// 강사 전용 메인 메뉴
						new InstructorMain().main(sc,id_);
					} else if(grade==2) {
						// 수강생 전용 메인 메뉴
						new StudentMain().main(sc, id_);
					} else {
						System.out.println("잘못된 등급 정보입니다.");
					}
				}
			} else if(selectNo == 0){
				run=false;
			}
			
		}
		sc.close();
		System.out.println("프로그램 종료");
	}

}

```

