package com.ferrarib.order.service;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ferrarib.order.model.User;

@Service
public class AuthService {

	public User getUserLogged() {
		return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
