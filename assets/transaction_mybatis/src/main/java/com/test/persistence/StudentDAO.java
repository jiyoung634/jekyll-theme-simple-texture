package com.test.persistence;

import java.util.List;

import com.test.domain.StudentMarks;

public interface StudentDAO {

   public List<StudentMarks> list();
   public void studentAdd(StudentMarks st);
   public void marksAdd(StudentMarks st);
   public Integer maxID();

}