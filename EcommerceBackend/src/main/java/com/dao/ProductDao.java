package com.dao;

import java.util.List;

import com.model.Product;

public interface ProductDao {
	public void saveProduct(Product p);
	public List<Product> getProductList();
    public void deleteProduct(int proid);
	public void updateProduct(Product p);
	public Product getProductById(int proid);


}
