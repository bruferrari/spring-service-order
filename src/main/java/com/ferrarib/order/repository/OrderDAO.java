package com.ferrarib.order.repository;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ferrarib.order.model.Order;
import com.ferrarib.order.model.Status;
import com.ferrarib.order.service.AuthService;

@Repository
@Transactional
public class OrderDAO {

	@PersistenceContext
	private EntityManager manager;
	
	@Autowired
	private AuthService authService;
	
	public void register(Order order) {
		order.setStatus(Status.OPENED);
		order.setOpenDate(Calendar.getInstance());
		order.setAuthor(authService.getUserLogged());
		
		manager.persist(order);
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> dashList() {
		Query query = manager
				.createQuery("select o from Order o where o.status = 0 order by o.openDate DESC", Order.class);
		query.setMaxResults(12);
		
		List<Order> result = query.getResultList();
//		List<Order> result 
//			= manager.createQuery("select o from Order o where o.status = 0 order by o.openDate DESC", 
//						Order.class).getResultList();
		
		return result;
	}
	
	public List<Order> allOrdersList() {
		List<Order> result 
				= manager.createQuery("select o from Order o order by o.openDate DESC",
						Order.class).getResultList();
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Order> userList() {
		Query query = manager.createQuery("select o from Order o order by o.openDate DESC");
		query.setMaxResults(8);
		List<Order> result = query.getResultList();
		
		return result;
	}
	
	public Order getById(Long id) {
		return manager.find(Order.class, id);
	}
}
