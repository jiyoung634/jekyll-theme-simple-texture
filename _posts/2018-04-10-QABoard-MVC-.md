---
layout: post
title: "QA Board (ver.MVC)"
description: "QA Board (ver.MVC)"
categories: [MVC, Servlet]
tags: [MVC, Servlet, QA, QA Board]
redirect_from:
  - /2018/04/10/
---

**※ 다음의 라이브러리 필요**

- **json-20180130.jar**
- **jstl-1.2.jar**
- **mysql-connector-java-5.1.45-bin.jar**



# com.test.controller>

## AdminController.java

```java
package com.test.controller;

import com.test.handler.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3766679378850308109L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자 요청 주소 분석
		// ->요청 URI + invoke() 메소드 기반 주소 분석
		String viewPage = "error";

		String uri = request.getRequestURI();
		System.out.println("uri:" + uri);

		if (uri.contains("/admin")) {
			uri = uri.substring(request.getContextPath().length());
			uri = uri.substring("/admin/".length());

			// 주소 분석 결과 -> 특정 액션 요청
			try {
				AdminHandler handler = new AdminHandler();
				Method m = AdminHandler.class.getMethod(uri, HttpServletRequest.class, HttpServletResponse.class);
				viewPage = (String) m.invoke(handler, request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 요청 결과 -> 뷰 정보 -> 포워딩 또는 리다이렉트
			if (viewPage.contains("redirect:")) {
				response.sendRedirect(viewPage.substring("redirect:".length()));
			} else if (viewPage.contains(".jsp")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE html>");
				out.println("<html>");
				out.println("<head>");
				out.println("<title></title>");
				out.println("</head>");
				out.println("<body>");
				out.println("Error:bad request!");
				out.println("</body>");
				out.println("</html>");
			}
		}

	}
}

```



## LoginController.java

```java
package com.test.controller;

import com.test.handler.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3766679378850308109L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자 요청 주소 분석
		// ->요청 URI + invoke() 메소드 기반 주소 분석
		String viewPage = "error";

		String uri = request.getRequestURI();
		System.out.println("uri:" + uri);

		if (uri.contains("/login")) {
			uri = uri.substring(request.getContextPath().length());
			uri = uri.substring("/login/".length());

			// 주소 분석 결과 -> 특정 액션 요청
			try {
				LoginHandler handler = new LoginHandler();
				Method m = LoginHandler.class.getMethod(uri, HttpServletRequest.class, HttpServletResponse.class);
				viewPage = (String) m.invoke(handler, request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 요청 결과 -> 뷰 정보 -> 포워딩 또는 리다이렉트
			if (viewPage.contains("redirect:")) {
				response.sendRedirect(viewPage.substring("redirect:".length()));
			} else if (viewPage.contains(".jsp")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE html>");
				out.println("<html>");
				out.println("<head>");
				out.println("<title></title>");
				out.println("</head>");
				out.println("<body>");
				out.println("Error:bad request!");
				out.println("</body>");
				out.println("</html>");
			}
		}

	}
}

```



## QABoardController.java

```java
package com.test.controller;

import com.test.handler.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QABoardController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3766679378850308109L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자 요청 주소 분석
		// ->요청 URI + invoke() 메소드 기반 주소 분석
		String viewPage = "error";

		String uri = request.getRequestURI();
		System.out.println("uri:" + uri);

		if (uri.contains("/qaboard")) {
			uri = uri.substring(request.getContextPath().length());
			uri = uri.substring("/qaboard/".length());

			// 주소 분석 결과 -> 특정 액션 요청
			try {
				QABoardHandler handler = new QABoardHandler();
				Method m = QABoardHandler.class.getMethod(uri, HttpServletRequest.class, HttpServletResponse.class);
				viewPage = (String) m.invoke(handler, request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 요청 결과 -> 뷰 정보 -> 포워딩 또는 리다이렉트
			if (viewPage.contains("redirect:")) {
				response.sendRedirect(viewPage.substring("redirect:".length()));
			} else if (viewPage.contains(".jsp")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE html>");
				out.println("<html>");
				out.println("<head>");
				out.println("<title></title>");
				out.println("</head>");
				out.println("<body>");
				out.println("Error:bad request!");
				out.println("</body>");
				out.println("</html>");
			}
		}

	}
}

```



## SISTController.java

```java
package com.test.controller;

import com.test.handler.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SISTController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3766679378850308109L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자 요청 주소 분석
		// ->요청 URI + invoke() 메소드 기반 주소 분석
		String viewPage = "error";

		String uri = request.getRequestURI();
		System.out.println("uri:" + uri);

		if (uri.contains("/sist")) {
			uri = uri.substring(request.getContextPath().length());
			uri = uri.substring("/sist/".length());

			// 주소 분석 결과 -> 특정 액션 요청
			try {
				SISTHandler handler = new SISTHandler();
				Method m = SISTHandler.class.getMethod(uri, HttpServletRequest.class, HttpServletResponse.class);
				viewPage = (String) m.invoke(handler, request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 요청 결과 -> 뷰 정보 -> 포워딩 또는 리다이렉트
			if (viewPage.contains("redirect:")) {
				response.sendRedirect(viewPage.substring("redirect:".length()));
			} else if (viewPage.contains(".jsp")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<!DOCTYPE html>");
				out.println("<html>");
				out.println("<head>");
				out.println("<title></title>");
				out.println("</head>");
				out.println("<body>");
				out.println("Error:bad request!");
				out.println("</body>");
				out.println("</html>");
			}
		}

	}
}

```



# com.test.dao>

## AdminQABoardDAO.java

```java
package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.test.domain.*;

public class AdminQABoardDAO {
	// 전체 출력 메소드
		public List<QABoard> list() {
			List<QABoard> result = new ArrayList<QABoard>();
			String sql = "SELECT qid, title, content_, writeday, clientip, blind, privacy, (SELECT replyContent FROM qaboardreplytable qr WHERE qr.qid=q.qid) AS 'replyContent' FROM qaboardtable q ORDER BY qid DESC ";

			// 주의) 일반사용자 모드로 작성해야 한다.
			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = MySQLConnection.connect();
				pstmt = conn.prepareStatement(sql);

				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String qid = rs.getString("qid");
					String title = rs.getString("title");
					String content_ = rs.getString("content_");
					LocalDate writeday = rs.getDate("writeday").toLocalDate();
					String clientip = rs.getString("clientip");
					int blind = rs.getInt("blind");
					int privacy = rs.getInt("privacy");
					String replyContent = rs.getString("replyContent");

					QABoard q = new QABoard();
					q.setQid(qid);
					q.setTitle(title);
					q.setContent_(content_);
					q.setWriteday(writeday);
					q.setClientip(clientip);
					q.setBlind(blind);
					q.setPrivacy(privacy);
					q.setReplyContent(replyContent);

					result.add(q);
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

		
	// 전체 출력 메소드 (+페이징)
	public List<QABoard> list(int offset, int count) {
		List<QABoard> result = new ArrayList<QABoard>();
		String sql = "SELECT qid, title, content_, writeday, clientip, blind, privacy, (SELECT replyContent FROM qaboardreplytable qr WHERE qr.qid=q.qid) AS 'replyContent' FROM qaboardtable q ORDER BY qid DESC ";
		sql += String.format("LIMIT %s,%s", offset, count);
		
		// 주의) 일반사용자 모드로 작성해야 한다.
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String qid = rs.getString("qid");
				String title = rs.getString("title");
				String content_ = rs.getString("content_");
				LocalDate writeday = rs.getDate("writeday").toLocalDate();
				String clientip = rs.getString("clientip");
				int blind = rs.getInt("blind");
				int privacy = rs.getInt("privacy");
				String replyContent = rs.getString("replyContent");

				QABoard q = new QABoard();
				q.setQid(qid);
				q.setTitle(title);
				q.setContent_(content_);
				q.setWriteday(writeday);
				q.setClientip(clientip);
				q.setBlind(blind);
				q.setPrivacy(privacy);
				q.setReplyContent(replyContent);

				result.add(q);
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

	// totalCount
		public int totalCount() {
			int result = 0;
			String sql = "SELECT COUNT(*) AS totalCount FROM qaboardtable";
			
			// 주의) 일반사용자 모드로 작성해야 한다.
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
		
	// 답변 입력 메소드
	// -> 글 번호 별도 확보
	public int replyAdd(QABoard q) {
		int result = 0;

		String sql = "INSERT INTO QABoardReplyTable (qid, replyContent) VALUES (?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, q.getQid());
			pstmt.setString(2, q.getReplyContent());

			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			System.out.println(se.getMessage());
			result = 0;
			// 롤백 액션
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			result = 0;
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
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

	// 답변 삭제 메소드
	// -> 글 번호 별도 확보
	public int replyDelete(String qid) {
		int result = 0;

		String sql = "DELETE FROM qaboardreplytable WHERE qid=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, qid);

			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			System.out.println(se.getMessage());
			result = 0;
			// 롤백 액션
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			result = 0;
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
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
	
	// 블라인드 처리 메소드
	// -> 글 번호 별도 확보
	public int blind(QABoard q) {
		int result = 0;

		String sql = "UPDATE qaboardtable SET blind=? WHERE qid=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, q.getBlind());
			pstmt.setString(2, q.getQid());

			result = pstmt.executeUpdate();

		} catch (SQLException se) {
			System.out.println(se.getMessage());
			result = 0;
			// 롤백 액션
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			result = 0;
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
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



## LoginDAO.java

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
		 */
		Login result = null;
		// 데이터베이스 질의 결과 올바른 관리자 또는 일반사용자인 경우 Login 객체 생성
		String sql = "SELECT id_, grade FROM login WHERE id_=? AND pw_=? AND grade=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, l.getId_());
			pstmt.setString(2, l.getPw_());
			pstmt.setInt(3, l.getGrade());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String id_ = rs.getString("id_");
				int grade = rs.getInt("grade");
				
				result = new Login();
				result.setId_(id_);
				result.setGrade(grade);
				
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



## MySQLConnection.java

```java
package com.test.dao;

