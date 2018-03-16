---
layout: post
title: "GuestBook"
description: "GuestBook"
categories: [JSP]
tags: [JSP, guestbook, web]
redirect_from:
  - /2018/03/16/
---



# Java 파일

## com.test.dao

```java
package com.test.dao;
import com.test.domain.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.*;
import java.util.*;

public class AdminGuestBookDAO {
	// 방명록 출력(검색) 메소드
	public List<AdminGuestBook> guestBookList(String key, String value){
		List<AdminGuestBook> result = new ArrayList<AdminGuestBook>();
		// 주의) 관리자 모드로 작성해야 한다.
		String sql = "SELECT gid, name_, content, regDate, clientIP, blind FROM guestbook ";

		switch (key) {
		case "All":
			break;
		case "name_":
			sql += "WHERE INSTR(name_, ?)>0 ";
			break;
		case "content":
			sql += "WHERE INSTR(content, ?)>0 ";
			break;
		case "regDate":
			sql += "WHERE INSTR(regDate, ?)>0 ";
			break;

		}

		sql += "ORDER BY gid DESC";

		// 주의) 일반사용자 모드로 작성해야 한다.
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			if (!key.equals("All")) {
				pstmt.setString(1, value);
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String gid = rs.getString("gid");
				String name_ = rs.getString("name_");
				String content = rs.getString("content");
				LocalDate regDate = rs.getDate("regDate").toLocalDate();
				String clientIP = rs.getString("clientIP");
				int blind = rs.getInt("blind");
				
				AdminGuestBook agb = new AdminGuestBook();
				agb.setGid(gid);
				agb.setName_(name_);
				agb.setContent(content);
				agb.setRegDate(regDate);
				agb.setClientIP(clientIP);
				agb.setBlind(blind);
				result.add(agb);
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
	
	// 방명록 게시물 수 반환 메소드
	public int totalCount() {
		int result=0;
		// 주의) 관리자 모드로 작성해야 한다.
		
		String sql = "SELECT COUNT(*) AS totalCount FROM guestbook";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				result = rs.getInt("totalCount");
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

	// 방명록 블라인드 메소드
	public int blind(AdminGuestBook gb) {
		int result=0;
		String sql = "UPDATE guestbook SET blind=? WHERE gid=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, gb.getBlind());
			pstmt.setString(2, gb.getGid());
			
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
	
	// 사진 출력(검색) 메소드
		public List<AdminGuestBook> picList(String key, String value) {
			List<AdminGuestBook> result = new ArrayList<AdminGuestBook>();

			String sql = "SELECT pid, picName, picContent FROM pictureList ";

			Connection conn = null;
			PreparedStatement pstmt = null;
			
			if(key.equals("pid")) {
				sql += "WHERE pid =? ";
			}
			
			sql+= "ORDER BY pid";
			
			try {
				conn = MySQLConnection.connect();
				pstmt = conn.prepareStatement(sql);

				if(key.equals("pid")) {
					pstmt.setString(1, value);
				}
				
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String pid = rs.getString("pid");
					String picName = rs.getString("picName");
					String picContent = rs.getString("picContent");

					AdminGuestBook agb = new AdminGuestBook();
					agb.setPid(pid);
					agb.setPicName(picName);
					agb.setPicContent(picContent);

					result.add(agb);
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
	
	// 사진 입력 메소드
	public int picAdd(AdminGuestBook agb) {
		int result=0;
		String sql = "INSERT INTO pictureList(pid, picName, picContent) VALUES (CONCAT('P', LPAD(SUBSTR(IFNULL((SELECT MAX(pid) FROM pictureList p), 'P000'),2)+1,3,'0')) , ?, ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, agb.getPicName());
			pstmt.setString(2, agb.getPicContent());

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
	
	
	// 사진 삭제 메소드
	public int picDelete(String pid) {
		int result=0;
		String sql = "DELETE FROM picturelist WHERE pid = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pid);

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
}

```

