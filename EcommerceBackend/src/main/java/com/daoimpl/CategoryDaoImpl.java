package com.daoimpl;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CategoryDao;
import com.model.Category;
import com.model.Product;


@Repository
@Transactional
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	SessionFactory sessionfactory;
	
	public void SaveCategory(Category c) {
		
			Session session=sessionfactory.openSession();
			session.beginTransaction();
			session.save(c);
			session.getTransaction().commit(); 
		
	}
	
	public List<Category> categoryList(){
	Session ssn=sessionfactory.openSession();
	Transaction t=ssn.getTransaction();
	t.begin();
	List<Category> list=ssn.createQuery("from Category").list();
	ssn.getTransaction().commit();
	
	return list;
}


	public Category getCategoryById(int categoryid) {
		
		Category c=sessionfactory.getCurrentSession().load(Category.class,categoryid);
		return c;
		
	}

}