import java.sql.*;

//데이터베이스 연결 정보 관리 클래스
public class MySQLConnection {

	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://211.63.89.72:3306/test03?useSSL=false"; // 연결문자열(포트번호까지 작성)

	// Database credentials
	static final String USER = "id";
	static final String PASS = "pw";

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



## QABoardDAO.java

```java
package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.test.domain.*;

public class QABoardDAO {
	// 전체 출력 메소드 (+페이징)
	// -> 블라인드 값이 0인 경우만 읽어온다.
	public List<QABoard> list() {
		List<QABoard> result = new ArrayList<QABoard>();
		String sql = "SELECT qid, title, content_, writeday, clientip, blind, privacy, (SELECT replyContent FROM qaboardreplytable qr WHERE qr.qid=q.qid) AS 'replyContent' FROM QABoardTable q WHERE blind=0 ORDER BY qid DESC";

		// 주의) 일반사용자 모드로 작성해야 한다.
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String qid = rs.getString("qid");
				String title = rs.getString("title");
				String content_ = rs.getString("content_");
				LocalDate writeday = rs.getDate("writeday").toLocalDate();
				String clientip = rs.getString("clientip");
				int blind = rs.getInt("blind");
				int privacy = rs.getInt("privacy");
				String replyContent = rs.getString("replyContent");

				QABoard q = new QABoard();
				q.setQid(qid);
				q.setTitle(title);
				q.setContent_(content_);
				q.setWriteday(writeday);
				q.setClientip(clientip);
				q.setBlind(blind);
				q.setPrivacy(privacy);
				q.setReplyContent(replyContent);
				
				result.add(q);
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

	// 전체 출력 메소드 (+페이징)
	public List<QABoard> list(int offset, int count) {
		List<QABoard> result = new ArrayList<QABoard>();
		String sql = "SELECT qid, title, content_, writeday, clientip, blind, privacy, (SELECT replyContent FROM qaboardreplytable qr WHERE qr.qid=q.qid) AS 'replyContent' FROM qaboardtable q WHERE blind=0 ORDER BY qid DESC ";
		sql += String.format("LIMIT %s,%s", offset, count);
		
		// 주의) 일반사용자 모드로 작성해야 한다.
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String qid = rs.getString("qid");
				String title = rs.getString("title");
				String content_ = rs.getString("content_");
				LocalDate writeday = rs.getDate("writeday").toLocalDate();
				String clientip = rs.getString("clientip");
				int blind = rs.getInt("blind");
				int privacy = rs.getInt("privacy");
				String replyContent = rs.getString("replyContent");

				QABoard q = new QABoard();
				q.setQid(qid);
				q.setTitle(title);
				q.setContent_(content_);
				q.setWriteday(writeday);
				q.setClientip(clientip);
				q.setBlind(blind);
				q.setPrivacy(privacy);
				q.setReplyContent(replyContent);

				result.add(q);
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

	// totalCount
		public int totalCount() {
			int result = 0;
			String sql = "SELECT COUNT(*) AS totalCount FROM qaboardtable WHERE blind=0";
			
			// 주의) 일반사용자 모드로 작성해야 한다.
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
	
	// 비밀글 확인을 위한 검색 메소드
	// -> qid, pw가 일치하는 컨텐츠 읽어오기
	public QABoard ajaxContent(String qid_, String pw) {
		QABoard result = null;
		String sql = "SELECT qid, title, content_, writeday, clientip, blind, privacy, pw FROM QABoardTable INNER JOIN QABoardPasswordTable USING(qid) WHERE qid=? AND pw=?";

		// 주의) 일반사용자 모드로 작성해야 한다.
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = MySQLConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qid_);
			pstmt.setString(2, pw);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String qid = rs.getString("qid");
				String title = rs.getString("title");
				String content_ = rs.getString("content_");
				LocalDate writeday = rs.getDate("writeday").toLocalDate();
				String clientip = rs.getString("clientip");
				int blind = rs.getInt("blind");
				int privacy = rs.getInt("privacy");

				QABoard q = new QABoard();
				q.setQid(qid);
				q.setTitle(title);
				q.setContent_(content_);
				q.setWriteday(writeday);
				q.setClientip(clientip);
				q.setBlind(blind);
				q.setPrivacy(privacy);
				
				result=q;
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
	
	
	// 입력 메소드
	// -> 글 번호 별도 확보
	// -> 비밀글(pw 변수의 값이 null이 아닌 경우) 입력인 경우 패스워드 별도
	// -> 트랜잭션 처리
	public int add(QABoard q) {
		int result = 0;

		String sql1 = "SELECT CONCAT('Q',LPAD(SUBSTRING((SELECT IFNULL(MAX(qid),'Q000') FROM QABoardTable q),3)+1,3, '0')) AS newQid FROM QABoardTable";
		String sql2 = "INSERT INTO QABoardTable (qid, title, content_, writeday, clientip, blind, privacy) VALUES (?, ?, ?, NOW(), ?,0,?)";
		String sql3 = "INSERT INTO QABoardPasswordTable (qid, pw) VALUES (?,?)";
		String newQid = "";

		Connection conn = null;
		// (pstmt는 하나로 써도 된다)
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;

		try {
			conn = MySQLConnection.connect();
			// 트랜잭션 선언
			conn.setAutoCommit(false);

			// 1. newQid 읽어오기
			pstmt1 = conn.prepareStatement(sql1);
			ResultSet rs = pstmt1.executeQuery();
			while (rs.next()) {
				newQid = rs.getString("newQid");
			}
			rs.close();

			// 2. QABoardTable에 Insert
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, newQid);
			pstmt2.setString(2, q.getTitle());
			pstmt2.setString(3, q.getContent_());
			pstmt2.setString(4, q.getClientip());
			if (q.getPw() == null) {
				// 일반글
				pstmt2.setInt(5, 0);
			} else {
				// 비밀글
				// blind값 1로 처리
				pstmt2.setInt(5, 1);
			}
			result = pstmt2.executeUpdate();

			// 3. (비밀글인 경우)QABoardPasswordTable에 Insert
			if (q.getPw() != null) {
				pstmt3 = conn.prepareStatement(sql3);
				pstmt3.setString(1, newQid);
				pstmt3.setString(2, q.getPw());

				result = pstmt3.executeUpdate();
			}
			// 커밋 액션
			conn.commit();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			result=0;
			// 롤백 액션
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			result=0;
		} finally {
			try {
				if (pstmt1 != null && pstmt2 != null && pstmt3 != null) {
					pstmt1.close();
					pstmt2.close();
					pstmt3.close();
				}
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



# com.test.domain>

## Login.java

```java
package com.test.domain;

public class Login {
	// 멤버 구성
	private String id_, pw_;
	private int grade;
	
	
	public String getId_() {
		return id_;
	}
	public String getPw_() {
		return pw_;
	}
	public int getGrade() {
		return grade;
	}
	public void setId_(String id_) {
		this.id_ = id_;
	}
	public void setPw_(String pw_) {
		this.pw_ = pw_;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	
}

```



## QABoard.java

```java
package com.test.domain;

import java.time.LocalDate;

public class QABoard {
	private String qid, title, content_,  clientip, replyContent, pw;
	private int blind, privacy;
	private LocalDate writeday;
	public String getQid() {
		return qid;
	}
	public String getTitle() {
		return title;
	}
	public String getContent_() {
		return content_;
	}
	public String getClientip() {
		return clientip;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public String getPw() {
		return pw;
	}
	public int getBlind() {
		return blind;
	}
	public int getPrivacy() {
		return privacy;
	}
	public LocalDate getWriteday() {
		return writeday;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent_(String content_) {
		this.content_ = content_;
	}
	public void setClientip(String clientip) {
		this.clientip = clientip;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setBlind(int blind) {
		this.blind = blind;
	}
	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}
	public void setWriteday(LocalDate writeday) {
		this.writeday = writeday;
	}
	
	
}

```



# com.test.filter>

## AdminLoginFilter.java

```java
package com.test.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AdminLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		
		Boolean login = false;
		if(session != null) {
			if(session.getAttribute("adminlogin")!=null) {
				login = true;
			}	
		}
		
		if(login) {
			chain.doFilter(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html><html><head><title>Jiyoung's Test</title></head><body>Error:access denied!</body></html>");
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	}

	@Override
	public void destroy() {
	}

}

```



## CharactorEncodingFilter.java

```java
package com.test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharactorEncodingFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response); 		// 여러 개의 필터를 연결해서 실행
	}

