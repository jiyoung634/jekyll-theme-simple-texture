---
layout: post
title: "Generate Excel File"
description: "Generate Excel File"
categories: [Servlet, excel]
tags: [Servlet, excel, poi]
redirect_from:
  - /2018/05/10/
---



# 라이브러리

- commons-collections4-4.1.jar
- jstl-1.2.jar
- poi-3.17.jar
- poi-ooxml-3.17.jar
- poi-ooxml-schemas-3.17.jar
- xmlbeans-2.6.0.jar



# Servlet 버전

## TestContoller.java

```java
package com.test;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestController extends HttpServlet {

	private static final long serialVersionUID = -27777817186348165L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//사용자 요청 주소 분석
		// ->요청 URI + invoke() 메소드 기반 주소 분석
		// ->http://211.63.89.68:8090/test/excel
		String viewPage = "error";

		String uri = request.getRequestURI();
		System.out.println("uri:"+uri);
		
		if (uri.contains("/test")) {
			uri = uri.substring(request.getContextPath().length());
			uri = uri.substring("/test/".length());
			
			//주소 분석 결과 -> 특정 액션 요청
			try {
				TestHandler handler = new TestHandler();
				Method m = TestHandler.class.getMethod(uri, HttpServletRequest.class, HttpServletResponse.class);
				viewPage = (String)m.invoke(handler, request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}

			//요청 결과 -> 뷰 정보 -> 포워딩 또는 리다이렉트
			if (viewPage != null && viewPage.contains("redirect:")) {
				response.sendRedirect(viewPage.substring("redirect:".length()));
			} else if (viewPage != null && viewPage.contains(".jsp")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}/* else {
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
			}*/
		}

	}

}

```



## TestHandler.java

```java
package com.test;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class TestHandler {
	
	///test/test	(주소 끝부분과 메소드명 일치)
	public String test(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "/WEB-INF/views/test.jsp";
	}
	
	///test/excel	(주소 끝부분과 메소드명 일치)
	public void excel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Create blank workbook
		XSSFWorkbook workbook = new XSSFWorkbook();
		
		// Create a blank sheet
		XSSFSheet spreadsheet = workbook.createSheet("Test");
		
		// Create row object
		XSSFRow row;
		
		// This data needs to be written (Object[])  ...  Map 자료형으로 준비하는 것이 좋다
		Map<String, Object[]> empinfo = new HashMap<String, Object[]>();
		empinfo.put("1", new Object[] { "EMP ID", "EMP NAME", "DESIGNATION" });
		empinfo.put("2", new Object[] { "tp01", "Gopal", "Technical Manager" });
		empinfo.put("3", new Object[] { "tp02", "Manisha", "Proof Reader" });
		empinfo.put("4", new Object[] { "tp03", "Masthan", "Technical Writer" });
		empinfo.put("5", new Object[] { "tp04", "Satish", "Technical Writer" });
		empinfo.put("6", new Object[] { "tp05", "Krishna", "Technical Writer" });
		
		// Iterate over data and write to sheet
		Set<String> keyid = empinfo.keySet();
		int rowid = 0;
		for (String key : keyid) {
			row = spreadsheet.createRow(rowid++);
			Object[] objectArr = empinfo.get(key);
			int cellid = 0;
			for (Object obj : objectArr) {
				Cell cell = row.createCell(cellid++);
				cell.setCellValue((String) obj);	// 배열로 미리 만들어서 한 번에 코딩
			}
		}
		
		response.setHeader("Content-disposition","attachment;filename=" + "test.xlsx");	// 파일명
	    response.setHeader("Content-Type", "application/vnd.ms-excel; charset=MS949");	// 브라우저가 Excel로 인식하게 함
	    response.setHeader("Content-Description", "JSP Generated Data"); 
	    response.setHeader("Content-Transfer-Encoding", "binary;"); 
	    response.setHeader("Pragma", "no-cache;"); // 새로고침 불가 (no-cache 설정: 뒤로가기 해도 이전 페이지가 보이지 않게..주로 금융권)
	    response.setHeader("Expires", "-1;");	// 유효기간 X
	    
	    ServletOutputStream out = response.getOutputStream();
	    workbook.write(out);
	    out.close();
	    
	    workbook.close();

	}

}

```



## test.jsp

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
        
        //Excel
        $("button.btnExcel").on("click", function() {
			if (confirm("자료를 Excel 형식으로 저장할까요?")) {
				location.assign("${pageContext.request.contextPath}/test/excel")
			}
        });
        
	});


