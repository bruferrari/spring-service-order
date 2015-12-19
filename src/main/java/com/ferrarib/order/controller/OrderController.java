package com.ferrarib.order.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ferrarib.order.model.Answer;
import com.ferrarib.order.model.Order;
import com.ferrarib.order.service.AnswerService;
import com.ferrarib.order.service.OrderService;
import com.ferrarib.order.validation.OrderValidation;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AnswerService answerService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new OrderValidation());
	}
	
	@RequestMapping("newOrder")
	public ModelAndView form(Order order) {
		
		List<Order> orders = orderService.userList();
		ModelAndView modelAndView = new ModelAndView("order/new");
		modelAndView.addObject("orders", orders);
		
		return modelAndView;
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView register(@Valid Order order, BindingResult result) {
		
		ModelAndView modelAndView = new ModelAndView("order/ok");
		
		if(result.hasErrors()) {
			return form(order);
		}
		
		orderService.register(order);
		return modelAndView;
	}
		
	@RequestMapping("viewOrder/{id}")
	public ModelAndView view(@PathVariable("id") Long id, Model model) {
		Order order = orderService.getById(id);
		model.addAttribute("order", order);
		
		List<Answer> answers = answerService.getAnswersByOrder(order);
		
		ModelAndView modelAndView = new ModelAndView("order/view");
		modelAndView.addObject("answers", answers);
		
		return modelAndView;
	}
	
	@RequestMapping("allOrders")
	public ModelAndView allOrders() {
		List<Order> orders = orderService.allOrdersList();
		
		ModelAndView modelAndView = new ModelAndView("order/all");
		modelAndView.addObject("orders", orders);
		
		return modelAndView;
	}

}