	@Override
	public void init(FilterConfig config) throws ServletException {

	}
	

	@Override
	public void destroy() {

	}

}

```



# com.test.handler>

## AdminHandler.java

```java
package com.test.handler;

import com.test.dao.*;
import com.test.domain.*;
import java.io.*;
import java.time.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AdminHandler {
	// 사용자 요청 주소별로 메소드 작성
	// 주의) 요청 주소 작성시 절대주소 표기법 사용
	// 주의) 주소와 메소드 이름을 서로 같은 이름 사용
	// 일반 사용자 접근 차단 기능 추가(로그인 필요) => LoginFilter로 대체

	AdminQABoardDAO dao = new AdminQABoardDAO();
	
	// admin/main
	public String main(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return "/WEB-INF/views/admin/adminmain.jsp";
	}

	// admin/qaboardlist
	public String qaboardlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int limit_count=10;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int limit_offset=(Integer.parseInt(pageNum)-1)*limit_count;
		int prev=Integer.parseInt(pageNum)-1;
		int next=Integer.parseInt(pageNum)+1;
				
		List<QABoard> list = dao.list(limit_offset,limit_count);
		int count = list.size();
		int totalCount = dao.totalCount();
	
		int totalPage=(int)Math.ceil((double)totalCount/limit_count);
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPage", totalPage);
		
		return "/WEB-INF/views/admin/adminqaboardlist.jsp";
	}
	
	// admin/replyinsert
	public String replyinsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String qid = request.getParameter("qid");
		String replyContent = request.getParameter("replyContent");
		
		QABoard q = new QABoard();
		q.setQid(qid);
		q.setReplyContent(replyContent);
		
		int result = dao.replyAdd(q);

		return  String.format("redirect:%s/admin/qaboardlist?success=%s", request.getContextPath(), result);
	}
	
	// admin/replydelete
	public String replydelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String qid = request.getParameter("qid");
		
		int result = dao.replyDelete(qid);

		return  String.format("redirect:%s/admin/qaboardlist?success=%s", request.getContextPath(), result);
	}
	
	// admin/blind
	public String blind(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String qid = request.getParameter("qid");
		int blind = Integer.parseInt(request.getParameter("blind"));
		
		QABoard q = new QABoard();
		q.setBlind(blind);
		q.setQid(qid);
		
		int result = dao.blind(q);

		return  String.format("redirect:%s/admin/qaboardlist?success=%s", request.getContextPath(), result);
	}
	

}

```



## LoginHandler.java

```java
package com.test.handler;

import com.test.dao.*;
import com.test.domain.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginHandler {
	// 사용자 요청 주소별로 메소드 작성
	// 주의) 요청 주소 작성시 절대주소 표기법 사용
	// 주의) 주소와 메소드 이름을 서로 같은 이름 사용

	LoginDAO dao = new LoginDAO();

	// login/loginForm
	public String loginForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return "";
	}

	// login/login
	public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "";
		String id_ = request.getParameter("id_");
		String pw_ = request.getParameter("pw_");
		int grade = Integer.parseInt(request.getParameter("grade"));

		Login l = new Login();
		l.setId_(id_);
		l.setPw_(pw_);
		l.setGrade(grade);

		Login result = dao.login(l);

		if (result == null) {
			url = "login/loginfail";
		} else {
			HttpSession session = request.getSession();
			if (result.getGrade() == 0) {
				session.setAttribute("adminlogin", result);
				url = "admin/main";
			}else if(result.getGrade()==1) {
				session.setAttribute("userlogin", result);
				url = "user/main";
			}
		}
		return String.format("redirect:%s/%s", request.getContextPath(), url);
	}

	// login/logout
	public String logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		session.invalidate();

		return String.format("redirect:%s/login/logoutform", request.getContextPath());
	}

	// login/logoutform (포워딩 - 미리 만들어진 jsp가 연결되도록 하세요)
	public String logoutform(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return "/WEB-INF/views/login/logoutform.jsp";
	}

	// lolgin/loginfail (포워딩 - 미리 만들어진 jsp가 연결되도록 하세요)
	public String loginfail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return "/WEB-INF/views/login/loginfail.jsp";
	}

}

```



## QABoardHandler.java

```java
package com.test.handler;

import com.test.dao.*;
import com.test.domain.*;
import java.io.*;
import java.time.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class QABoardHandler {
	// 사용자 요청 주소별로 메소드 작성
	// 주의) 요청 주소 작성시 절대주소 표기법 사용
	// 주의) 주소와 메소드 이름을 서로 같은 이름 사용
	// 일반 사용자 접근 차단 기능 추가(로그인 필요) => LoginFilter로 대체

	private QABoardDAO dao = new QABoardDAO();

	// qaboard/list
	public String list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int limit_count = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int limit_offset = (Integer.parseInt(pageNum) - 1) * limit_count;
		int prev = Integer.parseInt(pageNum) - 1;
		int next = Integer.parseInt(pageNum) + 1;

		List<QABoard> list = dao.list(limit_offset, limit_count);
		int count = list.size();
		int totalCount = dao.totalCount();

		int totalPage = (int) Math.ceil((double) totalCount / limit_count);

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPage", totalPage);

		return "/WEB-INF/views/qaboard/qaboardlist.jsp";
	}

	// qaboard/insert
	public String insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String clientip = request.getRemoteAddr();
		String pw = request.getParameter("pw");

		QABoard q = new QABoard();
		q.setTitle(title);
		q.setContent_(content);
		q.setClientip(clientip);
		q.setPw(pw);

		int result = dao.add(q);

		return String.format("redirect:%s/qaboard/list?success=%s", request.getContextPath(), result);
	}

	// qaboard/ajaxContent
	public String ajaxContent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String qid = request.getParameter("qid");
		String pw = request.getParameter("pw");

		String result = "Error:Bad Request!!";

		QABoard q = dao.ajaxContent(qid, pw);
		if (q != null) {
			result = String.format(
					"{\"qid\":\"%s\", \"title\":\"%s\", \"content_\":\"%s\", \"writeday\":\"%s\", \"clientip\":\"%s\", \"blind\":\"%s\", \"privacy\":\"%s\"}",
					q.getQid(), q.getTitle(), q.getContent_(), q.getWriteday(), q.getClientip(), q.getBlind(),
					q.getPrivacy());
		}
		request.setAttribute("result", result);

		return "/WEB-INF/views/qaboard/ajaxContent.jsp";
	}

}
```



## SISTHandler.java

```java
package com.test.handler;