</script>
</head>
<body>
	<div class="container">

		<div class="panel page-header" style="text-align:center;">
			<h1 style="font-size:xx-large;">
				<a href="${pageContext.request.contextPath}/test/test"><img src="${pageContext.request.contextPath}/img/sist_logo.png" alt="sist_logo.png"> </a>
				Excel Download <small>v1.0</small>
			</h1>
		</div>


		<div class="panel panel-default" id="output">
			<div class="panel-heading">다운로드 테스트</div>
			<div class="panel-body">

				<form class="form-inline" method="post">
					<div class="form-group">
						<button	type="button" class="btn btn-default btnExcel" >Excel<span class="glyphicon glyphicon-download-alt"></span></button>
					</div>
				</form>
								
			</div>
		</div>

	</div>

</body>
</html>
```



## web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	id="WebApp_ID" version="3.1">
	<display-name>apachepoi_20180508</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
	</welcome-file-list>

	<servlet>
		<servlet-name>TestController</servlet-name>
		<servlet-class>com.test.TestController</servlet-class>
	</servlet>

	<servlet-mapping>
		<servlet-name>TestController</servlet-name>
		<url-pattern>/test/*</url-pattern>
	</servlet-mapping>


</web-app>
```





# Spring MVC 버전

## Member.java

```java
package com.test;

import java.time.*;

public class Member {
	
	//필드 구성
	//->입력, 출력에 관여된 모든 항목
	//->동일 자료, 동일 식별자
	private String mid_, name_, phone, email, deptId, deptName, regDate;
	
	public String getMid_() {
		return mid_;
	}
	public void setMid_(String mid_) {
		this.mid_ = mid_;
	}
	public String getName_() {
		return name_;
	}
	public void setName_(String name_) {
		this.name_ = name_;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	

}

```



## MemberController.java

```java
package com.test;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	//의존 주입(DI)
	@Autowired
	private MemberJDBCTemplate memberJDBCTemplate;
	
	@RequestMapping("/list")
	public String list(Model model, String key, String value) {
		if(key==null) {
			key="ALL";
			value="";
		}
		List<Member> list = this.memberJDBCTemplate.list(key, value);
		List<Member> deptList = this.memberJDBCTemplate.deptList();
		int totalCount = this.memberJDBCTemplate.totalCount();
		int count = list.size();
		
		model.addAttribute("list", list);
		model.addAttribute("deptList", deptList);
		model.addAttribute("count", count);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		
		return "member";
	}
	
	
	@RequestMapping("/insert")
	public String insert(Member m) {
		int result = this.memberJDBCTemplate.memberInsert(m);
		return "redirect:/member/list?success="+result;
	}
	
	@RequestMapping("/delete")
	public String delete(String mid_) {
		int result = this.memberJDBCTemplate.memberDelete(mid_);
		return "redirect:/member/list?success="+result;
	}

	@RequestMapping("/update")
	public String update(Member m) {
		int result = this.memberJDBCTemplate.memberUpdate(m);
		return "redirect:/member/list?success="+result;
	}
	
	@RequestMapping("/excel")
	public void excel(HttpServletResponse response) throws IOException {
		// Create blank workbook
		XSSFWorkbook workbook = new XSSFWorkbook();
		
		// Create a blank sheet
		XSSFSheet spreadsheet = workbook.createSheet("Test");
		
		// Create row object
		XSSFRow row;
		
		// This data needs to be written (Object[])  ...  Map 자료형으로 준비하는 것이 좋다
		Map<String, Object[]> empinfo = new HashMap<String, Object[]>();
		empinfo.put("1", new Object[] { "Mid", "Name", "Phone", "Email", "RegDate", "DeptName"});
		List<Member> list = this.memberJDBCTemplate.list("ALL", "");
		int count = list.size();
		for(int a=0; a<count; ++a) {
			Member m = list.get(a);
			empinfo.put(String.valueOf(a+2), new Object[] { m.getMid_(), m.getName_(), m.getPhone(), m.getEmail(), m.getRegDate(), m.getDeptName()});
		}
		
		// Iterate over data and write to sheet
		Set<String> keyid = empinfo.keySet();
		int rowid = 0;
		for (String key : keyid) {
			row = spreadsheet.createRow(rowid++);
			Object[] objectArr = empinfo.get(key);
			int cellid = 0;
			for (Object obj : objectArr) {
				Cell cell = row.createCell(cellid++);
				cell.setCellValue((String) obj);	// 배열로 미리 만들어서 한 번에 코딩
			}
		}
		
		response.setHeader("Content-disposition","attachment;filename=" + "test.xlsx");	// 파일명
	    response.setHeader("Content-Type", "application/vnd.ms-excel; charset=MS949");	// 브라우저가 Excel로 인식하게 함
	    response.setHeader("Content-Description", "JSP Generated Data"); 
	    response.setHeader("Content-Transfer-Encoding", "binary;"); 
	    response.setHeader("Pragma", "no-cache;"); // 새로고침 불가 (no-cache 설정: 뒤로가기 해도 이전 페이지가 보이지 않게..주로 금융권)
	    response.setHeader("Expires", "-1;");	// 유효기간 X
	    
	    ServletOutputStream out = response.getOutputStream();
	    workbook.write(out);
	    out.close();
	    
	    workbook.close();
	}

}

```



