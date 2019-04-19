package com.phihung.springmvc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.phihung.springmvc.entities.Teacher;

@Repository
@Transactional
public class TeacherDao {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	//Lấy tất cả ds gv
	public List<Teacher> findAll() {
		return entityManager.createQuery("From Teacher", Teacher.class).getResultList();
		
	}


}