import com.test.dao.*;
import com.test.domain.*;
import java.io.*;
import java.time.*;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class SISTHandler {
	// 사용자 요청 주소별로 메소드 작성
	// 주의) 요청 주소 작성시 절대주소 표기법 사용
	// 주의) 주소와 메소드 이름을 서로 같은 이름 사용
	// 일반 사용자 접근 차단 기능 추가(로그인 필요) => LoginFilter로 대체

	// sist/main
	public String main(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		return "/WEB-INF/views/sist/sistmain.jsp";
	}
	// sist/intro
	public String intro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		return "/WEB-INF/views/sist/sistintro.jsp";
	}

	// sist/education
	public String education(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		return "/WEB-INF/views/sist/sisteducation.jsp";
	}
	
}

```



# WEB-INF>tags>

# pre.tag

```jsp
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" type="java.lang.String" required="true"%>
<%
	value = value.replace("&", "&amp;");
	value = value.replace("<", "&lt;");
	value = value.replace(">", "&gt;");
	value = value.replace(" ", "&nbsp;");
	value = value.replace("\n", "\n<br>");
%>
<%=value%>
```



# WEB-INF>views>admin>

## adminmain.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>
<script>
	$(document).ready(function() {


	});
</script>


<script>
	var position01 = new google.maps.LatLng(37.500197, 127.033471);
	var position02 = new google.maps.LatLng(37.499362, 127.033202);

	function myMap() {

		//구글 맵 정보 설정
		var mapProp = {
			center : position01,
			zoom : 17,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		//마커 정보 설정
		var marker = new google.maps.Marker({
			position : position02,
		});
		marker.setMap(map);

		//윈포윈도우 설정
		var infowindow = new google.maps.InfoWindow(
				{
					content : "한독약품빌딩<br>서울특별시 강남구 역삼1동 735<br><img src=\"${pageContext.request.contextPath}/resources/img/handok_small.png\">"
				});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});

	}
</script>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" style="padding:10px;">
				<a href="${pageContext.request.contextPath}/admin/main"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="sist_logo.png" style="vertical-align: bottom;"></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath}/admin/main">Home</a></li>
					<li><a href="#">과정</a></li>
					<li><a href="#">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/qaboardlist">문의게시판</a></li>
					<li><a href="#">회원</a></li>
					<li><a href="#">상담</a></li>
					<li><a href="#">성적</a></li>
					<li><a href="#">교재</a></li>
					<li><a href="${pageContext.request.contextPath}/login/logout">관리자 로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="panel-group">
			<div class="panel panel-primary" id="output">
				<div class="panel-heading">
					강남캠퍼스 02-3482-4632 서울특별시 강남구 테헤란로 132 (역삼동) 한독약품빌딩 8층
					<button type="button" class="btn btn-default btn-xs btnMap"
						id="map">Map</button>
				</div>
				<div class="panel-body">

					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>과정명</th>
								<th>교육기간</th>
								<th>교육시간</th>
								<th>교육비용</th>
								<th>정원</th>
								<th>과정신청/<br>상세보기
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>155</td>
								<td>정부지원</td>
								<td>웹프로그래머 취업 전문 과정<br> <span
									class="text-danger small">(매월 316,000원 수당 지급)</span></td>
								<td>2018.01.10~2018.05.24</td>
								<td>09:00~18:00</td>
								<td><span class="text-danger">전액 무료</span></td>
								<td>25명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
							<tr>
								<td>154</td>
								<td>정부지원</td>
								<td>사물인터넷 기술 구현 과정</td>
								<td>2018.02.16~2018.04.13</td>
								<td>09:00~18:00</td>
								<td><span class="text-danger">전액 무료</span></td>
								<td>25명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
							<tr>
								<td>153</td>
								<td>주말과정</td>
								<td>개발자를 위한 Java Programming</td>
								<td>2018.02.7, 14, 21, 28, 03.5</td>
								<td>10:00~18:00</td>
								<td>263,480원<br> <span class="text-danger small">(재직자
										환급 210,784원)</span></td>
								<td>20명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
							<tr>
								<td>152</td>
								<td>주말과정</td>
								<td>빅데이터 설계 및 분석 과정</td>
								<td>2018.03.7, 14, 21, 28, 04.5</td>
								<td>10:00~18:00</td>
								<td>230,090원<br> <span class="text-danger small">(재직자
										환급 184,072원)</span></td>
								<td>20명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
							<tr>
								<td>151</td>
								<td>주말과정</td>
								<td>실무 중심의 Oracle SQL &amp; PL/SQL</td>
								<td>2018.03.7, 14, 21, 28, 04.5</td>
								<td>10:00~18:00</td>
								<td>263,480원<br> <span class="text-danger small">(재직자
										환급 210,784원)</span></td>
								<td>20명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">공지사항</div>
				<div class="panel-body">

					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th style="width: 70%;">제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>114</td>
								<td><a href="#demo137" data-toggle="collapse">Framework를
										활용한 빅데이터 개발자 과정 수료 안내</a>
									<div id="demo137" class="collapse"
										style="width: 80%; margin: 10px;">
										<p>
											당 교육센터에서는 Framwork를 활용한 빅데이터 개발자 과정이 수료함 알려드립니다.<br>
											교육장소 : 강남교육센터<br> 교육일정 : 2017.06.3~2017.12.03 매주
											월~금(09:00~18:00)<br>
										</p>
									</div></td>
								<td>2017-11-03</td>
							</tr>
							<tr>
								<td>113</td>
								<td><a href="#demo136" data-toggle="collapse">2018년
										정부지원 무료 교육 안내</a>
									<div id="demo136" class="collapse"
										style="width: 80%; margin: 10px;">
										<p>
											당 교육센터에서는 고용노동부와 한국산업인력공단 주관으로 국가기간전략산업직종훈련 교육생을 아래와 같이
											모집합니다.<br> 교육장소 : 강남교육센터 , 강북교육센터<br> 교육일정 : 총
											5.5~6개월 매주 월~금(09:00~18:00)<br> 교육대상 : 미취업자 /
											졸업예정자(2018년 2월 졸업예정자)<br> 교육비용 :국비전액지원(교육비 및 교재비 전액지원)<br>
											훈련수당 : 월 236,000원~316,000원 지급
										</p>

									</div></td>
								<td>2017-10-30</td>
							</tr>
						</tbody>
					</table>
					<ul class="pager">
						<li><button type="button" class="btn btn-default btn-sm">Previous</button></li>
						<li><button type="button" class="btn btn-default btn-sm">Next</button></li>
					</ul>

				</div>
			</div>


		</div>


		<!-- Google Map Modal -->
		<div id="mapModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Google Map</h4>
					</div>
					<div class="modal-body">

						<div id="googleMap"
							style="width: 550px; height: 380px; margin: auto;"></div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- Modal -->
		<div id="myLoginFormModal" class="modal fade" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 로그인
						</h4>
						<label>정상적인 서비스 사용을 위해서 로그인해야 합니다.</label>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" method="post" action="${pageContext.request.contextPath}/login/login">
							<div class="form-group">
								<label for="id"> ID :</label> <input type="text"
									class="form-control" id="id_" name="id_" placeholder="Enter ID"
									required="required">
							</div>
							<div class="form-group">
								<label for="pw"> Password :</label> <input type="password"
									class="form-control" id="pw" name="pw"
									placeholder="Enter Password" required="required">
							</div>
							<button type="submit" class="btn btn-default btn-block">
								Login</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							id="memberInsertForm">회원가입</button>
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>

		</div>

	</div>

	<footer class="container-fluid bg-4 text-center">
		<p>
		www.sist.co.kr 쌍용교육센터 since 1985
		</p>
	</footer>
	
</body>
</html>
```

