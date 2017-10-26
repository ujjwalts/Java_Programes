package com.daoimpl;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CartDao;
import com.model.Cart;
@Transactional
@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	SessionFactory sessionfactory;
	

	public void insertc(Cart c) {
		
		sessionfactory.getCurrentSession().save(c);
	}
	
	




	public void updatec(Cart c) {


		sessionfactory.getCurrentSession().update(c);
		
		

		
	}


	public void deletec(int cartid) {
		
		Cart c = (Cart) sessionfactory.getCurrentSession().load(Cart.class, cartid);
		sessionfactory.getCurrentSession().delete(c);
	
		
		
	}


	public Cart getCartItem(int pid, String userid) {
	
		Cart c = (Cart) sessionfactory.getCurrentSession().createQuery("from Cart where userMailId=:uid and proid=:id").setString("uid", userid).setInteger("id", pid).uniqueResult();
		return c;
	}


	public Cart GetCartById(String cartId) {

		Cart p = sessionfactory.getCurrentSession().get(Cart.class, cartId);
		return p;
	}


	public List<Cart> GetCartList(String usermail) {
	
		List<Cart> list =sessionfactory.getCurrentSession().createQuery("from Cart where userMailId = :usermail").setString("usermail", usermail).list();
		return list;
		
		
	
	}


	
	
	

}