```java
package com.test.dao;
import com.test.domain.*;
import java.util.*;
import java.sql.*;
import java.time.LocalDate;

public class GuestBookDAO {
	// 방명록 입력 메소드
	public int guestBookAdd(GuestBook gb) {
		int result = 0;

		String sql = "INSERT INTO guestbook(gid,name_,pw,content,regDate,clientIP,blind) VALUES(CONCAT('G', LPAD(SUBSTR(IFNULL((SELECT MAX(gid) FROM guestbook gb), 'G0000'),2)+1,4,'0')),?,?,?,SYSDATE(),?,0)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, gb.getName_());
			pstmt.setString(2, gb.getPw());
			pstmt.setString(3, gb.getContent());
			pstmt.setString(4, gb.getClientIP());

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

	// 방명록 출력(검색) 메소드
	public List<GuestBook> guestBookList(String key, String value) {
		List<GuestBook> result = new ArrayList<GuestBook>();
		String sql = "SELECT gid, name_, content, regDate FROM guestbook WHERE blind=0 ";

		switch (key) {
		case "All":
			break;
		case "name_":
			sql += "AND INSTR(name_, ?)>0 ";
			break;
		case "content":
			sql += "AND INSTR(content, ?)>0 ";
			break;
		case "regDate":
			sql += "AND INSTR(regDate, ?)>0 ";
			break;

		}

		sql += "ORDER BY gid DESC";

		// 주의) 일반사용자 모드로 작성해야 한다.
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			if (!key.equals("All")) {
				pstmt.setString(1, value);
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String gid = rs.getString("gid");
				String name_ = rs.getString("name_");
				String content = rs.getString("content");
				LocalDate regDate = rs.getDate("regDate").toLocalDate();

				GuestBook gb = new GuestBook();
				gb.setGid(gid);
				gb.setName_(name_);
				gb.setContent(content);
				gb.setRegDate(regDate);
				result.add(gb);
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
	
	// 방명록 출력(검색) 메소드 + 페이징 처리
		public List<GuestBook> guestBookList(String key, String value, int offset, int count) {
			List<GuestBook> result = new ArrayList<GuestBook>();
			String sql = "SELECT gid, name_, content, regDate FROM guestbook WHERE blind=0 ";

			switch (key) {
			case "All":
				break;
			case "name_":
				sql += "AND INSTR(name_, ?)>0 ";
				break;
			case "content":
				sql += "AND INSTR(content, ?)>0 ";
				break;
			case "regDate":
				sql += "AND INSTR(regDate, ?)>0 ";
				break;

			}

			sql += "ORDER BY gid DESC ";
			
			if(key.equals("All")) {
				sql += String.format("LIMIT %s,%s", offset, count);
			}
			
			// 주의) 일반사용자 모드로 작성해야 한다.
			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = MySQLConnection.connect();
				pstmt = conn.prepareStatement(sql);

				if (!key.equals("All")) {
					pstmt.setString(1, value);
				}

				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String gid = rs.getString("gid");
					String name_ = rs.getString("name_");
					String content = rs.getString("content");
					LocalDate regDate = rs.getDate("regDate").toLocalDate();

					GuestBook gb = new GuestBook();
					gb.setGid(gid);
					gb.setName_(name_);
					gb.setContent(content);
					gb.setRegDate(regDate);
					result.add(gb);
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

	// 방명록 게시물 수 반환 메소드
	public int totalCount() {
		int result = 0;
		String sql = "SELECT COUNT(*) AS totalCount FROM guestbook WHERE blind=0";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				result = rs.getInt("totalCount");
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

	// 방명록 삭제 메소드
	public int guestBookDelete(GuestBook gb) {
		int result = 0;

		String sql = "DELETE FROM guestbook WHERE blind=0 AND gid=? AND pw=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, gb.getGid());
			pstmt.setString(2, gb.getPw());

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

	// 사진 출력 메소드
	public List<GuestBook> picList() {
		List<GuestBook> result = new ArrayList<GuestBook>();

		String sql = "SELECT pid, picName, picContent FROM pictureList ORDER BY pid";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String pid = rs.getString("pid");
				String picName = rs.getString("picName");
				String picContent = rs.getString("picContent");

				GuestBook gb = new GuestBook();
				gb.setPid(pid);
				gb.setPicName(picName);
				gb.setPicContent(picContent);

				result.add(gb);
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
package com.test.dao;
import com.test.domain.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class LoginDAO {
	//로그인 메소드
	public Login login(Login l) {
		/*
		CREATE OR REPLACE VIEW loginInfoView
		AS
		SELECT mid_, id, pw, name_, phone, email, regDate, deptId FROM loginInfo l INNER JOIN members m USING(id);
		 */
		Login result = null;
		String sql = "SELECT id, name_, phone, email FROM loginInfoView WHERE id=? AND pw=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, l.getId());
			pstmt.setString(2, l.getPw());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("id");
				String name_ = rs.getString("name_");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				
				result = new Login();
				result.setId(id);
				result.setName_(name_);
				result.setPhone(phone);
				result.setEmail(email);
				
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
package com.test.dao;

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



## com.test.domain

```java
package com.test.domain;

import java.time.*;

public class AdminGuestBook {
		// 방명록 정보 입출력 멤버 구성
		private String gid, name_, pw, content, clientIP;
		private LocalDate regDate;
		private int blind;
	
		// 사진 정보 입출력 멤버 구성

		private String pid, picName, picContent;


		public String getGid() {
			return gid;
		}

		public String getName_() {
			return name_;
		}

		public String getPw() {
			return pw;
		}

		public String getContent() {
			return content;
		}

		public LocalDate getRegDate() {
			return regDate;
		}

		public String getPid() {
			return pid;
		}

		public String getPicName() {
			return picName;
		}

		public String getPicContent() {
			return picContent;
		}
		
		public String getClientIP() {
			return clientIP;
		}

		public int getBlind() {
			return blind;
		}

		
		public void setPid(String pid) {
			this.pid = pid;
		}

		public void setPicName(String picName) {
			this.picName = picName;
		}

		public void setPicContent(String picContent) {
			this.picContent = picContent;
		}

		public void setGid(String gid) {
			this.gid = gid;
		}

		public void setName_(String name_) {
			this.name_ = name_;
		}

		public void setPw(String pw) {
			this.pw = pw;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public void setRegDate(LocalDate regDate) {
			this.regDate = regDate;
		}

		public void setClientIP(String clientIP) {
			this.clientIP = clientIP;
		}

		public void setBlind(int blind) {
			this.blind = blind;
		}


		
}

```

```java
package com.test.domain;

import java.time.*;

public class GuestBook {
		// 방명록 정보 입출력 멤버 구성
		private String gid, name_, pw, content, clientIP;
		private LocalDate regDate;
		private int blind;
	
		// 사진 정보 입출력 멤버 구성

		private String pid, picName, picContent;


		public String getGid() {
			return gid;
		}

		public String getName_() {
			return name_;
		}

		public String getPw() {
			return pw;
		}

		public String getContent() {
			return content;
		}

		public LocalDate getRegDate() {
			return regDate;
		}

		public String getPid() {
			return pid;
		}

		public String getPicName() {
			return picName;
		}

		public String getPicContent() {
			return picContent;
		}
		
		public String getClientIP() {
			return clientIP;
		}

		public int getBlind() {
			return blind;
		}

		
		public void setPid(String pid) {
			this.pid = pid;
		}

		public void setPicName(String picName) {
			this.picName = picName;
		}

		public void setPicContent(String picContent) {
			this.picContent = picContent;
		}

		public void setGid(String gid) {
			this.gid = gid;
		}

		public void setName_(String name_) {
			this.name_ = name_;
		}