## adminqaboardlist.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<script>
	$(document).ready(function() {
		// 답변보기 팝오버
		$('[data-toggle="popover"]').popover(); 
		
		// 답변쓰기 모달 창
		$("button.btnReplyAdd").on("click",function(){
			var title = $(this).parents("tr").find("a").text();
			var content = $(this).parents("tr").find("div.collapse p:nth-child(2)").text();
			var qid = $(this).val();
			
			$("input#qid").val(qid) ;
			$("#replytitle").val(title);
			$("#replycontent").val(content);
			
			$("#replyQABoardInsertForm").modal();
		});
		
		// 답변삭제 확인 창
		$("button.btnReplyDelete").on("click", function(){
			if(confirm("정말 삭제하시겠습니까?")){
				var qid = $(this).val();
				location.assign("${pageContext.request.contextPath}/admin/replydelete?qid="+qid);
			}
		});
				
		// 블라인드
		$("input.blindCB").on("click",function(){
			var qid = $(this).val();
			if($(this).is(":checked")){
				if(confirm("선택한 게시물을 블라인드 처리할까요?")){
					// '확인'
					location.assign("${pageContext.request.contextPath}/admin/blind?qid="+qid+"&blind="+1);
				} else {
					// '취소'
					return false;
				}
			} else {
				if(confirm("선택한 게시물을 블라인드 해제할까요?")){
					// '확인'
					location.assign("${pageContext.request.contextPath}/admin/blind?qid="+qid+"&blind="+0);
				} else{
					// '취소'
					return false;
				}
			}
		});
		
		// 페이징 처리
		$("button.btnPrevious").on("click",function(){
			location.assign("?pageNum=${prev}#bottom");
		});
		
		$("button.btnNext").on("click",function(){
			location.assign("?pageNum=${next}#bottom");
		});
		
		if("${prev}"=="0"){
			$("button.btnPrevious").attr("disabled","diabled");
		}
		if(parseInt("${next}")>parseInt("${totalPage}")){
			$("button.btnNext").attr("disabled","diabled");
		}
	});
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" style="padding: 10px;">
				<a href="${pageContext.request.contextPath}/admin/main"><img
					src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png" style="vertical-align: bottom;"></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/admin/main">Home</a></li>
					<li><a href="#">과정</a></li>
					<li><a href="#">공지사항</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/admin/qaboardlist">문의게시판</a></li>
					<li><a href="#">회원</a></li>
					<li><a href="#">상담</a></li>
					<li><a href="#">성적</a></li>
					<li><a href="#">교재</a></li>

					<%-- EL 표현을 이용해서 세션객체에 저장된 정보를 확인할 수 있다 --%>
					<li><a href="${pageContext.request.contextPath}/login/logout">관리자(${adminlogin.id_})
							로그아웃</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="panel-group">

			<div class="panel panel-default" id="output">
				<div class="panel-heading">
					교육 과정 및 교육원 관련 문의
					<button type="button" class="btn btn-default btn-xs"
						id="QABoardInsert" data-toggle="tooltip" data-placement="top"
						title="로그인 과정 없이 글쓰기가 가능합니다." disabled="disabled">글쓰기</button>
					<c:if test="${param.success==1}">
						<div class='alert alert-success alert-dismissible'
							style='display: inline-block; padding-top: 5px; padding-bottom: 5px; margin: 0px'>
							<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>성공했습니다
						</div>
					</c:if>
					<c:if test="${param.success==0}">
						<div class='alert alert-danger alert-dismissible'
							style='display: inline-block; padding-top: 5px; padding-bottom: 5px; margin: 0px'>
							<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다
						</div>
					</c:if>
				</div>
				<div class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th class="col-md-8">제목</th>
								<th>작성일</th>
								<th>답변보기</th>
								<th>답변쓰기</th>
								<th>답변삭제</th>
								<th>블라인드</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="l" items="${list}" varStatus="c">
							<tr>
								<td>${c.index+1}</td>
								<td><a href="#demo${c.index}" data-toggle="collapse">${l.title}</a>
									<div id="demo${c.index}" class="collapse" style="width: 80%; margin: 10px;">
										<p>${l.clientip}</p>
										<ct:pre value="${l.content_}" />
									</div></td>
								<td>${l.writeday}</td>
								<td>
									<c:if test="${empty l.replyContent}">
									<button type="button" class="btn btn-default btn-xs btnReply" disabled="disabled">답변보기</button>
									</c:if>
									<c:if test="${not empty l.replyContent}">
									<button type="button" class="btn btn-default btn-xs btnReply" title="관리자 답변" data-toggle="popover" data-placement="left"
										data-content="${l.replyContent}">답변보기</button>
									</c:if>
								</td>
								<td>
									<button type="button" class="btn btn-default btn-xs btnReplyAdd" value="${l.qid}">답변쓰기</button>
								</td>
								<td>
									<button type="button" class="btn btn-default btn-xs btnReplyDelete" value="${l.qid}">답변삭제</button>
								</td>
								<td><input type="checkbox" class="blindCB" value="${l.qid}" ${(l.blind==1)?"checked":""}></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div>
						<button type="button" class="btn btn-default btn-sm btnPicture">
							Total <span class="badge totalCount">${totalCount}</span>
						</button>
						<button type="button" class="btn btn-default btn-sm btnPicture">
							Count <span class="badge totalCount">${count}</span>
						</button>
						<button type="button" class="btn btn-default btn-sm btnPicture">
							Blind <span class="badge blindCount">0</span>
						</button>
						<button type="button" class="btn btn-default btn-sm btnTotalPages">
							Pages <span class="badge totalPages">${totalPage}</span>
						</button>
						<button type="button"
							class="btn btn-default btn-sm btnCurrentPage">
							Page <span class="badge currentPage">${pageNum}</span>
						</button>
						<button type="button" class="btn btn-default btn-sm btnPrevious">
							<span class="glyphicon glyphicon-step-backward"></span>Previous
						</button>
						<button type="button" class="btn btn-default btn-sm btnNext">
							Next<span class="glyphicon glyphicon-step-forward"></span>
						</button>
					</div>
				</div>
			</div>


		</div>


		<!-- Modal -->
		<div id="replyQABoardInsertForm" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">교육 과정 및 교육원 관련 문의에 대한 답변</h4>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label for="content">제목:</label> <input type="text"
								class="form-control" id="replytitle" name="replytitle"
								disabled="disabled" value="제목">
						</div>
						<div class="form-group">
							<label for="content">내용:</label>
							<textarea class="form-control" rows="10" id="replycontent"
								name="replycontent" disabled="disabled">글내용</textarea>
						</div>
						<form role="form" action="${pageContext.request.contextPath}/admin/replyinsert" method="post">
							<input type="hidden" id="qid" name="qid" value="">
							<div class="form-group">
								<label for="content">답변내용:</label>
								<textarea class="form-control" rows="10" id="replyContent"
									name="replyContent" placeholder="내용 (1000자 이내)" maxlength="1000"
									required="required"></textarea>
							</div>
							<button type="submit" class="btn btn-default btn-sm">Submit</button>
						</form>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>


	</div>

	<footer class="container-fluid bg-4 text-center">
		<p>www.sist.co.kr 쌍용교육센터 since 1985</p>
	</footer>
	<div id="bottom"></div>
</body>
</html>

```



# WEB-INF>views>login

## loginfail.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>SIST_쌍용교육센터</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>
</head>
<body>
	<div class="container">

		<div class="modal-dialog">

			<div>
				<h1 style="font-size: x-large;">
					<img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="logo"
						style="vertical-align: bottom;"> SIST <small>v2.3</small>
				</h1>
			</div>

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> 로그인
					</h4>
					<label>로그인에 실패했습니다.</label>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<div class="form-group"></div>
					<a href="${pageContext.request.contextPath}/sist/main" class="btn btn-default btn-block">Main</a>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>

	</div>
</body>
</html>

```

## logoutform.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>SIST_쌍용교육센터</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>
</head>
<body>
	<div class="container">

		<div class="modal-dialog">

			<div>
				<h1 style="font-size: x-large;">
					<img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="logo"
						style="vertical-align: bottom;"> SIST <small>v2.3</small>
				</h1>
			</div>

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> 로그인
					</h4>
					<label>안전하게 로그아웃 되었습니다.</label>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<div class="form-group"></div>
					<a href="${pageContext.request.contextPath}/sist/main" class="btn btn-default btn-block">Main</a>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>

	</div>
</body>
</html>
```





# WEB-INF>views>qaboard

## ajaxContent.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
${result}
```

