package com.ferrarib.order.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ferrarib.order.model.User;

@Repository
@Transactional
public class UserDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void register(User user) {
		manager.persist(user);
	}

	public List<User> list() {
		return manager.createQuery("select u from User u", User.class).getResultList();
	}
	
}
