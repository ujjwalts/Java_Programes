package com.daoimpl;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.SupplierDao;
import com.model.Product;
import com.model.Supplier;

@Repository
public class SupplierDaoImpl implements SupplierDao {
	
	@Autowired
	SessionFactory sessionfactory;
	
	public void SaveSupplier(Supplier s) {		
			Session session=sessionfactory.openSession();
			session.beginTransaction();
			session.save(s);
			session.getTransaction().commit(); 
	}
	
	
	public List<Supplier> supplierList() {
		Session session=sessionfactory.openSession();
		Transaction t=session.getTransaction();
		t.begin();
		List<Supplier> list=session.createQuery("from Supplier").list();
		session.getTransaction().commit();

		return list;

	}

@Transactional
	public Supplier getSupplierById(int sid) {
		Session session=sessionfactory.openSession();
		Supplier s=session.load(Supplier.class,sid);
		return s;
	}


}