		public void setPw(String pw) {
			this.pw = pw;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public void setRegDate(LocalDate regDate) {
			this.regDate = regDate;
		}

		public void setClientIP(String clientIP) {
			this.clientIP = clientIP;
		}

		public void setBlind(int blind) {
			this.blind = blind;
		}


		
}

```

```java
package com.test.domain;

public class Login {
	private String id, pw, name_, phone, email;

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
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

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	
	
}

```



## com.test.util

```java
package com.test.util;

import java.text.*;
import java.util.*;

public class Util {
	public static String randomFileName() {
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("HHMMmmyyyyssdd");
		Random r = new Random();
		String uniqueFileName = String.format("%04d%s", r.nextInt(1000), simDf.format(new Date(currentTime)));
		return uniqueFileName;
	}
}

```





# JSP 파일

## admin

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder sb = new StringBuilder();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

.login-box {
	width: 600px;
	margin: 0 auto;
}
div#input:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}



</style>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
$(document).ready(function(){

	   // jQuery methods go here...

});
</script>
</head>
<body>

	<div class="container">
		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="<%=contextRoot%>/index.jsp"><img src="<%=contextRoot%>/resources/img/sist_logo.png"
					alt="sist_logo.png"> </a> 방명록 <small>v1.2</small>
			</h1>
		</div>
			<div class="panel panel-default login-box" style="text-align: center;" id="input">

				<div class="panel-body login-box" style="text-align: center;">
					<span class="glyphicon glyphicon-lock"></span>로그인
				</div>
				<p>
					<strong>접근할 수 없는 페이지입니다.</strong>
				</p>
				<hr>
				<a href="<%=contextRoot%>/index.jsp" class="btn btn-default"
					style="width: 500px; margin: auto">Main</a>
				<hr>
			</div>

		</div>

</body>
</html>
```

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.time.*, com.test.dao.*, com.test.domain.*, com.test.util.*"%>                                                                                                                                                                                                                                                             
<%-- 일반 사용자 접근 차단 기능 추가 (로그인 필요) --%>
<%
	// session 내장 객체를 이용한 로그인 인증 확인
	Object sess = session.getAttribute("loginInfo");
	if (sess == null) {
		//로그인하지 않은 사용자 접근 상태
		//->접근 차단(강제 페이지 전환)
		response.sendRedirect("accessDenied.jsp");
		/* out.write("접근할 수 없는 페이지입니다.");  */
	}
%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();	
	StringBuilder sb = new StringBuilder();
	int count = 0;
	int totalCount = 0;
	int blindCount = 0;

	String key = request.getParameter("key");
	String value = request.getParameter("value");

	if (key == null) {
		key = "All";
		value = "";
	}

	//AdminGuestBookDAO 클래스의 guestBookList() 메소드 호출
	AdminGuestBookDAO dao = new AdminGuestBookDAO();
	List<AdminGuestBook> gbList = dao.guestBookList(key, value);

	//totalCount -> 전체 게시물 수
	totalCount = dao.totalCount();

	//반복문을 이용해서 동적 테이블 태그 생성
	if (gbList.size() == 0) {
		//결과가 없는 경우
		sb.append(String.format("<tr><td colspan=\"6\" style=\"text-align:center\">검색 결과가 없습니다</td></tr>"));
	} else {
		for (int a = 0; a < gbList.size(); ++a) {
			AdminGuestBook agb = gbList.get(a);
			//count -> 블라인드 처리 안 된 게시물 수
			//blindCount -> 블라인드 처리된 게시물 수
			if (agb.getBlind() == 0) {
				++count;
			} else if (agb.getBlind() == 1) {
				++blindCount;
			}
			sb.append(String.format("<tr %s><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td>",
					(agb.getBlind() == 1) ? "class=\"text-danger\"" : "", a + 1, agb.getName_(),
					agb.getContent(), agb.getRegDate(), agb.getClientIP()));
			
			//Blind 버튼
			//-> 클릭 이벤트 등록
			//-> on버튼 -> confirm 창 -> 글번호, 1 값 전송 -> GET or POST
			//-> off버튼 -> confirm 창 -> 글번호, 0 값 전송 -> GET or POST
			sb.append(String.format(
					"<td><div class=\"btn-group\"><button type=\"button\" class=\"btn btn-default btn-xs %s blindOn\" value=\"%s\">On</button><button type=\"button\" class=\"btn btn-default btn-xs %s blindOff\" value=\"%s\">Off</button></div></td></tr>",
					(agb.getBlind() == 1) ? "active" : "", agb.getGid(), (agb.getBlind() == 0) ? "active" : "",  agb.getGid()));
		}
	}

	// 로그인 사용자 개인정보 확인
	String id = "";
	String name_ = "";
	String phone = "";
	String email = "";
	if (sess != null) {
		Login l = (Login) session.getAttribute("loginInfo");
		id = l.getId();
		name_ = l.getName_();
		phone = l.getPhone();
		email = l.getEmail();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test:D</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<!-- 사용자 정의 함수 등록 -->
<script src="script/util.js"></script>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>


<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	//검색 진행하는 경우 key, value를 가지고 현재 컨트롤의 상태를 이전값으로
	var key = "<%=key%>";
	var value = "<%=value%>";
		$("option[value='" + key + "']").attr("selected", "selected");
		$("input#value").val(value);

	//블라인드 처리 액션 추가
	$("button.blindOn").on("click", function(){
		if(confirm("선택한 게시물을 블라인드 처리할까요?")) {
			location.assign("<%=contextRoot%>/admin/adminBlind.jsp?gid="+$(this).val()+"&blind=1");
			
		}
	});
	
	$("button.blindOff").on("click", function(){
		if(confirm("선택한 게시물을 블라인드 해제할까요?")) {
			location.assign("<%=contextRoot%>/admin/adminBlind.jsp?gid="+$(this).val()+"&blind=0");
		}
	});
		
	});
</script>
<style>
</style>
</head>
<body>


	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="<%=contextRoot%>/admin/admin_guestbook.jsp"><img src="<%=contextRoot%>/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 방명록 <small>v1.2</small>
			</h1>
		</div>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">관리자 메뉴</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="<%=contextRoot%>/admin/admin_guestbook.jsp">방명록 관리</a></li>
					<li><a href="<%=contextRoot%>/admin/admin_picturelist.jsp">사진 관리</a></li>
					<li style="padding: 15px"><%=name_%>(<%=id%>)님의 방문을 환영합니다</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=contextRoot%>/login/logout.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</nav>


