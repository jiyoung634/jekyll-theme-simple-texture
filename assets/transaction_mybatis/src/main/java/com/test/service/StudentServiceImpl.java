package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.domain.StudentMarks;
import com.test.persistence.StudentDAO;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Inject
	private StudentDAO studentDAO;

	@Override
	public List<StudentMarks> list() {
		return this.studentDAO.list();
	}

	@Transactional
	@Override
	public void create(StudentMarks st) {
		this.studentDAO.studentAdd(st);
		int sid = this.studentDAO.maxID();
		st.setSid(sid);
		this.studentDAO.marksAdd(st);
	}

}
