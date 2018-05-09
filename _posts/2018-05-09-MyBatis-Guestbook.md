---
layout: post
title: "Guestbook(ver.MyBatis)"
description: "Guestbook(ver.MyBatis)"
categories: [Spring, MVC, mybatis]
tags: [Spring, MVC, guestbook, login, mybatis]
redirect_from:
  - /2018/05/09/
---



# 라이브러리 / 파일 구성

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook(mybatis)/ex00.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook(mybatis)/ex01.png?raw=true">



### 결과 예시 - 일반 사용자

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex01.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex01.png?raw=true"><img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex02.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex03.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex04.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook/guestbook_ex05.png?raw=true">





### 결과 예시 - 관리자

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook(mybatis)/ex03.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook(mybatis)/ex04.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook(mybatis)/ex05.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook(mybatis)/ex06.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/guestbook(mybatis)/ex07.png?raw=true">



# com.test.domain

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



# com.test.persistence

### AdminGuestBookDAO.java

```java
package com.test.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.test.domain.AdminGuestBook;

public interface AdminGuestBookDAO {
	// 방명록 출력(검색) 메소드
		public List<AdminGuestBook> guestBookList(Map<String, String> map);

		// 방명록 게시물 수 반환 메소드
		public int totalCount();

		// 방명록 블라인드 메소드
		public int blind(AdminGuestBook gb) throws DataAccessException;

		// 사진 출력(검색) 메소드
		public List<AdminGuestBook> picList(Map<String, String> map);
		
		// 사진 정보(파일 이름, 사진 설명) 입력 메소드
		public int pictureAdd(AdminGuestBook gb) throws DataAccessException;
		
		//사진 정보 삭제 메소드
		public int pictureRemove(AdminGuestBook gb) throws DataAccessException;
}

```



### AdminGuestBookDAOImpl.java

```java
package com.test.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.test.domain.AdminGuestBook;

@Repository
public class AdminGuestBookDAOImpl implements AdminGuestBookDAO {
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<AdminGuestBook> guestBookList(Map<String, String> map) {
		return this.sqlSession.selectList("com.test.mapper.AdminGuestBookMapper.guestBookList", map);
	}

	@Override
	public int totalCount() {
		return this.sqlSession.selectOne("com.test.mapper.AdminGuestBookMapper.totalCount");
	}

	@Override
	public int blind(AdminGuestBook gb) throws DataAccessException {
		return this.sqlSession.update("com.test.mapper.AdminGuestBookMapper.blind",gb);
	}

	@Override
	public List<AdminGuestBook> picList(Map<String, String> map) {
		return this.sqlSession.selectList("com.test.mapper.AdminGuestBookMapper.picList",map);
	}

	@Override
	public int pictureAdd(AdminGuestBook gb) throws DataAccessException {
		return this.sqlSession.insert("com.test.mapper.AdminGuestBookMapper.pictureAdd",gb);
	}

	@Override
	public int pictureRemove(AdminGuestBook gb) throws DataAccessException {
		return this.sqlSession.delete("com.test.mapper.AdminGuestBookMapper.pictureRemove",gb);
	}

}

```



### adminGuestBookMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.test.mapper.AdminGuestBookMapper">
	<select id="guestBookList" resultType="com.test.domain.AdminGuestBook">
		SELECT gid, name_, content, regDate, clientIP, blind FROM guestbook
		<if test="key == 'gid'">
			WHERE gid = #{value}
		</if>
		<if test="key == 'name_'">
			WHERE INSTR(LOWER(name_), LOWER(#{value})) > 0
		</if>
		<if test="key == 'content'">
			WHERE INSTR(LOWER(content), LOWER(#{value})) > 0
		</if>
		<if test="key == 'regDate'">
			WHERE INSTR(LOWER(regDate), LOWER(#{value})) > 0
		</if>
		ORDER BY gid DESC
	</select>
	
	<select id="totalCount" resultType="Integer">
		SELECT COUNT(*) AS totalcount FROM guestbook
	</select>
	
	<update id="blind">
		UPDATE guestbook SET blind=#{blind} WHERE gid=#{gid}	
	</update> 
	
	<select id="picList" resultType="com.test.domain.AdminGuestBook">
		SELECT pid, picName, picContent FROM pictureList ORDER BY pid
		<if test="key == 'pid'">
			WHERE pid =#{pid}
		</if>
	</select>
	
	<insert id="pictureAdd">
		INSERT INTO pictureList (pid, picName, picContent) 
		VALUES ((SELECT * FROM (SELECT CONCAT('P', LPAD(IFNULL(SUBSTRING(MAX(pid), 2), 0) + 1, 3, 0)) AS newPid FROM pictureList) p), #{picName}, #{picContent})
	</insert>
 
	<delete id="pictureRemove">
		DELETE FROM picturelist WHERE pid = #{pid}
	</delete>

</mapper>
```



### GuestbookDAO.java

```java
package com.test.persistence;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.test.domain.GuestBook;

public interface GuestbookDAO {

	// 방명록 출력(검색) 메소드
	// public List<GuestBook> guestBookList(Map<String, Object> map);

	// 방명록 출력(검색) 메소드 + 페이징 처리
	public List<GuestBook> guestBookList(Map<String, Object> map);

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



### GuestbookDAOImpl.java

```java
package com.test.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.test.domain.GuestBook;

@Repository
public class GuestbookDAOImpl implements GuestbookDAO {
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<GuestBook> guestBookList(Map<String, Object> map) {
		return this.sqlSession.selectList("com.test.mapper.GuestbookMapper.guestBookList", map);
	}

	@Override
	public int totalCount() {
		return this.sqlSession.selectOne("com.test.mapper.GuestbookMapper.totalCount");
	}

	@Override
	public int guestBookAdd(GuestBook gb) throws DataAccessException {
		return this.sqlSession.insert("com.test.mapper.GuestbookMapper.guestBookAdd", gb);
	}

	@Override
	public int guestBookDelete(GuestBook gb) throws DataAccessException {
		return this.sqlSession.delete("com.test.mapper.GuestbookMapper.guestBookDelete", gb);
	}

	@Override
	public List<GuestBook> picList() {
		return this.sqlSession.selectList("com.test.mapper.GuestbookMapper.picList");
	}

}

```



### guestbookMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.test.mapper.GuestbookMapper">
	<select id="list" resultType="com.test.domain.GuestBook">
		SELECT gid, name_, content, regDate FROM guestbook WHERE blind=0
		<if test="key == 'gid'">
			AND gid = #{value} 
		</if>
		<if test="key == 'name_'">
			AND INSTR(LOWER(name_), LOWER(#{value})) > 0
		</if>
		<if test="key == 'content'">
			AND INSTR(LOWER(content), LOWER(#{value})) > 0 
		</if>
		<if test="key == 'regDate'">
			AND INSTR(LOWER(regDate), LOWER(#{value})) > 0 
		</if>
		ORDER BY gid DESC
	</select>
 
	<select id="guestBookList" resultType="com.test.domain.GuestBook">
		SELECT gid, name_, content, regDate FROM guestbook WHERE blind=0 
		<if test="key == 'gid'">
			AND gid = #{value} 
		</if>
		<if test="key == 'name_'">
			AND INSTR(LOWER(name_), LOWER(#{value})) > 0
		</if>
		<if test="key == 'content'">
			AND INSTR(LOWER(content), LOWER(#{value})) > 0 
		</if>
		<if test="key == 'regDate'">
			AND INSTR(LOWER(regDate), LOWER(#{value})) > 0 
		</if>
		ORDER BY gid DESC
		<if test="key == 'ALL'">
			LIMIT #{limit_offset}, #{limit_count}
		</if>
	</select>
	


	<select id="totalCount" resultType="Integer">
		SELECT COUNT(*) AS totalCount FROM guestbook WHERE blind=0
	</select>

	<insert id="guestBookAdd">
		INSERT INTO guestbook(gid,name_,pw,content,regDate,clientIP,blind) 
		VALUES(CONCAT('G', LPAD(SUBSTR(IFNULL((SELECT MAX(gid) FROM guestbook gb), 'G0000'),2)+1,4,'0')),#{name_},#{pw},#{content},SYSDATE(),#{clientIP},0)

	</insert>

	<delete id="guestBookDelete">
		DELETE FROM guestbook WHERE blind=0 AND gid=#{gid} AND pw=#{pw}
	</delete>
	
	<select id="picList" resultType="com.test.domain.GuestBook">
		SELECT pid, picName, picContent FROM pictureList ORDER BY pid
	</select>
</mapper>
```



### LoginDAO.java

```java
package com.test.persistence;

import org.springframework.dao.DataAccessException;

import com.test.domain.Login;

public interface LoginDAO {
	
	public Login login(Login l) throws DataAccessException;
}

```



### LoginDAOImpl.java

```java
package com.test.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.test.domain.Login;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public Login login(Login l) throws DataAccessException {
		
		return this.sqlSession.selectOne("com.test.mapper.LoginMapper.login", l);
	}

}

```



### loginMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.test.mapper.LoginMapper">

	<!-- 
		CREATE OR REPLACE VIEW lgoinInfoView
		AS
		SELECT mid_, id, pw, name_, phone, email, regDate
		FROM loginInfo l INNER JOIN members m USING(id);
	 -->

	<select id="login" resultType="com.test.domain.Login">
		SELECT id, name_, phone, email, regDate FROM loginInfoView 
		WHERE id=#{id} AND pw=#{pw}
	</select>
	
</mapper>
```



# com.test.service

### AdminGuestBookService.java

```java
package com.test.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.test.domain.AdminGuestBook;

public interface AdminGuestBookService {
	// 방명록 출력(검색) 메소드
	public List<AdminGuestBook> guestBookList(Map<String, String> map);

	// 방명록 게시물 수 반환 메소드
	public int totalCount();

	// 방명록 블라인드 메소드
	public int blind(AdminGuestBook gb) throws DataAccessException;

	// 사진 출력(검색) 메소드
	public List<AdminGuestBook> picList(Map<String, String> map);
	
	// 사진 정보(파일 이름, 사진 설명) 입력 메소드
	public int pictureAdd(AdminGuestBook gb) throws DataAccessException;
	
	//사진 정보 삭제 메소드
	public int pictureRemove(AdminGuestBook gb) throws DataAccessException;
}

```



### AdminGuestBookServiceImpl.java

```java
package com.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.test.domain.AdminGuestBook;
import com.test.persistence.AdminGuestBookDAO;

@Service
public class AdminGuestBookServiceImpl implements AdminGuestBookService{

	@Inject
	private AdminGuestBookDAO adminGuestBookDAO;
	
	@Override
	public List<AdminGuestBook> guestBookList(Map<String, String> map) {
		
		return this.adminGuestBookDAO.guestBookList(map);
	}

	@Override
	public int totalCount() {
		
		return this.adminGuestBookDAO.totalCount();
	}

	@Override
	public int blind(AdminGuestBook gb) throws DataAccessException {
		
		return this.adminGuestBookDAO.blind(gb);
	}

	@Override
	public List<AdminGuestBook> picList(Map<String, String> map) {
		
		return this.adminGuestBookDAO.picList(map);
	}

	@Override
	public int pictureAdd(AdminGuestBook gb) throws DataAccessException {
		
		return this.adminGuestBookDAO.pictureAdd(gb);
	}

	@Override
	public int pictureRemove(AdminGuestBook gb) throws DataAccessException {
		
		return this.adminGuestBookDAO.pictureRemove(gb);
	}

}

```



### GuestbookService.java

```java
package com.test.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.test.domain.GuestBook;

public interface GuestbookService {
	// 방명록 출력(검색) 메소드
	// public List<GuestBook> guestBookList(Map<String, Object> map);
	
	// 방명록 출력(검색) 메소드 + 페이징 처리
	public List<GuestBook> guestBookList(Map<String, Object> map);

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



### GuestbookServiceImpl.java

```java
package com.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.test.domain.GuestBook;
import com.test.persistence.GuestbookDAO;

@Service
public class GuestbookServiceImpl implements GuestbookService{
	@Inject
	private GuestbookDAO guestbookDAO;
	
	@Override
	public List<GuestBook> guestBookList(Map<String, Object> map) {
		return this.guestbookDAO.guestBookList(map);
	}


	@Override
	public int totalCount() {
		return this.guestbookDAO.totalCount();
	}

	@Override
	public int guestBookAdd(GuestBook gb) throws DataAccessException {
		return this.guestbookDAO.guestBookAdd(gb);
	}

	@Override
	public int guestBookDelete(GuestBook gb) throws DataAccessException {
		return this.guestbookDAO.guestBookDelete(gb);
	}

	@Override
	public List<GuestBook> picList() {
		return this.guestbookDAO.picList();
	}

}

```



### LoginService.java

```java
package com.test.service;

import org.springframework.dao.DataAccessException;

import com.test.domain.Login;

public interface LoginService {
	public Login login(Login l) throws DataAccessException;
}

```



### LoginServiceImpl.java

```java
package com.test.service;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.test.domain.Login;
import com.test.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService{
	@Inject
	private LoginDAO loginDAO;
	
	@Override
	public Login login(Login l) throws DataAccessException {
		
		return loginDAO.login(l);
	}

}

```





# com.test.controller

### AdminGuestBookController.java

```java
package com.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.AdminGuestBook;
import com.test.domain.FileModel;
import com.test.service.AdminGuestBookService;

@Controller
@RequestMapping("/admin")
public class AdminGuestBookController {

	@Inject
	private AdminGuestBookService adminGuestBookservice;

	@Inject
	private ServletContext context;

	@RequestMapping("/booklist")
	public String boolist(Model model, String key, String value) {
		if (key == null) {
			key = "ALL";
		}
		Map<String, String> map = new HashMap<>();
		map.put("key", key);
		map.put("value", value);
		
		List<AdminGuestBook> gbList = this.adminGuestBookservice.guestBookList(map);
		int totalCount = this.adminGuestBookservice.totalCount();

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
			result = this.adminGuestBookservice.blind(gb);
		} catch (DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);

		return "redirect:/admin/booklist";
	}

	@RequestMapping("/picturelist")
	public String picturelist(Model model, String key, String value) {
		Map<String, String> map = new HashMap<>();
		map.put("key", key);
		map.put("value", value);
		
		List<AdminGuestBook> picList = this.adminGuestBookservice.picList(map);
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
			result = this.adminGuestBookservice.pictureAdd(gb);
		} catch (DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);
		return "redirect:/admin/picturelist";
	}

	@RequestMapping("/picturedelete")
	public String picturedelete(RedirectAttributes rttr, AdminGuestBook gb) {
		int result = 0;
		try {
			result = this.adminGuestBookservice.pictureRemove(gb);
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.domain.GuestBook;
import com.test.service.GuestbookService;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {

	@Inject
	private GuestbookService service;

	@RequestMapping("/list")
	public String list(Model model, String key, String value, String pageNum) {
		// 검색 기준
		if (key == null) {
			key = "ALL";
			value = "";
		}
		// 페이징 처리
		if(pageNum==null){
			pageNum="1";
		}
		int limit_count=10;	// 보여질 개수
		int limit_offset=(Integer.parseInt(pageNum)-1)*limit_count;	//offset개를 건너뛴다
		int previous=Integer.parseInt(pageNum)-1;
		int next=Integer.parseInt(pageNum)+1;
		
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("value", value);
		map.put("limit_offset", limit_offset);
		map.put("limit_count", limit_count);
		
		List<GuestBook> gbList = this.service.guestBookList(map);
		List<GuestBook> picList = this.service.picList();
		int totalCount = this.service.totalCount();
		int totalPage = (totalCount/limit_count)+1;	

		model.addAttribute("key", key);
		model.addAttribute("value", value);
		model.addAttribute("gbList", gbList);
		model.addAttribute("picList", picList);
		model.addAttribute("count", gbList.size());
		model.addAttribute("picListLength", picList.size());
		model.addAttribute("totalCount", totalCount);
		// 페이징 처리 관련
		model.addAttribute("previous", previous);
		model.addAttribute("next", next);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("limit_count",limit_count);
		model.addAttribute("limit_offset", limit_offset);

		return "guestbook/guestbook"; // /WEB-INF/views/guestbook/guestbook.jsp
	}

	@RequestMapping("/insert")
	public String insert(Model model, HttpServletRequest request, RedirectAttributes rttr, GuestBook gb) {
		// IP 주소는 따로 얻어온다.
		String clientIP = request.getRemoteAddr();

		gb.setClientIP(clientIP);
		int result = 0;
		try {
			result = this.service.guestBookAdd(gb);
		} catch (DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);

		return "redirect:/guestbook/list";
	}

	@RequestMapping("/delete")
	public String delete(Model model, RedirectAttributes rttr, GuestBook gb) {

		int result = 0;
		try {
			result = this.service.guestBookDelete(gb);
		} catch (DataAccessException de) {
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

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.domain.Login;
import com.test.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Inject
	private LoginService loginService;

	@RequestMapping("/main")
	public String loginForm() {
		return "login/loginForm"; /// WEB-INF/views/login/loginForm.jsp
	}

	@RequestMapping("/login")
	public String login(Login login, HttpSession session) {
		// id, pw를 이용한 로그인 액션 처리
		// -> 성공한 경우 세션 객체 생성
		Login l = null;
		String uri = "redirect:/login/loginFail";

		l = this.loginService.login(login);
		// 주의) 이전과 달리 로그인 정보가 없을 경우 예외발생이 아니라 null로 반환되므로 try~catch 대신 if문 활용
		if (l != null) {
			session.setAttribute("adminLoginInfo", l);
			uri = "redirect:/admin/booklist";
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



# com.test.interceptor

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



# views> admin

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



# views> guestbook

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

	<div id="bottom"></div>

</body>
</html>
```



# views> login

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



# 환경설정

### servlet-context.xml

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

	<context:component-scan base-package="com.test.sts" />

	<!-- XXXController 클래스에 대한 스프링 빈 등록 설정 추가 -->
	<context:component-scan base-package="com.test.controller" />

	<!-- 파일 업로드 설정 추가 -->
	<beans:bean id="multipartResolver"
		class="org.springframework.web.multipart.commons.CommonsMultipartResolver" />

	<!-- 인터셉터 설정 추가 -->
	<interceptors>
		<interceptor>
			<mapping path="/admin/*" />
			<beans:bean class="com.test.interceptor.AdminInterceptor" />
		</interceptor>
	</interceptors>

</beans:beans>

```



### root-context.xml

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

	<!-- XXXDAOImpl 클래스에 대한 스프링 빈 등록 설정 추가 -->
	<context:component-scan base-package="com.test.persistence" />

	<!-- XXXServiceImpl 클래스에 대한 스프링 빈 등록 설정 추가 -->
	<context:component-scan base-package="com.test.service" />

</beans>

```





### web.xml

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



### pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.test</groupId>
	<artifactId>sts</artifactId>
	<name>guestbook_20180508</name>
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