## qaboardlist.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<script>
	$(document).ready(function() {
		// 글쓰기 버튼 클릭 이벤트
		$("button#QBBoardInsert").on("click", function(){
			$("#myQABoardInsertForm").modal();
		});
		
		// 글쓰기 시 비밀글 체크박스 클릭 이벤트
		// -> 체크 유무에 따른 패스워드 입력폼 설정 변경
		$("#undercover").on("change",function(){
			if($(this).is(":checked")){
				$("#myQABoardInsertForm").find("div#pwForm").show();
				$("#myQABoardInsertForm").find("input#pw").removeAttr("disabled");
			} else {
				$("#myQABoardInsertForm").find("div#pwForm").hide();
				$("#myQABoardInsertForm").find("input#pw").attr("disabled", "disabled");
			}
		});
		
		// 비밀글 읽기를 위한 Ajax 요청
		$("button.btnSubmit").on("click", function(){
			var qid = $(this).val();
			var pw = $(this).parent().find("input").val();
			
			// jQuery Ajax 요청
			// -> qid, pw를 서버로 전송
			// -> /qaboard/ajaxContent
			// -> 서버로부터 받은 결과를 화면에 출력
			var th = $(this);
			$.post("${pageContext.request.contextPath}/qaboard/ajaxContent",
					{qid:qid, pw:pw}, 
					function(data, status){	
						if(data.includes("Error:")){
							th.parents("div.collapse").find("div.fade").show();
						} else{var jobj = JSON.parse(data);
							th.parents("div.collapse").text(jobj.content_);
						}
					});
		});
			
		// 답변보기 팝오버
		$('[data-toggle="popover"]').popover(); 
		
		
		// 페이징 처리
		$("button.btnPrevious").on("click",function(){
			location.assign("?pageNum=${prev}#bottom");
		});
		
		$("button.btnNext").on("click",function(){
			location.assign("?pageNum=${next}#bottom");
		});
		
		if("${prev}"=="0"){
			$("button.btnPrevious").attr("disabled","diabled");
		}
		if(parseInt("${next}")>parseInt("${totalPage}")){
			$("button.btnNext").attr("disabled","diabled");
		}
		
	});
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" style="padding: 10px;">
				<a href="${pageContext.request.contextPath}/sist/main"><img
					src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png" style="vertical-align: bottom;"></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/sist/main">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/sist/intro">센터소개</a></li>
					<li><a
						href="${pageContext.request.contextPath}/sist/education">교육과정
							소개</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/qaboard/list">문의게시판</a></li>
					<li><a href="#" data-toggle="modal"
						data-target="#myLoginFormModal">회원가입/로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="panel-group">

			<div class="panel panel-default" id="output">
				<div class="panel-heading">
					교육 과정 및 교육원 관련 문의
					<button type="button" class="btn btn-default btn-xs"
						id="QBBoardInsert" data-toggle="tooltip" data-placement="top"
						title="로그인 과정 없이 글쓰기가 가능합니다.">글쓰기</button>
					<c:if test="${param.success==1}">
						<div class='alert alert-success alert-dismissible'
							style='display: inline-block; padding-top: 5px; padding-bottom: 5px; margin: 0px'>
							<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>성공했습니다
						</div>
					</c:if>
					<c:if test="${param.success==0}">
						<div class='alert alert-danger alert-dismissible'
							style='display: inline-block; padding-top: 5px; padding-bottom: 5px; margin: 0px'>
							<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다
						</div>
					</c:if>
				</div>
				<div class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th style="width: 70%">제목</th>
								<th>작성일</th>
								<th>답변보기</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="l" items="${list}" varStatus="c">
								<tr>
									<td>${c.index+1}</td>
									<td><a href="#demo${c.index}" data-toggle="collapse" data-target="#demo${c.index}">${l.title}</a> 
										<!-- 비밀글이 아닌 경우 -->
										<c:if test="${l.privacy==0}">
											<div id="demo${c.index}" class="collapse" style="width: 80%; margin: 10px;">
												<ct:pre value="${l.content_}" />
											</div>
										</c:if> 
										<!-- 비밀글인 경우 -->
										<c:if test="${l.privacy==1}">
											<span class="text-danger small">(비밀글)</span>
											<div id="demo${c.index}" class="collapse"	style="width: 80%; margin: 10px;">
												<form role="form" method="post">
													<div class="form-group">
														<input type="password" class="form-control input-sm"
															id="pw" name="pw" placeholder="패스워드 (4자리)" maxlength="4" required="required">
													</div>
													<!-- Ajax 요청을 위해 submit이 아니라 button으로 변경 -->
													<button type="button" class="btn btn-default btn-xs btnSubmit" value="${l.qid}">Submit</button>
													
													<!-- 비밀글 확인 결과 패스워드가 틀린 경우는 메시지 출력 -->
													<div class="alert alert-danger alert-dismissible fade in" style="display:none;">
														<strong>Fail!</strong> 비밀번호가 틀립니다
													</div>
														
												</form>
											</div>
										</c:if></td>
									<td>${l.writeday}</td>
									<td>
										<c:if test="${empty l.replyContent}">
											<button type="button" class="btn btn-default btn-xs btnReply" disabled="disabled">답변보기</button>
										</c:if>
										<c:if test="${not empty l.replyContent}">
											<button type="button" class="btn btn-default btn-xs btnReply" title="관리자 답변" data-toggle="popover" data-placement="left"
												data-content="${l.replyContent}">답변보기</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<ul class="pager">
						<li><button type="button"
								class="btn btn-default btn-sm btnPrevious">
								<span class="glyphicon glyphicon-step-backward"></span>Previous
							</button></li>
						<li><button type="button"
								class="btn btn-default btn-sm btnNext">
								Next<span class="glyphicon glyphicon-step-forward"></span>
							</button></li>
					</ul>
				</div>
			</div>
		</div>


		<!-- Modal -->
		<div id="myQABoardInsertForm" class="modal fade" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">교육 과정 및 교육원 관련 문의</h4>
						<label>최대한 빠른 답변을 해드리겠습니다.</label>
					</div>
					<div class="modal-body">

						<form role="form"
							action="${pageContext.request.contextPath}/qaboard/insert"
							method="post">
							<div class="form-group">
								<label for="name">제목:</label> <input type="text"
									class="form-control" id="title" name="title"
									placeholder="제목 (100자 이내)" maxlength="100" required="required"
									autofocus="autofocus">
							</div>
							<div class="form-group">
								<label for="comment">내용:</label>
								<textarea class="form-control" rows="10" id="content"
									name="content" placeholder="내용 (1000자 이내)" maxlength="1000"
									required="required"></textarea>
							</div>
							<div class="checkbox">
								<label><input type="checkbox" value="" id="undercover">비밀글
									<span class="small">(비밀글을 체크하면 글내용 보기를 할 때 패스워드를 확인하는
										게시물이 됩니다.)</span></label> <label class="text-danger small">* 수강 신청 확인
									등 신원 확인이 필요한 문의는 이름, 전화번호, 이메일을 적어주시고, 비밀글 체크를 해주시기 바랍니다.</label>
							</div>
							<div class="form-group" id="pwForm" style="display: none;">
								<input type="password" class="form-control " id="pw" name="pw"
									placeholder="패스워드 (4자리)" maxlength="4" required="required"
									disabled="disabled">
							</div>
							<button type="submit" class="btn btn-default btn-sm">Submit</button>
						</form>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- Modal -->
		<div id="myLoginFormModal" class="modal fade" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 로그인
						</h4>
						<label>정상적인 서비스 사용을 위해서 로그인해야 합니다.</label>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" action="${pageContext.request.contextPath}/login/login" method="post"
							action="${pageContext.request.contextPath}/login/login">
							<div class="form-group">
								<label for="id"> ID :</label> <input type="text"
									class="form-control" id="id_" name="id_" placeholder="Enter ID"
									required="required">
							</div>
							<div class="form-group">
								<label for="pw"> Password :</label> <input type="password"
									class="form-control" id="pw_" name="pw_"
									placeholder="Enter Password" required="required">
							</div>
							<!-- 등급 정보 제공을 위한 라디오 버튼 추가 -->
							<div class="form-group">
								<label class="radio-inline"><input type="radio" name="grade" value="1" checked>수강생</label>
								<label class="radio-inline"><input type="radio"	name="grade" value="0">관리자</label>
							</div>
							<button type="submit" class="btn btn-default btn-block">
								Login</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							id="memberInsertForm">회원가입</button>
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>

		</div>

	</div>
</body>
</html>


