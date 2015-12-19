package com.ferrarib.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ferrarib.order.model.Order;
import com.ferrarib.order.repository.OrderDAO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	public void register(Order order) {
		orderDAO.register(order);
	}
	
	public Order getById(Long id) {
		return orderDAO.getById(id);
	}
	
	public List<Order> list() {
		return orderDAO.dashList();
	}
	
	public List<Order> allOrdersList() {
		return orderDAO.allOrdersList();
	}
	
	public List<Order> userList() {
		return orderDAO.userList();
	}
}