## MemberDAO.java

```java
package com.test;

import java.util.*;

public interface MemberDAO {
	// 전체 명단 출력용 메소드
	public List<Member> list();

	// 전체 출력 및 검색 결과 출력용 메소드
	public List<Member> list(String key, String value);

	// 부서 정보 읽기용 메소드
	public List<Member> deptList();

	// 전체 인원수 확인용 메소드
	public int totalCount();
	
	// 회원정보 입력용 메소드
	public int memberInsert(Member m);

	// 회원 정보 삭제 메소드
	public int memberDelete(String mid_);

	// 회원정보 수정 액션 메소드
	public int memberUpdate(Member m);
}

```



## MemberJDBCTemplate.java

```java
package com.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MemberJDBCTemplate implements MemberDAO {

	private JdbcTemplate jdbcTemplate;

	// setter를 통한 의존 주입(DI)
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Member> list() {
		/*
		 * CREATE VIEW membersView AS SELECT mid_, name_, phone, email, regDate,
		 * deptName FROM members INNER JOIN dept USING(deptID) ORDER BY mid_;
		 */
		String sql = "SELECT mid_, name_, phone, email, regDate, deptName FROM membersView ORDER BY mid_";
		List<Member> result = this.jdbcTemplate.query(sql, new MemberMapper());

		return result;
	}

	@Override
	public List<Member> list(String key, String value) {
		/*
		 * CREATE VIEW membersView AS SELECT mid_, name_, phone, email, regDate,
		 * deptName FROM members INNER JOIN dept USING(deptID) ORDER BY mid_;
		 */

		String sql = "SELECT mid_, name_, phone, email, regDate, deptName FROM membersView";

		// key, value를 이용한 검색 조건 지정
		// ->key가 "ALL"인 경우는 전체 출력.
		switch (key) {
		case "ALL":
			sql += "";
			break;
		case "mid_":
			sql += " WHERE mid_ = ?";
			break;
		case "name_":
			sql += " WHERE INSTR(LOWER(name_), LOWER(?))";
			break;
		case "phone":
			sql += " WHERE INSTR(phone, ?)";
			break;
		case "email":
			sql += " WHERE INSTR(email, ?)";
			break;
		case "regDate":
			sql += " WHERE INSTR(regDate, ?)";
			break;
		case "deptName":
			sql += " WHERE INSTR(deptName, ?)";
			break;
		}
		sql += " ORDER BY mid_";

		List<Member> result;

		if (key.equals("ALL")) {
			result = this.jdbcTemplate.query(sql, new MemberMapper());
		} else {
			result = this.jdbcTemplate.query(sql, new MemberMapper(), value);
		}
		return result;
	}

	@Override
	public List<Member> deptList() {
		String sql = "SELECT deptId, deptName FROM dept ORDER BY deptId";
		// DeptMapper를 따로 만드는 대신 익명구현객체를 만든다.
		List<Member> result = this.jdbcTemplate.query(sql, new RowMapper<Member>() {

			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member m = new Member();
				m.setDeptId(rs.getString("deptId"));
				m.setDeptName(rs.getString("deptName"));
				return m;
			}

		});
		return result;
	}

	@Override
	public int totalCount() {
		String sql = "SELECT COUNT(*) AS totalCount FROM membersView";
		// 쿼리의 결과가 1개이고 int형으로 반환 받고 싶을 때 - queryForObject()
		int result = this.jdbcTemplate.queryForObject(sql, Integer.class);
		return result;
	}

	@Override
	public int memberInsert(Member m) {
		String sql = "INSERT INTO members (mid_, name_, phone, email, regDate, deptId) VALUES ((SELECT * FROM (SELECT CONCAT('M', LPAD(IFNULL(SUBSTRING(MAX(mid_), 2), 0) + 1, 2, 0)) AS newMid FROM members) m) , ?, ?, ?, ?, ?)";
		int result = 0;
		try {
			result = this.jdbcTemplate.update(sql, m.getName_(), m.getPhone(), m.getEmail(), m.getRegDate(),
					m.getDeptId());
		} catch (DataAccessException d) {

		}
		return result;
	}

	@Override
	public int memberDelete(String mid_) {
		String sql = "DELETE FROM members WHERE mid_=?";
		int result = 0;
		try {
			result = this.jdbcTemplate.update(sql, mid_);
		} catch (DataAccessException d) {

		}
		return result;
	}

	@Override
	public int memberUpdate(Member m) {
		String sql = "UPDATE members SET name_=?, phone=?, email=?, regDate=?, deptId=? WHERE mid_=?";
		int result = 0;
		try {
			result = this.jdbcTemplate.update(sql, m.getName_(), m.getPhone(), m.getEmail(), m.getRegDate(),
					m.getDeptId(), m.getMid_());
		} catch (DataAccessException d) {

		}
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

	@Override
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
		Member m = new Member();
		m.setMid_(rs.getString("mid_"));
		m.setName_(rs.getString("name_"));
		m.setPhone(rs.getString("phone"));
		m.setEmail(rs.getString("email"));
		m.setRegDate(rs.getString("regDate"));
		m.setDeptName(rs.getString("deptName"));
		
		return m;
	}

}

```



