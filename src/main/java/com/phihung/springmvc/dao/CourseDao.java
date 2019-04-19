package com.phihung.springmvc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.phihung.springmvc.entities.Course;
import com.phihung.springmvc.entities.Student;

@Repository
@Transactional
public class CourseDao {

	@PersistenceContext
	private EntityManager entityManager;

	// Tìm khóa học theo mã
	public Course findById(int id) {
		return entityManager.find(Course.class, id);
	}

	// Lấy tất cả ds khóa học
	public List<Course> findAll() {
		return entityManager.createQuery("From Course", Course.class).getResultList();
	}

	// Lấy DS SV theo khóa học
	public List<Student> getStudentByCourseId(int course_id) {
		return entityManager
				.createQuery("from Student s join fetch s.courses c where c.course_id = :course_id", Student.class)
				.setParameter("course_id", course_id).getResultList();
	}

	// Lấy khóa học đang dạy của gv
	public List<Course> getCourseByTeacherId(int teacher_id) {
		return entityManager
				.createQuery("select c FROM Course c JOIN c.teacher t where t.teacher_id = :teacher_id", Course.class)
				.setParameter("teacher_id", teacher_id).getResultList();
	}

	// Lấy khóa học đang học của sv
	public List<Course> getCourseByStudentId(int student_id) {
		return entityManager.createQuery("FROM Course c JOIN FETCH c.students s WHERE s.masv = :student_id")
				.setParameter("student_id", student_id).getResultList();
	}

	// SV đăng kí khóa học
	public void registerCourseForStudent(int masv, int course_id) {
		entityManager.createNativeQuery("INSERT INTO Enroll (masv, course_id) VALUES (?,?)").setParameter(2, masv)
				.setParameter(1, course_id).executeUpdate();
	}

	// Xóa khóa học
	public void deleteCourse(int course_id) {
		StoredProcedureQuery query = entityManager.createStoredProcedureQuery("deleteCourse");
		query.registerStoredProcedureParameter(1, Integer.class, ParameterMode.IN);
		query.setParameter(1, course_id);
		query.execute();
	}
	
	public void updateCourse(Course course) {
		entityManager.merge(course);
	}

}
