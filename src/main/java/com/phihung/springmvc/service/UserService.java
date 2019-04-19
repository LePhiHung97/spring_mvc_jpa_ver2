package com.phihung.springmvc.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phihung.springmvc.dao.UserDao;
import com.phihung.springmvc.entities.Users;

@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public Users findUserByAccount(String username, String password) {
		return userDao.findUserByAccount(username, password);
	}
}
