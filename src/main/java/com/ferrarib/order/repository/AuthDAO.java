package com.ferrarib.order.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.ferrarib.order.model.User;

@Repository
public class AuthDAO implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;
	
	public UserDetails loadUserByUsername(String email) {
		User user = manager.createQuery("select u from User u where u.email = :email"
				, User.class).setParameter("email", email).getSingleResult();
		
		if(user == null) {
			throw new UsernameNotFoundException("User with username " + email + " not found.");
		}
		
		return user;
	}
}
