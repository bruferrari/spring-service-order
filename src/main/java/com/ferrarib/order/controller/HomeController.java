package com.ferrarib.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ferrarib.order.model.Order;
import com.ferrarib.order.service.OrderService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index() {		
		List<Order> orders = orderService.list();
		ModelAndView modelAndView = new ModelAndView("order/dash");
		modelAndView.addObject("orders", orders);
		
		return modelAndView;
	}
	
}