## member.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test</title>

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

		//검색
		var key = "${key}";
		var value = "${value}";
        $("select#key > option[value='"+key+"']").attr("selected","selected");
        $("input#value").val(value);
        
        //삭제
        $("button.btnDelete").on("click", function() {
        	if (confirm("현재 선택한 자료를 삭제할까요?")) {
             	location.assign("${pageContext.request.contextPath}/member/delete?mid_=" + $(this).val());
         	}
        });
        
  
        
        //수정
        $("button.btnUpdate").on("click", function() {
        	$("div#input .panel-heading").text("회원관리 수정");
        	$("div#input form").attr("action", "${pageContext.request.contextPath}/member/update");
			var mid_ = $(this).parents("tr").children().eq(0).text();
			$("div#input form").prepend('<div class="form-group"> <label for="mid_">Mid:</label> <input type="text"	class="form-control" id="mid_" name="mid_" value="'+mid_+'" readonly> </div>');
        	$("div#input input#name_").val($(this).parents("tr").children().eq(1).text());
        	$("div#input input#phone").val($(this).parents("tr").children().eq(2).text());
        	$("div#input input#email").val($(this).parents("tr").children().eq(3).text());
        	$("div#input input#regDate").val($(this).parents("tr").children().eq(4).text());
        	$("div#input select#deptId option:contains('" + $(this).parents("tr").children().eq(5).text() + "')").attr("selected", "selected");
        	$("div#output button.btnUpdate").attr("disabled", "disabled");
        });
        
        //Excel
        $("button.btnExcel").on("click", function() {
			if (confirm("자료를 Excel 형식으로 저장할까요?")) {
				location.assign("${pageContext.request.contextPath}/member/excel")
			}
        });
	
	});


