package com.phihung.springmvc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;
import com.phihung.springmvc.entities.Users;

@Repository
@Transactional
public class UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	public Users findUserByAccount(String username, String password) {

		List<Users> listUsers = entityManager.createQuery(
				"SELECT u FROM Users u WHERE u.username = '" + username + "' AND u.password = '" + password + "'")
				.getResultList();
		return listUsers.size() > 0 ? listUsers.get(0) : null;
	}

}
