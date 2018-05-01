---
layout: post
title: "Guestbook(ver.Spring MVC)"
description: "Guestbook(ver.Spring MVC)"
categories: [Spring, MVC]
tags: [Spring, MVC, guestbook, login]
redirect_from:
  - /2018/04/30/
---



# Spring MVC Example4 - Guestbook

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex00.png?raw=true">





### 결과 예시

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex01.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex01.png?raw=true"><img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex02.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex03.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex04.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex05.png?raw=true">





### AdminGuestBook.java

```java
package com.test.domain;

import java.time.*;

public class AdminGuestBook {
		// 방명록 정보 입출력 멤버 구성
		private String gid, name_, pw, content, clientIP;
		private String regDate;
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

		public String getRegDate() {
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

		public void setRegDate(String regDate) {
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



### GuestBook.java

```java
package com.test.domain;

import java.time.*;

public class GuestBook {
		// 방명록 정보 입출력 멤버 구성
		private String gid, name_, pw, content, clientIP;
		private String regDate;
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

		public String getRegDate() {
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

		public void setRegDate(String regDate) {
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



### FileModel.java

```java
package com.test.domain;

import org.springframework.web.multipart.MultipartFile;

public class FileModel {
	private MultipartFile file; // 이 이름에 해당하는 데이터를 자동으로 채워줌

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
```



### Login.java

```java
package com.test.domain;

public class Login {
	private String id, pw, name_, phone, email, regDate;

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

	public String getRegDate() {
		return regDate;
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

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}

```



### AdminGuestBookDAO.java

```java
package com.test.DAO;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.test.domain.AdminGuestBook;

public interface AdminGuestBookDAO {
	// 방명록 출력(검색) 메소드
		public List<AdminGuestBook> guestBookList(String key, String value);

		// 방명록 게시물 수 반환 메소드
		public int totalCount();

		// 방명록 블라인드 메소드
		public int blind(AdminGuestBook gb) throws DataAccessException;

		// 사진 출력(검색) 메소드
		public List<AdminGuestBook> picList(String key, String value);
		
		
		// 사진 정보(파일 이름, 사진 설명) 입력 메소드
		public int pictureAdd(AdminGuestBook gb) throws DataAccessException;
		
		//사진 정보 삭제 메소드
		public int pictureRemove(String pid) throws DataAccessException;
}

```



### AdminGuestBookJDBCTemplate.java

```java
package com.test.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.test.domain.AdminGuestBook;

public class AdminGuestBookJDBCTemplate implements AdminGuestBookDAO {

	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<AdminGuestBook> guestBookList(String key, String value) {
		// 주의) 관리자 모드로 작성해야 한다.
		String sql = "SELECT gid, name_, content, regDate, clientIP, blind FROM guestbook";
		switch (key) {
		case "name_":
			sql += " WHERE INSTR(name_, ?)";
			break;
		case "content":
			sql += " WHERE INSTR(content, ?)";
			break;
		case "regDate":
			sql += " WHERE INSTR(CAST(regDate AS CHAR), ?)";
			break;
		case "ALL":
			break;
		}
		sql += " ORDER BY gid DESC";

		List<AdminGuestBook> result = null;
		if (key.equals("ALL")) {
			result = this.jdbcTemplate.query(sql, new AdminGuestBookMapper());
		} else {
			result = this.jdbcTemplate.query(sql, new AdminGuestBookMapper(), value);
		}
		return result;
	}

	@Override
	public int totalCount() {
		String sql = "SELECT COUNT(*) AS totalcount FROM guestbook";
		int result = this.jdbcTemplate.queryForObject(sql, Integer.class);
		return result;
	}

	@Override
	public int blind(AdminGuestBook gb) throws DataAccessException {
		String sql = "UPDATE guestbook SET blind=? WHERE gid=?";
		int result = this.jdbcTemplate.update(sql, gb.getBlind(), gb.getGid());
		return result;
	}

	@Override
	public List<AdminGuestBook> picList(String key, String value) {
		String sql = "SELECT pid, picName, picContent FROM pictureList ORDER BY pid";

		List<AdminGuestBook> picList = null;

		picList = this.jdbcTemplate.query(sql, new RowMapper<AdminGuestBook>() {
			@Override
			public AdminGuestBook mapRow(ResultSet rs, int rowNum) throws SQLException {
				String pid = rs.getString("pid");
				String picName = rs.getString("picName");
				String picContent = rs.getString("picContent");

				AdminGuestBook gb = new AdminGuestBook();

				gb.setPid(pid);
				gb.setPicName(picName);
				gb.setPicContent(picContent);

				return gb;
			}
		});

		return picList;
	}

	@Override
	public int pictureAdd(AdminGuestBook gb) throws DataAccessException {
		String sql = "INSERT INTO pictureList (pid, picName, picContent) VALUES ((SELECT * FROM (SELECT CONCAT('P', LPAD(IFNULL(SUBSTRING(MAX(pid), 2), 0) + 1, 3, 0)) AS newPid FROM pictureList) p), ?, ?)";
		int result = this.jdbcTemplate.update(sql, gb.getPicName(), gb.getPicContent());
		return result;
	}

	@Override
	public int pictureRemove(String pid) throws DataAccessException {
		String sql = "DELETE FROM picturelist WHERE pid = ?";
		int result = this.jdbcTemplate.update(sql, pid);
		return result;
	}

}

```



### AdminGuestBookMapper.java

```java
package com.test.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.test.domain.AdminGuestBook;

public class AdminGuestBookMapper implements RowMapper<AdminGuestBook> {

	@Override
	public AdminGuestBook mapRow(ResultSet rs, int rowNum) throws SQLException {
		String gid = rs.getString("gid");
		String name_ = rs.getString("name_");
		String content = rs.getString("content");
		String regDate = rs.getString("regDate");
		String clientIP = rs.getString("clientIP");
		int blind = rs.getInt("blind");

		AdminGuestBook gb = new AdminGuestBook();
		gb.setGid(gid);
		gb.setName_(name_);
		gb.setContent(content);
		gb.setRegDate(regDate);
		gb.setClientIP(clientIP);
		gb.setBlind(blind);
		
		return gb;
	}

}

```



### GuestbookDAO.java

```java
package com.test.DAO;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.test.domain.GuestBook;

public interface GuestbookDAO {

		// 방명록 출력(검색) 메소드
		public List<GuestBook> guestBookList(String key, String value);
		
		// 방명록 출력(검색) 메소드 + 페이징 처리
		public List<GuestBook> guestBookList(String key, String value, int offset, int count);

		// 방명록 게시물 수 반환 메소드
		public int totalCount();
		
		// 방명록 입력 메소드
		public int guestBookAdd(GuestBook gb) throws DataAccessException;

		// 방명록 삭제 메소드
		public int guestBookDelete(GuestBook gb) throws DataAccessException;

		// 사진 출력 메소드
		public List<GuestBook> picList(); 
}

```



### GuestbookJDBCTemplate.java

```java
package com.test.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.test.domain.GuestBook;

public class GuestbookJDBCTemplate implements GuestbookDAO {

	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}


	@Override
	public List<GuestBook> guestBookList(String key, String value) {
		String sql = "SELECT gid, name_, content, regDate FROM guestbook WHERE blind=0 ";
		switch (key) {
		case "ALL":
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
		
		List<GuestBook> result = null;
		if(key.equals("ALL")) {
			result = this.jdbcTemplate.query(sql, new GuestbookMapper());
		} else {
			result = this.jdbcTemplate.query(sql, new GuestbookMapper(), value);
		}
		
		return result;
	}

	@Override
	public List<GuestBook> guestBookList(String key, String value, int offset, int count) {
		String sql = "SELECT gid, name_, content, regDate FROM guestbook WHERE blind=0 ";
		switch (key) {
		case "ALL":
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
		sql += String.format("LIMIT %s,%s", offset, count);
		
		List<GuestBook> gbList = null;
		if(key.equals("ALL")) {
			gbList = this.jdbcTemplate.query(sql, new GuestbookMapper(), offset, count);
		} else {
			gbList = this.jdbcTemplate.query(sql, new GuestbookMapper(), value, offset, count);
		}
		
		return gbList;
	}

	@Override
	public int totalCount() {
		String sql = "SELECT COUNT(*) AS totalCount FROM guestbook WHERE blind=0";
		int result = this.jdbcTemplate.queryForObject(sql, Integer.class);
		return result;
	}

	
	@Override
	public int guestBookAdd(GuestBook gb)  throws DataAccessException{
		String sql = "INSERT INTO guestbook(gid,name_,pw,content,regDate,clientIP,blind) VALUES(CONCAT('G', LPAD(SUBSTR(IFNULL((SELECT MAX(gid) FROM guestbook gb), 'G0000'),2)+1,4,'0')),?,?,?,SYSDATE(),?,0)";
		int result = this.jdbcTemplate.update(sql, gb.getName_(), gb.getPw(), gb.getContent(), gb.getClientIP());
		return result;
	}
	
	@Override
	public int guestBookDelete(GuestBook gb)  throws DataAccessException{
		
		String sql = "DELETE FROM guestbook WHERE blind=0 AND gid=? AND pw=?";
		int result = this.jdbcTemplate.update(sql, gb.getGid(), gb.getPw());
		
		return result;
	}

	@Override
	public List<GuestBook> picList() {
		String sql = "SELECT pid, picName, picContent FROM pictureList ORDER BY pid";
		List<GuestBook> picList = this.jdbcTemplate.query(sql, new RowMapper<GuestBook>() {

			@Override
			public GuestBook mapRow(ResultSet rs, int rowNum) throws SQLException {
				String pid = rs.getString("pid");
				String picName = rs.getString("picName");
				String picContent = rs.getString("picContent");

				GuestBook gb = new GuestBook();
				gb.setPid(pid);
				gb.setPicName(picName);
				gb.setPicContent(picContent);
				
				return gb;
			}
			
		});
		return picList;
	}

}

```



### GuestbookMapper.java

```java
package com.test.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.test.domain.GuestBook;

public class GuestbookMapper implements RowMapper<GuestBook> {

	@Override
	public GuestBook mapRow(ResultSet rs, int rowNum) throws SQLException {

		String gid = rs.getString("gid");
		String name_ = rs.getString("name_");
		String content = rs.getString("content");
		String regDate = rs.getString("regDate");

		GuestBook gb = new GuestBook();
		gb.setGid(gid);
		gb.setName_(name_);
		gb.setContent(content);
		gb.setRegDate(regDate);
		
		return gb;
	}

}

```

### LoginDAO.java

```java
package com.test.DAO;

import org.springframework.dao.DataAccessException;

import com.test.domain.Login;

public interface LoginDAO {
	
	public Login login(Login login) throws DataAccessException;
}

```

### LoginJDBCTemplate.java

```java
package com.test.DAO;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.test.domain.Login;

public class LoginJDBCTemplate implements LoginDAO {

	private JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Login login(Login login) throws DataAccessException {
		String sql = "SELECT id, name_, phone, email, regDate FROM loginInfoView WHERE id=? AND pw=?";
		Login result = this.jdbcTemplate.queryForObject(sql, new LoginMapper(), login.getId(), login.getPw());
		return result;
	}
}

```

### LoginMapper.java

```java
package com.test.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.test.domain.Login;

public class LoginMapper implements org.springframework.jdbc.core.RowMapper<Login> {

	@Override
	public Login mapRow(ResultSet rs, int rowNum) throws SQLException {
		Login login = new Login();
		login.setId(rs.getString("id"));
		login.setName_(rs.getString("name_"));
		login.setPhone(rs.getString("phone"));
		login.setEmail(rs.getString("email"));
		login.setRegDate(rs.getString("regDate"));
		return login;
	}

}

```



### AdminGuestBookController.java

```java
package com.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.DAO.AdminGuestBookJDBCTemplate;
import com.test.domain.AdminGuestBook;
import com.test.domain.FileModel;

@Controller
@RequestMapping("/admin")
public class AdminGuestBookController {

	@Autowired
	private AdminGuestBookJDBCTemplate jdbcTemplate;

	@Autowired
	private ServletContext context;

	@RequestMapping("/booklist")
	public String boolist(Model model, String key, String value) {
		if (key == null) {
			key = "ALL";
		}
		List<AdminGuestBook> gbList = this.jdbcTemplate.guestBookList(key, value);
		int totalCount = this.jdbcTemplate.totalCount();

		model.addAttribute("key", key);
		model.addAttribute("value", value);
		model.addAttribute("gbList", gbList);
		model.addAttribute("gbListCount", gbList.size());
		model.addAttribute("totalCount", totalCount);

		return "admin/adminbooklist";
	}

	@RequestMapping("/blind")
	public String blind(RedirectAttributes rttr, AdminGuestBook gb) {
		int result = 0;
		try {
			result = this.jdbcTemplate.blind(gb);
		} catch (DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);

		return "redirect:/admin/booklist";
	}

	@RequestMapping("/picturelist")
	public String picturelist(Model model, String key, String value) {
		List<AdminGuestBook> picList = this.jdbcTemplate.picList(key, value);
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		model.addAttribute("picList", picList);

		return "admin/adminpicturelist";
	}

	@RequestMapping(value = "/pictureinsert", method = RequestMethod.POST)
	public String pictureinsert(RedirectAttributes rttr, FileModel file, ModelMap model, AdminGuestBook gb) throws IOException {
		
		// 실제 파일 저장
		MultipartFile multipartFile = file.getFile();
		System.out.println("Fetching file");
		String uploadPath = context.getRealPath("") + "resources/pictures" + File.separator;
		System.out.println(uploadPath);
		File newFile = new File(uploadPath + java.util.UUID.randomUUID() + "-" + multipartFile.getOriginalFilename());
		FileCopyUtils.copy(multipartFile.getBytes(), newFile);
		
		// DB에 저장
		int result = 0;
		gb.setPicName(newFile.getName());
		try {
			result = this.jdbcTemplate.pictureAdd(gb);
		} catch (DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);
		return "redirect:/admin/picturelist";
	}

	@RequestMapping("/picturedelete")
	public String picturedelete(RedirectAttributes rttr, String pid) {
		int result = 0;
		try {
			result = this.jdbcTemplate.pictureRemove(pid);
		} catch (DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);

		return "redirect:/admin/picturelist";
	}
}

```



### GuestbookController.java

```java
package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.DAO.GuestbookJDBCTemplate;
import com.test.domain.GuestBook;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {

	@Autowired
	private GuestbookJDBCTemplate jdbcTemplate;
	
	@RequestMapping("/list")
	public String list(Model model, String key, String value) {
		if(key==null) {
			key="ALL";
		}
		
		List<GuestBook> gbList = this.jdbcTemplate.guestBookList(key, value);
		List<GuestBook> picList = this.jdbcTemplate.picList();
		int totalCount = this.jdbcTemplate.totalCount();
		
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		model.addAttribute("gbList", gbList);
		model.addAttribute("picList", picList);
		model.addAttribute("count", gbList.size());
		model.addAttribute("picListLength", picList.size());
		model.addAttribute("totalCount", totalCount);
		
		return "guestbook/guestbook";	// /WEB-INF/views/guestbook/guestbook.jsp
	}
	
	@RequestMapping("/insert")
	public String insert(Model model, HttpServletRequest request, RedirectAttributes rttr, GuestBook gb) {
		// IP 주소는 따로 얻어온다.
		String clientIP = request.getRemoteAddr();		
		
		gb.setClientIP(clientIP);
		int result=0;
		try {
			result = this.jdbcTemplate.guestBookAdd(gb);
		} catch(DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/guestbook/list";
	}
	
	@RequestMapping("/delete")
	public String delete(Model model, RedirectAttributes rttr, GuestBook gb) {
				
		int result = 0;
		try{
			result = this.jdbcTemplate.guestBookDelete(gb);
		} catch(DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/guestbook/list";
	}

}

```



### LoginController.java

```java
package com.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.DAO.LoginJDBCTemplate;
import com.test.domain.Login;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginJDBCTemplate jdbcTemplate;
	

/*	@RequestMapping("/main")
	public String loginForm() {
		return "login/loginForm";  ///WEB-INF/views/login/loginForm.jsp
	}*/
	
	@RequestMapping("/login")
	public String login(Login login, HttpSession session) {
		// id, pw를 이용한 로그인 액션 처리
		// -> 성공한 경우 세션 객체 생성
		Login l = null;
		String uri = "redirect:/login/loginFail";
		try{
			l = this.jdbcTemplate.login(login);
			// 세션정보
			session.setAttribute("adminLoginInfo", l);
			uri = "redirect:/admin/booklist";
		} catch(DataAccessException e) {
			System.out.println(e.getMessage());
		}
		
		return uri;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login/logoutForm";
	}
	
	@RequestMapping("/logoutForm")
	public String logoutForm() {
		
		return "login/logoutFrom";
	}
	
	@RequestMapping("/loginFail")
	public String loginFail() {
		
		return "login/loginFail";
	}
}

```



### AdminInterceptor.java

```java
package com.test.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Boolean login = false;
		if (session != null) {
			if (session.getAttribute("adminLoginInfo") != null) {
				login = true;
			}
		}
		
		if (login) {
		} else {
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title></title>");
			out.println("</head>");
			out.println("<body>");
			out.println("Error:access denied!");
			out.println("</body>");
			out.println("</html>");	
		}

		return login;
}

}

```



### adminbooklist.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
div#input:hover, div#output:hover {
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

        //------------------------------------------------------------------------------
		//검색
		var key = "${key}";
		var value = "${value}";
		$("select#key > option[value='" + key + "']").attr("selected", "selected");
		$("input#value").val(value);

		
		//-----------------
		//블라인드
		$("button.blindON").on("click", function() {
			if (confirm("선택한 게시물을 블라인드 지정할까요?")) {
				location.assign("${pageContext.request.contextPath}/admin/blind?gid="+$(this).val()+"&blind=1");
			}
		});
		$("button.blindOFF").on("click", function() {
			if (confirm("선택한 게시물을 블라인드 해제할까요?")) {
				location.assign("${pageContext.request.contextPath}/admin/blind?gid="+$(this).val()+"&blind=0");
			}
		});

		
	});
</script>
</head>
<body>

	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="${pageContext.request.contextPath}/admin/booklist"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 방명록 <small>v2.3</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath}/admin/booklist">방명록 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/picturelist">사진 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/login/logout">[${adminLoginInfo.name_}/${adminLoginInfo.id}] 로그 아웃</a></li>
				</ul>
			</div>
		</nav>


		<div class="panel panel-default" id="output">
			<div class="panel-heading">
			
				방명록 글목록 
				<c:if test="${success==1}">
				<div class="alert alert-success alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Success!</strong> 요청한 작업이 처리되었습니다. </div>
				</c:if>
				<c:if test="${success==0}">
				<div class="alert alert-danger alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Fail!</strong> 요청한 작업 처리가 실패했습니다. </div>
				</c:if>
			
			</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>글쓴이</th>
							<th>글내용</th>
							<th>작성일</th>
							<th>Client IP</th>
							<th>Blind</th>
						</tr>
					</thead>
					<tbody>
						<!-- 
						<tr>
							<td>1</td>
							<td>관리자</td>
							<td>JSP 과정 진행 중입니다. 프로젝트 발표 사진도 올릴 예정입니다.</td>
							<td>2018-03-09</td>
							<td>211.63.89.86</td>
							<td><div class="input-group-btn">
									<button type="button" class="btn btn-default btn-xs">On</button>
									<button type="button" class="btn btn-default btn-xs active">Off</button>
								</div></td>
						</tr>
						 -->
						 
						<!-- count, blindCount 임시 변수 준비 --> 
						<c:set var="count" value="0" />
						<c:set var="blindCount" value="0" />
						
						<c:if test="${gbListCount==0}">
						<tr><td colspan="6" style="text-align:center;"> <strong>출력 대상이 없습니다.</strong> </td></tr>
						</c:if>
						
						<c:if test="${gbListCount>0}"> 
						<c:forEach var="g" items="${gbList}">
						
						<!-- 일반 게시물, 블라인드 게시물 카운팅 -->
						<c:if test="${g.blind==0}">
						<c:set var="count" value="${count+1}" />
						</c:if>
						<c:if test="${g.blind==1}">
						<c:set var="blindCount" value="${blindCount+1}" />
						</c:if>
						
						<tr>
							<td>${g.gid}</td>
							<td>${g.name_}</td>
							<td>${g.content}</td>
							<td>${g.regDate}</td>
							<td>${g.clientIP}</td>
							<td><div class="input-group-btn">
									<button type="button" class="btn btn-default btn-xs blindON ${(g.blind == 1)?'active':''}"  value="${g.gid}">On</button>
									<button type="button" class="btn btn-default btn-xs blindOFF ${(g.blind == 0)?'active':''}" value="${g.gid}">Off</button>
								</div></td>
						</tr>
						</c:forEach>
						</c:if>

					</tbody>
				</table>

				<form class="form-inline" method="post">
					<div class="form-group">
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge">${totalCount}</span>
						</button>
						
						<!-- count, blindCount 임시 변수의 값 출력 --> 
						<button type="button" class="btn btn-default">
							Count <span class="badge">${count}</span>
						</button>
						<button type="button" class="btn btn-default">
							BlindCount <span class="badge">${blindCount}</span>
						</button>
						
						
						<button type="button" class="btn btn-default" disabled>
							<span class="glyphicon glyphicon-step-backward"></span> Previous
						</button>
						<button type="button" class="btn btn-default" disabled>
							Next <span class="glyphicon glyphicon-step-forward"></span>
						</button>
						
						<!-- 검색 기준 선택 항목 추가 -->
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



