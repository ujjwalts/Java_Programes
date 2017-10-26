package com.daoimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDao;
import com.model.Product;
import com.model.User;

@Transactional
@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	SessionFactory sessionfactory;

	

	public void saveUser(User user) {
		
		sessionfactory.getCurrentSession().save(user);
	  
		
		
	}



	public User getUserById(int uid) {
	
		User u=(User) sessionfactory.getCurrentSession().load(User.class,uid);
		
		
		return u;
	}


	public User getUserByName(String uname) {

		Session session=sessionfactory.openSession();	
		Transaction t=session.getTransaction();
		t.begin();
		
		User u=(User) session.get(User.class,uname);
        t.commit();
		return u;
	}


	

		

}