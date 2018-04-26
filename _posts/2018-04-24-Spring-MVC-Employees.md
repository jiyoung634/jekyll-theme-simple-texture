---
layout: post
title: "Employees(ver.Spring MVC)"
description: "Employees(ver.Spring MVC)"
categories: [Spring, MVC]
tags: [Spring, MVC, employees, login]
redirect_from:
  - /2018/04/24/
---



# Spring MVC Example3 - Employees





<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_java.png?raw=true">



<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_lib_jsp.png?raw=true">



### 결과 예시

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex1.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex2.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex3.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex4.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex5.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex6.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex7.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex8.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex9.png?raw=true">

<img src="https://github.com/jiyoung634/jiyoung634.github.io/blob/master/assets/images/employees/employees_ex10.png?raw=true">



### Employees.java

```java
package com.test.domain;

import java.time.*;

// 자료형 클래스 선언
public class Employees {
	
	// 필드 구성
	private String eid, name_, phone, reg_id, dept_id, job_id, reg_name, dept_name, job_title, picName;
	private String hiredate;
	private int ssn, basicpay, extrapay, pay, minBasicPay;
	


	// 삭제 가능 여부 확인용 필드 구성
	private String deleteCheck;


	// getter
	public String getEid() {
		return eid;
	}

	public String getName_() {
		return name_;
	}

	public int getSsn() {
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

	public String getHiredate() {
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
	
	public int getMinBasicPay() {
		return minBasicPay;
	}

	public String getPicName() {
		return picName;
	}


	// setter
	public void setEid(String eid) {
		this.eid = eid;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public void setSsn(int ssn) {
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

	public void setHiredate(String hiredate) {
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

	public void setMinBasicPay(int minBasicPay) {
		this.minBasicPay = minBasicPay;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}

	// toString() 오버라이딩


	@Override
	public String toString() {
		return "Employees [eid=" + eid + ", name_=" + name_ + ", ssn=" + ssn + ", phone=" + phone + ", reg_id=" + reg_id
				+ ", dept_id=" + dept_id + ", job_id=" + job_id + ", reg_name=" + reg_name + ", dept_name=" + dept_name
				+ ", job_title=" + job_title + ", hiredate=" + hiredate + ", basicpay=" + basicpay + ", extrapay="
				+ extrapay + "]";
	}

}

```



### FileModel.java

```java
package com.test.domain;

import org.springframework.web.multipart.MultipartFile;

public class FileModel {
	private MultipartFile file;	// 이 이름에 해당하는 데이터를 자동으로 채워줌
	private String eid, picName;
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
      this.file = file;
   }

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}
	
	
}
```



### EmployeesDAO.java

```java
package com.test.DAO;

import java.util.*;

import org.springframework.dao.DataAccessException;

import com.test.domain.Employees;

public interface EmployeesDAO {
	// 직원 정보 정렬 출력 메소드
	// -> 전체 출력시 사번, 이름 등 기준으로 정렬 지원
	public List<Employees> list(String key);

	// 직원 정보 검색 출력 메소드
	// -> 사번, 이름 등 기준으로 검색하고 사번 정렬된 상태로 출력
	public List<Employees> list(String key, String value);

	// 직원 정보 입력 메소드
	public int insert(Employees e) throws DataAccessException;
	
	// 직원 정보 삭제 메소드
	public int delete(String value) throws DataAccessException;
		
	// 사진 입력 메소드
	public int pictureInsert(Employees e) throws DataAccessException;
	
	// 사진 수정 메소드
	public int pictureUpdate(Employees e) throws DataAccessException;
		
	// 사진 삭제 메소드
	public int pictureDelete(String value) throws DataAccessException;
	
	// -------------------------------------------------------------------------------------------------------------------------

	// 지역 정보 입력 메소드
	public int regionInsert(String value) throws DataAccessException;

	// 지역 정보 출력 메소드 -> 삭제 가능 여부 포함
	public List<Employees> regionList();

	// 지역 정보 삭제 메소드
	public int regionDelete(String value) throws DataAccessException;
	// -------------------------------------------------------------------------------------------------------------------------

	// 부서 정보 입력 메소드
	public int departmentInsert(String value) throws DataAccessException;

	// 부서 정보 출력 메소드 -> 삭제 가능 여부 포함
	public List<Employees> departmentList();

	// 부서 정보 삭제 메소드
	public int departmentDelete(String value) throws DataAccessException;
	// -------------------------------------------------------------------------------------------------------------------------

	// 직위 정보 입력 메소드
	public int jobInsert(Employees e) throws DataAccessException;

	// 직위 정보 출력 메소드 -> 삭제 가능 여부 포함
	public List<Employees> jobList();
	
	// 특정 직위의 기본급 얻기 메소드
	public int getMinBasicpay(String value);

	// 직위 정보 삭제 메소드
	public int jobDelete(String value) throws DataAccessException;
}

```



### EmployeesJDBCTemplate.java