### adminpicturelist.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
div#input:hover, div#output:hover {
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

		//사진 삭제
		$("button.btnDelete").on("click", function() {
			if (confirm("선택한 사진을 삭제하시겠습니까?")) {
				location.assign("${pageContext.request.contextPath}/admin/picturedelete?pid=" + $(this).val());
			}
		});

	});
</script>
</head>
<body>

	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="${pageContext.request.contextPath}/admin/booklist"><img
					src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 방명록 <small>v2.3</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li><a
						href="${pageContext.request.contextPath}/admin/booklist">방명록	관리</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/admin/picturelist">사진 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/login/logout">[${adminLoginInfo.name_}/${adminLoginInfo.id}] 로그 아웃 </a></li>
				</ul>
			</div>
		</nav>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">사진 업로드	
				<c:if test="${success==1}">
				<div class="alert alert-success alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Success!</strong> 요청한 작업이 처리되었습니다. </div>
				</c:if>
				<c:if test="${success==0}">
				<div class="alert alert-danger alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Fail!</strong> 요청한 작업 처리가 실패했습니다. </div>
				</c:if>
			</div>
			<div class="panel-body">
				<form
					action="${pageContext.request.contextPath}/admin/pictureinsert"
					method="post" enctype="multipart/form-data">
					<div class="form-group">
						<input type="text" class="form-control" id="picContent"
							name="picContent" placeholder="사진 설명(max:50)" required>
					</div>
					<!-- 주의) name 식별자를 file과 일치시켜야 한다 -->
					<div class="form-group">
						<input type="file" class="form-control" id="file"
							name="file" required> <span class="help-block">(.jpg or .png, max 1M)</span>
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>

			</div>
		</div>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">사진 목록</div>
			<div class="panel-body">

				<div class="row">

					<%-- 
					<div class="col-md-3">
						<div class="thumbnail">
							<a
								href="${pageContext.request.contextPath}/resources/pictures/ny.jpg"
								target="_blank"> <img src="${pageContext.request.contextPath}/resources/pictures/ny.jpg" alt="ny.jpg"
								style="width: 100%"></a>
							<div class="caption">
								<p>뉴욕 공연</p>
							</div>

						</div>
					</div>
					 --%>
					 
					<c:forEach var="p" items="${picList}"> 
					<div class="col-md-3">
						<div class="thumbnail">
							<div style="padding-top:5px; padding-bottom:30px;"><button type="button" class="close btnDelete" value="${p.pid}">&times;</button> </div>
							<a
								href="${pageContext.request.contextPath}/resources/pictures/${p.picName}"
								target="_blank"> <img src="${pageContext.request.contextPath}/resources/pictures/${p.picName}" alt="${p.picName}"
								style="width: 100%"></a>
							<div class="caption">
								<p>${p.picContent}</p>
							</div>

						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
