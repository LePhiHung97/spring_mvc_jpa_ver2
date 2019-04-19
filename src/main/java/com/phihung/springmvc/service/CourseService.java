package com.phihung.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phihung.springmvc.dao.CourseDao;
import com.phihung.springmvc.entities.Course;
import com.phihung.springmvc.entities.Student;

@Service
@Transactional
public class CourseService {

	@Autowired
	private CourseDao courseDao;

	public List<Course> getAllCourse() {
		return courseDao.findAll();
	}
	
	public Course getCourseById(int id) {
		return courseDao.findById(id);
	}
	public List<Student> getStudentByCourseId(int course_id) {
		return courseDao.getStudentByCourseId(course_id);
	}
	public List<Course>getCourseByTeacherId(int teacher_id){
		return courseDao.getCourseByTeacherId(teacher_id);
	}
	
	public List<Course>getCourseByStudentId(int student_id){
		return courseDao.getCourseByStudentId(student_id);
	}
	
	public void  registerCourseForStudent(int masv, int course_id) {
		courseDao.registerCourseForStudent(masv, course_id);
	}
	
	public void update(Course course) {
		courseDao.updateCourse(course);
	}
	
	public void deleteCourse(int course_id) {
		courseDao.deleteCourse(course_id);
	}
}
