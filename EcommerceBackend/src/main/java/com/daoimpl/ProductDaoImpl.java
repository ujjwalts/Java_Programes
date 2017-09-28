package com.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.ProductDao;
import com.model.Product;



@Repository
public class ProductDaoImpl implements ProductDao{

	
	@Autowired
	SessionFactory sessionfactory;
	public void saveProduct(Product p) {
		
			Session session=sessionfactory.openSession();
			session.beginTransaction();
			session.save(p);
			session.getTransaction().commit(); 
		
		
	}

	public List<Product> getProductList() {
		Session ssn=sessionfactory.openSession();
		ssn.beginTransaction();
		List<Product> list=ssn.createQuery("from Product").list();
		ssn.getTransaction().commit();
		return list;
	}
		
		
	

	public void deleteProduct(int proid) {
		Session session=sessionfactory.openSession();
		session.beginTransaction();
		Product pro=(Product)session.load(Product.class,proid);
		session.delete(pro);
		session.getTransaction().commit(); 
	
	}

	public void updateProduct(Product proid) {
		Session session=sessionfactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(proid);
		session.getTransaction().commit(); 
	
		
		
	}
    @Transactional
	public Product getProductById(int proid) {
		Session session=sessionfactory.openSession();
		Product p=session.load(Product.class,proid);
		return p;
		
			}

}
