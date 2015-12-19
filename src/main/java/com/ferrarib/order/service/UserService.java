package com.ferrarib.order.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ferrarib.order.model.User;
import com.ferrarib.order.repository.UserDAO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDao;
	
	public void register(User user) {
		user.setRegisterDate(Calendar.getInstance());
		userDao.register(user);
	}

	public List<User> list() {
		return userDao.list();
	}
}
