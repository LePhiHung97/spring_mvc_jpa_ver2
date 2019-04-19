package com.phihung.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phihung.springmvc.dao.StudentDAO;
import com.phihung.springmvc.entities.Student;

@Service
@Transactional
public class StudentService {

	@Autowired
	private StudentDAO studentDao;

	public List<Student> findAll() {
		return studentDao.findAll();
	}

	public Student findById(int id) {
		return studentDao.findById(id);
	}
	
	/*
	 * public List<Student> getListStudentById(int student_id){ return
	 * studentDao.getListStudentById(student_id); }
	 */

	public void save(Student student) {
		studentDao.persist(student);
	}

	public void update(Student student) {
		Student studentTemp = studentDao.findById(student.getMasv());
		studentTemp.setHoten(student.getHoten());
		studentTemp.setNamsinh(student.getNamsinh());
		studentTemp.setLop(student.getLop());
		studentTemp.setDiem(student.getDiem());
	}

	public boolean delete(int id) {
		Student student = studentDao.findById(id);
		if (student == null)
			return false;
		else {
			studentDao.delete(student);
			return true;
		}
	}

	public List<Student> getListStudentByName(String name) {
		return studentDao.getListByName(name);
	}

	public List<Student> getAllSortByOrder() {
		return studentDao.getAllSortByOrder();
	}

	public void insertByOrder(Student student, int order) {
		studentDao.insertStudentByOrder(student, order);
	}

	public List<Student> getStudentByPageAfterSort(String typesort, int pageid, int total) {
		return studentDao.getStudentByPageAfterSort(typesort, pageid, total);
	}

	public List<Student> getStudentByPage(int pageid, int total) {
		return studentDao.getStudentByPage(pageid, total);
	}
}