```



# WEB-INF>views>sist

## sisteducation.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<script>
	$(document).ready(function() {


	});

	function initialize() {
		//한독약품빌딩
		//서울특별시 강남구 역삼1동 735
		//37.499362, 127.033202
		var myCenter = new google.maps.LatLng(37.499362, 127.033202);
		var mapProp = {
			center : myCenter,
			zoom : 16,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		var marker = new google.maps.Marker({
			position : myCenter,
		});

		marker.setMap(map);
	}
</script>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" style="padding:10px;">
				<a href="${pageContext.request.contextPath}/sist/main"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="sist_logo.png" style="vertical-align: bottom;"></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a
						href="${pageContext.request.contextPath}/sist/main">Home</a></li>
					<li><a
						href="${pageContext.request.contextPath}/sist/intro">센터소개</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/sist/education">교육과정
							소개</a></li>
					<li><a
						href="${pageContext.request.contextPath}/qaboard/list">문의게시판</a></li>
					<li><a href="#" data-toggle="modal"
						data-target="#myLoginFormModal">회원가입/로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="panel-group">

			<div class="panel panel-default" id="output">
				<div class="panel-heading">교육개요</div>
				<div class="panel-body">
					<p>IT는 거의 모든 산업 분야에서 연관 되어져 있으며 앞으로도 지속적으로 발전 가능성이 많은 분야입니다. 국내
						IT 서비스 시장은 지속적으로 성장을 하고 있으며, IT 서비스 산업 자체의 변화 등 다양한 시장 환경 변화 움직임
						속에 신규 사업 발굴 작업이 지속되고, 시작 경쟁 구도의 변화 움직임이 확대될 전망입니다.</p>
					<p>그에 따른 전문인력 수급이 현저히 부족한 상황이고, 구직자들의 수준은 기업에서 요구하는 직무 능력에 충족이
						되지 못하고 있는 상황입니다. 청년층의 첫 일자리 전공 불일치 비율이 80%에 달하고, 기업에서는 신입 사원을
						재교육하는데 드는 비용이 크기 때문에 사전에 전문 교육을 이수한 구직자를 선호하고 있습니다.</p>
					<p>국가직무능력표준(NCS) 기반 채용 확대가 이어질 전망이며, 성공적인 IT 취업을 위해서는 이제 자격증만이
						아닌 자신의 직무능력 전문성을 길러야 하는 시대입니다.</p>
					<p>
						<span class="text-primary">교육센터에서 진행하는 과정들은 실무 중심의 이론과 실습을
							병행하는 최적의 과정입니다.</span>
					</p>
				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">교육대상</div>
				<div class="panel-body">
					<ul>
						<li>실업자/미취업자</li>
						<li>고등학교 3학년 재학 중인 사람으로서 대학교(전문대학)에 진학하지 아니할 것으로 예정된 사람</li>
						<li>대학교(전문대학)의 최종 학년에 재학중인 사람. 내년도 2월/8월 졸업예정자 가능.</li>
						<li>IT관련학과 우대 (컴퓨터공학, 정보통신 등)</li>
						<li>IT분야 신규 취업 또는 전직 희망자</li>
					</ul>
				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">교육목표</div>
				<div class="panel-body">
					<ul>
						<li>다양한 프로그래밍 언어와 데이터베이스 활용 능력 배양</li>
						<li>현장에서 활용 가능한 기술 교육에 대한 필요성과 인력 수요를 충족할 수 있는 중급자 수준의 인력 양성</li>
						<li>축적된 정형화/비정형화된 데이터를 분석하여 정보를 다룰 수 있는 정보제공 서비스의 개발 및 운영이
							가능한 전문 인력 양성</li>
						<li>실무 프로젝트를 통해서 실제 현업에서 요구하는 개발 능력을 갖춘 현장 적합 인력 양성</li>
					</ul>
				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">커리큘럼</div>
				<div class="panel-body">
					<p style="text-align: center;">
						<img src="${pageContext.request.contextPath}/resources/pictures/sist_curr.png" style="width:100%;">
					</p>

					<p style="text-align: center;">이외에도 과정별로 다양한 과목들이 진행됩니다.</p>
				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">특장점</div>
				<div class="panel-body">
					<p style="text-align: center;">
						<img src="${pageContext.request.contextPath}/resources/pictures/sist_profile.png" style="width:80%;">
					</p>
				</div>
			</div>
			<div class="panel panel-default" id="output">
				<div class="panel-heading">상담예약</div>
				<div class="panel-body">
					<p>과정 문의 상담은 유선 02-3482-4632 / 카톡 OOOOOO / 문자 010-OOOO-OOOO 등으로
						연락 바랍니다.</p>
					<p>방문 상담 환영합니다. 매니저 장OO.</p>

				</div>
			</div>


			<!-- Modal -->
		<div id="myLoginFormModal" class="modal fade" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 로그인
						</h4>
						<label>정상적인 서비스 사용을 위해서 로그인해야 합니다.</label>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" action="${pageContext.request.contextPath}/login/login" method="post"
							action="${pageContext.request.contextPath}/login/login">
							<div class="form-group">
								<label for="id"> ID :</label> <input type="text"
									class="form-control" id="id_" name="id_" placeholder="Enter ID"
									required="required">
							</div>
							<div class="form-group">
								<label for="pw"> Password :</label> <input type="password"
									class="form-control" id="pw_" name="pw_"
									placeholder="Enter Password" required="required">
							</div>
							<!-- 등급 정보 제공을 위한 라디오 버튼 추가 -->
							<div class="form-group">
								<label class="radio-inline"><input type="radio" name="grade" value="1" checked>수강생</label>
								<label class="radio-inline"><input type="radio"	name="grade" value="0">관리자</label>
							</div>
							<button type="submit" class="btn btn-default btn-block">
								Login</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							id="memberInsertForm">회원가입</button>
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>

		</div>

		</div>
	</div>

</body>
</html>

```

## sistintro.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>
<script>
	$(document).ready(function() {

	});
</script>

<script>
	var position01 = new google.maps.LatLng(37.500197, 127.033471);
	var position02 = new google.maps.LatLng(37.499362, 127.033202);

	function myMap() {

		//구글 맵 정보 설정
		var mapProp = {
			center : position01,
			zoom : 17,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		//마커 정보 설정
		var marker = new google.maps.Marker({
			position : position02,
		});
		marker.setMap(map);

		//윈포윈도우 설정
		var infowindow = new google.maps.InfoWindow(
				{
					content : "한독약품빌딩<br>서울특별시 강남구 역삼1동 735<br><img src=\"${pageContext.request.contextPath}/resources/img/handok_small.png\">"
				});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});

	}
</script>


</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" style="padding: 10px;">
				<a href="${pageContext.request.contextPath}/sist/main"><img
					src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png" style="vertical-align: bottom;"></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/sist/main">Home</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/sist/intro">센터소개</a></li>
					<li><a
						href="${pageContext.request.contextPath}/sist/education">교육과정
							소개</a></li>
					<li><a href="${pageContext.request.contextPath}/qaboard/list">문의게시판</a></li>
					<li><a href="#" data-toggle="modal"
						data-target="#myLoginFormModal">회원가입/로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="panel-group">

			<div class="panel panel-default" id="output">
				<div class="panel-heading">Vision</div>
				<div class="panel-body">
					<p style="text-align: center;">
						<img
							src="${pageContext.request.contextPath}/resources/pictures/sist_vision.png">
					</p>
				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">History</div>
				<div class="panel-body">
					<p style="text-align: center;">
						<img
							src="${pageContext.request.contextPath}/resources/pictures/sist_history.png">
					</p>
				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">Computer</div>
				<div class="panel-body">
					<p style="text-align: center;">
						<img
							src="${pageContext.request.contextPath}/resources/pictures/sist_com.png">
					</p>
				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">Location</div>
				<div class="panel-body">
					<div id="googleMap"
						style="width: 100%; height: 350px; margin: auto;"></div>

				</div>
			</div>

		</div>



		<!-- Modal -->
		<div id="myLoginFormModal" class="modal fade" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 로그인
						</h4>
						<label>정상적인 서비스 사용을 위해서 로그인해야 합니다.</label>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" action="${pageContext.request.contextPath}/login/login" method="post"
							action="${pageContext.request.contextPath}/login/login">
							<div class="form-group">
								<label for="id"> ID :</label> <input type="text"
									class="form-control" id="id_" name="id_" placeholder="Enter ID"
									required="required">
							</div>
							<div class="form-group">
								<label for="pw"> Password :</label> <input type="password"
									class="form-control" id="pw_" name="pw_"
									placeholder="Enter Password" required="required">
							</div>
							<!-- 등급 정보 제공을 위한 라디오 버튼 추가 -->
							<div class="form-group">
								<label class="radio-inline"><input type="radio" name="grade" value="1" checked>수강생</label>
								<label class="radio-inline"><input type="radio"	name="grade" value="0">관리자</label>
							</div>
							<button type="submit" class="btn btn-default btn-block">
								Login</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							id="memberInsertForm">회원가입</button>
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>

		</div>

	</div>

</body>
</html>

