package emiage.service;

import java.util.List;

import emiage.entity.Student;

public interface StudentService {

	public List<Student> getStudents();

	public void saveStudent(Student theStudent);

	public Student getStudent(int theId);

	public void deleteStudent(int theId);
	
	public List<Student> getFreeStudents();
	
}
