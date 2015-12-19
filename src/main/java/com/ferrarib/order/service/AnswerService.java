package com.ferrarib.order.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ferrarib.order.model.Answer;
import com.ferrarib.order.model.Order;
import com.ferrarib.order.repository.AnswerDAO;
import com.ferrarib.order.repository.OrderDAO;

@Service
public class AnswerService {

	@Autowired
	private OrderDAO orderDao;
	
	@Autowired
	private AnswerDAO ansDao;
	
	@Autowired
	private AuthService authService;
	
	public void register(Answer answer, Long orderId) {
		
		answer.setOrder(orderDao.getById(orderId));
		
		answer.setAuthor(authService.getUserLogged());
		answer.setDate(Calendar.getInstance());
		ansDao.register(answer);
	}
	
	public List<Answer> getAnswersByOrder(Order order) {
		return ansDao.getAnswersByOrder(order);
	}
}