		<div class="table-responsive">
			<div class="panel panel-default" id="output">
				<div class="panel-heading">방명록</div>
				<div class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>글쓴이</th>
								<th>글내용</th>
								<th>작성일</th>
								<th>ClientIP</th>
								<th>Blind</th>
							</tr>
						</thead>
						<tbody>
							<%=sb.toString()%>
						</tbody>
					</table>

					<form class="form-inline" method="post">
						<div class="form-group">
							<button type="button" class="btn btn-default">
								TotalCount <span class="badge"><%=totalCount%></span>
							</button>
							<button type="button" class="btn btn-default" id="count"
								name="count">
								Count <span class="badge"><%=count%></span>
							</button>
							<button type="button" class="btn btn-default" id="blindCount"
								name="blindCount">
								BlindCound <span class="badge"><%=blindCount%></span>
							</button>

							<select class="form-control" id="key" name="key">
								<option value="name_">Name</option>
								<option value="content">Content</option>
								<option value="regDate">RegDate</option>
							</select>
						</div>
						<div class="input-group">
							<input type="text" class="form-control" id="value" name="value"
								placeholder="Search">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">Search</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
```

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, java.time.*,  com.test.dao.*, com.test.domain.*, com.test.util.*"%>
<%-- 일반 사용자 접근 차단 기능 추가 (로그인 필요) --%>
<%
	// session 내장 객체를 이용한 로그인 인증 확인
	Object sess = session.getAttribute("loginInfo");
	if (sess == null) {
		//로그인하지 않은 사용자 접근 상태
		//->접근 차단(강제 페이지 전환)
		response.sendRedirect("accessDenied.jsp");
		/* out.write("접근할 수 없는 페이지입니다.");  */
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder sb = new StringBuilder();

	// 데이터베이스에 저장된 사진 목록을 읽어와서 동적 <img> 태그 생성
	AdminGuestBookDAO dao = new AdminGuestBookDAO();
	List<AdminGuestBook> list = dao.picList("All", "");
	for (AdminGuestBook agb : list) {
		/* 사진 삭제 버튼 추가, 클릭 이벤트 추가를 위한 class 식별자 추가 */
		sb.append(String.format(
				"<div class=\"col-sm-4\"><button type=\"button\" class=\"close btnDelete\" value=\"%s\">&times;</button><img class=\"img-rounded\" src=\"%s/resources/pictures/%s\" alt=\"%s\" style=\"width:100%%\"><div class=\"caption\"><p>%s</p></div></div>",
				agb.getPid(), contextRoot, agb.getPicName(), agb.getPicName(), agb.getPicContent()));
	}

	// 로그인 사용자 개인정보 확인
	String id = "";
	String name_ = "";
	String phone = "";
	String email = "";
	if (sess != null) {
		Login l = (Login) session.getAttribute("loginInfo");
		id = l.getId();
		name_ = l.getName_();
		phone = l.getPhone();
		email = l.getEmail();
	}

	//사진 입력 메시지 ------------
	String picIns = request.getParameter("picIns");
	String picInsMsg = "";
	if (picIns == null) {
	} else if (picIns.equals("1")) {
		picInsMsg = "<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>사진 등록에 성공했습니다</div>";
	} else if (picIns.equals("0")) {
		picInsMsg = "<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>사진 등록에 실패했습니다</div>";
	}

	//사진 삭제 메시지 ------------
	String picDel = request.getParameter("picDel");
	String picDelMsg = "";
	if (picDel == null) {
	} else if (picDel.equals("1")) {
		picDelMsg = "<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>사진 삭제에 성공했습니다</div>";
	} else if (picDel.equals("0")) {
		picDelMsg = "<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>사진 삭제에 실패했습니다</div>";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

		// 사진 삭제 버튼에 대한 클릭 이벤트 등록
		// -> 서버에 pid 값 GET 방식 전송
	 	$("button.btnDelete").on("click",function(){
	 		if(confirm("선택한 사진을 삭제하시겠습니까?")){
	 			location.assign("<%=contextRoot%>
	/admin/adminPictureDelete.jsp?pid="
																+ $(this).val());
											}
										});
					});
</script>
<style>
.photo-list .col-sm-4 img {
	width: 100%;
	margin-bottom: 10px;
}

.photo-list .col-sm-4 p {
	text-align: center;
}
</style>
</head>
<body>

	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="<%=contextRoot%>/admin/admin_guestbook.jsp"><img
					src="<%=contextRoot%>/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 방명록 <small>v1.2</small>
			</h1>
		</div>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">관리자 메뉴</a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="<%=contextRoot%>/admin/admin_guestbook.jsp">방명록
							관리</a></li>
					<li class="active"><a
						href="<%=contextRoot%>/admin/admin_picturelist.jsp">사진 관리</a></li>
					<li style="padding: 15px"><%=name_%>(<%=id%>)님의 방문을 환영합니다</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=contextRoot%>/login/logout.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</nav>


		<div class="panel panel-default photo-upload">
			<div class="panel-heading">
				사진 업로드
				<%=picInsMsg%></div>
			<div class="panel-body">

				<form action="<%=contextRoot%>/admin/adminPictureInsert.jsp"
					method="post" enctype="multipart/form-data">

					<div class="form-group">
						<input type="text" class="form-control" id="picContent"
							name="picContent" placeholder="사진 설명(50자 이내)">
					</div>
					<div class="form-group">
						<input type="file" class="form-control" id="picName"
							name="picName"> <span class="help-block">(only
							.jpg or .png, 1M byte이내)</span>
					</div>
					<button type="submit" class="btn btn-default picture-submit">Submit</button>
				</form>

			</div>
		</div>

		<div class="panel panel-default photo-list">
			<div class="panel-heading">
				사진 목록<%=picDelMsg%></div>
			<div class="panel-body">
				<div class="row">
					<%=sb.toString()%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
```

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.time.*,  com.test.dao.*, com.test.domain.*, com.test.util.*"%>
<%-- 일반 사용자 접근 차단 기능 추가 (로그인 필요) --%>
<%
	// session 내장 객체를 이용한 로그인 인증 확인
	Object sess = session.getAttribute("loginInfo");
	if (sess == null) {
		//로그인하지 않은 사용자 접근 상태
		//->접근 차단(강제 페이지 전환)
		response.sendRedirect("accessDenied.jsp");
		/* out.write("접근할 수 없는 페이지입니다.");  */
	}
%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();	
	StringBuilder sb = new StringBuilder();