```java
package com.test.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.test.domain.Employees;

public class EmployeesJDBCTemplate implements EmployeesDAO {

	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Employees> list(String key) {
		/*
		 *  CREATE OR REPLACE VIEW empView AS
			SELECT e.eid AS eid, name_, ssn, hiredate, phone, e.reg_id, reg_name, e.dept_id, dept_name, e.job_id, job_title, 
					basicpay, extrapay, basicpay+extrapay AS pay, picName
			FROM employees e 
			INNER JOIN regions r ON e.reg_id = r.reg_id
			INNER JOIN departments d ON e.dept_id = d.dept_id
			INNER JOIN jobs j ON e.job_id = j.job_id
			LEFT OUTER JOIN empPictures p ON e.eid = p.eid
			ORDER BY eid;
		 */

		String sql = "SELECT eid, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, basicpay, extrapay, pay, picName FROM empView";

		// 정렬 기준에 따른 ORDER BY 구문 추가
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
		

		List<Employees> result = this.jdbcTemplate.query(sql, new EmployeesMapper());

		return result;
	}

	@Override
	public List<Employees> list(String key, String value) {
		/*
		 *  CREATE OR REPLACE VIEW empView AS
			SELECT e.eid AS eid, name_, ssn, hiredate, phone, e.reg_id, reg_name, e.dept_id, dept_name, e.job_id, job_title, 
					basicpay, extrapay, basicpay+extrapay AS pay, picName
			FROM employees e 
			INNER JOIN regions r ON e.reg_id = r.reg_id
			INNER JOIN departments d ON e.dept_id = d.dept_id
			INNER JOIN jobs j ON e.job_id = j.job_id
			LEFT OUTER JOIN empPictures p ON e.eid = p.eid
			ORDER BY eid;
		 */

		String sql = "SELECT eid, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, basicpay, extrapay, pay, picName FROM empView";

		// 검색 기준에 따른 구문 추가
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

		sql += " ORDER BY eid";

		List<Employees> result = this.jdbcTemplate.query(sql, new EmployeesMapper(), value);

		return result;
	}
	

	@Override
	public int insert(Employees e) throws DataAccessException {
		
		String sql = "INSERT INTO employees(eid, name_,ssn,hiredate,phone,reg_id,dept_id,job_id,basicpay,extrapay) VALUES (CONCAT('E',LPAD((SUBSTRING(IFNULL((SELECT MAX(eid) FROM employees e),'E0000'),2)+1),2,0)), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int result = this.jdbcTemplate.update(sql, e.getName_(), e.getSsn(), e.getHiredate(), e.getPhone(), e.getReg_id(), e.getDept_id(), e.getJob_id(), e.getBasicpay(), e.getExtrapay());

		return result;
	}
	

	@Override
	public int delete(String value) {
		
		String sql = "DELETE FROM employees WHERE eid = ?";
		int result = this.jdbcTemplate.update(sql, value);
		
		return result;
	}
	
	@Override
	public int pictureInsert(Employees e) throws DataAccessException {
		
		String sql = "INSERT INTO empPictures(eid, picName) VALUES(?, ?)";
		int result = this.jdbcTemplate.update(sql, e.getEid(), e.getPicName());
		
		return  result;
	}
	
	@Override
	public int pictureUpdate(Employees e) throws DataAccessException {
		String sql = "UPDATE empPictures SET picName=? WHERE eid=?";
		int result = this.jdbcTemplate.update(sql, e.getPicName(), e.getEid());
		
		return  result;
	}


	@Override
	public int pictureDelete(String value) {
		String sql = "DELETE FROM emppictures WHERE eid=?";
		int result = this.jdbcTemplate.update(sql, value);
		
		return result;
	}
	
	@Override
	public int regionInsert(String value) throws DataAccessException{

		String sql = "INSERT INTO regions(reg_id, reg_name) VALUES(CONCAT('REG',LPAD((SUBSTRING(IFNULL((SELECT MAX(reg_id) FROM regions r),'REG00'),4)+1),2,0)), ?)";
		int result = this.jdbcTemplate.update(sql, value);
		
		return result;
	}

	@Override
	public List<Employees> regionList() {
		
		String sql = "SELECT reg_id, reg_name, IF((SELECT COUNT(*) FROM employees WHERE reg_id = r.reg_id)>0, 'N', 'Y') AS deleteCheck FROM regions r ORDER BY reg_id";
		List<Employees> result = this.jdbcTemplate.query(sql, new RowMapper<Employees>() {

			@Override
			public Employees mapRow(ResultSet rs, int rowNum) throws SQLException {
				Employees e = new Employees();
				e.setReg_id(rs.getString("reg_id"));
				e.setReg_name(rs.getString("reg_name"));
				e.setDeleteCheck(rs.getString("deleteCheck"));
				return e;
			}
		});
		
		return result;
	}

	@Override
	public int regionDelete(String value) throws DataAccessException {
		
		String sql = "DELETE FROM regions WHERE reg_id = ?";
		int result = this.jdbcTemplate.update(sql, value);
		
		return result;
	}

	@Override
	public int departmentInsert(String value) throws DataAccessException{
		
		String sql = "INSERT INTO departments(dept_id, dept_name) VALUES(CONCAT('DEPT',LPAD((SUBSTRING(IFNULL((SELECT MAX(dept_id) FROM departments d),'DEPT00'),5)+1),2,0)),?)";
		int result = this.jdbcTemplate.update(sql, value);
		
		return result;
	}

	@Override
	public List<Employees> departmentList() {
		
		String sql = "SELECT dept_id, dept_name, IF((SELECT COUNT(*) FROM employees WHERE dept_id = d.dept_id)>0, 'N', 'Y') AS deleteCheck FROM departments d ORDER BY dept_id";
		List<Employees> result = this.jdbcTemplate.query(sql, new RowMapper<Employees>() {

			@Override
			public Employees mapRow(ResultSet rs, int rowNum) throws SQLException {
				Employees e = new Employees();
				e.setDept_id(rs.getString("dept_id"));
				e.setDept_name(rs.getString("dept_name"));
				e.setDeleteCheck(rs.getString("deleteCheck"));
				return e;
			}
		});
		
		return result;
	}

	@Override
	public int departmentDelete(String value) throws DataAccessException {
		
		String sql = "DELETE FROM departments WHERE dept_id = ?";
		int result = this.jdbcTemplate.update(sql, value);
		
		return result;
	}

	@Override
	public int jobInsert(Employees e) throws DataAccessException{

		String sql = "INSERT INTO jobs(job_id, job_title, minBasicPay) VALUES(CONCAT('JOB',LPAD((SUBSTRING(IFNULL((SELECT MAX(job_id) FROM jobs j),'JOB00'),4)+1),2,0)),?,?)";
		int result = this.jdbcTemplate.update(sql, e.getJob_title(), e.getMinBasicPay());
		
		return result;
	}

	@Override
	public List<Employees> jobList() {
	
		String sql = "SELECT job_id, job_title, minBasicPay, IF((SELECT COUNT(*) FROM employees WHERE job_id = j.job_id)>0, 'N', 'Y') AS deleteCheck FROM jobs j ORDER BY job_id";
		List<Employees> result = this.jdbcTemplate.query(sql, new RowMapper<Employees>() {

			@Override
			public Employees mapRow(ResultSet rs, int rowNum) throws SQLException {
				Employees e = new Employees();
				e.setJob_id(rs.getString("job_id"));
				e.setJob_title(rs.getString("job_title"));
				e.setMinBasicPay(rs.getInt("minBasicPay"));
				e.setDeleteCheck(rs.getString("deleteCheck"));
				return e;
			}
		});
		
		return result;
	}

	@Override
	public int getMinBasicpay(String value) {
		String sql = "SELECT minBasicPay FROM jobs WHERE job_id=?";
		int result = this.jdbcTemplate.queryForObject(sql, Integer.class, value);
		
		return result;
	}
	@Override
	public int jobDelete(String value) throws DataAccessException {

		String sql = "DELETE FROM jobs WHERE job_id = ?";
		int result = this.jdbcTemplate.update(sql, value);
		
		return result;
	}


}

```



