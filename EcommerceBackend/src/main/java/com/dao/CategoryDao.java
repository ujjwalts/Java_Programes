package com.dao;

import java.util.List;

import com.model.Category;
import com.model.Product;


public interface CategoryDao {

	public void SaveCategory(Category c);
	public List<Category> categoryList();
	public Category getCategoryById(int categoryid);


}