</script>
</head>
<body>
	<div class="container">

		<div class="panel page-header" style="text-align:center;">
			<h1 style="font-size:xx-large;">
				<a href="${pageContext.request.contextPath}/member/list"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="sist_logo.png"> </a>
				회원관리 <small>v5.0</small> <span style="font-size:small; color: #777777;">A website that manages personal information for members</span>
			</h1>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">회원관리 입력</div>
			<div class="panel-body">

				<form name="Member" action="${pageContext.request.contextPath}/member/insert" method="post">
				
					<div class="form-group">
						<label for="name_">Name:</label> <input type="text"
							class="form-control" id="name_" name="name_" placeholder="max:20" required>
					</div>
					<div class="form-group">
						<label for="phone">Phone:</label> <input type="text"
							class="form-control" id="phone" name="phone" placeholder="max:20" required>
					</div>
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" id="email" name="email" placeholder="max:50">
					</div>
					
					<div class="form-group">
						<label for="regDate">RegDate:</label> <input type="date"
							class="form-control" id="regDate" name="regDate">
					</div>
										
					<div class="form-group">
					  <label for="deptId">DeptName:</label>
					  <select class="form-control" id="deptId" name="deptId">
					  	<c:forEach var="m" items="${deptList}">
					  	<option value ="${m.deptId}">${m.deptName}</option>
					   	</c:forEach>
					  </select>
					</div>					
					<button type="submit" class="btn btn-default">Submit</button>
					<c:if test="${param.success==1}">
						<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>성공했습니다</div>
					</c:if>
					<c:if test="${param.success==0}">
						<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다</div>
					</c:if>
					
				</form>
			</div>
		</div>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">회원관리 출력</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Mid</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>RegDate</th>
							<th>DeptName</th>
							<th>Update/Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${count==0}">
						<tr><td colspan="7" style="text-align:center;"> <strong>출력 대상이 없습니다.</strong> </td></tr>
						</c:if>
						<c:if test="${count>0}">
						<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.mid_}</td>
							<td>${m.name_}</td>
							<td>${m.phone}</td>
							<td>${m.email}</td>
							<td>${m.regDate}</td>
							<td>${m.deptName}</td>
							<td><div class="btn-group"><button type="button" class="btn btn-default btn-xs btnUpdate">Update</button><button type="button" class="btn btn-default btn-xs btnDelete" value="${m.mid_}">Delete</button></div></td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>

				<form class="form-inline" method="post">
					<button	type="button" class="btn btn-default btnExcel" >Excel<span class="glyphicon glyphicon-download-alt"></span></button>
					<div class="form-group">
						<button type="button" class="btn btn-default">TotalCount <span class="badge">${totalCount}</span></button>
						<button type="button" class="btn btn-default">Count <span class="badge">${count}</span></button>
						<button	type="button" class="btn btn-default" ><span class="glyphicon glyphicon-step-backward"></span> Previous</button>
						<button	type="button" class="btn btn-default" >Next <span class="glyphicon glyphicon-step-forward"></span></button>
						
						<select class="form-control" id="key" name="key">
							<option value="mid_">Mid</option>
							<option value="name_">Name</option>
							<option value="phone">Phone</option>
							<option value="email">Email</option>
							<option value="regDate">RegDate</option>
							<option value="deptName">DeptName</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search" >

						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
								
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
	<bean class="org.springframework.jdbc.datasource.DriverManagerDataSource"
		id="dataSource">
		<property value="com.mysql.jdbc.Driver" name="driverClassName" />
		<property value="jdbc:mysql://211.63.89.72:3306/test03?useSSL=false" name="url" />
		<property value="test03" name="username" />
		<property value="1234" name="password" />
	</bean>

	<bean class="com.test.MemberJDBCTemplate" id="memberJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
	<mvc:annotation-driven /> 
	<mvc:resources location="/resources/" mapping="/resources/**" />

