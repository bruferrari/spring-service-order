package com.ferrarib.order.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ferrarib.order.model.Answer;
import com.ferrarib.order.model.Order;
import com.ferrarib.order.model.Status;
import com.ferrarib.order.service.AnswerService;
import com.ferrarib.order.service.OrderService;

@Controller
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private AnswerService ansService;
	
	@Autowired
	private OrderService orderService;
	
	private Long selectedId;
	
	@RequestMapping("answerOrder/{id}")
	public ModelAndView answerForm(@PathVariable("id") Long id, Model model) {
		this.selectedId = id;
		Order order = orderService.getById(id);
		List<Answer> answers = ansService.getAnswersByOrder(order);
		
		model.addAttribute("order", order);
		model.addAttribute("statuses", Status.values());
		model.addAttribute(new Answer());
		
		ModelAndView modelAndView = new ModelAndView("order/answer");
		modelAndView.addObject("answers", answers);
		
		return modelAndView;
	}

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView register(@Valid Answer answer, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView("order/ok");

		if(result.hasErrors()) {
			//TODO
		}
		
		ansService.register(answer, selectedId);
		
		return modelAndView;
	}
}
