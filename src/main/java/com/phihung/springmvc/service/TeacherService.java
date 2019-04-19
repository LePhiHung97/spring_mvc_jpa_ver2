package com.phihung.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phihung.springmvc.dao.TeacherDao;
import com.phihung.springmvc.entities.Teacher;

@Service
@Transactional
public class TeacherService {
	@Autowired
	private TeacherDao teacherDao;
	
	public List<Teacher>getAllTeacher(){
		return teacherDao.findAll();
	}
}