```

## sistmain.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>SIST_쌍용교육센터</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<script src="https://maps.googleapis.com/maps/api/js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>
<script>
	$(document).ready(function() {

	});
</script>


<script>
	var position01 = new google.maps.LatLng(37.500197, 127.033471);
	var position02 = new google.maps.LatLng(37.499362, 127.033202);

	function myMap() {

		//구글 맵 정보 설정
		var mapProp = {
			center : position01,
			zoom : 17,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		//마커 정보 설정
		var marker = new google.maps.Marker({
			position : position02,
		});
		marker.setMap(map);

		//윈포윈도우 설정
		var infowindow = new google.maps.InfoWindow(
				{
					content : "한독약품빌딩<br>서울특별시 강남구 역삼1동 735<br><img src=\"${pageContext.request.contextPath}/resources/img/handok_small.png\">"
				});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});

	}
</script>


</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header" style="padding: 10px;">
				<a href="${pageContext.request.contextPath}/sist/main"><img
					src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png" style="vertical-align: bottom;"></a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="${pageContext.request.contextPath}/sist/main">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/sist/intro">센터소개</a></li>
					<li><a
						href="${pageContext.request.contextPath}/sist/education">교육과정
							소개</a></li>
					<li><a href="${pageContext.request.contextPath}/qaboard/list">문의게시판</a></li>
					<li><a href="#" data-toggle="modal"
						data-target="#myLoginFormModal">회원가입/로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="panel-group">
			<div class="panel panel-primary" id="output">
				<div class="panel-heading">
					강남캠퍼스 02-3482-4632 서울특별시 강남구 테헤란로 132 (역삼동) 한독약품빌딩 8층
					<button type="button" class="btn btn-default btn-xs btnMap"
						id="map">Map</button>
				</div>
				<div class="panel-body">

					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>과정명</th>
								<th>교육기간</th>
								<th>교육시간</th>
								<th>교육비용</th>
								<th>정원</th>
								<th>과정신청/<br>상세보기
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>155</td>
								<td>정부지원</td>
								<td>웹프로그래머 취업 전문 과정<br> <span
									class="text-danger small">(매월 316,000원 수당 지급)</span></td>
								<td>2018.01.10~2018.05.24</td>
								<td>09:00~18:00</td>
								<td><span class="text-danger">전액 무료</span></td>
								<td>25명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
							<tr>
								<td>154</td>
								<td>정부지원</td>
								<td>사물인터넷 기술 구현 과정</td>
								<td>2018.02.16~2018.04.13</td>
								<td>09:00~18:00</td>
								<td><span class="text-danger">전액 무료</span></td>
								<td>25명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
							<tr>
								<td>153</td>
								<td>주말과정</td>
								<td>개발자를 위한 Java Programming</td>
								<td>2018.02.7, 14, 21, 28, 03.5</td>
								<td>10:00~18:00</td>
								<td>263,480원<br> <span class="text-danger small">(재직자
										환급 210,784원)</span></td>
								<td>20명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
							<tr>
								<td>152</td>
								<td>주말과정</td>
								<td>빅데이터 설계 및 분석 과정</td>
								<td>2018.03.7, 14, 21, 28, 04.5</td>
								<td>10:00~18:00</td>
								<td>230,090원<br> <span class="text-danger small">(재직자
										환급 184,072원)</span></td>
								<td>20명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
							<tr>
								<td>151</td>
								<td>주말과정</td>
								<td>실무 중심의 Oracle SQL &amp; PL/SQL</td>
								<td>2018.03.7, 14, 21, 28, 04.5</td>
								<td>10:00~18:00</td>
								<td>263,480원<br> <span class="text-danger small">(재직자
										환급 210,784원)</span></td>
								<td>20명</td>
								<td><button type="button" class="btn btn-default btn-xs">상세보기</button></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>

			<div class="panel panel-default" id="output">
				<div class="panel-heading">공지사항</div>
				<div class="panel-body">

					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th style="width: 70%;">제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>114</td>
								<td><a href="#demo137" data-toggle="collapse">Framework를
										활용한 빅데이터 개발자 과정 수료 안내</a>
									<div id="demo137" class="collapse"
										style="width: 80%; margin: 10px;">
										<p>
											당 교육센터에서는 Framwork를 활용한 빅데이터 개발자 과정이 수료함 알려드립니다.<br>
											교육장소 : 강남교육센터<br> 교육일정 : 2017.06.3~2017.12.03 매주
											월~금(09:00~18:00)<br>
										</p>
									</div></td>
								<td>2017-11-03</td>
							</tr>
							<tr>
								<td>113</td>
								<td><a href="#demo136" data-toggle="collapse">2018년
										정부지원 무료 교육 안내</a>
									<div id="demo136" class="collapse"
										style="width: 80%; margin: 10px;">
										<p>
											당 교육센터에서는 고용노동부와 한국산업인력공단 주관으로 국가기간전략산업직종훈련 교육생을 아래와 같이
											모집합니다.<br> 교육장소 : 강남교육센터 , 강북교육센터<br> 교육일정 : 총
											5.5~6개월 매주 월~금(09:00~18:00)<br> 교육대상 : 미취업자 /
											졸업예정자(2018년 2월 졸업예정자)<br> 교육비용 :국비전액지원(교육비 및 교재비 전액지원)<br>
											훈련수당 : 월 236,000원~316,000원 지급
										</p>

									</div></td>
								<td>2017-10-30</td>
							</tr>
						</tbody>
					</table>
					<ul class="pager">
						<li><button type="button" class="btn btn-default btn-sm">Previous</button></li>
						<li><button type="button" class="btn btn-default btn-sm">Next</button></li>
					</ul>

				</div>
			</div>


		</div>


		<!-- Google Map Modal -->
		<div id="mapModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Google Map</h4>
					</div>
					<div class="modal-body">

						<div id="googleMap"
							style="width: 550px; height: 380px; margin: auto;"></div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

		<!-- Modal -->
		<div id="myLoginFormModal" class="modal fade" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<h4>
							<span class="glyphicon glyphicon-lock"></span> 로그인
						</h4>
						<label>정상적인 서비스 사용을 위해서 로그인해야 합니다.</label>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" action="${pageContext.request.contextPath}/login/login" method="post"
							action="${pageContext.request.contextPath}/login/login">
							<div class="form-group">
								<label for="id"> ID :</label> <input type="text"
									class="form-control" id="id_" name="id_" placeholder="Enter ID"
									required="required">
							</div>
							<div class="form-group">
								<label for="pw"> Password :</label> <input type="password"
									class="form-control" id="pw_" name="pw_"
									placeholder="Enter Password" required="required">
							</div>
							<!-- 등급 정보 제공을 위한 라디오 버튼 추가 -->
							<div class="form-group">
								<label class="radio-inline"><input type="radio" name="grade" value="1" checked>수강생</label>
								<label class="radio-inline"><input type="radio"	name="grade" value="0">관리자</label>
							</div>
							<button type="submit" class="btn btn-default btn-block">
								Login</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"
							id="memberInsertForm">회원가입</button>
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>

		</div>

	</div>

	<footer class="container-fluid bg-4 text-center">
		<p>www.sist.co.kr 쌍용교육센터 since 1985</p>
	</footer>
</body>
</html>

```



# WEB-INF>

## web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	id="WebApp_ID" version="3.1">
	<display-name>qaboard_20180410</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
	</welcome-file-list>

	<servlet>
		<servlet-name>AdminController</servlet-name>
		<servlet-class>com.test.controller.AdminController</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>AdminController</servlet-name>
		<url-pattern>/admin/*</url-pattern>
	</servlet-mapping>

	<servlet>
		<servlet-name>LoginController</servlet-name>
		<servlet-class>com.test.controller.LoginController</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>LoginController</servlet-name>
		<url-pattern>/login/*</url-pattern>
	</servlet-mapping>

	<servlet>
		<servlet-name>QABoardController</servlet-name>
		<servlet-class>com.test.controller.QABoardController</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>QABoardController</servlet-name>
		<url-pattern>/qaboard/*</url-pattern>
	</servlet-mapping>

	<servlet>
		<servlet-name>SISTController</servlet-name>
		<servlet-class>com.test.controller.SISTController</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>SISTController</servlet-name>
		<url-pattern>/sist/*</url-pattern>
	</servlet-mapping>

 	<filter>
		<filter-name>AdminLoginFilter</filter-name>
		<filter-class>com.test.filter.AdminLoginFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>AdminLoginFilter</filter-name>
		<url-pattern>/admin/*</url-pattern>
	</filter-mapping>
	
	<filter>
		<filter-name>encodingFilter</filter-name>
		<filter-class>com.test.filter.CharactorEncodingFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>encodingFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
</web-app>
```

