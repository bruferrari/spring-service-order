package com.ferrarib.order.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.ferrarib.order.model.Answer;
import com.ferrarib.order.model.Order;

@Repository
@Transactional
public class AnswerDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void register(Answer answer) {
		manager.persist(answer);
	}
	
	public List<Answer> getAnswersByOrder(Order order) {
		TypedQuery<Answer> query 
				= manager.createQuery("select a from Answer a where a.order=:aOrder", Answer.class);
		query.setParameter("aOrder", order);
		
		List<Answer> result = query.getResultList();
		
		return result;
	}
}
