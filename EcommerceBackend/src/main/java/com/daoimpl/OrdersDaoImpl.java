package com.daoimpl;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.OrdersDao;
import com.model.Orders;


@Repository
@Transactional
public class OrdersDaoImpl implements OrdersDao{
	@Autowired
	SessionFactory sessionfactory;

	public void insertOrder(Orders o) {
		sessionfactory.getCurrentSession().save(o);
		
	
		
	}

	 
}
