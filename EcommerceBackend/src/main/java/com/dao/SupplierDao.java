package com.dao;


import java.util.List;


import com.model.Supplier;

public interface SupplierDao {
	public List<Supplier> supplierList();
	public void SaveSupplier(Supplier s);
	public Supplier getSupplierById(int sid);

}