### EmployeesMapper.java

```java
package com.test.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.jdbc.core.RowMapper;

import com.test.domain.Employees;

public class EmployeesMapper implements RowMapper<Employees>{

	@Override
	public Employees mapRow(ResultSet rs, int rowNum) throws SQLException {
	
		Employees e = new Employees();
		e.setEid(rs.getString("eid"));
		e.setName_(rs.getString("name_"));
		e.setSsn(rs.getInt("ssn"));
		e.setHiredate(rs.getString("hiredate"));
		e.setPhone(rs.getString("phone"));
		e.setReg_name(rs.getString("reg_name"));
		e.setDept_name(rs.getString("dept_name"));
		e.setJob_title(rs.getString("job_title"));
		e.setBasicpay(rs.getInt("basicpay"));
		e.setExtrapay(rs.getInt("extrapay"));
		e.setPay(rs.getInt("pay"));
		e.setPicName(rs.getString("picName"));
		
		return e;
	}

}

```



### EmployeesController.java

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.DAO.EmployeesJDBCTemplate;
import com.test.domain.Employees;
import com.test.domain.FileModel;

@Controller
@RequestMapping("/employee")
public class EmployeesController {
	
	@Autowired
	private EmployeesJDBCTemplate jdbcTemplate;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("/list")
	public String list(Model model, String key) {
		if(key==null) {
			key="eid";
		}
		List<Employees> list = jdbcTemplate.list(key);
		model.addAttribute("list", list);
		
		return "employees/employeelist";	// /WEB-INF/views/employees/employeelist.jsp
	}
	
	@RequestMapping("/search")
	public String list(Model model, String searchKey, String searchValue) {
	
		if(searchKey==null) {
			searchKey="eid";
		}
		List<Employees> list = jdbcTemplate.list(searchKey, searchValue);
		model.addAttribute("list", list);
		model.addAttribute("searchKey",searchKey);
		model.addAttribute("searchValue",searchValue);
		
		return "employees/employeelist";	// /WEB-INF/views/employees/employeelist.jsp
	}
	
	@RequestMapping("/insertform")
	public String insertform(Model model) {
		
		// 지역, 부서, 직위 정보를 읽어내서 insertform 페이지에 전송
		List<Employees> deptList = jdbcTemplate.departmentList();
		List<Employees> jobList = jdbcTemplate.jobList();
		List<Employees> regionList = jdbcTemplate.regionList();
		
		model.addAttribute("deptList",deptList);
		model.addAttribute("jobList",jobList);
		model.addAttribute("regionList",regionList);
		
		return "employees/employeeinsertform";	// /WEB-INF/views/employees/employeeinsertform.jsp
	}
	
	// JSON 형식으로 리턴
	@RequestMapping("/getminbasicpay")
	public @ResponseBody Employees getminbasicpay(Employees e) {
		int minBasicPay = jdbcTemplate.getMinBasicpay(e.getJob_id());
		Employees emp = new Employees();
		emp.setMinBasicPay(minBasicPay);
		
		return emp;
	}
	
	@RequestMapping("/insert")
	public String insert(Employees e, RedirectAttributes rttr) {
		// GET 방식 대신 RedirectAttributes를 이용하여 성공/실패 메세지 출력
		int result = 0;
		try{
			result = jdbcTemplate.insert(e);
		} catch(DataAccessException de) {
			System.out.println(de.getMessage());
		}
		
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/employee/list";
	}
	
	@RequestMapping("/delete")
	public String delete(String eid, RedirectAttributes rttr) {
		int result = 0 ;
		try {
			// 사진 정보 삭제
			jdbcTemplate.pictureDelete(eid);
			
			// 직원 정보 삭제
			result = jdbcTemplate.delete(eid);
		} catch(DataAccessException de) {
			System.out.println(de.getMessage());
		}
		
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/employee/list";
	}
	
	
	@RequestMapping(value = "/pictureinsert", method = RequestMethod.GET)
	public String fileUploadPage() {
		return "employees/employeelist";
	}
	
	@RequestMapping(value = "/pictureinsert", method = RequestMethod.POST)
	public String pictureinsert(FileModel file, ModelMap model, String eid, String check) throws IOException {
		// 파일 저장
		MultipartFile multipartFile = file.getFile();
		System.out.println("Fetching file");
		String uploadPath = context.getRealPath("") + "resources\\picture" + File.separator;
		System.out.println(uploadPath);
		File newFile = new File(uploadPath + java.util.UUID.randomUUID() + "-" + multipartFile.getOriginalFilename());
		FileCopyUtils.copy(multipartFile.getBytes(),newFile);
		System.out.println(newFile.getName());
		
		// DB에 저장
		int result=0;
		Employees e = new Employees();
		e.setEid(eid);
		e.setPicName(newFile.getName());
		
		//check값에 따라 신규등록or수정
		try{
			if(check.equals("1")) {
				result = jdbcTemplate.pictureInsert(e);
			} else if(check.equals("0")){
				result = jdbcTemplate.pictureUpdate(e);
			}
		} catch(DataAccessException de) {
			System.out.println(de.getMessage());
		}
		model.addAttribute("success", result);
		
		return "redirect:/employee/list";
	}


}

