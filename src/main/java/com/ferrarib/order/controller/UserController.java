package com.ferrarib.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ferrarib.order.model.User;
import com.ferrarib.order.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/register")
	public ModelAndView registerUser() {
		ModelAndView modelAndView = new ModelAndView("/users/newUserForm");
		User user = new User();
		
		Map<Object, Object> roles = new HashMap<>();
		roles.put("ROLE_ADMIN", "Administrador");
		roles.put("ROLE_USER", "Usuário");
		
		modelAndView.addObject("user", user);
		modelAndView.addObject("roles", roles);
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView newUser(User user) {
		ModelAndView modelAndView = new ModelAndView("/order/ok");
		
		userService.register(user);
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("/users/listUsers");
		List<User> users = userService.list();
		
		modelAndView.addObject("users", users);
		
		return modelAndView;
	}
	
	@RequestMapping("/remove")
	public ModelAndView delete(String email) {
		ModelAndView modelAndView = new ModelAndView("redirect:/users");
		
		System.out.println(email);
		
		return modelAndView;
	}
	
	
}
