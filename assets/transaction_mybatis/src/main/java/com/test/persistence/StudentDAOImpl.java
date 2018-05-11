package com.test.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.StudentMarks;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<StudentMarks> list() {
		return this.sqlSession.selectList("com.test.mapper.StudentMapper.list");
	}

	@Override
	public void studentAdd(StudentMarks st) {
		this.sqlSession.insert("com.test.mapper.StudentMapper.studentAdd", st);
	}

	@Override
	public void marksAdd(StudentMarks st) {
		this.sqlSession.insert("com.test.mapper.StudentMapper.marksAdd", st);
	}

	@Override
	public Integer maxID() {
		return this.sqlSession.selectOne("com.test.mapper.StudentMapper.maxID");
	}

}