</beans> 
```



## web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>membersMVC_20180420</display-name>
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
    <filter-class>
        org.springframework.web.filter.CharacterEncodingFilter
    </filter-class>
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







# Spring MVC MyBatis 버전



**※ poi 라이브러리 3.17이 오류가 나서 3.16 버전으로 실행하였음**





## com.test.controller> MemberController.java

```java
package com.test.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.Member;
import com.test.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping("/list")
	public String list(Model model, String key, String value) {
		
		if (key == null) {
			key = "ALL";
			value = "";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("key", key);
		map.put("value", value);
		
		List<Member> list = this.memberService.list(map);
		int count = list.size();
		int totalCount = this.memberService.totalCount();
		
		List<Member> deptList = this.memberService.deptList();
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		model.addAttribute("deptList", deptList);
		
		return "member";
	}
	
	@RequestMapping("/insert")
	public String insert(Member m, RedirectAttributes rttr) {
		
		int result = 0;
		try {
				result = this.memberService.memberAdd(m);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		rttr.addAttribute("success", result);
		
		return "redirect:/member/list";
	}

	
	@RequestMapping("/delete")
	public String delete(Member m, RedirectAttributes rttr) {
		
		int result = 0;
		try {
				result = this.memberService.memberRemove(m);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		rttr.addAttribute("success", result);
		
		return "redirect:/member/list";
	}
	
	@RequestMapping("/update")
	public String update(Member m, RedirectAttributes rttr) {
		
		int result = 0;
		try {
				result = this.memberService.memberModify(m);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		rttr.addAttribute("success", result);
		
		return "redirect:/member/list";
	}
	
	@RequestMapping("/excel")
	public void excel(HttpServletResponse response) throws IOException {
		// Create blank workbook
		XSSFWorkbook workbook = new XSSFWorkbook();
		
		// Create a blank sheet
		XSSFSheet spreadsheet = workbook.createSheet("Test");
		
		// Create row object
		XSSFRow row;
		
		// This data needs to be written (Object[])  ...  Map 자료형으로 준비하는 것이 좋다
		Map<String, Object[]> empinfo = new HashMap<String, Object[]>();
		empinfo.put("1", new Object[] { "Mid", "Name", "Phone", "Email", "RegDate", "DeptName"});
		
		Map<String, String> map = new HashMap<>();
		map.put("key", "ALL");
		map.put("value", "");
		
		List<Member> list = this.memberService.list(map);
		int count = list.size();
		for(int a=0; a<count; ++a) {
			Member m = list.get(a);
			empinfo.put(String.valueOf(a+2), new Object[] { m.getMid_(), m.getName_(), m.getPhone(), m.getEmail(), m.getRegDate(), m.getDeptName()});
		}
		
		// Iterate over data and write to sheet
		Set<String> keyid = empinfo.keySet();
		int rowid = 0;
		for (String key : keyid) {
			row = spreadsheet.createRow(rowid++);
			Object[] objectArr = empinfo.get(key);
			int cellid = 0;
			for (Object obj : objectArr) {
				Cell cell = row.createCell(cellid++);
				cell.setCellValue((String) obj);	// 배열로 미리 만들어서 한 번에 코딩
			}
		}
		
		response.setHeader("Content-disposition","attachment;filename=" + "test.xlsx");	// 파일명
	    response.setHeader("Content-Type", "application/vnd.ms-excel; charset=MS949");	// 브라우저가 Excel로 인식하게 함
	    response.setHeader("Content-Description", "JSP Generated Data"); 
	    response.setHeader("Content-Transfer-Encoding", "binary;"); 
	    response.setHeader("Pragma", "no-cache;"); // 새로고침 불가 (no-cache 설정: 뒤로가기 해도 이전 페이지가 보이지 않게..주로 금융권)
	    response.setHeader("Expires", "-1;");	// 유효기간 X
	    
	    ServletOutputStream out = response.getOutputStream();
	    workbook.write(out);
	    out.close();
	    
	    workbook.close();
	}
}

```



## com.test.domain> Member.java

```java
package com.test.domain;

public class Member {
	
	private String mid_, name_, phone, email, deptId, deptName;
	private String regDate;
	
	public String getMid_() {
		return mid_;
	}
	public void setMid_(String mid_) {
		this.mid_ = mid_;
	}
	public String getName_() {
		return name_;
	}
	public void setName_(String name_) {
		this.name_ = name_;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}

```



## com.test.persistence> MemberDAO.java

```java
package com.test.persistence;

import java.util.List;
import java.util.Map;

import com.test.domain.Member;

public interface MemberDAO {
	
	public List<Member> list(Map<String, String> map);
	public int memberAdd(Member m) throws Exception;
	public List<Member> deptList();
	public int totalCount();
	public int memberRemove(Member m)  throws Exception;
	public int memberModify(Member m)  throws Exception;

}

```



## com.test.persistence> MemberDAOImpl.java

```java
package com.test.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Member> list(Map<String, String> map) {
		return this.sqlSession.selectList("com.test.mapper.MemberMapper.list", map);
	}

	@Override
	public int memberAdd(Member m) throws Exception {
		return this.sqlSession.insert("com.test.mapper.MemberMapper.memberAdd", m);
	}

	@Override
	public List<Member> deptList() {
		return this.sqlSession.selectList("com.test.mapper.MemberMapper.deptList");
	}

	@Override
	public int totalCount() {
		return this.sqlSession.selectOne("com.test.mapper.MemberMapper.totalCount");
	}

	@Override
	public int memberRemove(Member m) throws Exception {
		return this.sqlSession.delete("com.test.mapper.MemberMapper.memberRemove", m);
	}

	@Override
	public int memberModify(Member m) throws Exception {
		return this.sqlSession.update("com.test.mapper.MemberMapper.memberModify", m);
	}

}

```



## mappers> memberMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.test.mapper.MemberMapper">
	<select id="list" resultType="com.test.domain.Member">
		SELECT mid_, name_, phone, email,
		regDate, deptName
		FROM membersView
		<if test="key == 'mid_'">
			WHERE mid_ = #{value}
		</if>
		<if test="key == 'name_'">
			WHERE INSTR(LOWER(name_), LOWER(#{value}))
		</if>
		<if test="key == 'phone'">
			WHERE INSTR(phone, #{value})
		</if>
		<if test="key == 'email'">
			WHERE INSTR(email, #{value})
		</if>
		<if test="key == 'regDate'">
			WHERE INSTR(regDate, #{value})
		</if>
		<if test="key == 'deptName'">
			WHERE INSTR(deptName, #{value})
		</if>
		ORDER BY mid_
	</select>

	<select id="deptList" resultType="com.test.domain.Member"> 
		SELECT deptId, deptName FROM dept ORDER BY deptId
	</select>

	<select id="totalCount" resultType="Integer">
		SELECT COUNT(*) AS totalCount
		FROM membersView
	</select>

	<insert id="memberAdd">
		INSERT INTO members (mid_, name_, phone, email, regDate, deptId) 
			VALUES ((SELECT * FROM (SELECT CONCAT('M', LPAD(IFNULL(SUBSTRING(MAX(mid_), 2), 0) + 1, 2, 0)) AS newMid FROM members) m) 
				, #{name_}, #{phone}, #{email}, #{regDate}, #{deptId})
	</insert>

	<delete id="memberRemove"> 
		DELETE FROM members WHERE mid_=#{mid_}
	</delete>

	<update id="memberModify">
		UPDATE members SET name_ = #{name_}, phone = #{phone}
			, email = #{email}, regDate = #{regDate}
			, deptId = #{deptId} WHERE mid_ = #{mid_}
	</update>

</mapper>  
```



## com.test.service> MemberService.java

```java
package com.test.service;

import java.util.List;
import java.util.Map;

import com.test.domain.Member;

public interface MemberService {
	
	public List<Member> list(Map<String, String> map);
	public int memberAdd(Member m)  throws Exception;
	public List<Member> deptList();
	public int totalCount();
	public int memberRemove(Member m) throws Exception;
	public int memberModify(Member m) throws Exception;
	
}

```



## com.test.service> MemberServiceImpl.java

```java
package com.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.domain.Member;
import com.test.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public List<Member> list(Map<String, String> map) {
		return this.memberDAO.list(map);
	}

	@Override
	public int memberAdd(Member m)  throws Exception {
		return this.memberDAO.memberAdd(m);
	}

	@Override
	public List<Member> deptList() {
		return this.memberDAO.deptList();
	}

	@Override
	public int totalCount() {
		return this.memberDAO.totalCount();
	}

	@Override
	public int memberRemove(Member m) throws Exception {
		return this.memberDAO.memberRemove(m);
	}

	@Override
	public int memberModify(Member m) throws Exception {
		return this.memberDAO.memberModify(m);
	}

}

```



## member.jsp

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

		//검색
		var key = "${key}";
		var value = "${value}";
        $("select#key > option[value='"+key+"']").attr("selected","selected");
        $("input#value").val(value);
        
        //삭제
        $("button.btnDelete").on("click", function() {
			if (confirm("현재 선택한 자료를 삭제할까요?")) {
				location.assign("${pageContext.request.contextPath}/member/delete?mid_=" + $(this).val())
			}
        });
        
        //수정
        $("button.btnUpdate").on("click", function() {
	         $("div#input .panel-heading").text("회원관리 수정");
	         $("div#input form").attr("action", "${pageContext.request.contextPath}/member/update");
	  		 var mid_ = $(this).parents("tr").children().eq(0).text();
	  		 $("div#input form").prepend('<div class="form-group"> <label for="mid_">Mid:</label> <input type="text" class="form-control" id="mid_" name="mid_" value="'+mid_+'" readonly> </div>');
	         $("div#input input#name_").val($(this).parents("tr").children().eq(1).text());
	         $("div#input input#phone").val($(this).parents("tr").children().eq(2).text());
	         $("div#input input#email").val($(this).parents("tr").children().eq(3).text());
	         $("div#input input#regDate").val($(this).parents("tr").children().eq(4).text());
	         $("div#input select#deptId option:contains('" + $(this).parents("tr").children().eq(5).text() + "')").attr("selected", "selected");
	         $("div#output button.btnUpdate").attr("disabled", "disabled");
        });
        
        
        //Excel
        $("button.btnExcel").on("click", function() {
			if (confirm("자료를 Excel 형식으로 저장할까요?")) {
				location.assign("${pageContext.request.contextPath}/member/excel")
			}
        });
        
	});


</script>
</head>
<body>
	<div class="container">

		<div class="panel page-header" style="text-align:center;">
			<h1 style="font-size:xx-large;">
				<a href="${pageContext.request.contextPath}/member/list"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="sist_logo.png"> </a>
				회원관리 <small>v7.0</small> <span style="font-size:small; color: #777777;">A website that manages personal information for members</span>
			</h1>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">회원관리 입력</div>
			<div class="panel-body">

				<form action="${pageContext.request.contextPath}/member/insert" method="post">
				
					<div class="form-group">
						<label for="name_">Name:</label> <input type="text"
							class="form-control" id="name_" name="name_" placeholder="max:20" required>
					</div>
					<div class="form-group">
						<label for="phone">Phone:</label> <input type="text"
							class="form-control" id="phone" name="phone" placeholder="max:20" required>
					</div>
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" id="email" name="email" placeholder="max:50">
					</div>
					
					<div class="form-group">
						<label for="regDate">RegDate:</label> <input type="date"
							class="form-control" id="regDate" name="regDate">
					</div>
										
					<div class="form-group">
					  <label for="deptId">DeptName:</label>
					  <select class="form-control" id="deptId" name="deptId">
					  	<c:forEach var="m" items="${deptList}">
					  	<option value ="${m.deptId}">${m.deptName}</option>
					   	</c:forEach>
					  </select>
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
			<div class="panel-heading">회원관리 출력</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Mid</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>RegDate</th>
							<th>DeptName</th>
							<th>Update/Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${count==0}">
						<tr><td colspan="7" style="text-align:center;"> <strong>출력 대상이 없습니다.</strong> </td></tr>
						</c:if>
						<c:if test="${count>0}">
						<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.mid_}</td>
							<td>${m.name_}</td>
							<td>${m.phone}</td>
							<td>${m.email}</td>
							<td>${m.regDate}</td>
							<td>${m.deptName}</td>
							<td><div class="btn-group"><button type="button" class="btn btn-default btn-xs btnUpdate" value="${m.mid_}">Update</button><button type="button" class="btn btn-default btn-xs btnDelete" value="${m.mid_}">Delete</button></div></td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>

				<form class="form-inline" method="post">
					<div class="form-group">
						<button	type="button" class="btn btn-default btnExcel" >Excel<span class="glyphicon glyphicon-download-alt"></span></button>
						<button type="button" class="btn btn-default">TotalCount <span class="badge">${totalCount}</span></button>
						<button type="button" class="btn btn-default">Count <span class="badge">${count}</span></button>
						<button	type="button" class="btn btn-default" ><span class="glyphicon glyphicon-step-backward"></span> Previous</button>
						<button	type="button" class="btn btn-default" >Next <span class="glyphicon glyphicon-step-forward"></span></button>
						
						<select class="form-control" id="key" name="key">
							<option value="mid_">Mid</option>
							<option value="name_">Name</option>
							<option value="phone">Phone</option>
							<option value="email">Email</option>
							<option value="regDate">RegDate</option>
							<option value="deptName">DeptName</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" class="form-control" id="value" name="value"
							placeholder="Search" >

						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
								
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
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:jdbc="http://www.springframework.org/schema/jdbc"
	xmlns:mybatis-spring="http://mybatis.org/schema/mybatis-spring"
	xsi:schemaLocation="http://www.springframework.org/schema/jdbc http://www.springframework.org/schema/jdbc/spring-jdbc-4.3.xsd
		http://mybatis.org/schema/mybatis-spring http://mybatis.org/schema/mybatis-spring-1.2.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd
		http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-4.3.xsd">

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
	<name>membersMVC_final</name>
	<packaging>war</packaging>
	<version>1.0.0-BUILD-SNAPSHOT</version>

	<!-- Java 버전 수정 -->
	<properties>
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

		<!-- Jackson-Databind 라이브러리 추가 -->
		<dependency>
			<groupId>com.fasterxml.jackson.core</groupId>
			<artifactId>jackson-databind</artifactId>
			<version>2.5.4</version>
		</dependency>
		
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







**※ 참고 사이트: https://www.tutorialspoint.com/springmvc/springmvc_excel.htm**