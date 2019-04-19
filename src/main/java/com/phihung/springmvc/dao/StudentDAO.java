package com.phihung.springmvc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.PersistenceContext;
import javax.persistence.StoredProcedureQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;
import com.phihung.springmvc.entities.Student;

@Repository
@Transactional
public class StudentDAO {

	@PersistenceContext
	private EntityManager entityManager;

	//Thêm
	public void persist(Student student) {
		entityManager.persist(student);
	}

	//Tìm theo mã
	public Student findById(int id) {
		return entityManager.find(Student.class, id);
	}
	//Xóa
	public void delete(Student student) {
		entityManager.remove(student);
	}

	//Lấy ds SV
	public List<Student> findAll() {
		return entityManager.createQuery("From Student", Student.class).getResultList();
	}

	//Lấy SV sắp xếp theo stt
	public List<Student> getAllSortByOrder() {
		return entityManager.createQuery("select s from Student s order by s.numorder asc", Student.class)
				.getResultList();
	}

	//Tìm sv theo tên
	public List<Student> getListByName(String hoten) {
		return entityManager.createQuery("select s from Student s where s.hoten LIKE :hoten", Student.class)
				.setParameter("hoten", "%" + hoten + "%").getResultList();
	}

	//Thêm theo thứ tự
	public void insertStudentByOrder(Student student, int order) {
		StoredProcedureQuery query = entityManager.createStoredProcedureQuery("insertByOrder");
		query.registerStoredProcedureParameter(1, String.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(2, Integer.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(3, String.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(4, Double.class, ParameterMode.IN);
		query.registerStoredProcedureParameter(5, Integer.class, ParameterMode.IN);

		query.setParameter(1, student.getHoten());
		query.setParameter(2, student.getNamsinh());
		query.setParameter(3, student.getLop());
		query.setParameter(4, student.getDiem());
		query.setParameter(5, order);

		query.execute();
	}

	//Phân trang 
	public List<Student> getStudentByPage(int pageid, int total) {
		return entityManager.createQuery("select s from Student s ", Student.class).setMaxResults(total)
				.setFirstResult(pageid - 1).getResultList();
	}
	
	//Lấy sv theo page sau khi sort
	public List<Student> getStudentByPageAfterSort(String typesort, int pageid, int total) {
		String type = "";
		if (typesort.equals("sort-up"))
			type = "desc";
		else if (typesort.equals("sort-down"))
			type = "asc";
		return entityManager.createQuery("select s from Student s order by s.diem " + type + " ", Student.class)
				.setMaxResults(total).setFirstResult(pageid - 1).getResultList();

	}
}
