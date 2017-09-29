package com.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.dao.SupplierDao;
import com.model.Supplier;

@Transactional
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


	public Supplier getSupplierById(int sid) {

		Supplier s=sessionfactory.getCurrentSession().load(Supplier.class,sid);
		
		return s;
	}


}
