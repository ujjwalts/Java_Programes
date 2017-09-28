package com.daoimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.UserDao;
import com.model.User;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	SessionFactory sessionfactory;

	

	public void saveUser(User user) {
		Session session=sessionfactory.openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();  
		
		
	}


		

}