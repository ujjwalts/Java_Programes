package com.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.ProductDao;
import com.model.Category;
import com.model.Product;



@Repository
@Transactional
public class ProductDaoImpl implements ProductDao{

	
	@Autowired
	SessionFactory sessionfactory;
	public void saveProduct(Product p) {
		
			sessionfactory.getCurrentSession().save(p);
	
		
		
	}

	public List<Product> getProductList() {
	
		
		List<Product> list=sessionfactory.getCurrentSession().createQuery("from Product").list();

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
		
		sessionfactory.getCurrentSession().saveOrUpdate(proid);
	
	}
 
	public Product getProductById(int proid) {
	
		Product p=(Product)sessionfactory.getCurrentSession().get(Product.class,proid);
		return p;
		
			}

	public List<Product> custprolist(int cid) {
		Session session=sessionfactory.openSession();

		List<Product> cplist=session.createQuery("from Product where categoryid="+cid).list();
		return cplist;
	}

public List<Product> prolistdescp(int pid) {
	

	List<Product> plist=sessionfactory.getCurrentSession().createQuery("from Product where proid="+pid).list();
	return plist;
}


public Product getProById(int proid) {

	Product p=(Product)sessionfactory.getCurrentSession().get(Product.class,proid);
	
	return p;
	
		}

}