```



### guestbook.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

div#topBtn {
	position: fixed;
	bottom: 10px;
	right: 10px;
}

div#bottomBtn {
	position: fixed;
	top: 10px;
	right: 10px;
}
</style>

<!-- 사용자 정의 함수 등록 -->
<script src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {
		
		//남은 날짜 계산 함수 호출
		$("span#date").text(myDate("2018-06-01"));

		//구글맵
		$("button.map").on("click", function() {
			$("div#googleMapModal").modal();
		});
		$("div#googleMapModal").on("shown.bs.modal", function() {
			myMap();
		});
		$("div#googleMapModal").on("hidden.bs.modal", function() {
			$("div#googleMap").empty();
		});
		

		//검색
		var key = "${key}";
		var value = "${value}";
        $("select#key > option[value='"+key+"']").attr("selected","selected");
        $("input#value").val(value);
        
        
		//삭제 버튼 클릭시 모달창 오픈하는 과정
		$("button.btnDelete").on("click", function() {
			$("div#deleteFormModal input#gid").val($(this).val());
			$("div#deleteFormModal").modal();
		});
		
		
		//이전, 다음
		if ("${key}" != "ALL") {
		 	$("button.btnPrevious").attr("disabled", "disabled");
			$("button.btnNext").attr("disabled", "disabled")
		}
		if('${previous}'==0){
		 	$("button.btnPrevious").attr("disabled", "disabled");
		}
		if('${next}' > Math.ceil('${totalCount}'/'${limit_count}')){
		    $("button.btnNext").attr("disabled", "disabled")
		}
		$("button.btnPrevious").on("click", function() {
		 	location.assign("${pageContext.request.contextPath}/guestbook/list?pageNum=${previous}#bottom");
		});
		$("button.btnNext").on("click", function() {
		  	location.assign("${pageContext.request.contextPath}/guestbook/list?pageNum=${next}#bottom");
		});
});
</script>


<script>
	function myMap() {

		//위도, 경도 
		var handok = new google.maps.LatLng(37.499285, 127.033271);
		var center = new google.maps.LatLng(37.500544, 127.033215);

		//맵 정보
		var mapProp = {
			center : center,
			zoom : 17,
		};
		//맵 요청
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		//마커 표시
		var marker = new google.maps.Marker({
			position : handok
		});
		marker.setMap(map);

		//InfoWindow
		var infowindow = new google.maps.InfoWindow(
				{
					content : "<div style=\"text-align:center;\"><strong>한독약품빌딩</strong><br>서울특별시 강남구 역삼1동 735<br><img src=\"${pageContext.request.contextPath}/resources/img/handok_small.png\"></div>"
				});
		infowindow.open(map, marker);

	}
</script>

</head>
<body>

	<div class="container" id="top">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="${pageContext.request.contextPath}/guestbook/list"><img
					src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 방명록 <small>v2.3</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

		<div class="nanel panel-default" style="padding-bottom: 10px;">
			<div class="panel-heading">
				서울특별시 강남구 역삼 1동 735 한독약품빌딩 8층 쌍용교육센터 / 지하철 2호선 역삼역 3번출구<br>
				Java&amp;Python 기반 응용SW 개발자 양성과정 2017.11.01 ~ 2018.06.01 <span
					style="color: red;" id="date">(D day)</span>
				<button class="btn btn-default btn-xs map">Map</button>
				<button class="btn btn-default btn-xs admin" 
					data-toggle="modal"
					data-target="#adminFormModal">Admin</button>
			</div>
		</div>

		<div class="panel panel-default" id="carousel">
			<div class="panel-heading">Picture List</div>
			<div class="panel-body">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<c:forEach var="a" begin="0" end="${picListLength-1}">
						<li data-target="#myCarousel" data-slide-to="${a}" ${(a==0)?'class="active"':''}></li>
						</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">

						<c:forEach var="p" items="${picList}" varStatus="a">
						<div class="item ${(a.index==0)?'active':''}">
							<img src="${pageContext.request.contextPath}/resources/pictures/${p.picName}" alt="${p.picName}" style="width: 100%;">
							<div class="carousel-caption">
								<h3>${p.picContent}</h3>
							</div>
						</div>
						</c:forEach>
						
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

		<div class="panel panel-default" id="input">
			<div class="panel-heading">방명록 글쓰기</div>
			<div class="panel-body">

				<form action="${pageContext.request.contextPath}/guestbook/insert"
					method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="name_" name="name_"
							placeholder="Name(max 20)" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="pw" name="pw"
							placeholder="PASSWORD(max:20)" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="content"
							name="content" placeholder="CONTENT(max:500)">
					</div>


					<button type="submit" class="btn btn-default">Submit</button>
					<!-- 입력, 수정, 삭제 성공, 실패 메시지 출력 -->
					<c:if test="${success==1}">
					<div class="alert alert-success alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Success!</strong> 요청한 작업이 처리되었습니다. </div>
					</c:if>
					<c:if test="${success==0}">
					<div class="alert alert-danger alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Fail!</strong> 요청한 작업 처리가 실패했습니다. </div>
					</c:if>

				</form>


			</div>
		</div>


		<div class="panel panel-default" id="output">
			<div class="panel-heading">방명록 글목록</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>글쓴이</th>
							<th>글내용</th>
							<th>작성일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<!-- 
						<tr>
							<td>1</td>
							<td>관리자</td>
							<td>ServletMVC 과정 진행 중입니다. 프로젝트 발표 사진도 올릴 예정입니다.</td>
							<td>2018-04-02</td>
							<td><div class="btn-group">
									<button type="button" class="btn btn-default btn-xs">삭제</button>
								</div></td>
						</tr>
						 -->
						<!-- EL, JSTL를 이용한 방명록 게시물 출력 -->
						<c:if test="${count==0}">
						<tr><td colspan="5" style="text-align:center;"> <strong>출력 대상이 없습니다.</strong> </td></tr>
						</c:if>
						<c:if test="${count>0}">
						<c:forEach var="g" items="${gbList}">
						<tr>
							<td>${g.gid}</td>
							<td>${g.name_}</td>
							<td>${g.content}</td>
							<td>${g.regDate}</td>
							<td><div class="btn-group">
									<button type="button" class="btn btn-default btn-xs btnDelete" value="${g.gid}">삭제</button>
								</div></td>
						</tr>
						</c:forEach>
						</c:if>
						
					</tbody>
				</table>

				<form class="form-inline" method="post">
					<div class="form-group">
						<button type="button" class="btn btn-default">
							TotalCount <span class="badge">${totalCount}</span>
						</button>
						<button type="button" class="btn btn-default">
							Count <span class="badge">${count}</span>
						</button>
						<button type="button" class="btn btn-default btnPrevious">
							<span class="glyphicon glyphicon-step-backward"></span> Previous
						</button>
						<button type="button" class="btn btn-default btnNext">
							Next <span class="glyphicon glyphicon-step-forward"></span>
						</button>

						<!-- 검색 기준 선택 항목 추가 -->
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
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>

				</form>

			</div>


		</div>
		
	</div>


	<!-- Modal -->
	<div id="deleteFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Delete</h4>
				</div>
				<div class="modal-body">

					<p>본인이 작성한 글인지 확인하는 절차입니다.</p>

					<form action="${pageContext.request.contextPath}/guestbook/delete"
						method="post">

						<!-- 주의) 삭제 진행을 위해서 글번호 정보가 필요합니다. -->
						<input type="hidden" id="gid" name="gid" value="G00001">

						<div class="form-group">
							<input type="password" class="form-control" id="pw" name="pw"
								placeholder="PASSWORD(max:20)" required>
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


	<!-- Modal -->
	<div id="adminFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Admin Login</h4>
				</div>
				<div class="modal-body">

					<p>관리자인지 확인하는 절차입니다.</p>

					<form action="${pageContext.request.contextPath}/login/login" method="post">

						<div class="form-group">
							<input type="text" class="form-control" id="id" name="id"
								placeholder="ID(max:20)" required>
						</div>

						<div class="form-group">
							<input type="password" class="form-control" id="pw" name="pw"
								placeholder="PASSWORD(max:20)" required>
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


	<!-- Modal -->
	<div id="googleMapModal" class="modal fade" role="dialog">
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
	<!-- 
	<div id="bottomBtn">
		<button type="button" class="btn btn-default" onclick="location.assign('#bottom')">
			Bottom <span class="glyphicon glyphicon-arrow-down"></span>
		</button>
	</div>

	<div id="topBtn">
		<button type="button" class="btn btn-default" onclick="location.assign('#top')">
			Top <span class="glyphicon glyphicon-arrow-up"></span>
		</button>
	</div>
 -->
	<div id="bottom"></div>

</body>
</html>
```