```



### InstructorController.java

```java
package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/instructor")
public class InstructorController {

	@RequestMapping("/list")
	public String list() {
		
		return "instructor/list";
	}
}

```



### StudentController.java

```java
package com.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {

	@RequestMapping("/list")
	public String list() {
		
		return "student/list";
	}
}

```



### DepartmentController.java

```java
package com.test.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.DAO.EmployeesJDBCTemplate;
import com.test.domain.Employees;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	
	@Autowired
	private EmployeesJDBCTemplate jdbcTemplate;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<Employees> list = jdbcTemplate.departmentList();
		model.addAttribute("list", list);
		
		return "department/departmentlist";	// /WEB-INF/views/department/departmentlist.jsp
	}
	
	@RequestMapping("/insert")
	public String insert(String dept_name, RedirectAttributes rttr) {
		
		// GET 방식 대신 RedirectAttributes를 이용하여 성공/실패 메세지 출력
		int result = 0;
		try{
			result = jdbcTemplate.departmentInsert(dept_name);
		} catch(DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success",result);
		
		return "redirect:/department/list";
	}
	
	@RequestMapping("/delete")
	public String delete(String dept_id, RedirectAttributes rttr) {
		
		int result=0;
		try {
			result=jdbcTemplate.departmentDelete(dept_id);
		} catch(DataAccessException de){
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/department/list";
	}

}

```



### PositionController.java

```java
package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.DAO.EmployeesJDBCTemplate;
import com.test.domain.Employees;

@Controller
@RequestMapping("/position")
public class PositionController {
	
	@Autowired
	private EmployeesJDBCTemplate jdbcTemplate;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<Employees> list = jdbcTemplate.jobList();
		model.addAttribute("list", list);
		
		return "position/positionlist";	// /WEB-INF/views/employees/employeelist.jsp
	}
	
	@RequestMapping("/insert")
	public String insert(Employees e, RedirectAttributes rttr) {
		
		// GET 방식 대신 RedirectAttributes를 이용하여 성공/실패 메세지 출력
		int result = 0;
		try{
			result = jdbcTemplate.jobInsert(e);
		} catch(DataAccessException de) {
			System.out.println(de.getMessage());
		}
		
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/position/list";
	}
	
	@RequestMapping("/delete")
	public String delete(String job_id, RedirectAttributes rttr) {
		
		int result=0;
		try {
			result=jdbcTemplate.jobDelete(job_id);
		} catch(DataAccessException de){
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/position/list";
	}
}

```



### RegionContoller.java

```java
package com.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.DAO.EmployeesJDBCTemplate;
import com.test.domain.Employees;

@Controller
@RequestMapping("/region")
public class RegionContoller {
	
	@Autowired
	private EmployeesJDBCTemplate jdbcTemplate;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<Employees> list = jdbcTemplate.regionList();
		model.addAttribute("list", list);
		
		return "region/regionlist";	// /WEB-INF/views/region/regionlist.jsp
	}
	
	@RequestMapping("/insert")
	public String insert(String reg_name, RedirectAttributes rttr) {
		
		// GET 방식 대신 RedirectAttributes를 이용하여 성공/실패 메세지 출력
		int result = 0;
		try{
			result = jdbcTemplate.regionInsert(reg_name);
		} catch(DataAccessException de) {
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success",result);
		
		return "redirect:/region/list";
	}
	
	
	@RequestMapping("/delete")
	public String delete(String reg_id, RedirectAttributes rttr) {
		
		int result=0;
		try {
			result=jdbcTemplate.regionDelete(reg_id);
		} catch(DataAccessException de){
			System.out.println(de.getMessage());
		}
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/region/list";
	}
}

```



### Login.java

```java
package com.test.domain;

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



### LoginDAO.java

```java
package com.test.DAO;

import org.springframework.dao.DataAccessException;

import com.test.domain.Login;

public interface LoginDAO {
	public Login login(Login l) throws DataAccessException;
}

```



### LoginJDBCTemplate.java

```java
package com.test.DAO;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.test.DAO.LoginDAO;
import com.test.domain.Login;

public class LoginJDBCTemplate implements LoginDAO {
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Login login(Login l) throws DataAccessException {
		String sql = "SELECT id_,pw_,grade FROM login WHERE id_ = ? AND pw_ = ?";

		Login result = this.jdbcTemplate.queryForObject(sql, new LoginMapper(), l.getId_(), l.getPw_());
		return result;
	}

}

```



### LoginMapper.java

```java
package com.test.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sun.org.apache.bcel.internal.generic.LLOAD;
import com.test.domain.Login;

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
public class LoginController {
	@Autowired
	private LoginJDBCTemplate jdbcTemplate;
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		return "login/loginForm";  ///WEB-INF/views/login/loginForm.jsp
	}

	@RequestMapping("/login")
	public String login(HttpSession session, Login l ) {
		
		//id_, pw_ 수신
		//데이터베이스 질의
		//성공 여부 판단
		//실패시->loginFail
		//성공시->전용 세션(관리자, 강사) 생성 및 전용 페이지 이동
		Login login=null;
		try{
			login = jdbcTemplate.login(l);
		} catch(DataAccessException de) {
			return "login/loginFail";	// /WEB-INF/views/login/loginFail.jsp
		}			
		
		// 관리자
		if(login.getGrade()==0) {
			session.setAttribute("adminLoginInfo", login);
			return "redirect:/employee/list";
		} else if (login.getGrade()==1) {
			session.setAttribute("instructorLoginInfo", login);
			return "redirect:/instructor/list";
		} else {
			session.setAttribute("studentLoginInfo", login);
			return "redirect:/student/list";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		//세션 소멸
		session.invalidate();
		
		return "redirect:/logoutForm";
	}

	@RequestMapping("/logoutForm")
	public String logoutForm() {
		
		return "login/logoutForm";  ///WEB-INF/views/login/logoutForm.jsp
	}

}

```



### AdminLoginFilter.java

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
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		
		Boolean login = false;
		if (session != null) {
			if (session.getAttribute("adminLoginInfo") != null) {
				login = true;
			}
		}
		
		if (login) {
			chain.doFilter(request, response);
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

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}

```



### InstructorLoginFilter.java

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

public class InstructorLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		
		Boolean login = false;
		if (session != null) {
			if (session.getAttribute("instructorLoginInfo") != null) {
				login = true;
			}
		}
		
		if (login) {
			chain.doFilter(request, response);
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

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}

```



### StudentLoginFilter.java

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

public class StudentLoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		
		Boolean login = false;
		if (session != null) {
			if (session.getAttribute("studentLoginInfo") != null) {
				login = true;
			}
		}
		
		if (login) {
			chain.doFilter(request, response);
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

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}

```



### employeelist.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>직원 관리 시스템</title>

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
	var key = "${searchKey}";
	var value = "${searchValue}";
 		
	$("select#searchKey option[value='"+key+"']").attr("selected", "selected"); 
	$("input#searchValue").val(value);
	
	// 사진 입력
	$("button.btnPictureInsert").on("click", function(){
		var eid = $(this).val();
		// eid 세팅
		$("div#pictureModal input[name='eid']").val(eid);
		
		// 사진 신규등록or수정 체크
		if($(this).parents("tr").find("button.btnShowPicture").is(':disabled')){
			$("div#pictureModal input[name='check']").val("1");
		} else {
			$("div#pictureModal input[name='check']").val("0");
		}
		
		$("#pictureModal").modal();
		
	});
	
	// 사진 보기
	$("button.btnShowPicture").on("click", function(){
		// 이름 얻어오기
		var str = $(this).parents("td").text();
		var name_ = str.substring(0,str.indexOf("/"));
		// 사진 주소 얻어오기
		$("#myModal img").attr("src", "${pageContext.request.contextPath}/resources/picture/"+($(this).val()));
		$("#myModal h4.modal-title").text(name_ +"의 사진");
		$("#myModal").modal();
	});
	
	// 삭제
	$("button.btnDelete").on("click", function(){
		// 경고창 메시지
		if(confirm("현재 자료를 삭제할까요?")){
				
		// 삭제 요청 -> 지역번호 전송
		location.assign("${pageContext.request.contextPath}/employee/delete?eid="+$(this).val());
		}
	});
	
});
</script>
</head>
<body>
	<div class="container">
		<div style="margin-bottom: 1%;">
			<div>
				<h1 style="font-size: x-large;">
					<a href="${pageContext.request.contextPath}/employee/list">
					<img
						src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
						alt="logo" style="vertical-align: bottom;"></a> 직원관리<small>v4.0</small>
				</h1>
			</div>
			<div>
				<ul class="nav nav-pills nav-justified ">
					<li class="active"><a
						href="${pageContext.request.contextPath}/employee/list">직원관리</a></li>
					<li><a href="${pageContext.request.contextPath}/region/list">지역관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/department/list">부서관리</a></li>
					<li><a href="${pageContext.request.contextPath}/position/list">직위관리</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						style="color: red">${adminLoginInfo.id_} 로그아웃</a></li>
				</ul>
			</div>

		</div>
		<div class="panel-group" id="output">
			<div class="panel panel-default">
				<div class="panel-heading">직원 출력 		
				<!-- 입력, 수정, 삭제 성공 메세지 출력 -->
					<c:if test="${success==1}">
						<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>성공했습니다</div>
					</c:if>
					<c:if test="${success==0}">
						<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다</div>
					</c:if></div>
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath}/employee/search" role="form" method="post">
						<select class="form-control" id="searchKey" name="searchKey">					
							<option value="eid">번호</option>
							<option value="name_">이름</option>
							<option value="reg_name">지역</option>
							<option value="dept_name">부서</option>
							<option value="job_title">직위</option>
						</select> <label for="name"></label> <input type="text"
							class="form-control" id="searchValue" name="searchValue"
							required="required">
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span> Search
						</button>
					</form>


					<table class="table">
					<thead>
							<tr>
								<th><a href="${pageContext.request.contextPath}/employee/list?key=eid">사번</a></th>
								<th><a href="${pageContext.request.contextPath}/employee/list?key=name_">이름</a>/사진</th>
								<th>주민번호</th>
								<th>전화번호</th>
								<th>입사일</th>
								<th><a href="${pageContext.request.contextPath}/employee/list?key=reg_name">지역명</a></th>
								<th><a href="${pageContext.request.contextPath}/employee/list?key=dept_name">부서명</a></th>
								<th><a href="${pageContext.request.contextPath}/employee/list?key=job_title">직위명</a></th>
								<th>기본급</th>
								<th>수당</th>
								<th>급여</th>
								<th>사진등록</th>
								<th>삭제/수정</th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach var="e" items="${list}">
							<tr>
								<td>${e.eid}</td>
								<td>${e.name_}/
									<button type="button" class="btn btn-default btn-xs btnShowPicture"
									${(empty e.picName)?"disabled":""} value="${e.picName}">사진</button>
								</td>
								<td>${e.ssn}</td>
								<td>${e.phone}</td>
								<td>${e.hiredate}</td>
								<td>${e.reg_name}</td>
								<td>${e.dept_name}</td>
								<td>${e.job_title}</td>
								<td><fmt:formatNumber value="${e.basicpay}" groupingUsed="true" /></td>
								<td><fmt:formatNumber value="${e.extrapay}" groupingUsed="true" /></td>
								<td><fmt:formatNumber value="${e.pay}" groupingUsed="true" /></td>
								<td><button type="button" class="btn btn-default btn-xs btnPictureInsert" value="${e.eid}">사진등록</button></td>
								<td><button type="button" class="btn btn-default btn-xs btnDelete" value="${e.eid}">삭제</button><br><button type="button" class="btn btn-default btn-xs  btnUpdateForm" >수정</button></td>
							</tr>
							</c:forEach>
							
						</tbody>
					</table>

					<form class="form-inline" role="form" method="post">
						<a href="${pageContext.request.contextPath}/employee/insertform"
							class="btn btn-default">Add</a>
						<button type="button" class="btn btn-default">
							Count <span class="badge">1</span>
						</button>
					</form>

				</div>
			</div>
		</div>

		<!-- 모달 -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">홍길동의 사진</h4>
					</div>
					<div class="modal-body">
						<div style="text-align: center;">
							 <img src="" width="100%"> 
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		
		<!-- 사진 업로드용 모달 -->
		<div id="pictureModal" class="modal fade" role="dialog">
			<div class="modal-dialog modal-md">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">사진 업로드</h4>
					</div>
					<div class="modal-body">
						<form action="${pageContext.request.contextPath}/employee/pictureinsert" method="POST" enctype="multipart/form-data" class="form-inline">
							<input type="hidden" name="eid">
							<input type="hidden" name="check" value="0">
							<div class="form-group">
								<input type="file" name="file" class="form-control">
							</div>
							<input type="submit" value="서브밋"  class="btn btn-default">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>

	</div>

</body>
</html>
```



### employeeinsertform.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
		// 최초 직위에 해당하는 기본급
		$("input#basicpay").load("${pageContext.request.contextPath}/employee/getminbasicpay",{job_id:$("select#job_id").val()},function(response, status){
				if (status == "success"){
					// JSON 객체 분석 및 파싱 결과 출력
	               var jobj = JSON.parse(response);
					$(this).attr("placeholder", "기본급(최소 "+jobj.minBasicPay+"원 이상)" );
	            }
			});
		
		// 직위 선택시 선택된 직위 정보를 갖고 Ajax 요청 및 응답 처리
		$("select#job_id").on("change",function(){			
			$("input#basicpay").load("${pageContext.request.contextPath}/employee/getminbasicpay",{job_id:$("select#job_id").val()},function(response, status){
				if (status == "success"){
					// JSON 객체 분석 및 파싱 결과 출력
	               var jobj = JSON.parse(response);
					$(this).attr("placeholder", "기본급(최소 "+jobj.minBasicPay+"원 이상)" );
	            }
			});
		});
	})