	//블라인드 처리를 위한 자료 수신
	//-> 글 번호, 블라인드 값(0 or 1)
	int blind = Integer.parseInt(request.getParameter("blind"));
	String gid = request.getParameter("gid");
	
	//데이터베이스 액션 -> AdminGuestBookDAO 클래스 blind() 메소드 호출
	AdminGuestBookDAO dao = new AdminGuestBookDAO();
	
	AdminGuestBook agb = new AdminGuestBook();
	agb.setBlind(blind);
	agb.setGid(gid);
	
	int result=dao.blind(agb);
	
	//강제 페이지 전환
	response.sendRedirect(String.format("%s/admin/admin_guestbook.jsp?bli=%s",contextRoot,result));
%>

```

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*, java.time.*,  com.test.dao.*, com.test.domain.*, com.test.util.*"%>

<%-- 일반 사용자 접근 차단 기능 추가 (로그인 필요) --%>
<%
	// session 내장 객체를 이용한 로그인 인증 확인
	Object sess = session.getAttribute("loginInfo");
	if (sess == null) {
		//로그인하지 않은 사용자 접근 상태
		//->접근 차단(강제 페이지 전환)
		response.sendRedirect("accessDenied.jsp");
		/* out.write("접근할 수 없는 페이지입니다.");  */
	}
%>

<%

	// JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();	
	StringBuilder sb = new StringBuilder();
	int result=0;
	
	// 데이터 수신 -> pid
	String pid = request.getParameter("pid");

	// 데이터베이스에서 정보 확인 -> picName(파일이름)
	AdminGuestBookDAO dao = new AdminGuestBookDAO();
	List<AdminGuestBook> list = dao.picList("pid", pid);
	
	// 물리적 파일 삭제 -> 물리적 경로명/파일이름
	if(list.size()>0){
		String filePath = request.getServletContext().getRealPath("resources/pictures");
		String fileName = list.get(0).getPicName();
		File file = new File(filePath+"\\"+fileName);
		if(file.exists()){
			file.delete();
		}
		
	// 데이터베이스에서 정보 삭제
		result=dao.picDelete(pid);
	}
	// 강제 페이지 전환
	response.sendRedirect(String.format("%s/admin/admin_picturelist.jsp?picDel=%s",contextRoot,result));
%>
```

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*, java.time.*,  com.test.dao.*, com.test.domain.*, com.test.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%-- 일반 사용자 접근 차단 기능 추가 (로그인 필요) --%>
<%
	// session 내장 객체를 이용한 로그인 인증 확인
	Object sess = session.getAttribute("loginInfo");
	if (sess == null) {
		//로그인하지 않은 사용자 접근 상태
		//->접근 차단(강제 페이지 전환)
		response.sendRedirect("accessDenied.jsp");
		/* out.write("접근할 수 없는 페이지입니다.");  */
	}
%>
<%-- Declaration은 Util.java에 static 메소드로 만들어 놓으면 편리하다 --%>
<%

	// JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();	
	StringBuilder sb = new StringBuilder();
	
	//commons fileupload를 이용한 파일 업로드 처리
	//commons-fileupload-1.3.3.jar, commons-io-2.6.jar 라이브러리 필요
	
	//업로드된 파일에 대한 물리적 처리
	File file;
	int maxFileSize = 1 * 1024 * 1024; //1MByte
	int maxMemSize = 1 * 1024 * 1024; //1MByte
	ServletContext context = pageContext.getServletContext();
	String filePath = request.getServletContext().getRealPath("resources/pictures");
	// Verify the content type
	String contentType = request.getContentType();
	String newFileName = "";
	String picContent="";
	int result=0;

