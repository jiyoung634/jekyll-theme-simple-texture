package com.test.service;

import java.util.List;

import com.test.domain.StudentMarks;

public interface StudentService {

	 public List<StudentMarks> list();
	 public void create(StudentMarks st);
	 
}