</script>

</head>
<body>
	<div class="container">
		<div style="margin-bottom: 1%;">
			<div>
				<h1 style="font-size: x-large;">
					<img
						src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
						alt="logo" style="vertical-align: bottom;"> 직원관리<small>v4.0</small>
				</h1>
			</div>
			<div>
				<ul class="nav nav-pills nav-justified ">
					<li class="active"><a
						href="${pageContext.request.contextPath}/employee/list">직원관리</a></li>
					<li><a href="${pageContext.request.contextPath}/region/list">지역관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/department/list">부서관리</a></li>
					<li><a href="${pageContext.request.contextPath}/position/list">직위관리</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						style="color: red">홍길동 로그아웃</a></li>
				</ul>
			</div>

		</div>
		<div class="panel-group" id="input">
			<div class="panel panel-default">
				<div class="panel-heading">직원 입력</div>
				<div class="panel-body">
					<form role="form"
						action="${pageContext.request.contextPath}/employee/insert"
						method="post">
						<div class="form-group">
							<label for="name_">이름:</label> <input type="text"
								class="form-control" id="name_" name="name_"
								placeholder="이름 (30자 이내)" maxlength="30" required="required">
						</div>
						<div class="form-group">
							<label for="ssn">주민번호(뒷자리):</label> <input type="number"
								class="form-control " id="ssn" name="ssn"
								placeholder="주민번호 뒷자리 (NNNNNNN)" min="1000000" max="9999999"
								required="required">
						</div>

						<div class="form-group">
							<label for="phone">전화번호:</label> <input type="text"
								class="form-control" id="phone" name="phone"
								placeholder="전화번호 (30자 이내)" maxlength="30" required="required">
						</div>
						<div class="form-group">
							<label for="hiredate">입사일:</label> <input type="date"
								class="form-control" id="hiredate" name="hiredate"
								placeholder="입사일 (YYYY-MM-DD)" required="required">
						</div>
						<div class="form-group">
							<label for="reg_id">지역:</label> <select class="form-control"
								id="reg_id" name="reg_id">
								<c:forEach var="e" items="${regionList}">
								<option value="${e.reg_id}">${e.reg_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="dept_id">부서:</label> <select
								class="form-control" id="dept_id" name="dept_id">
								<c:forEach var="e" items="${deptList}">
								<option value="${e.dept_id}">${e.dept_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="job_id">직위:</label> <select class="form-control"
								id="job_id" name="job_id">
								<c:forEach var="e" items="${jobList}">
								<option value="${e.job_id}">${e.job_title}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="basicpay">기본급:</label> <input type="number"
								class="form-control" id="basicpay" name="basicpay"
								placeholder="기본급 (최소 0원 이상)" required="required">
						</div>
						<div class="form-group">
							<label for="extrapay">수당:</label> <input type="number"
								class="form-control" id="extrapay" name="extrapay"
								placeholder="수당" required="required">
						</div>

						<button type="submit" class="btn btn-default">Submit</button>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>



```



### departmentlist.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>직원 관리 시스템</title>

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
</head>
<script>
$(document).ready(function(){
	// 삭제
	$("button.btnDelete").on("click", function(){
		// 경고창 메시지
		if(confirm("현재 자료를 삭제할까요?")){
				
		// 삭제 요청 -> 지역번호 전송
		location.assign("${pageContext.request.contextPath}/department/delete?dept_id="+$(this).val());
		}
	});
});
</script>
<body>
	<div class="container">
		<div style="margin-bottom: 1%;">
			<div>
				<h1 style="font-size: x-large;">
					<a href="${pageContext.request.contextPath}/employee/list">
					<img
						src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
						alt="logo" style="vertical-align: bottom;"></a> 직원관리<small>v4.0</small>
				</h1>
			</div>
			<div>
				<ul class="nav nav-pills nav-justified ">
					<li><a
						href="${pageContext.request.contextPath}/employee/list">직원관리</a></li>
					<li><a href="${pageContext.request.contextPath}/region/list">지역관리</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/department/list">부서관리</a></li>
					<li><a href="${pageContext.request.contextPath}/position/list">직위관리</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						style="color: red">${adminLoginInfo.id_} 로그아웃</a></li>
				</ul>
			</div>

		</div>
		<div class="panel panel-default" id="input">
			<div class="panel-heading">부서 입력</div>
			<div class="panel-body" id="demo">
				<form role="form"
					action="${pageContext.request.contextPath}/department/insert"
					method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="dept_name"
							name="dept_name" placeholder="부서명 (30자 이내)" maxlength="30"
							required="required">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				
					<!-- 입력, 수정, 삭제 성공 메세지 출력 -->
					<c:if test="${success==1}">
						<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>성공했습니다</div>
					</c:if>
					<c:if test="${success==0}">
						<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다</div>
					</c:if>
			</div>
		</div>
		<div class="panel panel-default" id="output">
			<div class="panel-heading">부서 출력</div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>부서명</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="e" items="${list}">
						<tr>
							<td>${e.dept_id}</td>
							<td>${e.dept_name}</td>
							<td><button type="button"
									class="btn btn-default btn-xs  btnDelete" ${e.deleteCheck=='Y'?"":"disabled"} value="${e.dept_id}">삭제</button></td>
							<td><button type="button"
									class="btn btn-default btn-xs  btnUpdate">수정</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>

</body>
</html>
```



### positionlist.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>직원 관리 시스템</title>

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

</head>
<script>
$(document).ready(function(){
	// 삭제
	$("button.btnDelete").on("click", function(){
		// 경고창 메시지
		if(confirm("현재 자료를 삭제할까요?")){
				
		// 삭제 요청 -> 지역번호 전송
		location.assign("${pageContext.request.contextPath}/position/delete?job_id="+$(this).val());
		}
	});
});
</script>
<body>
	<div class="container">
		<div style="margin-bottom: 1%;">
			<div>
				<h1 style="font-size: x-large;">
					<a href="${pageContext.request.contextPath}/employee/list">
					<img
						src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
						alt="logo" style="vertical-align: bottom;"></a> 직원관리<small>v4.0</small>
				</h1>
			</div>
			<div>
				<ul class="nav nav-pills nav-justified ">
					<li><a
						href="${pageContext.request.contextPath}/employee/list">직원관리</a></li>
					<li><a href="${pageContext.request.contextPath}/region/list">지역관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/department/list">부서관리</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/position/list">직위관리</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						style="color: red">${adminLoginInfo.id_} 로그아웃</a></li>
				</ul>
			</div>

		</div>
		<div class="panel panel-default" id="input">
			<div class="panel-heading">직위 입력</div>
			<div class="panel-body" id="demo">
				<form role="form"
					action="${pageContext.request.contextPath}/position/insert"
					method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="job_title"
							name="job_title" placeholder="직위명 (30자 이내)" maxlength="30"
							required="required">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="minBasicPay"
							name="minBasicPay" placeholder="최소기본급" required="required">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				
					<!-- 입력, 수정, 삭제 성공 메세지 출력 -->
					<c:if test="${success==1}">
						<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>성공했습니다</div>
					</c:if>
					<c:if test="${success==0}">
						<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다</div>
					</c:if>
			</div>
		</div>
		<div class="panel panel-default" id="output">
			<div class="panel-heading">직위 출력</div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>직위명</th>
							<th>최소기본급</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="e" items="${list}">
						<tr>
							<td>${e.job_id}</td>
							<td>${e.job_title}</td>
							<td><fmt:formatNumber value="${e.minBasicPay}" groupingUsed="true" /></td>
							<td><button type="button"
									class="btn btn-default btn-xs btnDelete" ${e.deleteCheck=='Y'?"":"disabled"} value="${e.job_id}">삭제</button></td>
							<td><button type="button"
									class="btn btn-default btn-xs btnUpdate">수정</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>

</body>
</html>

```



### regionlist.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>직원 관리 시스템</title>

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


</head>
<script>
$(document).ready(function(){
	// 삭제
	$("button.btnDelete").on("click", function(){
		// 경고창 메시지
		if(confirm("현재 자료를 삭제할까요?")){
				
		// 삭제 요청 -> 지역번호 전송
		location.assign("${pageContext.request.contextPath}/region/delete?reg_id="+$(this).val());
		}
	});
});
</script>
<body>
	<div class="container">
		<div style="margin-bottom: 1%;">
			<div>
				<h1 style="font-size: x-large;">
					<a href="${pageContext.request.contextPath}/employee/list">
					<img
						src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
						alt="logo" style="vertical-align: bottom;"></a> 직원관리<small>v4.0</small>
				</h1>
			</div>
			<div>
				<ul class="nav nav-pills nav-justified ">
					<li><a
						href="${pageContext.request.contextPath}/employee/list">직원관리</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/region/list">지역관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/department/list">부서관리</a></li>
					<li><a href="${pageContext.request.contextPath}/position/list">직위관리</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						style="color: red">${adminLoginInfo.id_} 로그아웃</a></li>
				</ul>
			</div>

		</div>
		<div class="panel panel-default" id="input">
			<div class="panel-heading">지역 입력</div>
			<div class="panel-body" id="demo">
				<form role="form"
					action="${pageContext.request.contextPath}/region/insert"
					method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="reg_name"
							name="reg_name" placeholder="지역명 (30자 이내)" maxlength="30"
							required="required">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
					<!-- 입력, 수정, 삭제 성공 메세지 출력 -->
					<c:if test="${success==1}">
						<div class='alert alert-success alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>성공했습니다</div>
					</c:if>
					<c:if test="${success==0}">
						<div class='alert alert-danger alert-dismissible' style='display:inline-block;padding-top:5px;padding-bottom:5px;margin:0px'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Fail!</strong>실패했습니다</div>
					</c:if>
			</div>
		</div>
		<div class="panel panel-default" id="output">
			<div class="panel-heading">지역 출력</div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>지역명</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="e" items="${list}">
						<tr>
							<td>${e.reg_id}</td>
							<td>${e.reg_name}</td>
							<td><button type="button"
									class="btn btn-default btn-xs  btnDelete" ${e.deleteCheck=='Y'?"":"disabled"} value=${e.reg_id}>삭제</button></td>
							<td><button type="button"
									class="btn btn-default btn-xs  btnUpdate">수정</button></td>
						</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>
	</div>

</body>
</html>

```



### instructor> list.jsp

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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

div#input:hover, div#output:hover {
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
	
		<div style="margin-bottom: 1%;">
			<div>
				<h1 style="font-size: xx-large;">
					<a href="${pageContext.request.contextPath}/instructor/list"><img
						src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
						alt="logo" style="vertical-align: bottom;"></a> 직원관리<small>v4.0</small>
				</h1>
			</div>
			<div>
				<ul class="nav nav-pills nav-justified ">
					<li class="active"><a
						href="${pageContext.request.contextPath}/instructor/list">강사정보</a></li>
					<li><a
						href="${pageContext.request.contextPath}/instructor/list">스케줄조회</a></li>
					<li><a
						href="${pageContext.request.contextPath}/instructor/list">시험관리</a></li>
					<li><a
						href="${pageContext.request.contextPath}/instructor/list">성적관리</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						style="color: red">${instructorLoginInfo.id_}  로그아웃</a></li>
				</ul>
			</div>

		</div>
		
		<div class="panel-group" id="output">
			<div class="panel panel-default">
				<div class="panel-heading">강사 정보</div>
				<div class="panel-body">
				
				<h1>강사 개인 정보 페이지</h1>
	

				</div>
			</div>
		</div>
	</div>

</body>
</html>
```



### student> list.jsp

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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>

div#input:hover, div#output:hover {
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
	
		<div style="margin-bottom: 1%;">
			<div>
				<h1 style="font-size: xx-large;">
					<a href="${pageContext.request.contextPath}/instructor/list"><img
						src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
						alt="logo" style="vertical-align: bottom;"></a> 직원관리<small>v4.0</small>
				</h1>
			</div>
			<div>
				<ul class="nav nav-pills nav-justified ">
					<li class="active"><a
						href="${pageContext.request.contextPath}/student/list">수강생정보</a></li>
					<li><a
						href="${pageContext.request.contextPath}/student/list">성적조회</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"
						style="color: red">${studentLoginInfo.id_}  로그아웃</a></li>
				</ul>
			</div>

		</div>
		
		<div class="panel-group" id="output">
			<div class="panel panel-default">
				<div class="panel-heading">수강생 정보</div>
				<div class="panel-body">
				
				<h1>수강생 개인 정보 페이지</h1>
	

				</div>
			</div>
		</div>
	</div>

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
				<a href="${pageContext.request.contextPath}/loginForm"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 직원관리 <small>v4.0</small> <span
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
					<a href="${pageContext.request.contextPath}/loginForm" class="btn btn-default btn-block">Main</a>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>

	</div>
</body>
</html>
```



### loginForm.jsp

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
	<div class="modal-dialog">

		<div class="panel page-header" style="text-align: center;">
			<h1 style="font-size: xx-large;">
				<a href="${pageContext.request.contextPath}/loginForm"><img
					src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 직원관리 <small>v4.0</small> <span
					style="font-size: small; color: #777777;"></span>
			</h1>
		</div>

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="padding: 35px 50px;">
				<h4>
					<span class="glyphicon glyphicon-lock"></span> 로그인
				</h4>
				<label>정상적인 서비스 사용을 위해서 로그인해야 합니다.</label>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<form role="form" method="post"
					action="${pageContext.request.contextPath}/login">
					<div class="form-group">
						<label for="id_"> ID :</label> <input type="text"
							class="form-control" id="id_" name="id_" placeholder="Enter ID"
							required="required">
					</div>
					<div class="form-group">
						<label for="pw"> Password :</label> <input type="password"
							class="form-control" id="pw_" name="pw_"
							placeholder="Enter Password" required="required">
					</div>
					<button type="submit" class="btn btn-default btn-block">
						Login</button>
				</form>
			</div>
			<div class="modal-footer"></div>
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
				<a href="${pageContext.request.contextPath}/loginForm"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png"
					alt="sist_logo.png"></a> 직원관리 <small>v4.0</small> <span
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
					<a href="${pageContext.request.contextPath}/loginForm" class="btn btn-default btn-block">Main</a>
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

	<bean class="com.test.DAO.EmployeesJDBCTemplate" id="employeesJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
	<bean class="com.test.DAO.LoginJDBCTemplate" id="loginJDBCTemplate">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
	<!-- 정적 자원 연결 -->
	<mvc:annotation-driven /> 
	<mvc:resources location="/resources/" mapping="/resources/**" />

	<!-- 파일 업로드 설정 추가 -->
	<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver" ></bean>
</beans> 
```



### web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd" id="WebApp_ID" version="3.1">
  <display-name>employeesMVC_20180426</display-name>
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

	<!--  로그인 필터 추가 -->
	<filter>
		<filter-name>adminLoginFilter</filter-name>
		<filter-class>com.test.filter.AdminLoginFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>adminLoginFilter</filter-name>
		<url-pattern>/employee/*</url-pattern>
		<url-pattern>/department/*</url-pattern>
		<url-pattern>/position/*</url-pattern>
		<url-pattern>/region/*</url-pattern>
	</filter-mapping>
	<!--  로그인 필터 추가  -->
	<filter>
		<filter-name>instructorLoginFilter</filter-name>
		<filter-class>com.test.filter.InstructorLoginFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>instructorLoginFilter</filter-name>
		<url-pattern>/instructor/*</url-pattern>
	</filter-mapping>
	<!--  로그인 필터 추가  -->
	<filter>
		<filter-name>studentLoginFilter</filter-name>
		<filter-class>com.test.filter.StudentLoginFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>studentLoginFilter</filter-name>
		<url-pattern>/student/*</url-pattern>
	</filter-mapping>
</web-app>
```