	if ((contentType.indexOf("multipart/form-data") >= 0)) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);

		// Location to save data that is larger than maxMemSize. (임시폴더)
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);

		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();


			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (fi.isFormField()) {
					picContent = fi.getString("UTF-8");
				} else {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();

					// Write the file
					/* if( fileName.lastIndexOf("\\") >= 0 ) {
					   file = new File( filePath + "\\" + fileName.substring( fileName.lastIndexOf("\\"))) ;
					} else {
					   file = new File( filePath + "\\" + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
					} */

					// 주의) 물리적 파일이름이 같은 파일인 경우 덮어쓰기가 된다. -> 유니크 파일 이름 생성 -> 확장자는 그대로 유지해야 한다. -> "동적 생성된 파일 이름.확장자"

					if (fileName.lastIndexOf(".") >= 0) {
						String ext = fileName.substring(fileName.lastIndexOf(".")); // 현재 파일의 확장자;
						newFileName = Util.randomFileName() + ext;//동적 생성된 이름 + 기존 확장자;
						file = new File(filePath + "\\" + newFileName);
					} else {
						newFileName = Util.randomFileName();//동적 생성된 이름 + 기존 확장자;
						file = new File(filePath + "\\" + newFileName);
					}
					System.out.println("new FilePath + FileName:" + filePath + "\\" + newFileName);

					// 콘텐츠 타입 검사 및 사용자 예외 발생
					// -> .jpg, .png만 허용하도록 설정
					String fileType=fi.getContentType();
					if(!(fileType.contains("jpeg")||fileType.contains("jpg")||fileType.contains("png")))
						throw new Exception();
					
					// 서버의 데이터를 물리적으로 기록(저장)
					fi.write(file); 

					
					//데이터 베이스에 사진 정보(파일 이름, 사진 설명) 저장
					AdminGuestBookDAO dao = new AdminGuestBookDAO();
					AdminGuestBook agb = new AdminGuestBook();
					agb.setPicContent(picContent);
					agb.setPicName(newFileName);
					result=dao.picAdd(agb);
				}
			}
		} catch (Exception ex) {
			System.out.println(ex);
		}
	} else {

	}
	
	// 강제 페이지 전환
	response.sendRedirect(String.format("%s/admin/admin_picturelist.jsp?picIns=%s",contextRoot,result));
%>
```



## login

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.time.*, com.test.dao.*, com.test.domain.*, com.test.util.*"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();	
	StringBuilder sb = new StringBuilder();
	
	
	//ID, PW 설정
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//로그인 인증 여부 액션 추가
	LoginDAO dao = new LoginDAO();
	
	Login l = new Login();
	l.setId(id);
	l.setPw(pw);
	
	Login result = dao.login(l);
	
	if(result==null) {
		//로그인 실패
		response.sendRedirect("loginFailForm.jsp");
	} else {
		//로그인 성공
		//->로그인 사용자의 개인정보를 session 객체에 저장
		session.setAttribute("loginInfo", result);
		response.sendRedirect(String.format("%s/admin/admin_guestbook.jsp",contextRoot));
	}


%>

```

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();	
	StringBuilder sb = new StringBuilder();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

.login-box {
	width: 600px;
	margin: 0 auto;
}
div#input:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}



</style>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
$(document).ready(function(){

	   // jQuery methods go here...

});
</script>
</head>
<body>

	<div class="container">
		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="<%=contextRoot%>/index.jsp"><img src="<%=contextRoot%>/resources/img/sist_logo.png"
					alt="sist_logo.png"> </a> 방명록 <small>v1.2</small>
			</h1>
		</div>
			<div class="panel panel-default login-box" style="text-align: center;" id="input">

				<div class="panel-body login-box" style="text-align: center;">
					<span class="glyphicon glyphicon-lock"></span>로그인
				</div>
				<p>
					<strong>로그인에 실패했습니다.</strong>
				</p>
				<hr>
				<a href="<%=contextRoot%>/index.jsp" class="btn btn-default"
					style="width: 500px; margin: auto">Main</a>
				<hr>
			</div>

		</div>

</body>
</html>
```

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();	
	StringBuilder sb = new StringBuilder();
	
	//로그아웃 액션 추가
	session.invalidate();

	//강제 페이지 전환
	response.sendRedirect("logoutForm.jsp");
%>
```

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder sb = new StringBuilder();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
.login-box {
	width: 600px;
	margin: 0 auto;
}

div#input:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

		// jQuery methods go here...

	});
</script>
</head>
<body>

	<div class="container">
		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="<%=contextRoot%>/index.jsp"><img
					src="<%=contextRoot%>/resources/img/sist_logo.png"
					alt="sist_logo.png"> </a> 방명록 <small>v1.2</small>
			</h1>
		</div>
		<div class="panel panel-default login-box" style="text-align: center;"
			id="input">

			<div class="panel-body login-box" style="text-align: center;">
				<span class="glyphicon glyphicon-lock"></span>로그인
			</div>
			<p>
				<strong>안전하게 로그아웃 되었습니다.</strong>
			</p>
			<hr>
				<a href="<%=contextRoot%>/index.jsp" class="btn btn-default"
					style="width: 500px; margin: auto">Main</a>
			<hr>
		</div>

	</div>

</body>
</html>
```



## user

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.time.*,  com.test.dao.*, com.test.domain.*, com.test.util.*"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder sb = new StringBuilder();

	//데이터 수신
	//-> 클라이언트 IP 획득 과정 추가
	String gid = request.getParameter("gid");
	String pw = request.getParameter("pw");
	
	//DAO 클래스에 전달 -> GuestBook 객체
	GuestBookDAO dao = new GuestBookDAO();
	GuestBook gb = new GuestBook();
	gb.setGid(gid);
	gb.setPw(pw);
	
	//guestBookDelete() 메소드 호출
	int result=dao.guestBookDelete(gb);
	
	//강제 페이지 전환
	//->작업 성공, 실패 메시지 반환
	response.sendRedirect(String.format("%s/index.jsp?del=%s",contextRoot,result));
%>
```

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.time.*,  com.test.dao.*, com.test.domain.*, com.test.util.*"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();
	StringBuilder sb = new StringBuilder();

	//데이터 수신
	//-> 클라이언트 IP 획득 과정 추가
	String name_ = request.getParameter("name_");
	String pw = request.getParameter("pw");
	String content = request.getParameter("content");
	String clientIP = request.getRemoteAddr();
	
	//DAO 클래스에 전달 -> GuestBook 객체
	GuestBookDAO dao = new GuestBookDAO();
	GuestBook gb = new GuestBook();
	gb.setName_(name_);
	gb.setPw(pw);
	gb.setContent(content);
	gb.setClientIP(clientIP);
	
	//guestBookAdd() 메소드 호출
	int result = dao.guestBookAdd(gb);
	
	//강제 페이지 전환
	//->작업 성공, 실패 메시지 반환
	response.sendRedirect(String.format("%s/index.jsp?ins=%s",contextRoot,result));	
