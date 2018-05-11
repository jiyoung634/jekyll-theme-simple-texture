package com.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.domain.StudentMarks;
import com.test.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		List<StudentMarks> list =  this.studentService.list();
		
		model.addAttribute("list", list);
		
		return "student"; ///WEB-INF/views/student.jsp
	}

	@RequestMapping("/insert")
	public String insert(StudentMarks st) {
		
		this.studentService.create(st);
		
		return "redirect:/student/list";
	}
	
}