### loginFail.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

div#input:hover, div#output:hover {
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


</head>
<body>
	<div class="container">

		<div class="modal-dialog">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="${pageContext.request.contextPath}/guestbook/list"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 방명록 <small>v2.3</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4>
						<span class="glyphicon glyphicon-lock"></span> 로그인
					</h4>
					<label>로그인에 성공하지 못했습니다.</label>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<div class="form-group"></div>
					<a href="${pageContext.request.contextPath}/guestbook/list" class="btn btn-default btn-block">Main</a>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>

	</div>
</body>
</html>
```



### logoutForm.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIST_쌍용교육센터</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

div#input:hover, div#output:hover {
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


</head>
<body>
	<div class="container">

		<div class="modal-dialog">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="${pageContext.request.contextPath}/guestbook/list"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 방명록 <small>v2.3</small> <span
					style="font-size: small; color: #777777;"></span>
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
					<a href="${pageContext.request.contextPath}/guestbook/list" class="btn btn-default btn-block">Main</a>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>

	</div>
</body>
</html>
```



### dispatcher-servlet.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="
   http://www.springframework.org/schema/beans     
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
   http://www.springframework.org/schema/context 
   http://www.springframework.org/schema/context/spring-context-3.0.xsd 
   http://www.springframework.org/schema/mvc 
   http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd">

	<!-- Spring MVC - Annotation Controller Example -->
	<context:component-scan base-package="com.test.controller" />

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
		<property value="jdbc:mysql://211.63.89.72:3306/test03?useSSL=false"
			name="url" />
		<property value="test03" name="username" />
		<property value="1234" name="password" />
	</bean>

	<bean id="guestbookJDBCTemplate" class="com.test.DAO.GuestbookJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
	<bean id="adminGuestbookJDBCTemplate" class="com.test.DAO.AdminGuestBookJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
	<bean id="loginJDBCTemplate" class="com.test.DAO.LoginJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>

	<!-- 정적 자원 연결 -->
	<mvc:annotation-driven />
	<mvc:resources location="/resources/" mapping="/resources/**" />

	<!-- 파일 업로드 설정 추가 -->
	<bean id="multipartResolver"
		class="org.springframework.web.multipart.commons.CommonsMultipartResolver"></bean>

	<!-- 인터셉터 설정 추가 -->
	<mvc:interceptors>
		<mvc:interceptor>
			<mvc:mapping path="/admin/*" />
			<bean class="com.test.interceptor.AdminInterceptor" />
		</mvc:interceptor>
	</mvc:interceptors>
</beans> 
```



### web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>guestbookMVC_20180430</display-name>
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