%>
```



## root

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.time.*, com.test.dao.*, com.test.domain.*, com.test.util.*"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	String contextRoot = request.getContextPath();	// 웹 상의 절대경로를 얻어온다
	StringBuilder sb = new StringBuilder();
	StringBuilder pic1 = new StringBuilder();
	StringBuilder pic2 = new StringBuilder();

	// 검색을 위해 key와 value 얻어오기
	String key = request.getParameter("key");
	String value = request.getParameter("value");

	if (key == null) {
		key = "All";
		value = "";
	}

	GuestBookDAO dao = new GuestBookDAO();

	
	
	//방명록 출력(검색) 액션 ------------
	int totalCount = dao.totalCount();
	
	//페이징 처리 전
	//List<GuestBook> gbList = dao.guestBookList(key, value);
	
	//페이징 처리 후
	String pageNum = request.getParameter("pageNum");	// 현재 페이지의 정보를 받아옴
	if(pageNum==null){
		pageNum="1";
	}
	int limit_count=10;	// 보여질 개수
	int limit_offset=(Integer.parseInt(pageNum)-1)*limit_count;	//offset개를 건너뛴다
	int prev=Integer.parseInt(pageNum)-1;
	int next=Integer.parseInt(pageNum)+1;
	int totalPage = (totalCount/limit_count)+1;	// Next 버튼의 제한 페이지를 구하기 위한 totalPage
	
	List<GuestBook> gbList = dao.guestBookList(key, value, limit_offset, limit_count);
	int count = gbList.size();
	
	if (count == 0) {
		//결과가 없는 경우
		sb.append(String.format("<tr><td colspan=\"5\" style=\"text-align:center\">검색 결과가 없습니다</td></tr>"));
	} else {
		//결과가 있는 경우
		for (int a = 0; a < count; ++a) {
			GuestBook gb = gbList.get(a);
			sb.append(String.format(
					"<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td><button type=\"button\" class=\"btn btn-default btn-xs btnDelete\" value=\"%s\">삭제</button></td></tr>",
					limit_offset + (a + 1), gb.getName_(), gb.getContent(), gb.getRegDate(), gb.getGid()));
		}
	}

	//방명록 출력(검색) 메시지 ------------
	String ins = request.getParameter("ins");
	String insMsg = "";
	if (ins == null) {
	} else if (ins.equals("1")) {
		insMsg = "<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>입력에 성공했습니다</div>";
	} else if (ins.equals("0")) {
		insMsg = "<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>입력에 실패했습니다</div>";
	}

	//방명록 삭제 메시지 ------------
	String del = request.getParameter("del");
	String delMsg = "";
	if (del == null) {
	} else if (del.equals("1")) {
		delMsg = "<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>삭제에 성공했습니다</div>";
	} else if (del.equals("0")) {
		delMsg = "<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>삭제에 실패했습니다</div>";
	}

	//사진 출력 액션 --------------
	List<GuestBook> picList = dao.picList();

	// 주의) 인덱스 사용을 위해서 일반 for문 사용
	int picListLength = picList.size();
	for (int a = 0; a < picListLength; ++a) {

		GuestBook gb = picList.get(a);

		// 주의) 첫 번째 항목만 class="active" 지정 필요
		pic1.append(String.format("<li data-target=\"#myCarousel\" data-slide-to=\"%s\" %s></li>", a,
				(a == 0) ? "class=\"active\"" : ""));

		// 주의) 첫 번째 항목만 class="active" 지정 필요
		pic2.append(String.format("<div class=\"item %s\">", (a == 0) ? "active" : ""));
		pic2.append(String.format("<img src=\"%s/resources/pictures/%s\" alt=\"%s\" style=\"width:100%%\">", contextRoot, gb.getPicName(),
				gb.getPicName()));
		pic2.append(
				String.format("<div class=\"carousel-caption\"><h3>%s</h3></div></div>", gb.getPicContent()));

	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test:D</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

div#btnTop {
	position: fixed;
	bottom: 45px;
	right: 10px;
}

div#btnBottom {
	position: fixed;
	bottom: 10px;
	right: 10px;
}
</style>

<!-- 사용자 정의 함수 등록 -->
<script src="<%=contextRoot%>/resources/script/util.js"></script>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>


<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {
		//남은 날짜 계산 함수 호출
		$("span#date").text("("+myDate("2018-06-01")+")");
		//검색 진행하는 경우 key, value를 가지고 현재 컨트롤의 상태를 이전값으로
		var key = "<%=key%>";
		var value = "<%=value%>";
		$("option[value='" + key + "']").attr("selected", "selected");
		$("input#value").val(value);

		//Delete 모달
		$("button.btnDelete").on("click", function() {
			//삭제를 위한 번호를 지정하는 액션 추가
			$("div#deleteModal input#gid").val($(this).val());
			//모달 open
			$("div#deleteModal").modal();

		});

		//Map 모달
		$("button.btnMap").on("click", function() {
			$("div#mapModal").modal();
			/* myMap(); */
		});

		//모달창 이벤트 등록 -> myMap() 함수 호출, 동적 생성된 엘리먼트 삭제 연계
		$("div#mapModal").on("shown.bs.modal", function() {
			myMap();
		});
		$("div#mapModal").on("hidden.bs.modal", function() {
			$("div#googleMap").empty();
		});

		//Admin 모달
		$("button.btnAdmin").on("click", function() {
			$("div#adminModal").modal();
		});
		
		
		// 이전, 다음 버튼에 대한 이벤트 등록 및 비활성/활성 처리
		// 검색 진행시 이전, 다음 버튼 전체를 비활성
		<%-- if("<%=key%>"!="All") {
			$("button.btnPrev").attr("disabled", "disabled");
			$("button.btnNext").attr("disabled", "disabled");	
		} --%>
		
		// 첫 페이지 Previous 버튼 비활성화
		if(<%=prev%>==0){
			$("button.btnPrev").attr("disabled", "disabled");
		}
		
		// 마지막 페이지 Next 버튼 비활성화
		if(<%=next%>==<%=totalPage+1%>){
			$("button.btnNext").attr("disabled", "disabled");
		} 
		
		// Previous/Next 버튼 클릭시 이전/다음 페이지로 이동
		<%-- if(key=="All"){
			$("button.btnPrev").on("click", function(){
				location.assign("?pageNum=<%=prev%>");
			});
			$("button.btnNext").on("click", function(){
				location.assign("?pageNum=<%=next%>");
			});
		} else {
			$("button.btnPrev").on("click", function(){
				location.assign("?pageNum=<%=prev%>&key="+$("option[selected='selected']").val()+"&value="+$("input#value").val());
			});
			$("button.btnNext").on("click", function(){
				location.assign("?pageNum=<%=next%>&key="+$("option[selected='selected']").val()+"&value="+$("input#value").val());
			});
		} --%>
		$("button.btnPrev").on("click", function(){
			location.assign("?pageNum=<%=prev%>");
		});
		$("button.btnNext").on("click", function(){
			location.assign("?pageNum=<%=next%>");
		});
		



	});
</script>

</head>
<body>

	<div class="container" id="top">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="index.jsp"><img src="<%=contextRoot%>/resources/img/sist_logo.png"
					alt="sist_logo.png"> </a> 방명록 <small>v1.2</small>
			</h1>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				서울 강남구 테헤란로 132 한독약품빌딩 8층 쌍용교육센터. 지하철 2호선 역삼역 3번 출구<br>
				Java&Python 기반 응용SW 개발자 양성과정 2017.11.01 ~ 2018.06.01<span
					style="color: red" id="date"></span>
				<button type="button" class="btn btn-default btn-xs btnMap">Map</button>
				<button type="button" class="btn btn-default btn-xs btnAdmin">Admin</button>
			</div>
		</div>


		<div class="panel panel-default">
			<div class="panel-heading">Picture List</div>
			<div class="panel-body">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<%=pic1.toString()%>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<%=pic2.toString()%>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">방명록 글쓰기</div>
			<div class="panel-body">
				<form action="<%=contextRoot%>/user/guestbookInsert.jsp" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="name_" name="name_"
							placeholder="NAME(max:20)">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="pw" name="pw"
							placeholder="PASSWORD(max:20)">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="content"
							name="content" placeholder="CONTENT(max:500)">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
					<%=insMsg%><%=delMsg%>
				</form>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">방명록 글 목록</div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<td>번호</td>
							<td>글쓴이</td>
							<td>글내용</td>
							<td>작성일</td>
							<td>삭제</td>
						</tr>
					</thead>
					<tbody>
						<%=sb.toString()%>
					</tbody>
				</table>
				<form class="form-inline" method="post">
					<div class="form-group">
						<button type="button" class="btn btn-default">
							Total Count <span class="badge"><%=totalCount%></span>
						</button>
						<button type="button" class="btn btn-default">
							Count <span class="badge"><%=count%></span>
						</button>
						<button type="button" class="btn btn-default btnPrev">
							<span class="glyphicon glyphicon-step-backward"></span>Previous
						</button>
						<button type="button" class="btn btn-default btnNext">
							Next<span class="glyphicon glyphicon-step-forward"></span>
						</button>

						<!-- 검색 기준 선택 항목 추가 -->
						<select class="form-control" id="key" name="key">
							<option value="name_">Name</option>
							<option value="content">Content</option>
							<option value="regDate">RegDate</option>
						</select>
					</div>
					<div class="input-group" style="width: 45%;">
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search">

						<div class="input-group-btn">
							<button id="searchBtn" class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div id="btnTop">
			<button type="button" class="btn btn-default btn-sm"
				onclick="location.assign('#top')">
				Top<span class="glyphicon glyphicon-arrow-up"></span>
			</button>
		</div>
		<div id="btnBottom">
			<button type="button" class="btn btn-default btn-sm"
				onclick="location.assign('#bottom')">
				Bottom<span class="glyphicon glyphicon-arrow-down"></span>
			</button>
		</div>
		<div id="bottom"></div>
	</div>
	



	<div id="mapModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Google Map</h4>
				</div>
				<div class="modal-body">
					<!-- 맵 출력 -->
					<div id="googleMap" style="width: 100%; height: 500px;"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<div id="adminModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Admin Login</h4>
				</div>
				<div class="modal-body">
					<p>관리자 전용 ID와 비밀번호를 입력하세요</p>
					<form action="<%=contextRoot%>/login/login.jsp" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="id" name="id"
								placeholder="ID(max:20)" required>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="pw" name="pw"
								placeholder="PASSWORD(max:20)">
						</div>
						<button type="submit" class="btn btn-default">로그인</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<div id="deleteModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Delete</h4>
				</div>
				<div class="modal-body">
					<form action="<%=contextRoot%>/user/guestbookDelete.jsp" method="post">
						<!-- 주의) 삭제 진행을 위해서 글 번호 정보가 필요하다 -->
						<div class="form-group">
							<p>본인 확인을 위해 비밀번호를 입력하세요</p>
							<input type="hidden" id="gid" name="gid"> <input
								type="password" class="form-control" id="pw" name="pw"
								placeholder="PASSWORD(max:20)">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
```

